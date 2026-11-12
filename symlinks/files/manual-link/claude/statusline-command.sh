#!/bin/bash
# 標準入力からJSON形式のデータを読み込む
input=$(cat)

# 各種情報を取得
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
effort=$(echo "$input" | jq -r '.effort.level // empty')
input_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // "0"')
output_tokens=$(echo "$input" | jq -r '.context_window.total_output_tokens // "0"')
used_raw=$(echo "$input" | jq -r '.context_window.used_percentage // "0"')
used=$(printf "%.0f" "$used_raw")
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // empty')

# トークン数を3桁ごとにカンマで区切る
input_tokens=$(echo "$input_tokens" | sed -E -e ':a' -e 's/^([0-9]+)([0-9]{3})/\1,\2/' -e 'ta')
output_tokens=$(echo "$output_tokens" | sed -E -e ':a' -e 's/^([0-9]+)([0-9]{3})/\1,\2/' -e 'ta')

# モデル表示（effort.level がある場合は括弧付きで表示）
if [ -n "$effort" ]; then
  model_str="${model} (${effort})"
else
  model_str="${model}"
fi

# 5時間制限の情報を取得
five_hour_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_hour_resets_at=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')

# 5時間制限の残り割合を組み立てる
five_hour_str=""
if [ -n "$five_hour_pct" ]; then
  five_hour_left=$(awk -v p="$five_hour_pct" 'BEGIN { printf "%.0f", 100 - p }')
  if [ -n "$five_hour_resets_at" ]; then
    reset_time=$(date -r "$five_hour_resets_at" +%H:%M 2>/dev/null || date -d "@$five_hour_resets_at" +%H:%M 2>/dev/null)
    five_hour_str=" | 5h ${five_hour_left}% left (reset ${reset_time})"
  else
    five_hour_str=" | 5h ${five_hour_left}% left"
  fi
fi

# 週次（7日）制限の情報を取得
weekly_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
weekly_resets_at=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# 週次制限の残り割合を組み立てる
weekly_str=""
if [ -n "$weekly_pct" ]; then
  weekly_left=$(awk -v p="$weekly_pct" 'BEGIN { printf "%.0f", 100 - p }')
  if [ -n "$weekly_resets_at" ]; then
    weekly_reset_time=$(date -r "$weekly_resets_at" +"%m/%d %H:%M" 2>/dev/null || date -d "@$weekly_resets_at" +"%m/%d %H:%M" 2>/dev/null)
    weekly_str=" | weekly ${weekly_left}% left (reset ${weekly_reset_time})"
  else
    weekly_str=" | weekly ${weekly_left}% left"
  fi
fi

# 作業ディレクトリがGitリポジトリの場合はブランチ名を表示する
git_branch_str=""
if [ -n "$current_dir" ]; then
  git_branch=$(git -C "$current_dir" branch --show-current 2>/dev/null)
  if [ -n "$git_branch" ]; then
    git_branch_str=" | ${git_branch}"
  fi
fi

# ステータスライン表示
echo "${model_str} | Context ${used}% used | ${input_tokens} in / ${output_tokens} out${five_hour_str}${weekly_str}${git_branch_str}"
