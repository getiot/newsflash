#!/bin/bash

root_dir="docs"

# 获取当前年份和月份
current_year=$(date +"%Y")
current_month=$(date +"%m")
current_day=$(date +"%d")

# 构造文件路径
file_path="${root_dir}/${current_year}/newsflash-${current_year}${current_month}.md"

# 检查文件是否存在
if [ -f "$file_path" ]; then
    # 使用 awk 查找并打印日期为今天的内容
    awk -v date="## ${current_year}.${current_month}.${current_day}" '
    BEGIN { found = 0 }
    $0 ~ date { found = 1; next }
    found && /^## / { exit }
    found && NF { gsub(/^ +| +$/, "", $0); print }
    ' "$file_path"
else
    # 文件不存在时的提示信息
    echo "文件 ${file_path} 不存在"
fi

