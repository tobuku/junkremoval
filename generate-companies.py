import json, html, re, os

with open('companies-data.json') as f:
    companies = json.load(f)

ISLAND_NAMES = {'oahu':'Oahu','maui':'Maui','kauai':'Kauai','hawaii-island':'Hawaii Island','molokai':'Molokai'}

HEADER = '<header class="header"><div class="container header-inner"><a href="/" class="logo"><div class="logo-icon"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M4 6h16l-1.5 9.5a2 2 0 0 1-2 1.5H7.5a2 2 0 0 1-2-1.5L4 6z"/><path d="M2 4h20"/><path d="M10 11v4"/><path d="M14 11v4"/></svg></div><div class="logo-text">RemoveJunk<span>Hawaii</span></div></a><nav class="nav-desktop"><a href="/companies/">Companies</a><a href="/islands/">Islands</a><a href="/services/">Services</a><a href="/resources/">Resources</a><a href="/blog/">Blog</a><a href="/add-business/">List Your Business</a></nav><button class="nav-toggle" aria-label="Open menu" aria-expanded="false" onclick="document.getElementById(\'mobileNav\').classList.toggle(\'open\');this.setAttribute(\'aria-expanded\',this.getAttribute(\'aria-expanded\')===\'false\')"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg></button></div><nav class="nav-mobile" id="mobileNav"><a href="/companies/">Browse Companies</a><a href="/islands/">Browse by Island</a><a href="/services/">Services</a><a href="/resources/">Resources</a><a href="/tools/">Tools</a><a href="/blog/">Blog</a><a href="/add-business/">List Your Business</a></nav></header>'

OPALA = '<section class="section" style="padding:2.5rem 0;background:linear-gradient(135deg,var(--color-ocean),#1a5276)"><div class="container"><div style="display:flex;flex-wrap:wrap;align-items:center;gap:2rem;color:#fff"><div style="flex:1;min-width:280px"><div style="display:flex;align-items:center;gap:0.75rem;margin-bottom:0.75rem"><svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#fbbf24" stroke-width="2.5" stroke-linecap="round"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg><span style="font-size:0.85rem;font-weight:600;text-transform:uppercase;letter-spacing:0.08em;opacity:0.9">Hawaii\'s Recommended Provider</span></div><h2 style="margin:0 0 0.5rem;font-size:1.75rem;color:#fff">Opala Kuleana</h2><p style="margin:0 0 1rem;opacity:0.9;line-height:1.6">Oahu's trusted junk removal provider. Call to schedule a free onsite estimate &mdash; no phone quotes, just accurate pricing at your door.</p><div style="display:flex;flex-wrap:wrap;gap:0.75rem"><a href="tel:+18085366075" class="btn" style="background:#fff;color:var(--color-ocean);font-weight:700;padding:0.75rem 1.5rem;border-radius:0.5rem;text-decoration:none;display:inline-flex;align-items:center;gap:0.5rem"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>(808) 536-6075</a><a href="https://opalakuleana.com" target="_blank" rel="noopener" style="border:2px solid rgba(255,255,255,0.6);color:#fff;font-weight:600;padding:0.75rem 1.5rem;border-radius:0.5rem;text-decoration:none">Visit Website</a></div></div></div></div></section>'

FOOTER = '<footer class="footer"><div class="container"><div class="footer-grid"><div class="footer-brand"><a href="/" class="logo" style="color:var(--color-white)"><div class="logo-icon"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M4 6h16l-1.5 9.5a2 2 0 0 1-2 1.5H7.5a2 2 0 0 1-2-1.5L4 6z"/><path d="M2 4h20"/></svg></div><div class="logo-text">RemoveJunk<span>Hawaii</span></div></a><p>Hawaii\'s most comprehensive junk removal directory.</p></div><div><h4>Islands</h4><ul><li><a href="/islands/oahu/">Oahu</a></li><li><a href="/islands/maui/">Maui</a></li><li><a href="/islands/kauai/">Kauai</a></li><li><a href="/islands/hawaii-island/">Hawaii Island</a></li><li><a href="/islands/molokai/">Molokai</a></li><li><a href="/islands/lanai/">Lanai</a></li></ul></div><div><h4>Services</h4><ul><li><a href="/services/junk-removal/">Junk Removal</a></li><li><a href="/services/furniture-removal/">Furniture Removal</a></li><li><a href="/services/appliance-removal/">Appliance Removal</a></li><li><a href="/services/estate-cleanouts/">Estate Cleanouts</a></li><li><a href="/services/construction-debris-removal/">Construction Debris</a></li><li><a href="/services/commercial-cleanouts/">Commercial Cleanouts</a></li></ul></div><div><h4>Resources</h4><ul><li><a href="/resources/transfer-stations/">Transfer Stations</a></li><li><a href="/resources/recycling/">Recycling Centers</a></li><li><a href="/blog/">Blog</a></li></ul></div><div><h4>For Providers</h4><ul><li><a href="/add-business/">Add Your Business</a></li><li><a href="/contact/">Contact Us</a></li><li><a href="/about/">About</a></li></ul></div></div><div class="footer-bottom"><span>&copy; 2026 RemoveJunkHawaii.com. All rights reserved.</span><div class="footer-bottom-links"><a href="/privacy/">Privacy</a><a href="/terms/">Terms</a><a href="/sitemap/">Sitemap</a></div></div></div></footer>'

MOBILEBAR = '<div class="mobile-bar"><div class="mobile-bar-inner"><a href="/companies/" class="btn btn-primary">Browse Companies</a><a href="/islands/" class="btn btn-accent">Browse Islands</a></div></div>'

GA = '''<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J4M41S5XTQ"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-J4M41S5XTQ');
</script>'''

STAR_SVG = '<svg viewBox="0 0 24 24" class="star-filled"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>'
STAR_HALF = '<svg viewBox="0 0 24 24" class="star-half"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>'

PHONE_SVG = '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>'

def stars_html(rating_str):
    if not rating_str: return ''
    rating = float(rating_str)
    full = int(rating)
    half = 1 if rating - full >= 0.3 else 0
    return STAR_SVG * full + STAR_HALF * half

def format_phone(p):
    if len(p) == 10:
        return f'({p[:3]}) {p[3:6]}-{p[6:]}'
    return p

count = 0
for co in companies:
    slug = co['slug']
    name = co['name']
    island_slug = co['island']
    island_name = ISLAND_NAMES.get(island_slug, island_slug.title())
    addr = co['address']
    rating = co['rating']
    reviews = co['reviews']
    phone = co['phone']
    hours = co['hours']

    phone_display = format_phone(phone) if phone else '(808) 536-6075'
    phone_link = f'+1{phone}' if phone else '+18085366075'

    city = ''
    if addr:
        parts = addr.split(',')
        if len(parts) >= 2:
            city = parts[-2].strip()

    dir_path = f'companies/{slug}'
    os.makedirs(dir_path, exist_ok=True)

    stars = stars_html(rating)

    rating_block = ''
    if rating:
        rating_block = f'''<div style="display:flex;align-items:center;gap:8px;margin-bottom:1rem">
            <div style="display:flex;gap:2px;color:var(--color-sand)">{stars}</div>
            <span style="font-weight:700;font-size:1.1rem">{rating}</span>
            <span style="color:rgba(255,255,255,0.7)">({reviews} reviews)</span>
        </div>'''

    info_items = ''
    if addr and addr != 'Hawaii':
        info_items += f'<div class="info-card"><strong>Address</strong><p>{addr}</p></div>\n'
    if phone:
        info_items += f'<div class="info-card"><strong>Phone</strong><p><a href="tel:{phone_link}">{phone_display}</a></p></div>\n'
    if hours:
        info_items += f'<div class="info-card"><strong>Hours</strong><p>{hours}</p></div>\n'
    info_items += f'<div class="info-card"><strong>Island</strong><p>{island_name}</p></div>\n'

    call_btn = ''
    if phone:
        call_btn = f'<a href="tel:{phone_link}" class="btn" style="background:#fff;color:var(--color-ocean);font-weight:700;padding:0.75rem 1.5rem;border-radius:0.5rem;text-decoration:none;display:inline-flex;align-items:center;gap:0.5rem">{PHONE_SVG}Call {phone_display}</a>'

    addr_schema = f'"address":{{"@type":"PostalAddress","streetAddress":"{addr}"}},' if addr and addr != 'Hawaii' else ''
    phone_schema = f'"telephone":"{phone_display}",' if phone else ''
    rating_schema = f',"aggregateRating":{{"@type":"AggregateRating","ratingValue":"{rating}","reviewCount":"{reviews.replace(",","")}"}}' if rating else ''
    rating_desc = f'Rated {rating}/5 from {reviews} reviews. ' if rating else ''
    city_prefix = f'{city}, ' if city else ''
    addr_about = f' Located at {addr},' if addr and addr != 'Hawaii' else ''

    page_html = f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{name} &mdash; Junk Removal in {island_name}, HI | RemoveJunkHawaii</title>
    <meta name="description" content="{name} provides junk removal services in {island_name}, Hawaii. {rating_desc}Call {phone_display} for service.">
    <link rel="canonical" href="https://removejunkhawaii.com/companies/{slug}/">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{name} &mdash; {island_name} Junk Removal">
    <meta property="og:description" content="{name} &mdash; junk removal in {island_name}. {rating_desc}">
    <meta property="og:url" content="https://removejunkhawaii.com/companies/{slug}/">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <script type="application/ld+json">
    {{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[
        {{"@type":"ListItem","position":1,"name":"Home","item":"https://removejunkhawaii.com/"}},
        {{"@type":"ListItem","position":2,"name":"Companies","item":"https://removejunkhawaii.com/companies/"}},
        {{"@type":"ListItem","position":3,"name":"{name}"}}
    ]}}
    </script>
    <script type="application/ld+json">
    {{"@context":"https://schema.org","@type":"LocalBusiness","name":"{name}",{addr_schema}{phone_schema}"areaServed":{{"@type":"AdministrativeArea","name":"{island_name}, Hawaii"}}{rating_schema}}}
    </script>
    <style>
    .profile-header {{background:linear-gradient(135deg, var(--color-ocean), #1a5276);color:#fff;padding:3rem 0}}
    .profile-header h1 {{color:#fff;font-size:1.8rem;margin-bottom:0.5rem}}
    .profile-header p {{color:rgba(255,255,255,0.8);margin-bottom:0.75rem}}
    .profile-info-grid {{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:1rem;margin-top:1.5rem}}
    .info-card {{background:var(--color-white);border:1px solid var(--color-slate-200);border-radius:var(--radius-md);padding:1.25rem}}
    .info-card strong {{display:block;font-size:0.8rem;text-transform:uppercase;letter-spacing:0.06em;color:var(--color-slate-400);margin-bottom:0.25rem}}
    .info-card p {{font-size:1rem;color:var(--color-slate-800);margin:0}}
    .info-card a {{color:var(--color-ocean-light)}}
    .star-filled {{width:20px;height:20px;fill:var(--color-sand)}}
    .star-half {{width:20px;height:20px;fill:var(--color-slate-300)}}
    </style>
{GA}
</head>
<body>
    {HEADER}

    <div class="container"><nav class="breadcrumb" aria-label="Breadcrumb"><a href="/">Home</a><span>/</span><a href="/companies/">Companies</a><span>/</span>{name}</nav></div>

    <section class="profile-header">
        <div class="container">
            <h1>{name}</h1>
            <p>{city_prefix}{island_name}, Hawaii</p>
            {rating_block}
            {call_btn}
        </div>
    </section>

    {OPALA}

    <section class="section">
        <div class="container">
            <h2>Company Details</h2>
            <div class="profile-info-grid">
                {info_items}
            </div>
        </div>
    </section>

    <section class="section alt">
        <div class="container">
            <h2>About {name}</h2>
            <div class="content-block">
                <p>{name} is a junk removal and hauling company serving {island_name}, Hawaii.{addr_about} this provider offers residential and commercial junk removal services including furniture removal, appliance hauling, estate cleanouts, and general debris removal.</p>
                <p>Hawaii's island environment creates unique challenges for waste disposal &mdash; limited landfill capacity, county-specific transfer station rules, and barge costs for off-island disposal. Local companies like {name} understand these logistics and route items to the appropriate facilities.</p>
                <p>For junk removal service in {island_name}, call <a href="tel:{phone_link}">{phone_display}</a>.</p>
            </div>
        </div>
    </section>

    <section class="cta-band">
        <div class="container cta-band-content">
            <h2>Need Junk Removal in {island_name}?</h2>
            <p>Browse our directory to find providers serving {island_name}.</p>
            <div class="cta-buttons">
                <a href="/companies/" class="btn btn-white btn-lg">Browse Companies</a>
                <a href="/companies/" class="btn btn-outline-white btn-lg">Browse All Companies</a>
            </div>
        </div>
    </section>

    {FOOTER}
    {MOBILEBAR}
    <script>function toggleFaq(btn){{var a=btn.nextElementSibling;btn.classList.toggle("open");a.classList.toggle("open")}}</script>
</body>
</html>'''

    with open(f'{dir_path}/index.html', 'w', encoding='utf-8') as f:
        f.write(page_html)

    count += 1

print(f'Done! Generated {count} company profile pages')
