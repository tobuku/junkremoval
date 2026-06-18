#!/bin/bash
DOMAIN="https://removejunkhawaii.com"
DATE="2026-06-17"
OUT="sitemap.xml"

echo '<?xml version="1.0" encoding="UTF-8"?>' > "$OUT"
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> "$OUT"

# Homepage first with highest priority
echo "  <url><loc>${DOMAIN}/</loc><lastmod>${DATE}</lastmod><changefreq>weekly</changefreq><priority>1.0</priority></url>" >> "$OUT"

# Find all other pages
find . -name "index.html" ! -path "./index.html" | sed 's|^\./||' | sed 's|/index\.html$|/|' | sort | while read -r path; do
  url="${DOMAIN}/${path}"

  # Assign priority based on depth
  depth=$(echo "$path" | tr -cd '/' | wc -c)
  case $depth in
    1) priority="0.9" ; freq="weekly" ;;   # /companies/, /islands/, /services/, etc.
    2) priority="0.8" ; freq="weekly" ;;   # /islands/oahu/, /services/junk-removal/
    3) priority="0.7" ; freq="monthly" ;;  # /islands/oahu/honolulu/
    4) priority="0.6" ; freq="monthly" ;;  # /islands/oahu/honolulu/junk-removal/
    *) priority="0.5" ; freq="monthly" ;;
  esac

  echo "  <url><loc>${url}</loc><lastmod>${DATE}</lastmod><changefreq>${freq}</changefreq><priority>${priority}</priority></url>" >> "$OUT"
done

echo '</urlset>' >> "$OUT"
echo "Generated sitemap.xml with $(grep -c '<url>' "$OUT") URLs"
