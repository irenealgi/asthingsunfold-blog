Place the favicon source image you attached (square PNG, ideally 512x512 or larger) into this folder and name it `source-favicon.png`.

Then run the included `generate-favicons.sh` script (macOS) to create all required sizes referenced by `_includes/favicon.html`.

Example steps:

1. Save the attached image as `assets/images/favicon/source-favicon.png`.

2. From the repo root, run:

   ./assets/images/favicon/generate-favicons.sh

3. The script will create the following files in this directory:

   apple-touch-icon-57x57.png
   apple-touch-icon-60x60.png
   apple-touch-icon-72x72.png
   apple-touch-icon-76x76.png
   apple-touch-icon-114x114.png
   apple-touch-icon-120x120.png
   apple-touch-icon-144x144.png
   apple-touch-icon-152x152.png
   favicon-196x196.png
   favicon-96x96.png
   favicon-32x32.png
   favicon-16x16.png
   favicon-128.png
   mstile-144x144.png
   mstile-150x150.png
   mstile-310x150.png
   mstile-310x310.png
   mstile-70x70.png

Notes:
- The script uses macOS `sips` to resize images. If you prefer ImageMagick, replace the `sips` commands with `convert`.
- If the source image has transparency or padding you don't want, edit it first in an image editor.
- After generating, run `bundle exec jekyll build` or `bundle exec jekyll serve` to verify the site shows the new favicon.
