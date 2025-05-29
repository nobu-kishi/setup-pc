#!/bin/bash

# インストールした asdf のプラグインから.tool-versions生成するスクリプト
# https://asdf-vm.com/ja-jp/guide/getting-started.html#_6-%E3%83%8F%E3%82%99%E3%83%BC%E3%82%B7%E3%82%99%E3%83%A7%E3%83%B3%E3%82%92%E3%82%BB%E3%83%83%E3%83%88

TOOL_VERSIONS_FILE="$HOME/.tool-versions"
>"$TOOL_VERSIONS_FILE" # 既存ファイルを空にする

current_tool=""
# `asdf list` の出力を読み込んで解析
asdf list | while IFS= read -r line; do
    # ツール名の行（インデントなし）
    if [[ ! "$line" =~ ^[[:space:]] ]]; then
        current_tool=$(echo "$line" | xargs)
    # アスタリスク付きのバージョン（選択されているもの）
    elif [[ "$line" =~ ^[[:space:]]*\*?([0-9a-zA-Z\.\-]+)$ ]]; then
        selected_version="${BASH_REMATCH[1]}"
        echo "${current_tool} ${selected_version}" >>"$TOOL_VERSIONS_FILE"
    fi
done

echo "✅ .tool-versions を更新しました:"
cat "$TOOL_VERSIONS_FILE"
