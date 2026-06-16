# RemoveJunkHawaii.com — Complete Platform Specification

**Version:** 1.0
**Date:** 2026-06-15
**Domain:** RemoveJunkHawaii.com
**Platform Type:** Statewide Junk Removal Directory + Lead Generation Marketplace
**Target Market:** All Hawaiian Islands

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Business Model](#2-business-model)
3. [Site Architecture](#3-site-architecture)
4. [Location Structure](#4-location-structure)
5. [Service Categories](#5-service-categories)
6. [Listing System](#6-listing-system)
7. [Lead Generation System](#7-lead-generation-system)
8. [SEO Strategy](#8-seo-strategy)
9. [Content Strategy](#9-content-strategy)
10. [Tools and Calculators](#10-tools-and-calculators)
11. [Review System](#11-review-system)
12. [User Experience](#12-user-experience)
13. [Database Design](#13-database-design)
14. [Data Acquisition and Directory Population](#14-data-acquisition-and-directory-population)
15. [Competitive Advantages](#15-competitive-advantages)
16. [Monetization Roadmap](#16-monetization-roadmap)
17. [Success Metrics](#17-success-metrics)
18. [Technical Stack](#18-technical-stack)

---

## 1. Executive Summary

RemoveJunkHawaii.com is a purpose-built directory platform connecting Hawaii residents, businesses, property managers, contractors, real estate professionals, and government agencies with junk removal providers across every Hawaiian island.

**Why this wins:** No Hawaii-specific junk removal directory exists. Yelp, Angi, HomeAdvisor, and Thumbtack treat Hawaii as an afterthought — limited listings, no island-specific context, no understanding of Hawaii's unique logistics (inter-island shipping, limited landfills, high disposal costs, island-specific regulations). RemoveJunkHawaii.com owns the niche entirely.

**Core value propositions:**
- For customers: Find, compare, and get quotes from verified local junk removal providers instantly
- For providers: Receive qualified leads, build reputation, grow their business
- For the platform: Generate revenue through leads, featured listings, advertising, and premium tools

---

## 2. Business Model

### 2.1 Revenue Streams

| Stream | Model | Year 1 Target |
|--------|-------|---------------|
| Featured Listings | Monthly subscription | $500/mo |
| Premium Profiles | Monthly subscription | $300/mo |
| Pay-Per-Lead | Per qualified lead | $1,000/mo |
| Sponsored Placements | CPM/CPC | $200/mo |
| Banner Advertising | Monthly flat rate | $150/mo |
| Affiliate Commissions | Per referral/sale | $100/mo |
| Quote Matching Fee | Per matched quote | $200/mo |
| Claim Listing Upsell | One-time + monthly | $150/mo |

**Year 1 Revenue Target:** $2,600/mo ($31,200/yr) by month 12

### 2.2 Membership Plans

#### Free Listing (Imported/Claimed)
- Business name, address, phone, website
- Up to 3 photos
- Basic category listing
- Appear in search results (standard position)
- Receive quote requests (limited to 5/month)

#### Pro Listing — $49/month
- Everything in Free
- Unlimited photos and videos
- Priority search placement (above free listings)
- Unlimited quote requests
- Response to reviews
- Business hours and holiday schedule
- Service area map
- Analytics dashboard (views, clicks, calls)
- Verified badge

#### Premium Listing — $99/month
- Everything in Pro
- Featured placement on city and island pages
- Homepage rotation
- Highlighted in quote matching results
- Lead priority routing (first to receive leads)
- Competitor comparison shield (no competitor ads on your profile)
- Monthly performance report
- Dedicated support

#### Elite Listing — $199/month
- Everything in Premium
- Exclusive island-level sponsorship (1 per island per category)
- Custom landing page on the platform
- Blog feature article (quarterly)
- Social media promotion
- Video testimonial production assistance
- API access for lead integration
- White-label quote widget for their website

### 2.3 Pay-Per-Lead Options

| Lead Type | Price |
|-----------|-------|
| Standard quote request (name, phone, description) | $8–$15 |
| Verified quote request (photo included) | $15–$25 |
| Emergency/same-day request | $25–$40 |
| Commercial cleanout lead | $30–$50 |
| Multi-provider quote (shared lead, up to 3 providers) | $5–$10 each |

Lead pricing varies by island and service type. Oahu leads command premium pricing due to population density.

### 2.4 Advertising Options

| Placement | Price |
|-----------|-------|
| Homepage banner (728x90) | $300/month |
| Island page sidebar (300x250) | $150/month |
| City page banner | $75/month |
| Service category page banner | $100/month |
| Blog post sponsorship | $50/post |
| Email newsletter sponsorship | $100/send |
| Search results top placement | $0.50–$2.00 CPC |

### 2.5 Affiliate Opportunities

- Dumpster rental affiliate partnerships (national companies operating in Hawaii)
- Moving company referral partnerships
- Storage unit referral partnerships
- Donation center partnerships
- Recycling equipment affiliate links
- Home improvement tool affiliates
- Cleaning supply affiliates

### 2.6 AI-Powered Quote Matching

Customers describe their junk removal need (text + photos). The AI system:
1. Classifies the job type and estimated volume
2. Matches to qualified providers in the service area
3. Sends the lead to up to 3 matched providers
4. Providers respond with quotes
5. Customer compares and selects

Platform takes a matching fee ($3–$5 per match sent) or percentage of closed jobs (5–10% for opted-in providers).

### 2.7 Future Marketplace Opportunities

- **Instant booking:** Providers set availability and pricing; customers book and pay online
- **Dumpster rental marketplace:** Aggregate dumpster rental inventory across Hawaii
- **Donation pickup coordination:** Connect donors with charities that pick up
- **Recycling marketplace:** Connect scrap metal, e-waste, and recyclable material sellers with buyers
- **Labor marketplace:** On-demand helpers for DIY junk removal
- **Equipment rental:** Trailers, dollies, moving blankets
- **Disposal pass marketplace:** Bulk transfer station passes at discount

---

## 3. Site Architecture

### 3.1 Complete Sitemap

```
/                                          — Homepage
/companies/                                — Browse All Companies
/companies/{slug}/                         — Individual Company Profile
/islands/                                  — Browse by Island
/islands/{island}/                         — Island Landing Page
/islands/{island}/{city}/                  — City Landing Page
/islands/{island}/{city}/{service}/        — City + Service Page
/services/                                 — Browse All Services
/services/{service}/                       — Service Category Page
/services/{service}/{island}/              — Service + Island Page
/categories/                               — Browse All Categories
/blog/                                     — Blog Index
/blog/{slug}/                              — Blog Post
/resources/                                — Resource Hub
/resources/pricing-guides/                 — Pricing Guide Index
/resources/pricing-guides/{slug}/          — Individual Pricing Guide
/resources/disposal-laws/                  — Hawaii Disposal Laws
/resources/recycling/                      — Recycling Resources
/resources/donation-centers/               — Donation Center Directory
/resources/landfills/                      — Landfill Directory
/resources/transfer-stations/              — Transfer Station Directory
/resources/military-pcs/                   — Military PCS Resources
/resources/disaster-cleanup/               — Disaster Cleanup Resources
/resources/property-managers/              — Property Manager Hub
/resources/landlords/                      — Landlord Resource Hub
/resources/hoa/                            — HOA Resource Hub
/resources/contractors/                    — Contractor Resource Hub
/tools/                                    — Tools & Calculators Index
/tools/cost-calculator/                    — Junk Removal Cost Calculator
/tools/dumpster-calculator/                — Dumpster Size Calculator
/tools/load-calculator/                    — Load Size Calculator
/tools/cleanout-estimator/                 — Cleanout Cost Estimator
/tools/donation-calculator/                — Donation Value Calculator
/tools/debris-calculator/                  — Debris Volume Calculator
/compare/                                  — Compare Providers
/compare/{company-a}-vs-{company-b}/       — Head-to-Head Comparison
/reviews/                                  — Review Hub
/reviews/{company-slug}/                   — Company Reviews Page
/get-quotes/                               — Request Quote (Multi-Step Form)
/get-quotes/emergency/                     — Emergency Service Request
/dashboard/                                — Customer Dashboard
/dashboard/quotes/                         — My Quote Requests
/dashboard/reviews/                        — My Reviews
/dashboard/saved/                          — Saved Companies
/pro/                                      — Contractor Dashboard
/pro/leads/                                — Lead Management
/pro/reviews/                              — Review Management
/pro/profile/                              — Profile Editor
/pro/analytics/                            — Analytics & Reports
/pro/billing/                              — Billing & Subscription
/add-business/                             — Add Your Business
/claim/                                    — Claim Your Listing
/claim/{company-slug}/                     — Claim Specific Listing
/pricing/                                  — Platform Pricing (for providers)
/about/                                    — About Us
/contact/                                  — Contact
/privacy/                                  — Privacy Policy
/terms/                                    — Terms of Service
/sitemap.xml                               — XML Sitemap
/sitemap/                                  — HTML Sitemap
```

### 3.2 URL Pattern Logic

**Location pages follow island-first hierarchy:**
```
/islands/oahu/                             — Oahu landing
/islands/oahu/honolulu/                    — Honolulu landing
/islands/oahu/honolulu/junk-removal/       — Junk Removal in Honolulu
/islands/oahu/honolulu/appliance-removal/  — Appliance Removal in Honolulu
```

**Service pages follow service-first hierarchy:**
```
/services/junk-removal/                    — Statewide junk removal
/services/junk-removal/oahu/              — Junk removal on Oahu
/services/junk-removal/maui/             — Junk removal on Maui
```

**Company pages are flat:**
```
/companies/aloha-junk-removal/
/companies/island-haulers-hawaii/
```

This dual-path structure (location-first AND service-first) maximizes SEO surface area without duplicate content. Location pages focus on "junk removal in [city]" intent. Service pages focus on "[service type] Hawaii" intent.

---

## 4. Location Structure

### 4.1 Island and County Mapping

| Island | County | County Seat |
|--------|--------|-------------|
| Oahu | City and County of Honolulu | Honolulu |
| Maui | Maui County | Wailuku |
| Kauai | Kauai County | Lihue |
| Hawaii Island | Hawaii County | Hilo |
| Molokai | Maui County | Kaunakakai |
| Lanai | Maui County | Lanai City |

### 4.2 Oahu Cities and Towns

| City/Town | URL Slug | Population Tier |
|-----------|----------|-----------------|
| Honolulu | honolulu | Tier 1 |
| Ewa Beach | ewa-beach | Tier 1 |
| Kapolei | kapolei | Tier 1 |
| Waipahu | waipahu | Tier 1 |
| Mililani | mililani | Tier 1 |
| Pearl City | pearl-city | Tier 1 |
| Aiea | aiea | Tier 2 |
| Kaneohe | kaneohe | Tier 2 |
| Kailua | kailua | Tier 2 |
| Wahiawa | wahiawa | Tier 2 |
| Waialua | waialua | Tier 3 |
| Haleiwa | haleiwa | Tier 3 |
| Makakilo | makakilo | Tier 2 |
| Hawaii Kai | hawaii-kai | Tier 2 |
| Waimanalo | waimanalo | Tier 3 |
| Kahuku | kahuku | Tier 3 |
| Laie | laie | Tier 3 |
| Hauula | hauula | Tier 3 |
| Kaaawa | kaaawa | Tier 3 |
| Nanakuli | nanakuli | Tier 3 |
| Waianae | waianae | Tier 2 |

**Full URL examples for Oahu:**
```
/islands/oahu/
/islands/oahu/honolulu/
/islands/oahu/honolulu/junk-removal/
/islands/oahu/honolulu/furniture-removal/
/islands/oahu/honolulu/appliance-removal/
/islands/oahu/honolulu/estate-cleanouts/
/islands/oahu/ewa-beach/
/islands/oahu/ewa-beach/junk-removal/
/islands/oahu/kapolei/
/islands/oahu/kapolei/junk-removal/
... (every city x every service)
```

### 4.3 Maui Cities and Towns

| City/Town | URL Slug | Population Tier |
|-----------|----------|-----------------|
| Kahului | kahului | Tier 1 |
| Wailuku | wailuku | Tier 1 |
| Kihei | kihei | Tier 1 |
| Lahaina | lahaina | Tier 2 |
| Paia | paia | Tier 3 |
| Makawao | makawao | Tier 3 |
| Kula | kula | Tier 3 |
| Hana | hana | Tier 3 |

**Full URL examples for Maui:**
```
/islands/maui/
/islands/maui/kahului/
/islands/maui/kahului/junk-removal/
/islands/maui/lahaina/
/islands/maui/lahaina/storm-debris-removal/
```

### 4.4 Kauai Cities and Towns

| City/Town | URL Slug | Population Tier |
|-----------|----------|-----------------|
| Lihue | lihue | Tier 1 |
| Kapaa | kapaa | Tier 2 |
| Princeville | princeville | Tier 3 |
| Hanalei | hanalei | Tier 3 |
| Koloa | koloa | Tier 3 |
| Poipu | poipu | Tier 3 |
| Waimea | waimea-kauai | Tier 3 |

### 4.5 Hawaii Island Cities and Towns

| City/Town | URL Slug | Population Tier |
|-----------|----------|-----------------|
| Hilo | hilo | Tier 1 |
| Kailua-Kona | kailua-kona | Tier 1 |
| Keaau | keaau | Tier 2 |
| Pahoa | pahoa | Tier 3 |
| Waimea | waimea-big-island | Tier 2 |
| Waikoloa | waikoloa | Tier 2 |
| Ocean View | ocean-view | Tier 3 |

### 4.6 Molokai and Lanai

| City/Town | Island | URL Slug |
|-----------|--------|----------|
| Kaunakakai | Molokai | kaunakakai |
| Lanai City | Lanai | lanai-city |

**Full URL examples:**
```
/islands/molokai/
/islands/molokai/kaunakakai/
/islands/molokai/kaunakakai/junk-removal/
/islands/lanai/
/islands/lanai/lanai-city/
/islands/lanai/lanai-city/junk-removal/
```

### 4.7 Population Tier Strategy

- **Tier 1** (high population): Full content pages with unique copy, multiple providers, cost data, local tips, nearby disposal facilities, local regulations
- **Tier 2** (medium population): Template-generated pages with localized data points (nearest transfer station, service providers covering area, estimated costs)
- **Tier 3** (small population): Thin pages that aggregate to nearest Tier 1/2 hub with "serving [town] from [hub city]" messaging; expand to full pages when listing data supports it

### 4.8 Total Programmatic Page Count

| Page Type | Count |
|-----------|-------|
| Island pages | 6 |
| City pages | 48 |
| City + Service pages (48 cities x 28 services) | 1,344 |
| Service pages | 28 |
| Service + Island pages (28 x 6) | 168 |
| Company profile pages (target) | 500+ |
| Blog posts (Year 1 target) | 100+ |
| Resource pages | 50+ |
| Comparison pages | 100+ |
| **Total addressable pages** | **2,300+** |

---

## 5. Service Categories

### 5.1 Primary Service Categories

| Category | URL Slug | Search Volume Priority |
|----------|----------|----------------------|
| Junk Removal | junk-removal | High |
| Furniture Removal | furniture-removal | High |
| Appliance Removal | appliance-removal | High |
| Construction Debris Removal | construction-debris-removal | Medium |
| Yard Waste Removal | yard-waste-removal | Medium |
| Estate Cleanouts | estate-cleanouts | Medium |
| Garage Cleanouts | garage-cleanouts | Medium |
| E-Waste Removal | e-waste-removal | Medium |
| Scrap Metal Removal | scrap-metal-removal | Low |
| Commercial Cleanouts | commercial-cleanouts | Medium |

### 5.2 Full Category Taxonomy

```
Residential Services
├── Junk Removal (general)
├── Furniture Removal
│   ├── Couch Removal
│   ├── Desk Removal
│   └── Bedroom Set Removal
├── Appliance Removal
│   ├── Refrigerator Removal
│   ├── Washer/Dryer Removal
│   ├── Dishwasher Removal
│   ├── Oven/Stove Removal
│   └── Water Heater Removal
├── Mattress Removal
├── Hot Tub / Spa Removal
├── Shed Demolition and Removal
├── Garage Cleanouts
├── Attic Cleanouts
├── Basement Cleanouts (where applicable)
├── Storage Unit Cleanouts
├── Moving Cleanouts
├── Yard Waste Removal
│   ├── Green Waste Removal
│   ├── Tree Debris Removal
│   └── Palm Frond Removal
├── E-Waste Removal
│   ├── TV Removal
│   ├── Computer Removal
│   └── Electronics Recycling
└── Scrap Metal Removal

Property and Estate Services
├── Estate Cleanouts
├── Hoarder Cleanouts
├── Foreclosure Cleanouts
├── Tenant Cleanouts
├── Eviction Cleanouts
├── Real Estate Cleanouts
├── Property Management Cleanouts
├── Vacation Rental Cleanouts
└── Military PCS Cleanouts

Commercial Services
├── Commercial Cleanouts
├── Office Cleanouts
├── Retail Cleanouts
├── Warehouse Cleanouts
├── Restaurant Cleanouts
├── Hotel/Resort Cleanouts
└── Construction Site Cleanup

Specialty Services
├── Construction Debris Removal
│   ├── Concrete Removal
│   ├── Drywall Removal
│   ├── Roofing Debris Removal
│   └── Renovation Debris Removal
├── Storm Debris Removal
│   ├── Hurricane Cleanup
│   └── Flood Damage Debris
├── Disaster Cleanup
├── Illegal Dumping Cleanup
└── Biohazard Cleanup

Disposal and Recycling
├── Donation Pickup
├── Recycling Services
├── Hazardous Waste Disposal
├── Tire Disposal
├── Paint Disposal
└── Chemical Disposal
```

### 5.3 Category-to-Provider Mapping

Each provider can be tagged with multiple categories. Categories drive:
- Which city+service pages the provider appears on
- Quote routing logic
- Search filtering
- SEO landing page provider counts

---

## 6. Listing System

### 6.1 Business Profile Page — Complete Field Specification

```
CORE INFORMATION
├── company_name              — Required
├── slug                      — Auto-generated, editable
├── logo                      — Image upload (max 500KB, 400x400)
├── cover_image               — Image upload (max 2MB, 1200x400)
├── tagline                   — Max 120 characters
├── description               — Rich text, max 2000 characters
├── year_established          — Year
├── number_of_employees       — Range selector
├── locally_owned             — Boolean
├── veteran_owned             — Boolean
├── native_hawaiian_owned     — Boolean
└── woman_owned               — Boolean

CONTACT INFORMATION
├── phone_primary             — Required, click-to-call enabled
├── phone_secondary           — Optional
├── email                     — Required for claimed listings
├── website                   — URL
├── street_address            — Optional (some are mobile-only)
├── city                      — Required
├── island                    — Required
├── state                     — HI (fixed)
├── zip_code                  — Required
├── latitude                  — Auto-geocoded
├── longitude                 — Auto-geocoded
└── service_radius_miles      — Number

SOCIAL PROFILES
├── facebook_url
├── instagram_url
├── youtube_url
├── tiktok_url
├── google_business_url
├── yelp_url
└── nextdoor_url

SERVICE INFORMATION
├── categories[]              — Multi-select from taxonomy
├── service_areas[]           — Multi-select cities/islands
├── service_highlights[]      — Up to 6 bullet points
├── pricing_model             — Enum: flat_rate, hourly, volume_based, free_estimate
├── price_range_min           — Dollar amount
├── price_range_max           — Dollar amount
├── free_estimates            — Boolean
├── same_day_service          — Boolean
├── weekend_service           — Boolean
├── emergency_service         — Boolean
└── eco_friendly              — Boolean

HOURS OF OPERATION
├── monday                    — Open/Close time or "Closed"
├── tuesday
├── wednesday
├── thursday
├── friday
├── saturday
├── sunday
├── holiday_hours_note        — Free text
└── by_appointment_only       — Boolean

CREDENTIALS
├── license_number            — Text
├── license_type              — Enum
├── license_verified          — Boolean (admin-set)
├── insurance_verified        — Boolean (admin-set)
├── bonded                    — Boolean
├── certifications[]          — Multi-value text
└── affiliations[]            — Multi-value text (BBB, chamber, etc.)

MEDIA
├── photos[]                  — Up to 20 (Pro), 50 (Premium), unlimited (Elite)
├── videos[]                  — YouTube/Vimeo embeds, up to 5
├── before_after_photos[]     — Paired before/after sets
└── team_photos[]             — Staff/truck photos

REVIEWS (platform-generated)
├── average_rating            — Calculated 1.0–5.0
├── review_count              — Count
├── google_rating             — Imported from Google
├── google_review_count       — Imported from Google
├── trust_score               — Calculated composite score
└── reviews[]                 — Individual review objects

FAQ SECTION
├── faqs[]                    — Provider-written Q&A pairs, up to 10
└── auto_faqs[]               — System-generated based on category

CALL TO ACTION BUTTONS
├── request_quote_button      — Always visible
├── click_to_call_button      — Always visible (mobile prominent)
├── sms_button                — Visible on mobile
├── directions_button         — Links to Google Maps
├── website_button            — External link (nofollow)
└── share_button              — Social sharing
```

### 6.2 Profile Page Layout (Desktop)

```
┌─────────────────────────────────────────────────────────────┐
│ [Cover Image — full width]                                   │
│ ┌──────┐                                                     │
│ │ Logo │  Company Name          ★★★★☆ (4.2) · 47 reviews   │
│ └──────┘  Tagline               ✓ Licensed · ✓ Insured      │
│           Honolulu, Oahu        🟢 Open Now                  │
│                                                              │
│  [Get Quote]  [Call Now]  [Visit Website]  [Directions]      │
├──────────────────────────┬──────────────────────────────────┤
│ About                     │ Quick Facts                      │
│ [Description text...]     │ Established: 2015                │
│                           │ Employees: 5–10                  │
│ Services                  │ Service Area: All Oahu           │
│ • Junk Removal            │ Price Range: $$                  │
│ • Furniture Removal       │ Free Estimates: Yes              │
│ • Appliance Removal       │ Same Day: Yes                    │
│ • Estate Cleanouts        │ Eco-Friendly: Yes                │
│ • ...                     │ Locally Owned: Yes               │
│                           │                                  │
│ Service Areas             │ Hours                            │
│ [Map with service area]   │ Mon–Fri: 7am–6pm                │
│ Honolulu · Kailua ·      │ Sat: 8am–4pm                    │
│ Kaneohe · Pearl City ·   │ Sun: Closed                      │
│ ...                       │                                  │
├───────────────────────────┴──────────────────────────────────┤
│ Photos & Videos                                              │
│ [Gallery grid — before/after, work photos, trucks]           │
├──────────────────────────────────────────────────────────────┤
│ Customer Reviews                            [Write a Review] │
│ ★★★★★  "Best junk removal on Oahu..."  — Sarah K. 6/1/26   │
│ ★★★★☆  "Quick and professional..."     — Mike T. 5/15/26   │
│ [Load More Reviews]                                          │
├──────────────────────────────────────────────────────────────┤
│ Frequently Asked Questions                                   │
│ ▸ What items do you remove?                                  │
│ ▸ How much does junk removal cost?                          │
│ ▸ Do you offer same-day service?                            │
├──────────────────────────────────────────────────────────────┤
│ Similar Companies on Oahu                                    │
│ [3 related listings with ratings and CTA]                    │
└──────────────────────────────────────────────────────────────┘
```

### 6.3 Structured Data on Profile Page

Every company profile emits:
- `LocalBusiness` schema (with `@type` refined to appropriate sub-type)
- `AggregateRating` schema
- `Review` schema (for each review)
- `FAQPage` schema
- `BreadcrumbList` schema
- `GeoCoordinates` schema
- `OpeningHoursSpecification` schema

---

## 7. Lead Generation System

### 7.1 Instant Quote Request Flow

```
Step 1: What do you need removed?
├── Category selector (visual icons)
├── Description textarea
├── Photo upload (up to 5 photos)
└── [Next]

Step 2: Where are you located?
├── Island selector
├── City selector (filtered by island)
├── ZIP code
├── Address (optional, for onsite estimates)
└── [Next]

Step 3: When do you need service?
├── Urgency selector
│   ├── Emergency / Today
│   ├── Within 2–3 days
│   ├── This week
│   ├── Flexible / No rush
│   └── Just getting prices
└── [Next]

Step 4: Your contact information
├── Name
├── Phone
├── Email
├── Preferred contact method (call, text, email)
└── [Get My Quotes]

Result: Thank You Page
├── "Your request has been sent to X providers"
├── Expected response time
├── Matched provider cards with ratings
├── Track your request → Dashboard
└── [Browse more providers]
```

### 7.2 Multi-Company Quote Request

From any search results or company listing page, customers can:
1. Check up to 3 companies
2. Click "Get Quotes from Selected"
3. Fill one form, sent to all selected providers
4. Each provider receives the lead independently
5. Customer compares responses in their dashboard

### 7.3 Lead Routing Engine

```
Lead arrives →
  1. Classify by category, location, urgency
  2. Find all providers matching:
     - Category match
     - Service area match
     - Currently active/subscribed
  3. Sort by:
     - Membership tier (Elite > Premium > Pro > Free)
     - Response time history
     - Rating
     - Distance
  4. Route to top 3 (or customer-selected) providers
  5. Notify providers via:
     - Email (instant)
     - SMS (instant for Premium+)
     - Dashboard notification
     - Push notification (future app)
  6. Track:
     - Time to first response
     - Quote submitted
     - Job won/lost
     - Customer satisfaction
```

### 7.4 AI Quote Assistant

A conversational interface on the homepage and quote pages:

```
AI: "Hi! I can help you find the right junk removal service.
     What do you need to get rid of?"

User: "I have an old couch, a broken fridge, and some boxes
       in my garage in Kailua"

AI: "Got it — furniture removal and appliance removal in
     Kailua, Oahu. Based on what you described, this is
     typically a half-truck load.

     Estimated cost range: $250–$450

     I found 4 providers serving Kailua with same-day
     availability. Want me to send them your details
     for exact quotes?"

User: "Yes"

AI: [Collects name, phone, email → routes lead]
```

The AI assistant uses:
- Category classification from description
- Volume estimation from item lists
- Local pricing data from completed jobs
- Provider matching from service area data

### 7.5 Emergency Service Requests

Dedicated `/get-quotes/emergency/` page for:
- Storm damage cleanup
- Eviction cleanouts (same-day)
- Illegal dumping (urgent for businesses)
- Safety hazards

Emergency leads are:
- Flagged as priority
- Sent to all active providers in the area (not just top 3)
- Priced at emergency lead rates
- Tracked with faster SLA expectations

### 7.6 Property Assessment Forms

For large jobs (estate cleanouts, commercial cleanouts, foreclosures):

```
Property Type: [Residential / Commercial / Multi-Unit]
Property Size: [Sq ft or bedroom count]
Cleanout Scope: [Full / Partial / Specific rooms]
Access Issues: [Stairs / Elevator / Narrow access / Gated]
Hazardous Materials: [Yes / No / Unknown]
Timeline: [Date needed]
Photos: [Upload room-by-room]
Special Instructions: [Textarea]
Budget Range: [Optional]
```

---

## 8. SEO Strategy

### 8.1 Keyword Architecture

**Head terms (statewide):**
- junk removal hawaii
- junk removal near me (hawaii IP)
- hawaii junk removal
- trash removal hawaii
- hauling services hawaii

**Island terms:**
- junk removal oahu
- junk removal maui
- junk removal kauai
- junk removal big island
- junk removal kona
- junk removal hilo

**City terms (highest volume):**
- junk removal honolulu
- junk removal kapolei
- junk removal kailua
- junk removal ewa beach
- junk removal pearl city
- junk removal kahului
- junk removal kihei
- junk removal lihue

**Long-tail (city + service):**
- appliance removal honolulu
- estate cleanout oahu
- furniture removal kailua
- construction debris removal kapolei
- hot tub removal hawaii kai
- hoarder cleanout maui

**Informational:**
- how much does junk removal cost in hawaii
- where to dump furniture oahu
- oahu transfer station hours
- hawaii landfill locations
- free junk removal hawaii

### 8.2 Programmatic SEO Templates

#### City Page Template
**URL:** `/islands/{island}/{city}/`
**Title:** `Junk Removal in {City}, {Island} — {Count} Local Companies | RemoveJunkHawaii`
**H1:** `Junk Removal Companies in {City}`
**Content blocks:**
1. Intro paragraph (unique per city, referencing local landmarks/neighborhoods)
2. Provider listings (sorted by tier, then rating)
3. Service category quick links
4. Local pricing data (average cost for common jobs)
5. Nearest disposal facilities (transfer stations, recycling centers)
6. City-specific tips (parking, access, regulations)
7. FAQ section (programmatic, city-aware)
8. Related cities on same island

#### Service Page Template
**URL:** `/services/{service}/`
**Title:** `{Service} in Hawaii — Compare Local Providers | RemoveJunkHawaii`
**H1:** `{Service} Services in Hawaii`
**Content blocks:**
1. Service explanation (what it includes, what to expect)
2. Provider listings filtered by service
3. Island quick links
4. Pricing guide for this service
5. Before/after photos (aggregated from providers)
6. Tips for this service type
7. Related services
8. FAQ section (service-specific)

#### City + Service Page Template
**URL:** `/islands/{island}/{city}/{service}/`
**Title:** `{Service} in {City}, Hawaii — Top Rated Companies | RemoveJunkHawaii`
**H1:** `{Service} in {City}`
**Content blocks:**
1. Localized intro (1–2 paragraphs)
2. Filtered provider listings (service + city match)
3. Local pricing data for this service in this area
4. How to prepare for this service
5. Local disposal options for this material type
6. Get quotes CTA
7. FAQ (service + city specific)

### 8.3 Schema Markup Strategy

Every page type gets appropriate schema:

| Page Type | Schema Types |
|-----------|-------------|
| Homepage | `Organization`, `WebSite`, `SearchAction` |
| Company Profile | `LocalBusiness`, `AggregateRating`, `Review`, `FAQPage`, `BreadcrumbList` |
| City Page | `ItemList`, `BreadcrumbList`, `FAQPage` |
| Service Page | `Service`, `ItemList`, `BreadcrumbList`, `FAQPage` |
| City + Service Page | `Service`, `ItemList`, `BreadcrumbList`, `FAQPage` |
| Blog Post | `Article`, `BreadcrumbList`, `FAQPage` (if applicable) |
| Cost Calculator | `WebApplication`, `BreadcrumbList` |
| Resource Page | `Article`, `BreadcrumbList` |

### 8.4 Technical SEO

- **Canonical URLs:** Every page has a self-referencing canonical
- **Hreflang:** Not needed (English only, US only)
- **Pagination:** Service listing pages use `rel=next/prev` or infinite scroll with SEO-friendly fallback
- **Internal linking:** Every city page links to its service sub-pages; every service page links to its city sub-pages; every company profile links to its city and service pages
- **XML sitemap:** Split by type — `sitemap-companies.xml`, `sitemap-locations.xml`, `sitemap-services.xml`, `sitemap-blog.xml`, `sitemap-resources.xml`
- **Robots.txt:** Block `/dashboard/`, `/pro/`, `/api/`, search result pages with filters
- **Page speed:** Target <2s LCP on mobile. Static generation for all programmatic pages. Image optimization. Lazy loading below fold.
- **Mobile-first:** All pages designed mobile-first. Click-to-call prominent. Thumb-friendly tap targets.

### 8.5 AI Search Optimization (GEO)

Optimize for AI search engines (Google SGE, ChatGPT, Perplexity):

- **Entity clarity:** Every page clearly states what it is, who it's for, and where it applies in the first 100 words
- **Structured answers:** Use definition lists, comparison tables, and direct Q&A format
- **Citable statistics:** Include specific numbers (average costs, provider counts, review scores)
- **Source authority:** Cite Hawaii-specific regulations, transfer station data, and disposal laws
- **Freshness signals:** Date-stamp pricing data, update provider counts programmatically

### 8.6 Voice Search Optimization

Target conversational queries:
- "Who does junk removal near me in Kailua?"
- "How much does it cost to remove a couch in Honolulu?"
- "What's the best junk removal company on Maui?"

Implement:
- FAQ schema on every location and service page
- Speakable schema on key content
- Natural language in H2/H3 headings (question format)
- Direct answers in first paragraph of each section

---

## 9. Content Strategy

### 9.1 Content Silos

#### Silo 1: Cost Guides
```
/resources/pricing-guides/
├── junk-removal-cost-hawaii/
├── furniture-removal-cost/
├── appliance-removal-cost/
├── estate-cleanout-cost/
├── hoarder-cleanout-cost/
├── construction-debris-removal-cost/
├── yard-waste-removal-cost/
├── hot-tub-removal-cost/
├── shed-demolition-cost/
├── dumpster-rental-cost-hawaii/
├── e-waste-disposal-cost/
└── commercial-cleanout-cost/
```

Each guide includes:
- Average cost ranges for Hawaii (higher than mainland — acknowledge this)
- Cost factors (island, access, volume, urgency, disposal fees)
- Cost comparison table (service vs DIY vs dumpster rental)
- How to save money
- What's included in the price
- FAQ

#### Silo 2: Hawaii Disposal Laws and Regulations
```
/resources/disposal-laws/
├── hawaii-illegal-dumping-laws/
├── appliance-disposal-regulations/
├── electronics-disposal-hawaii/
├── hazardous-waste-disposal-hawaii/
├── construction-waste-regulations/
├── oahu-disposal-rules/
├── maui-disposal-rules/
├── kauai-disposal-rules/
└── hawaii-island-disposal-rules/
```

#### Silo 3: Disposal Facility Directory
```
/resources/transfer-stations/
├── oahu-transfer-stations/
│   ├── waimanalo-gulch-sanitary-landfill/
│   └── ... (each facility)
├── maui-transfer-stations/
├── kauai-transfer-stations/
└── hawaii-island-transfer-stations/

/resources/recycling/
├── oahu-recycling-centers/
├── maui-recycling-centers/
├── kauai-recycling-centers/
└── hawaii-island-recycling-centers/

/resources/donation-centers/
├── oahu-donation-centers/
│   ├── goodwill-hawaii/
│   ├── salvation-army-hawaii/
│   ├── habitat-for-humanity-restore/
│   └── ...
├── maui-donation-centers/
├── kauai-donation-centers/
└── hawaii-island-donation-centers/
```

#### Silo 4: Audience-Specific Resource Hubs
```
/resources/property-managers/
├── property-manager-cleanout-guide/
├── tenant-turnover-cleanout-checklist/
├── vacation-rental-cleanout-guide/
└── bulk-service-agreements/

/resources/landlords/
├── eviction-cleanout-guide-hawaii/
├── tenant-damage-cleanup/
├── abandoned-property-disposal-laws/
└── landlord-junk-removal-checklist/

/resources/hoa/
├── hoa-bulk-waste-programs/
├── community-cleanup-event-planning/
└── hoa-approved-junk-removal-companies/

/resources/contractors/
├── construction-debris-disposal-guide/
├── renovation-waste-management/
└── subcontractor-hauling-services/

/resources/military-pcs/
├── pcs-move-junk-removal/
├── military-discount-junk-removal-hawaii/
├── base-housing-cleanout-guide/
└── military-storage-cleanout/
```

### 9.2 Blog Content Calendar (Year 1)

**Monthly output:** 8–10 posts

**Content types:**
- How-to guides (40%)
- Cost/pricing articles (20%)
- Local resource articles (15%)
- Seasonal/timely (15%)
- Company spotlights (10%)

**Sample Year 1 titles:**

**Q1:**
- How Much Does Junk Removal Cost on Oahu in 2026?
- 7 Things to Know Before Hiring a Junk Removal Company in Hawaii
- Oahu Transfer Station Guide: Locations, Hours, and Accepted Items
- What Happens to Your Junk After It's Hauled Away in Hawaii?
- Estate Cleanout Guide for Hawaii Families
- Where to Donate Furniture on Oahu
- Maui Junk Removal: What to Expect and What It Costs
- The Complete Guide to Appliance Disposal in Hawaii

**Q2:**
- Spring Cleaning? Hawaii Junk Removal Checklist
- How to Prepare for a Junk Removal Appointment
- Kauai Recycling Guide: What Goes Where
- Commercial Cleanout Services in Honolulu
- Hawaii Hoarder Cleanout: A Compassionate Guide
- DIY vs Professional Junk Removal: Cost Comparison for Hawaii
- Military PCS Move? Junk Removal Services Near Hawaii Bases
- Illegal Dumping in Hawaii: Laws, Fines, and How to Report

**Q3–Q4:** Continue cadence covering remaining cities, services, seasonal content (hurricane prep, holiday cleanout, end-of-year decluttering), and company spotlights.

### 9.3 Content Production System

For programmatic pages at scale:
1. **Data-driven templates:** City pages, service pages, and city+service pages are generated from structured data (provider counts, average ratings, price ranges, nearest facilities)
2. **Human-written intros:** Each Tier 1 city and each primary service gets a unique 200–400 word intro written by a human or high-quality AI with manual review
3. **Dynamic content blocks:** Provider listings, pricing data, and facility links are pulled from the database and rendered at build time
4. **Thin content prevention:** Pages with fewer than 2 providers get a "Coming soon — request to be notified" treatment + aggregate to nearest hub page. No empty pages indexed.

---

## 10. Tools and Calculators

### 10.1 Junk Removal Cost Calculator

**URL:** `/tools/cost-calculator/`

**Inputs:**
```
Island: [Oahu / Maui / Kauai / Hawaii Island / Molokai / Lanai]
City: [Filtered by island]
Items to Remove:
  □ Couch/Sofa (+$75–$150)
  □ Mattress (+$50–$100)
  □ Refrigerator (+$75–$150)
  □ Washer/Dryer (+$60–$120)
  □ Dining Table (+$50–$100)
  □ Desk (+$40–$80)
  □ TV (+$30–$60)
  □ Boxes/Bags (per item +$10–$20)
  □ Other (describe)
OR
Load Size: [Single Item / Few Items / Quarter Truck / Half Truck / Full Truck]
Access Difficulty: [Ground floor / Stairs / Elevator / Tight access]
Urgency: [Flexible / This week / Tomorrow / Today/Emergency]
```

**Output:**
```
Estimated Cost: $XXX – $XXX
Based on: [load size] on [island]

This estimate includes:
✓ Labor (2 crew members)
✓ Truck/hauling
✓ Disposal fees
✓ Basic cleanup

Cost factors for [city]:
• [Island] disposal fees: $XX/ton at [nearest transfer station]
• [Urgency] surcharge: +$XX
• [Access] surcharge: +$XX

💡 Save money: [Tip based on items — e.g., "Your refrigerator may qualify
   for free pickup through Hawaii Energy's appliance recycling program"]

[Get Exact Quotes from Local Companies →]
```

### 10.2 Dumpster Size Calculator

**URL:** `/tools/dumpster-calculator/`

Helps users determine if they need junk removal service or a dumpster rental:

**Inputs:** Room type, number of rooms, debris type, project type
**Output:** Recommended dumpster size (10/15/20/30/40 yard), estimated rental cost, comparison to full-service junk removal cost, recommendation

### 10.3 Load Size Calculator

**URL:** `/tools/load-calculator/`

Visual tool showing truck bed with draggable item icons. User places items to see how much truck space they'll need. Outputs fractional truck load estimate and cost range.

### 10.4 Cleanout Cost Estimator

**URL:** `/tools/cleanout-estimator/`

For large-scale cleanouts (estates, foreclosures, hoarder homes):

**Inputs:** Property size, fullness level (1–10 scale), number of rooms, special conditions (biohazard, heavy items, stairs), island
**Output:** Estimated cost range, estimated time, recommended number of trucks, suggested provider tier

### 10.5 Donation Value Calculator

**URL:** `/tools/donation-calculator/`

Helps users estimate tax deduction value of donated items:

**Inputs:** Item list with condition ratings
**Output:** Estimated fair market value, potential tax deduction, nearest donation centers accepting those items, which items donation centers typically reject

### 10.6 Debris Volume Calculator

**URL:** `/tools/debris-calculator/`

For construction/renovation debris:

**Inputs:** Material type, dimensions or weight estimate
**Output:** Cubic yard estimate, disposal cost estimate, recommended removal method, material-specific disposal requirements in Hawaii

---

## 11. Review System

### 11.1 Review Schema

```
review:
  id: UUID
  company_id: FK → businesses
  user_id: FK → users
  rating: 1–5 (integer)
  title: varchar(200)
  body: text (max 5000 chars)
  service_category: FK → categories
  service_date: date
  verified: boolean
  verification_method: enum [email, phone, lead_match, receipt]
  photos[]: array of image URLs
  video_url: optional
  helpful_count: integer
  reported: boolean
  company_response: text
  company_response_date: datetime
  created_at: datetime
  updated_at: datetime
  status: enum [pending, published, flagged, removed]
```

### 11.2 Verification System

**Tier 1 — Basic Verified:**
- Email address confirmed
- Displayed as "Verified Reviewer"

**Tier 2 — Service Verified:**
- Reviewer matched to a lead/quote request in the system
- Displayed as "Verified Customer"

**Tier 3 — Receipt Verified:**
- Reviewer uploads receipt/invoice from the provider
- Displayed as "Verified Purchase"

### 11.3 Trust Score Algorithm

Each company receives a composite Trust Score (0–100):

```
Trust Score = weighted average of:
  Platform review average (30%)
  Google review average (20%)
  Review volume score (10%) — logarithmic scale
  Response rate to reviews (10%)
  Response rate to leads (10%)
  Profile completeness (5%)
  Years in business (5%)
  Credential verification (10%) — license, insurance, bonded
```

Displayed as:
- 90–100: "Exceptional Trust"
- 75–89: "High Trust"
- 60–74: "Good Trust"
- 40–59: "Building Trust"
- Below 40: Score not displayed

### 11.4 Review Fraud Prevention

- Rate limiting: Max 1 review per company per user per 90 days
- IP monitoring: Flag multiple reviews from same IP
- Pattern detection: Flag reviews that are too similar (copy-paste)
- New account throttle: Accounts <24 hours old cannot leave reviews
- Business owner self-review detection: Flag if reviewer email domain matches business website domain
- Manual moderation queue for flagged reviews

### 11.5 Company Response System

Claimed listing owners can:
- Respond publicly to any review (one response per review)
- Report reviews for policy violations
- Request verification of a review
- See aggregate review analytics (rating trends, sentiment, common themes)

---

## 12. User Experience

### 12.1 Homepage

```
┌──────────────────────────────────────────────────────────────┐
│ HERO SECTION                                                  │
│                                                                │
│  Find Junk Removal Services in Hawaii                         │
│                                                                │
│  ┌──────────────────────────────────────────┐  [Search]       │
│  │ What do you need removed?                 │                 │
│  └──────────────────────────────────────────┘                 │
│  ┌─────────────────┐  ┌─────────────────────┐                 │
│  │ Select Island ▼  │  │ Select City ▼       │                 │
│  └─────────────────┘  └─────────────────────┘                 │
│                                                                │
│  or [Get Instant Quotes]  [Talk to AI Assistant]              │
├──────────────────────────────────────────────────────────────┤
│ POPULAR SERVICES (icon grid)                                  │
│ 🚛 Junk Removal  🛋 Furniture  ❄ Appliances  🏠 Cleanouts   │
│ 🌿 Yard Waste    🔨 Debris     ♻ E-Waste    📦 Moving       │
├──────────────────────────────────────────────────────────────┤
│ BROWSE BY ISLAND                                              │
│ [Oahu]  [Maui]  [Kauai]  [Hawaii Island]  [Molokai] [Lanai]│
│  245      62      38        71              8         4       │
│ companies                                                     │
├──────────────────────────────────────────────────────────────┤
│ FEATURED COMPANIES (carousel — paid placements)               │
│ [Company Card] [Company Card] [Company Card] [Company Card]  │
├──────────────────────────────────────────────────────────────┤
│ TOP RATED ON EACH ISLAND                                      │
│ Oahu: Company X ★4.9 (127 reviews)                           │
│ Maui: Company Y ★4.8 (43 reviews)                            │
│ Kauai: Company Z ★4.7 (28 reviews)                           │
├──────────────────────────────────────────────────────────────┤
│ HOW IT WORKS                                                  │
│ 1. Tell us what you need removed                              │
│ 2. Get quotes from top local companies                        │
│ 3. Compare and choose the best fit                            │
│ 4. Get your junk removed                                      │
├──────────────────────────────────────────────────────────────┤
│ LATEST COST DATA                                              │
│ Average junk removal cost on Oahu: $275–$550                  │
│ [Full pricing guide →]                                        │
├──────────────────────────────────────────────────────────────┤
│ RECENT BLOG POSTS                                             │
│ [Post] [Post] [Post]                                          │
├──────────────────────────────────────────────────────────────┤
│ FOR SERVICE PROVIDERS                                         │
│ List your company — reach thousands of Hawaii customers       │
│ [Add Your Business]  [Claim Your Listing]                     │
└──────────────────────────────────────────────────────────────┘
```

### 12.2 Search and Discovery

**Quick Search:** Autocomplete search bar on every page. Searches across company names, categories, cities, and services.

**Filtered Browse:**
```
Filters:
├── Island (checkbox, multi-select)
├── City (checkbox, multi-select, filtered by island)
├── Service Category (checkbox, multi-select)
├── Rating (minimum stars slider)
├── Verified Only (toggle)
├── Open Now (toggle)
├── Free Estimates (toggle)
├── Same Day Available (toggle)
├── Eco-Friendly (toggle)
└── Sort By: [Best Match / Highest Rated / Most Reviews / Nearest]
```

**Map Search:**
- Full-screen map view with provider pins
- Cluster markers in dense areas
- Click pin → mini profile card with rating, phone, CTA
- "Search this area" on map pan
- Mobile: half-map, half-list split view

### 12.3 Mobile Experience

- Thumb-zone optimized navigation
- Sticky bottom bar: [Search] [Get Quotes] [Call] [Map]
- Click-to-call buttons are the primary CTA on mobile
- SMS button for text-preferred users
- Swipeable company cards in search results
- Pull-to-refresh on listing pages
- Offline-capable service worker for repeat visitors
- Add-to-homescreen prompt after second visit

### 12.4 AI Assistant

Floating chat widget (bottom-right, collapsible):
- Available on every page
- Conversational interface for finding providers
- Can answer questions about disposal rules, pricing, facility hours
- Can initiate quote request flow conversationally
- Trained on all platform content, Hawaii disposal regulations, and pricing data
- Handoff to human support for complex issues

---

## 13. Database Design

### 13.1 Core Tables

```sql
-- =============================================
-- BUSINESSES (core listing table)
-- =============================================
CREATE TABLE businesses (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name                    VARCHAR(255) NOT NULL,
    slug                    VARCHAR(255) UNIQUE NOT NULL,
    tagline                 VARCHAR(200),
    description             TEXT,
    logo_url                VARCHAR(500),
    cover_image_url         VARCHAR(500),

    -- Contact
    phone_primary           VARCHAR(20),
    phone_secondary         VARCHAR(20),
    email                   VARCHAR(255),
    website                 VARCHAR(500),

    -- Location
    street_address          VARCHAR(255),
    city                    VARCHAR(100),
    island                  VARCHAR(50) NOT NULL,
    county                  VARCHAR(100),
    state                   CHAR(2) DEFAULT 'HI',
    zip_code                VARCHAR(10),
    latitude                DECIMAL(10, 7),
    longitude               DECIMAL(10, 7),
    service_radius_miles    INTEGER,

    -- Business details
    year_established        INTEGER,
    employee_count_range    VARCHAR(20),
    locally_owned           BOOLEAN DEFAULT FALSE,
    veteran_owned           BOOLEAN DEFAULT FALSE,
    native_hawaiian_owned   BOOLEAN DEFAULT FALSE,
    woman_owned             BOOLEAN DEFAULT FALSE,

    -- Service attributes
    pricing_model           VARCHAR(50),
    price_range_min         DECIMAL(10,2),
    price_range_max         DECIMAL(10,2),
    free_estimates          BOOLEAN DEFAULT FALSE,
    same_day_service        BOOLEAN DEFAULT FALSE,
    weekend_service         BOOLEAN DEFAULT FALSE,
    emergency_service       BOOLEAN DEFAULT FALSE,
    eco_friendly            BOOLEAN DEFAULT FALSE,

    -- Credentials
    license_number          VARCHAR(100),
    license_type            VARCHAR(100),
    license_verified        BOOLEAN DEFAULT FALSE,
    insurance_verified      BOOLEAN DEFAULT FALSE,
    bonded                  BOOLEAN DEFAULT FALSE,

    -- Social
    facebook_url            VARCHAR(500),
    instagram_url           VARCHAR(500),
    youtube_url             VARCHAR(500),
    tiktok_url              VARCHAR(500),
    google_business_url     VARCHAR(500),
    yelp_url                VARCHAR(500),
    nextdoor_url            VARCHAR(500),

    -- External ratings (imported)
    google_rating           DECIMAL(2,1),
    google_review_count     INTEGER DEFAULT 0,

    -- Platform ratings (calculated)
    platform_rating         DECIMAL(2,1),
    platform_review_count   INTEGER DEFAULT 0,
    trust_score             INTEGER DEFAULT 0,

    -- Membership
    membership_tier         VARCHAR(20) DEFAULT 'free',
    -- 'free', 'pro', 'premium', 'elite'

    -- Listing status
    status                  VARCHAR(20) DEFAULT 'active',
    -- 'active', 'pending', 'suspended', 'closed'
    claimed                 BOOLEAN DEFAULT FALSE,
    claimed_by              UUID REFERENCES users(id),
    claimed_at              TIMESTAMP,
    featured                BOOLEAN DEFAULT FALSE,

    -- Import tracking
    source                  VARCHAR(50),
    -- 'outscraper', 'manual', 'claimed', 'api'
    source_id               VARCHAR(255),
    -- external ID from source
    last_verified           TIMESTAMP,

    -- Timestamps
    created_at              TIMESTAMP DEFAULT NOW(),
    updated_at              TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_businesses_island ON businesses(island);
CREATE INDEX idx_businesses_city ON businesses(city);
CREATE INDEX idx_businesses_status ON businesses(status);
CREATE INDEX idx_businesses_membership ON businesses(membership_tier);
CREATE INDEX idx_businesses_slug ON businesses(slug);
CREATE INDEX idx_businesses_location ON businesses(latitude, longitude);


-- =============================================
-- CATEGORIES
-- =============================================
CREATE TABLE categories (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(100) NOT NULL,
    slug            VARCHAR(100) UNIQUE NOT NULL,
    parent_id       UUID REFERENCES categories(id),
    description     TEXT,
    icon            VARCHAR(50),
    display_order   INTEGER DEFAULT 0,
    seo_title       VARCHAR(200),
    seo_description VARCHAR(300),
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- BUSINESS ↔ CATEGORY (many-to-many)
-- =============================================
CREATE TABLE business_categories (
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    category_id     UUID REFERENCES categories(id) ON DELETE CASCADE,
    is_primary      BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (business_id, category_id)
);


-- =============================================
-- LOCATIONS (islands, cities)
-- =============================================
CREATE TABLE locations (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(100) NOT NULL,
    slug            VARCHAR(100) NOT NULL,
    type            VARCHAR(20) NOT NULL,
    -- 'island', 'county', 'city'
    parent_id       UUID REFERENCES locations(id),
    island          VARCHAR(50),
    county          VARCHAR(100),
    latitude        DECIMAL(10, 7),
    longitude       DECIMAL(10, 7),
    population      INTEGER,
    population_tier INTEGER,
    -- 1, 2, 3
    seo_title       VARCHAR(200),
    seo_description VARCHAR(300),
    intro_text      TEXT,
    created_at      TIMESTAMP DEFAULT NOW(),
    UNIQUE(slug, type)
);


-- =============================================
-- BUSINESS ↔ SERVICE AREA (many-to-many)
-- =============================================
CREATE TABLE business_service_areas (
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    location_id     UUID REFERENCES locations(id) ON DELETE CASCADE,
    PRIMARY KEY (business_id, location_id)
);


-- =============================================
-- BUSINESS HOURS
-- =============================================
CREATE TABLE business_hours (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    day_of_week     INTEGER NOT NULL, -- 0=Sunday, 6=Saturday
    open_time       TIME,
    close_time      TIME,
    is_closed       BOOLEAN DEFAULT FALSE,
    by_appointment  BOOLEAN DEFAULT FALSE
);


-- =============================================
-- USERS
-- =============================================
CREATE TABLE users (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email           VARCHAR(255) UNIQUE NOT NULL,
    password_hash   VARCHAR(255) NOT NULL,
    name            VARCHAR(255),
    phone           VARCHAR(20),
    role            VARCHAR(20) DEFAULT 'customer',
    -- 'customer', 'provider', 'admin'
    island          VARCHAR(50),
    city            VARCHAR(100),
    email_verified  BOOLEAN DEFAULT FALSE,
    phone_verified  BOOLEAN DEFAULT FALSE,
    created_at      TIMESTAMP DEFAULT NOW(),
    updated_at      TIMESTAMP DEFAULT NOW(),
    last_login      TIMESTAMP
);


-- =============================================
-- REVIEWS
-- =============================================
CREATE TABLE reviews (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id             UUID REFERENCES businesses(id) ON DELETE CASCADE,
    user_id                 UUID REFERENCES users(id),
    rating                  INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    title                   VARCHAR(200),
    body                    TEXT,
    service_category_id     UUID REFERENCES categories(id),
    service_date            DATE,
    verified                BOOLEAN DEFAULT FALSE,
    verification_method     VARCHAR(50),
    helpful_count           INTEGER DEFAULT 0,
    reported                BOOLEAN DEFAULT FALSE,
    status                  VARCHAR(20) DEFAULT 'pending',
    -- 'pending', 'published', 'flagged', 'removed'
    company_response        TEXT,
    company_response_date   TIMESTAMP,
    created_at              TIMESTAMP DEFAULT NOW(),
    updated_at              TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_reviews_business ON reviews(business_id);
CREATE INDEX idx_reviews_status ON reviews(status);
CREATE INDEX idx_reviews_rating ON reviews(rating);


-- =============================================
-- REVIEW PHOTOS
-- =============================================
CREATE TABLE review_photos (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    review_id       UUID REFERENCES reviews(id) ON DELETE CASCADE,
    photo_url       VARCHAR(500) NOT NULL,
    caption         VARCHAR(200),
    display_order   INTEGER DEFAULT 0,
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- BUSINESS PHOTOS
-- =============================================
CREATE TABLE business_photos (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    photo_url       VARCHAR(500) NOT NULL,
    photo_type      VARCHAR(20),
    -- 'gallery', 'before_after', 'team', 'truck'
    caption         VARCHAR(200),
    display_order   INTEGER DEFAULT 0,
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- BUSINESS VIDEOS
-- =============================================
CREATE TABLE business_videos (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    video_url       VARCHAR(500) NOT NULL,
    title           VARCHAR(200),
    display_order   INTEGER DEFAULT 0,
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- BUSINESS FAQS
-- =============================================
CREATE TABLE business_faqs (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    question        VARCHAR(500) NOT NULL,
    answer          TEXT NOT NULL,
    display_order   INTEGER DEFAULT 0,
    auto_generated  BOOLEAN DEFAULT FALSE,
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- BUSINESS CERTIFICATIONS
-- =============================================
CREATE TABLE business_certifications (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    name            VARCHAR(200) NOT NULL,
    issuer          VARCHAR(200),
    issue_date      DATE,
    expiry_date     DATE,
    verified        BOOLEAN DEFAULT FALSE,
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- LEADS / QUOTE REQUESTS
-- =============================================
CREATE TABLE leads (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_user_id    UUID REFERENCES users(id),
    -- nullable for anonymous
    customer_name       VARCHAR(255) NOT NULL,
    customer_phone      VARCHAR(20) NOT NULL,
    customer_email      VARCHAR(255),
    contact_preference  VARCHAR(20) DEFAULT 'phone',
    -- 'phone', 'text', 'email'

    -- Job details
    category_id         UUID REFERENCES categories(id),
    description         TEXT NOT NULL,
    island              VARCHAR(50) NOT NULL,
    city                VARCHAR(100),
    zip_code            VARCHAR(10),
    address             VARCHAR(255),
    latitude            DECIMAL(10, 7),
    longitude           DECIMAL(10, 7),

    -- Urgency
    urgency             VARCHAR(20) DEFAULT 'flexible',
    -- 'emergency', 'within_days', 'this_week', 'flexible', 'just_pricing'
    preferred_date      DATE,

    -- Property details (for cleanouts)
    property_type       VARCHAR(50),
    property_size       VARCHAR(50),
    cleanout_scope      VARCHAR(50),
    access_difficulty   VARCHAR(50),
    hazardous_materials BOOLEAN DEFAULT FALSE,

    -- Status
    status              VARCHAR(20) DEFAULT 'new',
    -- 'new', 'matched', 'quoted', 'won', 'lost', 'expired', 'cancelled'
    source              VARCHAR(50),
    -- 'quote_form', 'ai_assistant', 'emergency', 'phone', 'multi_quote'

    -- AI classification
    ai_category         VARCHAR(100),
    ai_volume_estimate  VARCHAR(50),
    ai_cost_estimate    VARCHAR(50),

    created_at          TIMESTAMP DEFAULT NOW(),
    updated_at          TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_leads_island ON leads(island);
CREATE INDEX idx_leads_status ON leads(status);
CREATE INDEX idx_leads_created ON leads(created_at);


-- =============================================
-- LEAD PHOTOS
-- =============================================
CREATE TABLE lead_photos (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lead_id         UUID REFERENCES leads(id) ON DELETE CASCADE,
    photo_url       VARCHAR(500) NOT NULL,
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- LEAD ↔ BUSINESS MATCHES
-- =============================================
CREATE TABLE lead_matches (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lead_id         UUID REFERENCES leads(id) ON DELETE CASCADE,
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    status          VARCHAR(20) DEFAULT 'sent',
    -- 'sent', 'viewed', 'quoted', 'won', 'declined', 'expired'
    sent_at         TIMESTAMP DEFAULT NOW(),
    viewed_at       TIMESTAMP,
    quoted_at       TIMESTAMP,
    quote_amount    DECIMAL(10,2),
    quote_notes     TEXT,
    won_at          TIMESTAMP,
    lead_cost       DECIMAL(10,2),
    -- what the provider pays for this lead
    created_at      TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_lead_matches_business ON lead_matches(business_id);
CREATE INDEX idx_lead_matches_lead ON lead_matches(lead_id);


-- =============================================
-- MEMBERSHIPS / SUBSCRIPTIONS
-- =============================================
CREATE TABLE memberships (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    tier            VARCHAR(20) NOT NULL,
    -- 'pro', 'premium', 'elite'
    price_monthly   DECIMAL(10,2) NOT NULL,
    status          VARCHAR(20) DEFAULT 'active',
    -- 'active', 'past_due', 'cancelled', 'expired'
    started_at      TIMESTAMP NOT NULL,
    current_period_start TIMESTAMP,
    current_period_end   TIMESTAMP,
    cancelled_at    TIMESTAMP,
    stripe_subscription_id VARCHAR(255),
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- ADVERTISING
-- =============================================
CREATE TABLE ad_placements (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id),
    advertiser_name VARCHAR(255),
    -- for non-business advertisers
    placement_type  VARCHAR(50) NOT NULL,
    -- 'homepage_banner', 'island_sidebar', 'city_banner',
    -- 'category_banner', 'search_top', 'blog_sponsor'
    target_island   VARCHAR(50),
    target_city     VARCHAR(100),
    target_category UUID REFERENCES categories(id),
    image_url       VARCHAR(500),
    link_url        VARCHAR(500),
    alt_text        VARCHAR(200),
    pricing_model   VARCHAR(20),
    -- 'cpm', 'cpc', 'flat_monthly'
    price           DECIMAL(10,2),
    impressions     INTEGER DEFAULT 0,
    clicks          INTEGER DEFAULT 0,
    status          VARCHAR(20) DEFAULT 'active',
    start_date      DATE,
    end_date        DATE,
    created_at      TIMESTAMP DEFAULT NOW()
);


-- =============================================
-- ANALYTICS / EVENT TRACKING
-- =============================================
CREATE TABLE analytics_events (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id     UUID REFERENCES businesses(id),
    event_type      VARCHAR(50) NOT NULL,
    -- 'profile_view', 'phone_click', 'website_click',
    -- 'quote_request', 'direction_click', 'search_impression',
    -- 'search_click', 'ad_impression', 'ad_click'
    source_page     VARCHAR(255),
    user_agent      TEXT,
    ip_hash         VARCHAR(64),
    -- hashed for privacy
    referrer        VARCHAR(500),
    created_at      TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_analytics_business ON analytics_events(business_id);
CREATE INDEX idx_analytics_type ON analytics_events(event_type);
CREATE INDEX idx_analytics_created ON analytics_events(created_at);


-- =============================================
-- SAVED / FAVORITE COMPANIES
-- =============================================
CREATE TABLE saved_businesses (
    user_id         UUID REFERENCES users(id) ON DELETE CASCADE,
    business_id     UUID REFERENCES businesses(id) ON DELETE CASCADE,
    created_at      TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (user_id, business_id)
);


-- =============================================
-- IMPORT BATCHES (for tracking bulk imports)
-- =============================================
CREATE TABLE import_batches (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source          VARCHAR(50) NOT NULL,
    -- 'outscraper', 'csv', 'api', 'manual'
    filename        VARCHAR(255),
    total_records   INTEGER,
    imported        INTEGER DEFAULT 0,
    duplicates      INTEGER DEFAULT 0,
    errors          INTEGER DEFAULT 0,
    status          VARCHAR(20) DEFAULT 'pending',
    -- 'pending', 'processing', 'completed', 'failed'
    notes           TEXT,
    imported_by     UUID REFERENCES users(id),
    created_at      TIMESTAMP DEFAULT NOW(),
    completed_at    TIMESTAMP
);


-- =============================================
-- DISPOSAL FACILITIES (transfer stations, recycling, donation)
-- =============================================
CREATE TABLE facilities (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(255) NOT NULL,
    slug            VARCHAR(255) UNIQUE NOT NULL,
    type            VARCHAR(50) NOT NULL,
    -- 'transfer_station', 'landfill', 'recycling_center', 'donation_center'
    description     TEXT,
    street_address  VARCHAR(255),
    city            VARCHAR(100),
    island          VARCHAR(50) NOT NULL,
    zip_code        VARCHAR(10),
    latitude        DECIMAL(10, 7),
    longitude       DECIMAL(10, 7),
    phone           VARCHAR(20),
    website         VARCHAR(500),
    accepted_items  TEXT,
    -- JSON array or comma-separated
    rejected_items  TEXT,
    fees            TEXT,
    -- Fee schedule description
    hours_json      JSONB,
    -- Structured hours
    status          VARCHAR(20) DEFAULT 'active',
    created_at      TIMESTAMP DEFAULT NOW(),
    updated_at      TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_facilities_island ON facilities(island);
CREATE INDEX idx_facilities_type ON facilities(type);
```

### 13.2 Entity Relationship Summary

```
businesses ──< business_categories >── categories
businesses ──< business_service_areas >── locations
businesses ──< business_hours
businesses ──< business_photos
businesses ──< business_videos
businesses ──< business_faqs
businesses ──< business_certifications
businesses ──< reviews ──< review_photos
businesses ──< lead_matches >── leads ──< lead_photos
businesses ──< memberships
businesses ──< ad_placements
businesses ──< analytics_events
businesses ──< saved_businesses >── users
users ──< reviews
users ──< leads
locations ── parent_id (self-referencing hierarchy)
categories ── parent_id (self-referencing hierarchy)
import_batches (standalone, tracks bulk imports)
facilities (standalone, disposal facility directory)
```

---

## 14. Data Acquisition and Directory Population

### 14.1 Phase 1: Initial Data Collection

**Primary source: Outscraper Google Maps Export**

Search queries to run in Outscraper:
```
"junk removal" Hawaii
"hauling" Hawaii
"junk hauling" Oahu
"junk hauling" Maui
"junk hauling" Kauai
"junk hauling" Hilo
"junk hauling" Kona
"trash removal" Hawaii
"debris removal" Hawaii
"estate cleanout" Hawaii
"cleanout service" Hawaii
"appliance removal" Hawaii
"furniture removal" Hawaii
"demolition" Hawaii
"dumpster rental" Hawaii
"waste removal" Hawaii
"scrap metal" Hawaii
"e-waste recycling" Hawaii
"recycling center" Hawaii
"donation center" Hawaii
"transfer station" Hawaii
```

Run separately for each island to ensure complete coverage.

### 14.2 Outscraper Export Field Mapping

| Outscraper Field | Database Field | Notes |
|-----------------|----------------|-------|
| name | businesses.name | Trim, title case |
| full_address | Parse to street_address, city, state, zip | Address parser |
| phone | businesses.phone_primary | Format to (808) XXX-XXXX |
| site | businesses.website | Validate URL |
| rating | businesses.google_rating | |
| reviews | businesses.google_review_count | |
| category | Map to categories table | Multi-value |
| latitude | businesses.latitude | |
| longitude | businesses.longitude | |
| working_hours | Parse to business_hours table | JSON parser |
| description | businesses.description | If available |
| photo | businesses.logo_url or business_photos | First photo |
| google_maps_url | businesses.google_business_url | |
| place_id | businesses.source_id | For dedup |

### 14.3 Google Apps Script Automation Pipeline

**Sheet 1: Raw Import**
- Paste Outscraper CSV data
- Columns match Outscraper export format exactly

**Sheet 2: Cleaning**
- Script: `cleanBusinessData()`
  - Trim whitespace
  - Normalize phone numbers to (808) format
  - Extract city from full address
  - Map city to island (lookup table)
  - Map city to county
  - Validate URLs (add https:// if missing)
  - Detect and flag duplicates (match on phone OR name+city)
  - Flag spam listings (keywords: "closed", "permanently closed", phone number in name)
  - Generate slug from business name (`slugify(name)`)
  - Ensure slug uniqueness (append city if duplicate)

**Sheet 3: Category Assignment**
- Script: `assignCategories()`
  - Map Google Places categories to platform categories using lookup table:
    ```
    "Junk dealer" → "junk-removal"
    "Waste management service" → "junk-removal"
    "Demolition contractor" → "construction-debris-removal"
    "Recycling center" → "recycling"
    ...
    ```
  - Parse business name and description for category keywords
  - Allow manual override column

**Sheet 4: Location Assignment**
- Script: `assignLocations()`
  - Map address city to locations table entry
  - Assign island based on city-to-island lookup
  - Assign county based on island-to-county lookup
  - Generate service area estimate (same island, nearest 5 cities within radius)

**Sheet 5: Export Ready**
- Script: `generateExport()`
  - Output clean CSV matching database import schema
  - Output JSON alternative for API import
  - Include only non-duplicate, non-spam, categorized records
  - Add metadata: import_batch_id, source="outscraper", import_date

**Sheet 6: Update Tracker**
- Script: `detectChanges()`
  - Compare new Outscraper export against previous export
  - Flag: new businesses, closed businesses, changed phone numbers, changed ratings, changed hours
  - Generate update CSV for incremental import

### 14.4 Google Apps Script Code Structure

```
/gas-automation/
├── Code.gs                 — Main entry points
├── CleanData.gs            — Data cleaning functions
├── Categorize.gs           — Category assignment
├── Geolocate.gs            — Location/island mapping
├── Dedup.gs                — Duplicate detection
├── SlugGenerator.gs        — URL slug generation
├── Export.gs               — CSV/JSON export
├── ChangeDetection.gs      — Diff against previous imports
├── Config.gs               — Lookup tables, constants
└── Utilities.gs            — Shared helper functions
```

### 14.5 Island-City Lookup Table (for Apps Script)

```javascript
const ISLAND_CITY_MAP = {
  "oahu": [
    "Honolulu", "Ewa Beach", "Kapolei", "Waipahu", "Mililani",
    "Pearl City", "Aiea", "Kaneohe", "Kailua", "Wahiawa",
    "Waialua", "Haleiwa", "Makakilo", "Hawaii Kai", "Waimanalo",
    "Kahuku", "Laie", "Hauula", "Kaaawa", "Nanakuli", "Waianae"
  ],
  "maui": [
    "Kahului", "Wailuku", "Kihei", "Lahaina", "Paia",
    "Makawao", "Kula", "Hana"
  ],
  "kauai": [
    "Lihue", "Kapaa", "Princeville", "Hanalei",
    "Koloa", "Poipu", "Waimea"
  ],
  "hawaii-island": [
    "Hilo", "Kailua-Kona", "Keaau", "Pahoa",
    "Waimea", "Waikoloa", "Ocean View"
  ],
  "molokai": ["Kaunakakai"],
  "lanai": ["Lanai City"]
};
```

### 14.6 Bulk Import API

```
POST /api/admin/import
Content-Type: multipart/form-data

Body:
  file: CSV or JSON file
  source: "outscraper" | "csv" | "manual"
  mode: "create" | "update" | "upsert"
  dry_run: true | false

Response:
  batch_id: UUID
  total_records: 150
  valid: 142
  duplicates: 6
  errors: 2
  error_details: [...]
  preview: [...first 10 records...]

If dry_run=false:
  Proceeds with import
  Returns batch_id for status tracking

GET /api/admin/import/{batch_id}
  Returns import progress and results
```

### 14.7 Duplicate Detection Strategy

**Match criteria (in priority order):**
1. Exact phone number match → definite duplicate
2. Exact Google place_id match → definite duplicate
3. Name similarity (>90% Levenshtein) + same city → likely duplicate → flag for review
4. Same address + different name → possible duplicate (DBA) → flag for review
5. Same website domain → likely duplicate → flag for review

**Resolution:**
- Definite duplicates: auto-merge (keep higher-quality record, merge missing fields)
- Likely duplicates: admin review queue
- Possible duplicates: admin review queue with merge suggestion

### 14.8 Ongoing Data Maintenance

**Monthly:**
- Re-run Outscraper exports for top categories
- Run change detection script
- Process update CSV (new businesses, closed businesses, changed info)
- Update Google ratings and review counts

**Quarterly:**
- Full re-export from Outscraper for all categories
- Verify phone numbers still active (automated call/SMS verification)
- Check websites still live
- Update business hours from Google

**Annually:**
- License and insurance re-verification for claimed listings
- Full data audit
- Archive permanently closed businesses

### 14.9 Claim Listing Workflow

```
Imported Business (unclaimed)
│
├── Business owner finds their listing
│   └── Clicks "Claim This Business"
│       └── Verification options:
│           ├── Phone verification (automated call to listed number)
│           ├── Email verification (to domain email)
│           ├── Document upload (business license)
│           └── Google Business verification (OAuth)
│
├── Verification approved
│   └── Owner gains access to:
│       ├── Edit all business information
│       ├── Add/remove photos and videos
│       ├── Update service areas
│       ├── Respond to reviews
│       ├── View analytics (views, clicks, calls)
│       ├── Receive leads (free tier: 5/month)
│       └── Upgrade to paid tier
│
└── Upgrade prompts:
    ├── On claim: "Upgrade to Pro for unlimited leads"
    ├── After 5th lead: "You've reached your monthly lead limit"
    ├── On competitor comparison: "Go Premium to remove competitor ads"
    └── Monthly email: Performance report + upgrade CTA
```

### 14.10 Scale Targets

| Milestone | Target | Timeline |
|-----------|--------|----------|
| Initial import | 200–400 businesses | Month 1 |
| Enriched with categories and service areas | 200–400 | Month 1–2 |
| Recycling/donation/transfer stations | 50–100 facilities | Month 2 |
| First claimed listings | 10–20 businesses | Month 3 |
| 500 total listings | All categories | Month 6 |
| 1,000 total listings (including related services) | Month 12 |
| 10,000+ pages (programmatic SEO) | By Month 6 |

---

## 15. Competitive Advantages

### 15.1 Features No Competitor Offers in Hawaii

| Feature | Why It Wins |
|---------|-------------|
| **Hawaii-only focus** | Every competitor is national/generic. We understand islands, inter-island logistics, limited disposal options, and Hawaii-specific regulations. |
| **AI-powered provider matching** | Customers describe their need in plain language or photos. AI classifies, estimates volume, and matches to providers. No competitor does this for junk removal. |
| **Real-time quote comparison** | Side-by-side quote comparison from multiple providers with pricing transparency. Yelp/Angi don't show prices. |
| **Island-aware cost data** | Actual pricing data by island, city, and service type. Hawaii costs 30–50% more than mainland — our calculator reflects this. |
| **Disposal facility integration** | Every listing and quote page shows nearest transfer station, recycling center, and donation center with hours and accepted items. |
| **Property manager dashboard** | Multi-property managers can manage quote requests across properties, track vendor performance, and maintain preferred vendor lists. |
| **HOA bulk program portal** | HOAs can organize community cleanup events, negotiate group rates, and manage approved vendor lists. |
| **Military PCS resource hub** | Dedicated resources for military families — the only junk removal platform acknowledging Hawaii's massive military population and PCS cycle. |
| **Disaster cleanup coordination** | Hurricane/storm/flood cleanup resource center with emergency provider activation. Given Hawaii's vulnerability to natural disasters, this is a critical differentiator. |
| **Eco-friendly scoring** | Rate providers on recycling, donation, and landfill diversion percentages. Hawaii's limited landfill capacity makes this locally important. |
| **Before/after galleries** | Aggregated before/after photo galleries by job type — helps customers understand what to expect and builds provider credibility. |
| **Donation center integration** | When a customer's items are donate-worthy, connect them with local charities for free pickup — reducing load for junk removal companies and cost for customers. |
| **Trust score transparency** | Open, explainable trust scoring system. Users can see exactly why a company is rated the way it is, unlike Yelp's opaque algorithm. |

### 15.2 Platform Moats

1. **Data moat:** Most comprehensive junk removal business database in Hawaii, continuously enriched
2. **Content moat:** 2,000+ programmatic SEO pages covering every city+service combination
3. **Review moat:** Verified review system with higher trust than Google or Yelp reviews
4. **Network effects:** More providers → more quote options → more customers → more leads → more providers
5. **Local knowledge:** Hawaii-specific disposal laws, facility hours, cost data, and logistical context
6. **Relationship moat:** Direct relationships with providers through claimed listings and paid memberships

---

## 16. Monetization Roadmap

### 16.1 Year 1: Foundation ($31K target)

**Q1 (Months 1–3): Build and populate**
- Launch site with 200–400 imported listings
- Publish 24 blog posts + 20 resource pages
- Generate all programmatic city/service pages
- Submit to Google Search Console
- Revenue: $0 (building)

**Q2 (Months 4–6): Organic growth + first revenue**
- Target: 5,000 monthly organic visitors
- First 10–20 claimed listings
- Launch free tier lead generation
- First Pro subscriptions (target: 5 at $49/mo = $245/mo)
- First pay-per-lead revenue (target: 50 leads/mo at $10 avg = $500/mo)
- Revenue: ~$745/mo by Month 6

**Q3 (Months 7–9): Scale leads**
- Target: 15,000 monthly organic visitors
- 30–50 claimed listings
- 10 Pro, 3 Premium subscriptions ($490 + $297 = $787/mo)
- 150 leads/mo at $12 avg = $1,800/mo
- First banner advertisers ($150/mo)
- Revenue: ~$2,737/mo by Month 9

**Q4 (Months 10–12): Monetization maturity**
- Target: 30,000 monthly organic visitors
- 15 Pro, 5 Premium, 1 Elite ($735 + $495 + $199 = $1,429/mo)
- 300 leads/mo at $12 avg = $3,600/mo
- Advertising: $500/mo
- Revenue: ~$5,529/mo by Month 12

### 16.2 Year 2: Growth ($120K target)

- 75,000 monthly visitors
- 50 paid subscriptions across tiers
- 1,000 leads/month
- Launch AI quote matching
- Launch dumpster rental marketplace
- Expand advertising program
- Introduce contractor dashboard analytics premium
- Monthly revenue target: $10,000 by Month 24

### 16.3 Year 3: Market Dominance ($250K target)

- 150,000 monthly visitors
- 100 paid subscriptions
- 2,500 leads/month
- Launch instant booking for select providers
- Launch mobile app
- Introduce property manager SaaS tier
- Monthly revenue target: $21,000 by Month 36

### 16.4 Year 5: Ecosystem ($500K+ target)

- 300,000+ monthly visitors
- Dominant #1 position for all Hawaii junk removal queries
- Full marketplace with booking, payment, and insurance
- Expand model to other Hawaii service verticals (moving, cleaning, landscaping)
- Licensing the platform model to other states
- Monthly revenue target: $42,000+

---

## 17. Success Metrics

### 17.1 Traffic Goals

| Milestone | Monthly Organic Visitors | Timeline |
|-----------|-------------------------|----------|
| Launch | 0 | Month 1 |
| First traction | 1,000 | Month 3 |
| Growth | 5,000 | Month 6 |
| Scale | 30,000 | Month 12 |
| Authority | 75,000 | Month 24 |
| Dominance | 150,000 | Month 36 |

### 17.2 Listing Goals

| Milestone | Total Listings | Claimed | Paid |
|-----------|---------------|---------|------|
| Launch | 200 | 0 | 0 |
| Month 3 | 350 | 15 | 3 |
| Month 6 | 500 | 40 | 10 |
| Month 12 | 750 | 80 | 25 |
| Month 24 | 1,000 | 150 | 50 |
| Month 36 | 1,500 | 250 | 100 |

### 17.3 Lead Goals

| Period | Monthly Leads | Revenue per Lead |
|--------|--------------|-----------------|
| Month 6 | 50 | $10 |
| Month 12 | 300 | $12 |
| Month 24 | 1,000 | $15 |
| Month 36 | 2,500 | $15 |

### 17.4 Revenue Goals

| Period | Monthly Revenue | Annual Run Rate |
|--------|----------------|-----------------|
| Month 6 | $745 | $8,940 |
| Month 12 | $5,529 | $66,348 |
| Month 24 | $10,000 | $120,000 |
| Month 36 | $21,000 | $252,000 |
| Month 60 | $42,000 | $504,000 |

### 17.5 Market Penetration Goals

| Metric | Year 1 | Year 3 | Year 5 |
|--------|--------|--------|--------|
| % of Hawaii junk removal companies listed | 60% | 85% | 95% |
| % of claimed listings | 15% | 25% | 40% |
| Search visibility (avg position for core terms) | Top 10 | Top 3 | #1 |
| Brand recognition (aided) in Hawaii market | 5% | 25% | 50% |

---

## 18. Technical Stack

### 18.1 Recommended Stack

| Layer | Technology | Rationale |
|-------|-----------|-----------|
| **Frontend** | Next.js (React) | SSG for programmatic pages, SSR for dynamic, great SEO |
| **Styling** | Tailwind CSS | Rapid development, consistent design |
| **Database** | PostgreSQL (Supabase) | Robust, geo queries, JSON support, free tier |
| **Auth** | Supabase Auth | Built-in, supports email/phone/OAuth |
| **File Storage** | Supabase Storage or Cloudflare R2 | Image hosting |
| **Search** | Meilisearch or Algolia | Fast autocomplete and filtered search |
| **Maps** | Mapbox or Google Maps | Provider pins, service area visualization |
| **Payments** | Stripe | Subscriptions, one-time payments |
| **Email** | Resend or SendGrid | Transactional emails, lead notifications |
| **SMS** | Twilio | Lead notifications, verification |
| **AI** | Claude API (Anthropic) | Quote assistant, content generation |
| **Analytics** | Plausible or PostHog | Privacy-friendly, self-hostable |
| **Hosting** | Vercel | Optimal for Next.js, edge functions |
| **CDN** | Cloudflare | Performance, DDoS protection |
| **Monitoring** | Sentry | Error tracking |

### 18.2 Alternative: Static-First Approach (GitHub Pages Compatible)

For initial launch without backend complexity:

| Layer | Technology |
|-------|-----------|
| **Site** | Static HTML/CSS/JS (GitHub Pages) |
| **Data** | JSON files generated from Google Sheets |
| **Search** | Client-side Fuse.js |
| **Forms** | Formspree or Google Forms |
| **Maps** | Leaflet with OpenStreetMap |
| **Analytics** | Google Analytics |
| **CMS** | Google Sheets → JSON pipeline |

This matches Neal's existing GitHub Pages workflow and can be upgraded to the full stack later.

### 18.3 Build Phases

**Phase 1 (Static MVP):** GitHub Pages with JSON data, programmatic HTML generation via build script, Formspree for quote forms. Get SEO pages indexed.

**Phase 2 (Dynamic Features):** Migrate to Next.js on Vercel. Add Supabase backend. Enable user accounts, claimed listings, lead routing.

**Phase 3 (Full Platform):** Add payment processing, contractor dashboard, AI assistant, map search, review system.

---

## Appendix A: Page Count Projections

```
Static/Programmatic Pages:
  Homepage:                              1
  Island pages:                          6
  City pages:                           48
  City + Service pages:              1,344
  Service pages:                        28
  Service + Island pages:              168
  Company pages (Year 1):             500+
  Blog posts (Year 1):               100+
  Resource pages:                      50+
  Pricing guides:                       12
  Tool pages:                            6
  Comparison pages:                   100+
  Facility pages:                      75+
  ────────────────────────────────────────
  Total Year 1:                    2,400+
  Total Year 3 (with growth):     5,000+
  Total Year 5:                   10,000+
```

## Appendix B: Competitor Gap Analysis

| Feature | Yelp | Angi | HomeAdvisor | Thumbtack | **RemoveJunkHawaii** |
|---------|------|------|-------------|-----------|---------------------|
| Hawaii-specific content | No | No | No | No | **Yes** |
| Island-level pages | No | No | No | No | **Yes** |
| Junk removal only focus | No | No | No | No | **Yes** |
| Disposal facility directory | No | No | No | No | **Yes** |
| Hawaii cost data | No | No | Generic | No | **Yes** |
| AI quote matching | No | No | No | No | **Yes** |
| Multi-provider comparison | No | No | Limited | Limited | **Yes** |
| Property manager tools | No | No | No | No | **Yes** |
| Military PCS resources | No | No | No | No | **Yes** |
| Donation center integration | No | No | No | No | **Yes** |
| Trust score transparency | No | No | No | No | **Yes** |
| Free basic listing | No | Yes | Yes | Yes | **Yes** |
| Hawaii disposal law guides | No | No | No | No | **Yes** |

---

*End of specification. This document serves as the complete product requirements, business plan, architecture blueprint, SEO strategy, database design, data acquisition plan, and growth roadmap for RemoveJunkHawaii.com.*
