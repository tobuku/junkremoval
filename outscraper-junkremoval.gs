/**
 * RemoveJunkHawaii.com — Outscraper Automation for Junk Removal Directory
 *
 * Paste this entire file into your Google Apps Script editor
 * (Extensions > Apps Script in your Google Sheet).
 *
 * Setup:
 *   1. Create a Google Sheet with a tab named "junkremoval-directory"
 *   2. Add header row: business_name, street_address, city, island, zip,
 *      phone, website, google_rating, review_count,
 *      hours_monday, hours_tuesday, hours_wednesday,
 *      hours_thursday, hours_friday, hours_saturday, hours_sunday,
 *      latitude, longitude
 *   3. Paste this script into Apps Script (Extensions > Apps Script)
 *   4. Replace MY_OUTSCRAPER_API_KEY_GOES_HERE with your actual key
 *   5. Click Save, then run main()
 *   6. If it times out (6-min limit), just run main() again — it resumes
 *   7. Call resetProgress() to start over from the beginning
 *   8. After main() finishes, run fillMissingPhones() for rows without phones
 *
 * Rate limits:
 *   - 2-second delay between API calls
 *   - Outscraper free tier: 500 places/month, then $3/1,000
 */

// ── Configuration ────────────────────────────────────────────────────────────

var CONFIG = {
  OUTSCRAPER_API_KEY: "MY_OUTSCRAPER_API_KEY_GOES_HERE",
  SHEET_NAME: "junkremoval-directory",
  RESULTS_PER_QUERY: 20,
  DELAY_MS: 2000
};

/**
 * Hawaii-specific queries: multiple search terms x major cities/islands.
 * Granular city-level queries pull deeper results than broad island queries.
 *
 * Search terms cover the full service spectrum:
 *   - junk removal (broadest)
 *   - hauling services
 *   - cleanout services
 *   - debris removal
 *   - trash hauling
 *
 * Cities cover all major population centers across 6 islands.
 */
var SEARCH_QUERIES = [
  // ── Oahu — junk removal ──
  "junk removal, Honolulu, Hawaii",
  "junk removal, Pearl City, Hawaii",
  "junk removal, Kapolei, Hawaii",
  "junk removal, Kailua, Oahu, Hawaii",
  "junk removal, Kaneohe, Hawaii",
  "junk removal, Ewa Beach, Hawaii",
  "junk removal, Mililani, Hawaii",
  "junk removal, Wahiawa, Hawaii",
  "junk removal, Waipahu, Hawaii",
  "junk removal, Aiea, Hawaii",
  "junk removal, Waikiki, Hawaii",
  "junk removal, Hawaii Kai, Hawaii",

  // ── Oahu — hauling / cleanout variations ──
  "hauling services, Honolulu, Hawaii",
  "hauling services, Kapolei, Hawaii",
  "hauling services, Kailua, Oahu, Hawaii",
  "cleanout services, Honolulu, Hawaii",
  "cleanout services, Pearl City, Hawaii",
  "debris removal, Honolulu, Hawaii",
  "trash hauling, Honolulu, Hawaii",
  "trash hauling, Kapolei, Hawaii",
  "furniture removal, Honolulu, Hawaii",
  "appliance removal, Honolulu, Hawaii",
  "estate cleanout, Honolulu, Hawaii",
  "construction debris removal, Honolulu, Hawaii",

  // ── Maui ──
  "junk removal, Kahului, Maui, Hawaii",
  "junk removal, Kihei, Maui, Hawaii",
  "junk removal, Lahaina, Maui, Hawaii",
  "junk removal, Wailuku, Maui, Hawaii",
  "junk removal, Pukalani, Maui, Hawaii",
  "hauling services, Kahului, Maui, Hawaii",
  "cleanout services, Kihei, Maui, Hawaii",
  "trash hauling, Maui, Hawaii",
  "debris removal, Maui, Hawaii",

  // ── Kauai ──
  "junk removal, Lihue, Kauai, Hawaii",
  "junk removal, Kapaa, Kauai, Hawaii",
  "junk removal, Poipu, Kauai, Hawaii",
  "junk removal, Princeville, Kauai, Hawaii",
  "junk removal, Koloa, Kauai, Hawaii",
  "hauling services, Lihue, Kauai, Hawaii",
  "cleanout services, Kauai, Hawaii",
  "trash hauling, Kauai, Hawaii",

  // ── Hawaii Island (Big Island) ──
  "junk removal, Hilo, Hawaii",
  "junk removal, Kailua-Kona, Hawaii",
  "junk removal, Captain Cook, Hawaii",
  "junk removal, Waimea, Hawaii Island",
  "junk removal, Pahoa, Hawaii",
  "junk removal, Keaau, Hawaii",
  "hauling services, Hilo, Hawaii",
  "hauling services, Kailua-Kona, Hawaii",
  "cleanout services, Hilo, Hawaii",
  "trash hauling, Kona, Hawaii",
  "debris removal, Big Island, Hawaii",

  // ── Molokai ──
  "junk removal, Kaunakakai, Molokai, Hawaii",
  "hauling services, Molokai, Hawaii",

  // ── Lanai ──
  "junk removal, Lanai City, Lanai, Hawaii",
  "hauling services, Lanai, Hawaii",

  // ── Broad statewide catches ──
  "junk removal service, Hawaii",
  "junk hauling, Hawaii",
  "rubbish removal, Hawaii",
  "yard waste removal, Hawaii",
  "demolition services, Hawaii",
  "dumpster rental, Hawaii"
];

// ── Island lookup by city ─────────────────────────────────────────────────────

var CITY_TO_ISLAND = {
  "honolulu": "Oahu", "pearl city": "Oahu", "kapolei": "Oahu", "kailua": "Oahu",
  "kaneohe": "Oahu", "ewa beach": "Oahu", "mililani": "Oahu", "wahiawa": "Oahu",
  "waipahu": "Oahu", "aiea": "Oahu", "waikiki": "Oahu", "hawaii kai": "Oahu",
  "haleiwa": "Oahu", "laie": "Oahu", "waimanalo": "Oahu", "makakilo": "Oahu",
  "nanakuli": "Oahu", "waianae": "Oahu", "schofield barracks": "Oahu",
  "kahului": "Maui", "kihei": "Maui", "lahaina": "Maui", "wailuku": "Maui",
  "pukalani": "Maui", "makawao": "Maui", "haiku": "Maui", "paia": "Maui",
  "kula": "Maui", "wailea": "Maui", "napili": "Maui", "kapalua": "Maui",
  "lihue": "Kauai", "kapaa": "Kauai", "poipu": "Kauai", "princeville": "Kauai",
  "koloa": "Kauai", "waimea": "Kauai", "hanapepe": "Kauai", "kilauea": "Kauai",
  "eleele": "Kauai", "kalaheo": "Kauai", "anahola": "Kauai", "hanalei": "Kauai",
  "hilo": "Hawaii Island", "kailua-kona": "Hawaii Island", "kona": "Hawaii Island",
  "captain cook": "Hawaii Island", "pahoa": "Hawaii Island", "keaau": "Hawaii Island",
  "volcano": "Hawaii Island", "kamuela": "Hawaii Island", "waikoloa": "Hawaii Island",
  "holualoa": "Hawaii Island", "ocean view": "Hawaii Island", "naalehu": "Hawaii Island",
  "papaikou": "Hawaii Island", "kurtistown": "Hawaii Island", "mountain view": "Hawaii Island",
  "kaunakakai": "Molokai", "maunaloa": "Molokai",
  "lanai city": "Lanai"
};

// ── Main ─────────────────────────────────────────────────────────────────────

function main() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName(CONFIG.SHEET_NAME);
  if (!sheet) {
    throw new Error("Sheet '" + CONFIG.SHEET_NAME + "' not found. Create a tab with that name first.");
  }

  var props = PropertiesService.getScriptProperties();
  var startIndex = parseInt(props.getProperty("lastCompletedQuery") || "-1", 10) + 1;

  if (startIndex >= SEARCH_QUERIES.length) {
    Logger.log("All " + SEARCH_QUERIES.length + " queries already completed. Call resetProgress() to start over.");
    return;
  }

  Logger.log("Resuming from query " + (startIndex + 1) + "/" + SEARCH_QUERIES.length);

  var existingRows = getExistingRows(sheet);
  var added = 0;

  for (var i = startIndex; i < SEARCH_QUERIES.length; i++) {
    var query = SEARCH_QUERIES[i];
    Logger.log("Query " + (i + 1) + "/" + SEARCH_QUERIES.length + ": " + query);

    var places = fetchOutscraper(query);
    if (!places || places.length === 0) {
      Logger.log("  No results.");
      props.setProperty("lastCompletedQuery", String(i));
      continue;
    }

    for (var j = 0; j < places.length; j++) {
      var row = mapToRow(places[j]);
      if (!row) continue;

      var businessName = row[0];
      var phone = row[5];
      var address = row[1];

      if (isDuplicate(existingRows, businessName, phone, address)) continue;

      sheet.appendRow(row);
      existingRows.push({ businessName: businessName, phone: phone, address: address });
      added++;
    }

    props.setProperty("lastCompletedQuery", String(i));

    if (i < SEARCH_QUERIES.length - 1) {
      Utilities.sleep(CONFIG.DELAY_MS);
    }
  }

  Logger.log("Done. Added " + added + " new rows. Completed through query " + SEARCH_QUERIES.length + "/" + SEARCH_QUERIES.length);
}

function resetProgress() {
  PropertiesService.getScriptProperties().deleteProperty("lastCompletedQuery");
  Logger.log("Progress reset. Next main() run will start from query 1.");
}

// ── Fill Missing Phones ──────────────────────────────────────────────────────

function fillMissingPhones() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName(CONFIG.SHEET_NAME);
  if (!sheet) {
    throw new Error("Sheet '" + CONFIG.SHEET_NAME + "' not found.");
  }

  var props = PropertiesService.getScriptProperties();
  var lastProcessed = parseInt(props.getProperty("lastPhoneRow") || "1", 10);
  var lastRow = sheet.getLastRow();
  var phoneCol = 6;
  var updated = 0;
  var skipped = 0;

  Logger.log("Filling missing phones starting from row " + (lastProcessed + 1));

  for (var row = lastProcessed + 1; row <= lastRow; row++) {
    var phone = sheet.getRange(row, phoneCol).getValue();

    if (phone && String(phone).trim() !== "") {
      skipped++;
      props.setProperty("lastPhoneRow", String(row));
      continue;
    }

    var name = sheet.getRange(row, 1).getValue();
    var city = sheet.getRange(row, 3).getValue();

    if (!name) {
      props.setProperty("lastPhoneRow", String(row));
      continue;
    }

    var query = name + ", " + city + ", Hawaii";
    Logger.log("Row " + row + ": Looking up " + query);

    var places = fetchOutscraper(query);

    if (places && places.length > 0) {
      var foundPhone = (places[0].phone || "").trim().replace(/^\+/, "");
      if (foundPhone) {
        sheet.getRange(row, phoneCol).setValue(foundPhone);
        updated++;
        Logger.log("  Found: " + foundPhone);
      } else {
        Logger.log("  No phone in result.");
      }
    } else {
      Logger.log("  No results.");
    }

    props.setProperty("lastPhoneRow", String(row));
    Utilities.sleep(CONFIG.DELAY_MS);
  }

  Logger.log("Done. Updated " + updated + " phones. Skipped " + skipped + " (already had phone).");
}

function resetPhoneProgress() {
  PropertiesService.getScriptProperties().deleteProperty("lastPhoneRow");
  Logger.log("Phone progress reset. Next fillMissingPhones() run will start from row 2.");
}

// ── Outscraper API ───────────────────────────────────────────────────────────

function fetchOutscraper(query) {
  var url = "https://api.app.outscraper.com/maps/search-v3"
    + "?query=" + encodeURIComponent(query)
    + "&limit=" + CONFIG.RESULTS_PER_QUERY
    + "&async=false";

  var options = {
    method: "get",
    headers: {
      "X-API-KEY": CONFIG.OUTSCRAPER_API_KEY
    },
    muteHttpExceptions: true
  };

  var response = UrlFetchApp.fetch(url, options);
  var code = response.getResponseCode();

  if (code !== 200) {
    Logger.log("  API error " + code + ": " + response.getContentText().substring(0, 200));
    return [];
  }

  var json = JSON.parse(response.getContentText());

  if (json.data && json.data.length > 0 && Array.isArray(json.data[0])) {
    return json.data[0];
  }
  return [];
}

// ── Row mapping ──────────────────────────────────────────────────────────────

/**
 * Maps an Outscraper place object to a sheet row.
 * Column order:
 *   business_name, street_address, city, island, zip,
 *   phone, website, google_rating, review_count,
 *   hours_monday – hours_sunday,
 *   latitude, longitude
 *
 * Key difference from the roofing script: column 4 is "island" not "state"
 * since everything is in Hawaii. We resolve the island from the city name.
 */
function mapToRow(place) {
  if (!place || !place.name) return null;

  var city = safeString(place.city).trim();
  var island = resolveIsland(city, place);
  var hours = parseHours(place.working_hours);

  return [
    safeString(place.name).trim(),
    safeString(place.street || place.full_address).trim(),
    city,
    island,
    safeString(place.postal_code).toString().trim(),
    safeString(place.phone).trim().replace(/^\+/, ""),
    safeString(place.site).trim(),
    safeString(place.rating),
    safeString(place.reviews),
    hours[0], hours[1], hours[2], hours[3], hours[4], hours[5], hours[6],
    safeString(place.latitude),
    safeString(place.longitude)
  ];
}

/**
 * Resolve which island a business is on from its city name.
 * Falls back to zip code ranges if city is unknown.
 */
function resolveIsland(city, place) {
  if (city) {
    var key = city.toLowerCase();
    if (CITY_TO_ISLAND[key]) return CITY_TO_ISLAND[key];
  }

  // Fallback: Hawaii zip code ranges
  var zip = safeString(place.postal_code).toString().trim();
  if (zip.length >= 5) {
    var z = parseInt(zip.substring(0, 5), 10);
    if (z >= 96701 && z <= 96782) return "Oahu";
    if (z >= 96783 && z <= 96797) return "Oahu";
    if (z >= 96707 && z <= 96707) return "Oahu"; // Kapolei
    if (z >= 96708 && z <= 96708) return "Oahu";
    if (z >= 96801 && z <= 96899) return "Oahu"; // Honolulu PO boxes
    if (z >= 96732 && z <= 96793) return "Maui";
    if (z >= 96703 && z <= 96754) return "Kauai";
    if (z >= 96720 && z <= 96785) return "Hawaii Island";
    if (z === 96729 || z === 96748 || z === 96757) return "Molokai";
    if (z === 96763) return "Lanai";
  }

  return "Hawaii";
}

function safeString(val) {
  if (val === null || val === undefined) return "";
  if (typeof val === "string") return val;
  if (typeof val === "number") return val;
  try {
    return JSON.stringify(val);
  } catch (e) {
    return "";
  }
}

function parseHours(workingHours) {
  var result = ["", "", "", "", "", "", ""];
  if (!workingHours) return result;

  var hoursStr = "";
  try {
    hoursStr = JSON.stringify(workingHours);
  } catch (e) {
    return result;
  }

  var hoursObj = JSON.parse(hoursStr);
  var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

  if (hoursObj && typeof hoursObj === "object" && !Array.isArray(hoursObj)) {
    for (var i = 0; i < days.length; i++) {
      var val = hoursObj[days[i]];
      if (val) {
        result[i] = (typeof val === "string") ? val : JSON.stringify(val);
      }
    }
    return result;
  }

  if (Array.isArray(hoursObj)) {
    result[0] = hoursStr;
    return result;
  }

  return result;
}

// ── Deduplication ────────────────────────────────────────────────────────────

function getExistingRows(sheet) {
  var lastRow = sheet.getLastRow();
  if (lastRow < 2) return [];

  var data = sheet.getRange(2, 1, lastRow - 1, 18).getValues();
  var rows = [];
  for (var i = 0; i < data.length; i++) {
    rows.push({
      businessName: String(data[i][0]).trim().toLowerCase(),
      phone: String(data[i][5]).trim(),
      address: String(data[i][1]).trim().toLowerCase()
    });
  }
  return rows;
}

function isDuplicate(existingRows, businessName, phone, address) {
  var n = (businessName || "").trim().toLowerCase();
  var p = (phone || "").trim();
  var a = (address || "").trim().toLowerCase();

  if (!n && !p && !a) return false;

  for (var i = 0; i < existingRows.length; i++) {
    var row = existingRows[i];
    if (n && row.businessName && n === row.businessName) return true;
    if (p && row.phone && p === row.phone) return true;
    if (a && row.address && a === row.address) return true;
  }
  return false;
}
