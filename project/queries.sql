-- 1. Insert new plants into the database
INSERT INTO "plants" (
    "plant_id",
    "seed_id",
    "plant_name_in_english",
    "plant_name_in_sinhala",
    "plant_type",
    "days_to_maturity",
    "ideal_sunlight",
    "ideal_water",
    "ideal_soil",
    "how_to_plant",
    "notes"
) VALUES
(1, 1, 'tomatoes', 'තක්කාලි', 'vegetable', 70, 'bright', 'moderate', 'loamy', 'Spacing: 45-60cm, Depth: 0.5-1cm', 'Grow in well-drained soil, provide support, mulch to retain moisture.'),
(2, 2, 'cabbage', 'ගෝවා', 'vegetable', 90, 'bright', 'high', 'rich', 'Spacing: 30-45cm, Depth: 1-2cm', 'Cooler parts of the tropics, protect from intense midday sun, mulch heavily.'),
(3, 3, 'chilli pepper', 'මිරිස්', 'vegetable', 80, 'bright', 'moderate', 'well-drained', 'Spacing: 30-45cm, Depth: 0.5cm', 'Start seeds indoors, provide support, protect from heavy rain.'),
(4, 4, 'okra', 'බණ්ඩක්කා', 'vegetable', 60, 'bright', 'moderate', 'sandy loam', 'Spacing: 30-45cm, Depth: 1-2cm', 'Direct sow in warm soil, tolerates heat and humidity.'),
(5, NULL, 'pineapple', 'අන්නාසි', 'fruit', 500, 'bright', 'low', 'sandy', 'Spacing: 60-90cm, Depth: crown planting', 'Plant the crown of a pineapple, well-drained soil, protect from frost.'),
(6, 5, 'corn', 'බඩ ඉරිඟු', 'vegetable', 90, 'bright', 'moderate', 'rich', 'Spacing: 20-30cm, Depth: 2-5cm', 'Plant seeds directly in warm soil, full sun, ensure proper drainage.'),
(7, 6, 'white long raddish', 'දිග සුදු රාබු', 'vegetable', 50, 'bright', 'moderate', 'loose', 'Spacing: 10-15cm, Depth: 1-2cm', 'Direct sow in cooler parts of the tropics, avoid waterlogging.'),
(8, 7, 'green long beans', 'මෑ කරල්', 'vegetable', 60, 'bright', 'moderate', 'well-drained', 'Spacing: 15-20cm, Depth: 2-3cm', 'Direct sow after last frost, provide support, ensure good drainage.'),
(9, 8, 'cowpea', 'කව්පි', 'vegetable', 70, 'bright', 'moderate', 'sandy', 'Spacing: 15-20cm, Depth: 2-3cm', 'Direct sow after last frost, tolerates poor soil, drought-tolerant.'),
(10, NULL, 'sweet potatoes', 'බතල', 'vegetable', 100, 'bright', 'low', 'sandy loam', 'Spacing: 30-45cm, Depth: slips planted 10-15cm deep', 'Plant slips after last frost, well-drained soil, mound the soil.'),
(11, NULL, 'potatoes', 'අර්තාපල්', 'vegetable', 90, 'bright', 'moderate', 'loose', 'Spacing: 20-30cm, Depth: 10-15cm', 'Plant seed potatoes in cool soil, mound soil as they grow, avoid waterlogged areas.'),
(12, NULL, 'spring onions', 'ලූණු කොළ', 'vegetable', 60, 'bright', 'moderate', 'rich', 'Spacing: 5-10cm, Depth: 1-2cm', 'Plant sets or seeds, harvest frequently, well-drained soil.'),
(13, NULL, 'marigold', 'දාස්පෙතියා', 'flower', 60, 'bright', 'moderate', 'well-drained', 'Sow seeds 1cm deep, space 20-30cm apart.', 'Attracts pollinators, repels pests. Plant in full sun.'),
(14, 9, 'leaf cabbage', 'කොළ ගෝවා', 'vegetable', 60, 'bright', 'moderate', 'rich', 'Sow seeds 1cm deep, space 30-45cm apart.', 'Prefers cooler tropical areas. Protect from midday sun.'),
(15, NULL, 'nivithi', 'නිවිති', 'vegetable', 60, 'bright', 'moderate', 'well-drained', 'Sow seeds 1cm deep, space 15-20cm apart.', 'Cut regularly to encourage growth. Tolerates partial shade.'),
(16, NULL, 'pumpkin', 'වට්ටක්කා', 'vegetable', 110, 'bright', 'moderate', 'well-drained', 'Sow seeds 2-3cm deep, space 1-2m apart.', 'Provide support for vines. Harvest when skin is hard.'),
(17, 10, 'carrot', 'කැරට්', 'vegetable', 75, 'bright', 'moderate', 'sandy loam', 'Sow seeds 1cm deep, space 5-10cm apart.', 'Loose, well-drained soil is crucial. Avoid waterlogging.'),
(18, NULL, 'maniyok', 'මඤ්ඤොක්කා', 'vegetable', 300, 'bright', 'low', 'well-drained', 'Plant cuttings 10-15cm deep, space 1m apart.', 'Tolerates poor soil. Harvest after 8-12 months.'),
(19, NULL, 'malumiris', 'මාළු මිරිස්', 'vegetable', 65, 'bright', 'moderate', 'well-drained', 'Sow seeds 0.5cm deep, space 30-45cm apart.', 'Provide support. Protect from heavy rain.'),
(20, NULL, 'niyan vatakolu', 'නියං වටකොළු', 'vegetable', 60, 'bright', 'moderate', 'well-drained', 'Sow seeds 1-2cm deep, space 30-45cm apart.', 'Drought tolerant variety. Provide support.'),
(21, NULL, 'kankun', 'කංකුන්', 'vegetable', 60, 'bright', 'moderate', 'well-drained', 'Sow seeds 1-2cm deep, space 15-20cm apart.', 'Grows well in waterlogged areas. Harvest regularly.'),
(22, 11, 'winged beans', 'දඹල', 'vegetable', 60, 'bright', 'moderate', 'well-drained', 'Sow seeds 2-3cm deep, space 30-45cm apart.', 'Provide strong support for vines. Harvest young pods.'),
(23, 12, 'bitter gourd', 'කරවිල', 'vegetable', 60, 'bright', 'moderate', 'well-drained', 'Sow seeds 2-3cm deep, space 45-60cm apart.', 'Provide support. Harvest when fruits are green.'),
(24, NULL, 'garlic', 'සුදු ලූනු', 'vegetable', 120, 'bright', 'moderate', 'well-drained', 'Plant cloves 2-3cm deep, 10-15cm apart.', 'Plant in well drained soil. Harvest when leaves start to brown.'),
(36, NULL, 'garden balsam', 'කූඩලු', 'flower', 60, 'bright', 'moderate', 'well-drained', 'Sow seeds 1cm deep, space 20-30cm apart.', 'Prefers warm climates. Keep soil consistently moist.');

-- 2. Insert new seeds into the database
INSERT INTO "seeds" (
    "seed_id",
    "seed_name_in_english",
    "seed_name_in_sinhala",
    "days_to_germinate",
    "direct_sow",
    "water_soak",
    "how_to_plant",
    "notes"
) VALUES
(1, 'tomatoes', 'තක්කාලි', 7, 'no', 'no', 'Start seeds indoors 6-8 weeks before last frost, sow 0.5cm deep.', NULL),
(2, 'cabbage', 'ගෝවා', 5, 'no', 'no', 'Start seeds indoors or direct sow in cool weather, sow 1cm deep.', NULL),
(3, 'chilli pepper', 'මිරිස්', 7, 'no', 'no', 'Start seeds indoors, provide warm temperatures, sow 0.5cm deep.', NULL),
(4, 'okra', 'බණ්ඩක්කා', 7, 'yes', 'no', 'Direct sow after soil warms, sow 2cm deep.', NULL),
(5, 'corn', 'බඩ ඉරිඟු', 7, 'yes', 'no', 'Direct sow after last frost, sow 2-5cm deep.', NULL),
(6, 'long white raddish', 'දිග සුදු රාබු', 4, 'yes', 'no', 'Direct sow in cool weather, sow 1cm deep.', NULL),
(7, 'green long beans', 'බෝංචි', 7, 'yes', 'no', 'Direct sow after last frost, sow 2-3cm deep.', NULL),
(8, 'cowpea', 'කව්පි', 7, 'yes', 'no', 'Direct sow after last frost, sow 2-3cm deep.', NULL),
(9, 'leaf cabbage', 'කොළ ගෝවා', 5, 'no', 'no', 'Start seeds indoors or direct sow in cool weather, sow 1cm deep.', NULL),
(10, 'carrot', 'කැරට්', 7, 'yes', 'no', 'Sow seeds 1cm deep, space 5-10cm apart.', 'Loose, well-drained soil is crucial. Avoid waterlogging.'),
(11, 'winged beans', 'දඹල', 7, 'yes', 'no', 'Sow seeds 2-3cm deep, space 30-45cm apart.', 'Provide strong support for vines. Harvest young pods.'),
(12, 'bitter gourd', 'කරවිල', 7, 'yes', 'yes', 'Sow seeds 2-3cm deep, space 45-60cm apart.', 'Provide support. Harvest when fruits are green.');

-- 3. Insert new garden sections into the database
INSERT INTO sections (section_name, sunlight, has_space, soil, notes)
VALUES
    ('A', 'bright', 'no', 'sandy and loamy', 'direct sun in the afternoon'),
    ('B', 'bright', 'yes', 'sandy and loamy', 'has space if garlic not germinate'),
    ('C', 'bright', 'no', 'sandy and loamy', 'direct sun in the afternoon');

-- 4. Insert planted plants into sections
INSERT INTO plants_and_sections (plant_id, section_id, planted_date)
VALUES
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'corn'), (SELECT section_id FROM sections WHERE section_name = 'A'), date('2025-01-31')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'white long raddish'), (SELECT section_id FROM sections WHERE section_name = 'A'), date('2025-01-20')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'chilli pepper'), (SELECT section_id FROM sections WHERE section_name = 'A'), date('2025-01-31')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'spring onions'), (SELECT section_id FROM sections WHERE section_name = 'A'), date('2025-02-17')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'garlic'), (SELECT section_id FROM sections WHERE section_name = 'A'), date('2025-02-17')),

  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'marigold'), (SELECT section_id FROM sections WHERE section_name = 'B'), date('2025-01-31')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'tomatoes'), (SELECT section_id FROM sections WHERE section_name = 'B'), date('2025-02-22')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'garden balsam'), (SELECT section_id FROM sections WHERE section_name = 'B'), date('2025-01-20')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'garlic'), (SELECT section_id FROM sections WHERE section_name = 'B'), date('2025-02-17')),
  
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'okra'), (SELECT section_id FROM sections WHERE section_name = 'C'), date('2025-02-25')),
  ((SELECT plant_id FROM plants WHERE plant_name_in_english = 'carrot'), (SELECT section_id FROM sections WHERE section_name = 'C'), date('2025-02-26'));

-- 5. Insert germinating seeds into sections
INSERT INTO seeds_and_sections (seed_id, section_id, start_date)
VALUES
  ((SELECT seed_id FROM seeds WHERE seed_name_in_english = 'okra'), (SELECT section_id FROM sections WHERE section_name = 'C'), date('2025-02-25')),
  ((SELECT seed_id FROM seeds WHERE seed_name_in_english = 'carrot'), (SELECT section_id FROM sections WHERE section_name = 'C'), date('2025-02-26'));

-- 6. Update plant details
UPDATE plants
SET notes = 'Updated: Requires more watering during summer.'
WHERE plant_id = 1;

-- 7. Delete a plant record
DELETE FROM plants WHERE plant_id = 1;

-- 8. Get plants ready for harvest
SELECT p.plant_name_in_english, ps.harvest_date
FROM plants p
JOIN plants_and_sections ps ON p.plant_id = ps.plant_id
WHERE ps.harvest_date <= DATE('now');


-- 9. Get all plants that require bright sunlight
SELECT plant_name_in_english FROM plants WHERE ideal_sunlight = 'bright';

-- 10. Count the number of plants in each section
SELECT s.section_name, COUNT(ps.plant_id) AS plant_count
FROM sections s
LEFT JOIN plants_and_sections ps ON s.section_id = ps.section_id
GROUP BY s.section_name;

-- 11. Get all sections that have available space for planting
SELECT section_name FROM sections WHERE has_space = 'yes';
