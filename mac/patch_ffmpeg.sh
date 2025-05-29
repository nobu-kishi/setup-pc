#!/bin/bash

# このスクリプトは Homebrew の ffmpeg Formula にパッチを適用するためのものです
# https://github.com/yt-dlp/FFmpeg-Builds/issues/62#issuecomment-2177100664

# 設定
PATCH_URL="https://github.com/yt-dlp/FFmpeg-Builds/blob/master/patches/ffmpeg/release/7.1/0001-Nonstandard-HEVC-over-FLV.patch?raw=true"
FORMULA_URL="https://raw.githubusercontent.com/homebrew-ffmpeg/homebrew-ffmpeg/master/Formula/ffmpeg.rb"
FORMULA_FILE="ffmpeg.rb"
PATCH_BLOCK_FILE="patch_block.txt"

echo "⬇️ Formula を取得中..."
curl -sSL "$FORMULA_URL" -o "$FORMULA_FILE"

echo "🔍 パッチのSHA256を取得中..."
PATCH_SHA256=$(curl -sSL "$PATCH_URL" | shasum -a 256 | awk '{print $1}')
echo "✅ SHA256: $PATCH_SHA256"

echo "🧩 パッチブロックを作成中..."
cat >"$PATCH_BLOCK_FILE" <<EOF
    patch do
        url "$PATCH_URL"
        sha256 "$PATCH_SHA256"
    end
EOF
echo "🧩 Formula にパッチを追加中..."

# stable do ブロック内の最初の patch do ～ end の直後に追記
awk -v patch_file="$PATCH_BLOCK_FILE" '
  BEGIN {
    in_patch = 0;
    inserted = 0;
  }
  /^ *patch do *$/ {
    in_patch = 1;
  }
  /^ *end *$/ {
    if (in_patch && !inserted) {
      print $0;
      while ((getline line < patch_file) > 0) print line;
      close(patch_file);
      inserted = 1;
      in_patch = 0;
      next;
    }
  }
  {
    print;
  }
' "$FORMULA_FILE" >"${FORMULA_FILE}.tmp" && mv "${FORMULA_FILE}.tmp" "$FORMULA_FILE"

echo "🍺 Homebrew で ffmpeg をインストール中（カスタムFormula）..."
brew install --formula "./$FORMULA_FILE"

echo "🎉 インストール完了！"

rm -rf "$FORMULA_FILE" "$PATCH_BLOCK_FILE"
echo "🗑️ 一時ファイルを削除しました。"
