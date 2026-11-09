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

# モデル表示（effort.level がある場合は括弧付きで表示）
if [ -n "$effort" ]; then
  model_str="${model} (${effort})"
else
  model_str="${model}"
fi

# 5時間制限の情報を取得
five_hour_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_hour_resets_at=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')

# 5時間制限の表示を組み立てる
five_hour_str=""
if [ -n "$five_hour_pct" ]; then
  five_hour_pct_fmt=$(printf "%.0f" "$five_hour_pct")
  if [ -n "$five_hour_resets_at" ]; then
    reset_time=$(date -r "$five_hour_resets_at" +%H:%M 2>/dev/null || date -d "@$five_hour_resets_at" +%H:%M 2>/dev/null)
    five_hour_str=" | 5h ${five_hour_pct_fmt}% (reset ${reset_time})"
  else
    five_hour_str=" | 5h ${five_hour_pct_fmt}%"
  fi
fi

# ステータスライン表示
echo "${model_str} | in: ${input_tokens} / out: ${output_tokens} tokens | Context: ${used}% used${five_hour_str}"

