#!/bin/bash
# Generate city+service combo pages for Kauai x top 6 services

ISLAND_SLUG="kauai"
ISLAND_NAME="Kauai"

CITIES=(
"hanalei|Hanalei|Hanalei Town, Hanalei Bay, Wainiha, Haena, Princeville boundary|a laid-back North Shore beach town surrounded by dramatic Na Pali coast mountains, taro fields, and luxury vacation rentals"
"kalaheo|Kalaheo|Kalaheo, Kukuiolono, Lawai, Omao, Kalaheo Hillside|a quiet South Shore residential community perched above Poipu with local farms, coffee estates, and affordable family homes"
"kapaa|Kapaa|Kapaa Town, Wailua, Wailua Homesteads, Waipouli, Coconut Marketplace area, Kealia|Kauai's largest town on the east side, a commercial and residential hub with beachfront condos, older homes, and local shops"
"kilauea|Kilauea|Kilauea Town, Kilauea Lighthouse area, Anini Beach, Kalihiwai, Secret Beach area|a small North Shore community known for its historic lighthouse, organic farms, and luxury estates on bluffs above the ocean"
"koloa|Koloa|Koloa Town, Poipu, Poipu Beach, Kukuiula, Brennecke Beach area, Lawai Beach|a historic South Shore plantation town adjacent to the Poipu resort area with vacation rentals, condos, and local residences"
"lihue|Lihue|Lihue Town, Puhi, Hanamaulu, Nawiliwili, Rice Street area, Kauai Community College area|Kauai's county seat and airport town with government offices, shopping centers, and the island's main commercial district"
"princeville|Princeville|Princeville, Hanalei Plantation, Queens Bath area, Sealodge, Pali Ke Kua|a planned resort community on Kauai's North Shore with luxury condos, golf courses, and dramatic cliff-top ocean views"
"waimea|Waimea|Waimea Town, Kekaha, Waimea Canyon area, Pakala Village, Kikiaola|a historic West Side town at the gateway to Waimea Canyon, with military presence at Pacific Missile Range Facility nearby"
)

SERVICES=(
"junk-removal|Junk Removal|Full-service junk hauling and removal|old furniture, appliances, yard waste, garage clutter, and household items|150|800"
"furniture-removal|Furniture Removal|Sofa, table, desk, and bedroom set removal|sofas, sectionals, dining tables, dressers, bed frames, desks, and patio furniture|75|500"
"appliance-removal|Appliance Removal|Refrigerator, washer, dryer, and appliance hauling|refrigerators, washers, dryers, dishwashers, stoves, water heaters, and AC units|75|300"
"estate-cleanouts|Estate Cleanouts|Full-property cleanout services|entire home contents including furniture, personal items, appliances, and stored belongings|600|2500"
"construction-debris-removal|Construction Debris Removal|Renovation and construction waste hauling|drywall, lumber, tile, concrete, roofing materials, old fixtures, and demolition waste|200|1000"
"commercial-cleanouts|Commercial Cleanouts|Office and commercial space clearing|office furniture, cubicles, filing cabinets, commercial equipment, and retail fixtures|400|2000"
)

HEADER='<header class="header"><div class="container header-inner"><a href="/" class="logo"><div class="logo-icon"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M4 6h16l-1.5 9.5a2 2 0 0 1-2 1.5H7.5a2 2 0 0 1-2-1.5L4 6z"/><path d="M2 4h20"/><path d="M10 11v4"/><path d="M14 11v4"/></svg></div><div class="logo-text">RemoveJunk<span>Hawaii</span></div></a><nav class="nav-desktop"><a href="/companies/">Companies</a><a href="/islands/">Islands</a><a href="/services/">Services</a><a href="/resources/">Resources</a><a href="/blog/">Blog</a><a href="/add-business/">List Your Business</a><a href="tel:+18085366075" class="btn-nav-cta">Call (808) 536-6075</a></nav><button class="nav-toggle" aria-label="Open menu" aria-expanded="false" onclick="document.getElementById('\''mobileNav'\'').classList.toggle('\''open'\'');this.setAttribute('\''aria-expanded'\'',this.getAttribute('\''aria-expanded'\'')==='\''false'\'')"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg></button></div><nav class="nav-mobile" id="mobileNav"><a href="/companies/">Browse Companies</a><a href="/islands/">Browse by Island</a><a href="/services/">Services</a><a href="/resources/">Resources</a><a href="/tools/">Tools</a><a href="/blog/">Blog</a><a href="/add-business/">List Your Business</a><a href="tel:+18085366075">Call (808) 536-6075</a></nav></header>'

OPALA='<section class="section" style="padding:2.5rem 0;background:linear-gradient(135deg,var(--color-ocean),#1a5276)"><div class="container"><div style="display:flex;flex-wrap:wrap;align-items:center;gap:2rem;color:#fff"><div style="flex:1;min-width:280px"><div style="display:flex;align-items:center;gap:0.75rem;margin-bottom:0.75rem"><svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#fbbf24" stroke-width="2.5" stroke-linecap="round"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg><span style="font-size:0.85rem;font-weight:600;text-transform:uppercase;letter-spacing:0.08em;opacity:0.9">Hawaii'\''s Recommended Provider</span></div><h2 style="margin:0 0 0.5rem;font-size:1.75rem;color:#fff">Opala Kuleana</h2><p style="margin:0 0 1rem;opacity:0.9;line-height:1.6">Serving communities across the Hawaiian Islands with reliable, responsible junk removal. From single-item pickups to full property cleanouts &mdash; Opala Kuleana handles it all.</p><div style="display:flex;flex-wrap:wrap;gap:0.75rem"><a href="tel:+18085366075" class="btn" style="background:#fff;color:var(--color-ocean);font-weight:700;padding:0.75rem 1.5rem;border-radius:0.5rem;text-decoration:none;display:inline-flex;align-items:center;gap:0.5rem"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>(808) 536-6075</a><a href="https://opalakuleana.com" target="_blank" rel="noopener" style="border:2px solid rgba(255,255,255,0.6);color:#fff;font-weight:600;padding:0.75rem 1.5rem;border-radius:0.5rem;text-decoration:none">Visit Website</a></div></div></div></div></section>'

FOOTER='<footer class="footer"><div class="container"><div class="footer-grid"><div class="footer-brand"><a href="/" class="logo" style="color:var(--color-white)"><div class="logo-icon"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M4 6h16l-1.5 9.5a2 2 0 0 1-2 1.5H7.5a2 2 0 0 1-2-1.5L4 6z"/><path d="M2 4h20"/></svg></div><div class="logo-text">RemoveJunk<span>Hawaii</span></div></a><p>Hawaii'\''s most comprehensive junk removal directory.</p></div><div><h4>Islands</h4><ul><li><a href="/islands/oahu/">Oahu</a></li><li><a href="/islands/maui/">Maui</a></li><li><a href="/islands/kauai/">Kauai</a></li><li><a href="/islands/hawaii-island/">Hawaii Island</a></li><li><a href="/islands/molokai/">Molokai</a></li><li><a href="/islands/lanai/">Lanai</a></li></ul></div><div><h4>Services</h4><ul><li><a href="/services/junk-removal/">Junk Removal</a></li><li><a href="/services/furniture-removal/">Furniture Removal</a></li><li><a href="/services/appliance-removal/">Appliance Removal</a></li><li><a href="/services/estate-cleanouts/">Estate Cleanouts</a></li><li><a href="/services/construction-debris-removal/">Construction Debris</a></li><li><a href="/services/commercial-cleanouts/">Commercial Cleanouts</a></li></ul></div><div><h4>Resources</h4><ul><li><a href="/resources/transfer-stations/">Transfer Stations</a></li><li><a href="/resources/recycling/">Recycling Centers</a></li><li><a href="/blog/">Blog</a></li></ul></div><div><h4>For Providers</h4><ul><li><a href="/add-business/">Add Your Business</a></li><li><a href="/contact/">Contact Us</a></li><li><a href="/about/">About</a></li></ul></div></div><div class="footer-bottom"><span>&copy; 2026 RemoveJunkHawaii.com. All rights reserved.</span><div class="footer-bottom-links"><a href="/privacy/">Privacy</a><a href="/terms/">Terms</a><a href="/sitemap/">Sitemap</a></div></div></div></footer>'

MOBILEBAR='<div class="mobile-bar"><div class="mobile-bar-inner"><a href="tel:+18085366075" class="btn btn-primary">Call (808) 536-6075</a><a href="tel:+18085366075" class="btn btn-accent"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>Call</a></div></div>'

count=0

for city_data in "${CITIES[@]}"; do
    IFS='|' read -r city_slug city_name neighborhoods city_desc <<< "$city_data"

    for svc_data in "${SERVICES[@]}"; do
        IFS='|' read -r svc_slug svc_name svc_short svc_items svc_price_low svc_price_high <<< "$svc_data"

        dir="islands/${ISLAND_SLUG}/${city_slug}/${svc_slug}"
        mkdir -p "$dir"

        neighborhood_pills=""
        IFS=',' read -ra hoods <<< "$neighborhoods"
        for hood in "${hoods[@]}"; do
            hood=$(echo "$hood" | sed 's/^ *//')
            neighborhood_pills="${neighborhood_pills}                <span class=\"service-pill\">${hood}</span>
"
        done

        other_services=""
        for other_svc in "${SERVICES[@]}"; do
            IFS='|' read -r os_slug os_name os_short os_items os_pl os_ph <<< "$other_svc"
            if [ "$os_slug" != "$svc_slug" ]; then
                other_services="${other_services}                <a href=\"/islands/${ISLAND_SLUG}/${city_slug}/${os_slug}/\" class=\"related-card\"><h3>${os_name}</h3><p>${os_short} in ${city_name}.</p></a>
"
            fi
        done

        cat > "$dir/index.html" << HEREDOC
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${svc_name} in ${city_name}, ${ISLAND_NAME}, HI — Call (808) 536-6075 | RemoveJunkHawaii</title>
    <meta name="description" content="${svc_name} services in ${city_name}, ${ISLAND_NAME}. Professional ${svc_short,,} serving ${city_name} and nearby neighborhoods. Call (808) 536-6075 for service.">
    <link rel="canonical" href="https://removejunkhawaii.com/islands/${ISLAND_SLUG}/${city_slug}/${svc_slug}/">
    <meta property="og:type" content="website">
    <meta property="og:title" content="${svc_name} in ${city_name}, ${ISLAND_NAME} — Local Service">
    <meta property="og:description" content="Professional ${svc_short,,} in ${city_name}, ${ISLAND_NAME}. Call (808) 536-6075.">
    <meta property="og:url" content="https://removejunkhawaii.com/islands/${ISLAND_SLUG}/${city_slug}/${svc_slug}/">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <script type="application/ld+json">
    {"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[
        {"@type":"ListItem","position":1,"name":"Home","item":"https://removejunkhawaii.com/"},
        {"@type":"ListItem","position":2,"name":"Islands","item":"https://removejunkhawaii.com/islands/"},
        {"@type":"ListItem","position":3,"name":"${ISLAND_NAME}","item":"https://removejunkhawaii.com/islands/${ISLAND_SLUG}/"},
        {"@type":"ListItem","position":4,"name":"${city_name}","item":"https://removejunkhawaii.com/islands/${ISLAND_SLUG}/${city_slug}/"},
        {"@type":"ListItem","position":5,"name":"${svc_name}"}
    ]}
    </script>
    <script type="application/ld+json">
    {"@context":"https://schema.org","@type":"Service","name":"${svc_name} in ${city_name}, ${ISLAND_NAME}","description":"Professional ${svc_short,,} serving ${city_name} and surrounding ${ISLAND_NAME} neighborhoods.","provider":{"@type":"Organization","name":"Opala Kuleana","telephone":"(808) 536-6075","url":"https://opalakuleana.com"},"areaServed":{"@type":"City","name":"${city_name}","containedInPlace":{"@type":"AdministrativeArea","name":"${ISLAND_NAME}, Hawaii"}},"serviceType":"${svc_name}"}
    </script>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J4M41S5XTQ"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-J4M41S5XTQ');
</script>
</head>
<body>
    ${HEADER}

    <div class="container"><nav class="breadcrumb" aria-label="Breadcrumb"><a href="/">Home</a><span>/</span><a href="/islands/">Islands</a><span>/</span><a href="/islands/${ISLAND_SLUG}/">${ISLAND_NAME}</a><span>/</span><a href="/islands/${ISLAND_SLUG}/${city_slug}/">${city_name}</a><span>/</span>${svc_name}</nav></div>

    <section class="page-hero">
        <div class="container page-hero-content">
            <h1>${svc_name} in ${city_name}, ${ISLAND_NAME}</h1>
            <p>Professional ${svc_short,,} in ${city_name}. ${city_name} is ${city_desc}. Local providers handle ${svc_items} with reliable scheduling across ${ISLAND_NAME}. Call (808) 536-6075 to schedule service.</p>
            <div class="page-hero-stats">
                <div><div class="page-hero-stat-num">${ISLAND_NAME}</div><div class="page-hero-stat-label">Island</div></div>
                <div><div class="page-hero-stat-num">${city_name}</div><div class="page-hero-stat-label">Service Area</div></div>
                <div><div class="page-hero-stat-num">Free</div><div class="page-hero-stat-label">Call for Service</div></div>
            </div>
        </div>
    </section>

    ${OPALA}

    <section class="section">
        <div class="container">
            <div class="content-block">
                <h2>${svc_name} Services in ${city_name}</h2>
                <p>${svc_name} in ${city_name} covers the removal of ${svc_items}. Whether you're clearing out a single room or handling a larger project, ${city_name} providers are familiar with the area's housing types, access challenges, and disposal options specific to ${ISLAND_NAME}.</p>
                <p>Hawaii's island environment means disposal logistics are different from the mainland. Limited landfill capacity, county-specific transfer station rules, and barge costs for off-island disposal all factor into how providers operate. ${city_name} ${svc_short,,} crews work within these constraints daily, routing items to the appropriate transfer stations, recycling facilities, and donation centers across ${ISLAND_NAME}.</p>
                <p>Neighborhoods throughout ${city_name} — including $(echo "$neighborhoods" | sed 's/,/, /g') — are all within the service area. Call (808) 536-6075 to connect with a provider who serves your specific neighborhood in ${city_name}.</p>
            </div>
        </div>
    </section>

    <section class="section alt">
        <div class="container">
            <div class="section-header"><div class="section-label">Service Area</div><h2 class="section-title">${svc_name} Areas in ${city_name}</h2><p class="section-sub">Serving all ${city_name} neighborhoods and surrounding areas.</p></div>
            <div class="grid-4">
${neighborhood_pills}            </div>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="section-header centered"><div class="section-label">Pricing</div><h2 class="section-title">${svc_name} Cost in ${city_name}</h2><p class="section-sub">Typical pricing for ${svc_short,,} in the ${city_name} area.</p></div>
            <div class="pricing-grid">
                <div class="pricing-table-wrap">
                    <div class="pricing-table-header"><h3>${city_name} ${svc_name} Pricing</h3><p>Typical ranges for the ${city_name} area</p></div>
                    <table class="pricing-table"><thead><tr><th>Service Level</th><th>Price Range</th></tr></thead><tbody>
                        <tr><td>Single item or small job</td><td>\$${svc_price_low} – \$$(( svc_price_low + (svc_price_high - svc_price_low) / 3 ))</td></tr>
                        <tr><td>Partial load or multi-item</td><td>\$$(( svc_price_low + (svc_price_high - svc_price_low) / 3 )) – \$$(( svc_price_low + 2 * (svc_price_high - svc_price_low) / 3 ))</td></tr>
                        <tr><td>Full load or large project</td><td>\$$(( svc_price_low + 2 * (svc_price_high - svc_price_low) / 3 )) – \$${svc_price_high}+</td></tr>
                    </tbody></table>
                    <div class="pricing-note">Pricing varies based on volume, item type, weight, and access to your ${city_name} property. Stairs, narrow driveways, and remote locations on ${ISLAND_NAME} may affect cost. All pricing is confirmed onsite before work begins.</div>
                </div>
                <div class="pricing-cta">
                    <h3>Call Opala Kuleana</h3>
                    <p>Get a firm price for ${svc_short,,} at your ${city_name} property. Call (808) 536-6075 today.</p>
                    <ul class="check-list">
                        <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"/></svg>No-obligation service calls</li>
                        <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"/></svg>Licensed &amp; insured providers</li>
                        <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"/></svg>Serving all ${city_name} areas</li>
                        <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"/></svg>${ISLAND_NAME}-based crews</li>
                    </ul>
                    <a href="tel:+18085366075" class="btn btn-primary btn-full btn-lg">Call (808) 536-6075</a>
                </div>
            </div>
        </div>
    </section>

    <section class="section alt">
        <div class="container">
            <div class="section-header"><div class="section-label">More Services</div><h2 class="section-title">Other Services in ${city_name}</h2></div>
            <div class="related-grid">
${other_services}            </div>
        </div>
    </section>

    <section class="cta-band">
        <div class="container cta-band-content">
            <h2>Need ${svc_name} in ${city_name}?</h2>
            <p>Call (808) 536-6075 to connect with providers serving ${city_name} and all of ${ISLAND_NAME}.</p>
            <div class="cta-buttons">
                <a href="tel:+18085366075" class="btn btn-white btn-lg">Call (808) 536-6075</a>
                <a href="/islands/${ISLAND_SLUG}/${city_slug}/" class="btn btn-outline-white btn-lg">All ${city_name} Services</a>
            </div>
        </div>
    </section>

    ${FOOTER}
    ${MOBILEBAR}
    <script>function toggleFaq(btn){var a=btn.nextElementSibling;btn.classList.toggle('open');a.classList.toggle('open')}</script>
</body>
</html>
HEREDOC

        count=$((count + 1))
        echo "[$count/48] Created: $dir/index.html"
    done
done

echo ""
echo "Done! Generated $count Kauai city+service pages."
