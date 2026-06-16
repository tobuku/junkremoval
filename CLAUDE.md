# RemoveJunkHawaii.com

## Overview
Statewide Hawaii junk removal directory. Static HTML/CSS/JS on GitHub Pages.
- **Domain**: removejunkhawaii.com
- **Repo**: junkremoval (tobuku/junkremoval)

## Tech Stack
- Static HTML/CSS/JS — no build system, no framework
- Shared CSS: `/css/style.css` (255 lines, CSS custom properties)
- Google Fonts: Inter (headings) + DM Sans (body)
- Schema.org structured data on every page (BreadcrumbList, FAQPage, ItemList)
- No GSAP or animation libraries — pure CSS transitions only

## Design System
- Color palette defined in CSS custom properties (`--color-ocean`, `--color-palm`, `--color-sand`, `--color-lava`, `--color-slate-*`)
- Component classes: `.service-card`, `.city-card`, `.service-pill`, `.island-pill`, `.info-card`, `.related-card`, `.faq-item`
- Layout: `.container` (1200px max), `.grid-2/3/4`, `.pricing-grid`
- Hero: `.page-hero` with gradient background
- Responsive breakpoints: 1024px, 768px, 480px, prefers-reduced-motion

## Page Template Pattern
Every subpage follows this structure:
1. `<head>` — meta charset, viewport, title, description, canonical, OG tags, Google Fonts, `/css/style.css`, JSON-LD schemas
2. `<header class="header">` — shared site header with logo SVG, desktop nav, mobile nav toggle
3. Breadcrumb nav
4. `.page-hero` section
5. Content sections (`.section`, `.section.alt` for alternating backgrounds)
6. FAQ accordion (uses `toggleFaq()` JS function)
7. CTA band
8. Footer (5-column grid)
9. Mobile bottom bar

## Standard Header HTML
```html
<header class="header"><div class="container header-inner"><a href="/" class="logo"><div class="logo-icon"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M4 6h16l-1.5 9.5a2 2 0 0 1-2 1.5H7.5a2 2 0 0 1-2-1.5L4 6z"/><path d="M2 4h20"/><path d="M10 11v4"/><path d="M14 11v4"/></svg></div><div class="logo-text">RemoveJunk<span>Hawaii</span></div></a><nav class="nav-desktop"><a href="/companies/">Companies</a><a href="/islands/">Islands</a><a href="/services/">Services</a><a href="/resources/">Resources</a><a href="/blog/">Blog</a><a href="/add-business/">List Your Business</a><a href="tel:+18085366075" class="btn-nav-cta">Call (808) 536-6075</a></nav><button class="nav-toggle" aria-label="Open menu" aria-expanded="false" onclick="document.getElementById('mobileNav').classList.toggle('open');this.setAttribute('aria-expanded',this.getAttribute('aria-expanded')==='false')"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg></button></div><nav class="nav-mobile" id="mobileNav"><a href="/companies/">Browse Companies</a><a href="/islands/">Browse by Island</a><a href="/services/">Services</a><a href="/resources/">Resources</a><a href="/tools/">Tools</a><a href="/blog/">Blog</a><a href="/add-business/">List Your Business</a><a href="tel:+18085366075">Call (808) 536-6075</a></nav></header>
```

## FAQ Toggle JS
```javascript
function toggleFaq(btn){var a=btn.nextElementSibling;btn.classList.toggle('open');a.classList.toggle('open')}
```

## Business Model
- **Primary CTA: Call (808) 536-6075** — this is Opala Kuleana's phone number and the main call-to-action site-wide
- No "free estimate" language, no "get quotes" language — the CTA is always to CALL
- **Opala Kuleana (opalakuleana.com)** is the primary featured provider on every junk removal page
- Prominent ocean-gradient featured section appears RIGHT AFTER the hero on all services, island/city, and company pages
- Opala Kuleana is positioned as the solution for every service type

## Nav links
- /companies/ — Company directory
- /islands/ — Browse by island (Oahu, Maui, Kauai, Hawaii Island, Molokai, Lanai)
- /services/ — 18 service categories
- /resources/ — Transfer stations, recycling centers
- /blog/ — Blog (coming soon landing page)
- /add-business/ — Business listing page

## Site Structure
```
index.html                          # Homepage
css/style.css                       # Shared stylesheet
companies/index.html                # Company directory (by island)
islands/index.html                  # Island browse page
islands/{island}/index.html         # Per-island pages (6)
islands/oahu/{city}/index.html      # Oahu city pages (20)
islands/{island}/{city}/index.html  # Neighbor island city pages (30)
services/index.html                 # Services browse page
services/{service}/index.html       # Per-service pages (18)
resources/index.html                # Resources hub page
resources/transfer-stations/        # Transfer station directory
resources/recycling/                # Recycling center directory
blog/index.html                     # Blog (coming soon)
add-business/index.html             # Business listing page
outscraper-junkremoval.gs           # Google Apps Script for Outscraper API
junkremoval-data.csv                # Scraped business data (310 rows, not committed)
```

## Data Source
- `junkremoval-data.csv` — 310 rows from Outscraper Google Maps scrape
- Columns: business_name, street_address, city, island, zip, phone, website, google_rating, review_count, hours_mon-sun, lat, lng
- No header row
- Contains junk removal companies, transfer stations, recycling centers, and noise (cleaning, towing, movers, laundry)
- Island field sometimes says "Hawaii" generically — use city/coordinates to determine actual island

## SEO Approach
- Programmatic SEO: city + service landing pages
- Every page has unique title, meta description, canonical URL
- Schema.org JSON-LD on every page
- Neighborhood pills for long-tail keyword coverage
- Internal linking between related pages

## Conventions
- No inline CSS — use /css/style.css classes. Only exception: page-specific component styles in a `<style>` block when the component doesn't exist in shared CSS
- All paths use leading slash (absolute from root): `/css/style.css`, `/companies/`, etc.
- Phone links: `<a href="tel:+18081234567">` format
- Star ratings rendered with SVG stars in HTML
- Hours parsed from JSON array format in CSV
