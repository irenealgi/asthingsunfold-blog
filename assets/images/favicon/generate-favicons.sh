#!/usr/bin/env bash
# Generate favicon sizes from a single square source PNG using macOS `sips`.
# Place your source image in this folder and name it `source-favicon.png`.
# Run from the repo root: ./assets/images/favicon/generate-favicons.sh

set -euo pipefail
cd "$(dirname "$0")"
SRC=source-favicon.png
if [ ! -f "$SRC" ]; then
  echo "Error: $SRC not found in $(pwd). Please save your attached favicon image as $SRC"
  exit 1
fi

declare -A sizes=(
  [apple-touch-icon-57x57.png]=57
  [apple-touch-icon-60x60.png]=60
  [apple-touch-icon-72x72.png]=72
  [apple-touch-icon-76x76.png]=76
  [apple-touch-icon-114x114.png]=114
  [apple-touch-icon-120x120.png]=120
  [apple-touch-icon-144x144.png]=144
  [apple-touch-icon-152x152.png]=152
  [favicon-196x196.png]=196
  [favicon-96x96.png]=96
  [favicon-32x32.png]=32
  [favicon-16x16.png]=16
  [favicon-128.png]=128
  [mstile-144x144.png]=144
  [mstile-150x150.png]=150
  [mstile-310x150.png]=150x310
  [mstile-310x310.png]=310
  [mstile-70x70.png]=70
)

for name in "${!sizes[@]}"; do
  size=${sizes[$name]}
  if [[ "$size" == *x* ]]; then
    # special case for non-square tile (310x150)
    width=${size%x*}
    height=${size#*x}
    echo "Creating $name (${width}x${height})"
    sips -z "$height" "$width" "$SRC" --out "$name" >/dev/null
  else
    echo "Creating $name (${size}x${size})"
    sips -Z "$size" "$SRC" --out "$name" >/dev/null
  fi
done

echo "Done. Created ${#sizes[@]} favicon files from $SRC"
