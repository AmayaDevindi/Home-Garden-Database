-- Table for storing seed details
CREATE TABLE "seeds" (
    "seed_id" INTEGER,
    "seed_name_in_english" TEXT NOT NULL,
    "seed_name_in_sinhala" TEXT NOT NULL,
    "days_to_germinate" INTEGER NOT NULL CHECK("days_to_germinate" > 0),
    "direct_sow" TEXT CHECK("direct_sow" IN ('yes', 'no')) NOT NULL DEFAULT 'no',
    "water_soak" TEXT CHECK("water_soak" IN ('yes', 'no')) NOT NULL DEFAULT 'no',
    "how_to_plant" TEXT,
    "notes" TEXT,
    PRIMARY KEY("seed_id")
);

-- Table for storing plant details
CREATE TABLE "plants" (
    "plant_id" INTEGER,
    "seed_id" INTEGER,
    "plant_name_in_english" TEXT NOT NULL,
    "plant_name_in_sinhala" TEXT NOT NULL,
    "plant_type" TEXT CHECK("plant_type" IN ('vegetable', 'fruit', 'herb', 'flower', 'ornamental')) NOT NULL,
    "days_to_maturity" INTEGER NOT NULL CHECK("days_to_maturity" > 0),
    "ideal_sunlight" TEXT CHECK("ideal_sunlight" IN ('bright', 'medium', 'low')) NOT NULL,
    "ideal_water" TEXT CHECK("ideal_water" IN ('high', 'moderate', 'low')) NOT NULL DEFAULT 'moderate',
    "ideal_soil" TEXT,
    "how_to_plant" TEXT,
    "notes" TEXT,
    PRIMARY KEY("plant_id"),
    FOREIGN KEY ("seed_id") REFERENCES "seeds"("seed_id")
);

-- Table for storing garden sections
CREATE TABLE "sections" (
    "section_id" INTEGER,
    "section_name" TEXT NOT NULL,
    "sunlight" TEXT CHECK("sunlight" IN ('bright', 'medium', 'low')) NOT NULL,
    "has_space" TEXT CHECK("has_space" IN ('yes', 'no')) DEFAULT 'yes',
    "soil" TEXT,
    "notes" TEXT,
    PRIMARY KEY("section_id")
);

-- Table for tracking planted instances
CREATE TABLE "plants_and_sections" (
    "id" INTEGER,
    "plant_id" INTEGER,
    "section_id" INTEGER,
    "planted_date" DATE NOT NULL,
    "days_old" INTEGER, --trigger
    "harvest_date" DATE,--trigger
    PRIMARY KEY("id"),
    FOREIGN KEY("plant_id") REFERENCES "plants"("plant_id"),
    FOREIGN KEY("section_id") REFERENCES "sections"("section_id")
);

-- Table for tracking germinated instances
CREATE TABLE "seeds_and_sections" (
    "id" INTEGER,
    "seed_id" INTEGER,
    "section_id" INTEGER,
    "start_date" DATE NOT NULL,
    "days_old" INTEGER, --trigger
    "complete_date" DATE,--trigger
    PRIMARY KEY("id"),
    FOREIGN KEY("seed_id") REFERENCES "seeds"("seed_id"),
    FOREIGN KEY("section_id") REFERENCES "sections"("section_id")
);

-- Create indexes to speed common searches
CREATE INDEX "plant_name_search" ON "plants" ("plant_name");
CREATE INDEX "plant_type_search" ON "plants" ("plant_type");

CREATE INDEX "section_name_search" ON "sections" ("section_name");

CREATE INDEX "seed_name_search" ON "seeds" ("seed_name");

CREATE INDEX "planted_plant_search" ON "plants_and_sections" ("plant_id");
CREATE INDEX "planted_section_search" ON "plants_and_sections" ("section_id");

CREATE INDEX "planted_seeds_search" ON "seeds_and_sections" ("seed_id");


-- Triggers

-- Trigger to calculate days_old for plants_and_sections
CREATE TRIGGER "update_plants_and_sections_days_old"
AFTER INSERT ON "plants_and_sections"
FOR EACH ROW
BEGIN
    UPDATE "plants_and_sections"
    SET "days_old" = CAST((JULIANDAY('now') - JULIANDAY(NEW."planted_date")) AS INTEGER)
    WHERE "id" = NEW."id";
END;

-- Trigger to calculate harvest_date for plants_and_sections
CREATE TRIGGER "update_plants_and_sections_harvest_date"
AFTER INSERT ON "plants_and_sections"
FOR EACH ROW
BEGIN
    UPDATE "plants_and_sections"
    SET "harvest_date" = DATE(NEW."planted_date", '+' || (SELECT "days_to_maturity" FROM "plants" WHERE "plant_id" = NEW."plant_id") || ' days')
    WHERE "id" = NEW."id";
END;

-- Trigger to calculate days_old for seeds_and_sections
CREATE TRIGGER "update_seeds_and_sections_days_old"
AFTER INSERT ON "seeds_and_sections"
FOR EACH ROW
BEGIN
    UPDATE "seeds_and_sections"
    SET "days_old" = CAST((JULIANDAY('now') - JULIANDAY(NEW."start_date")) AS INTEGER)
    WHERE "id" = NEW."id";
END;

-- Trigger to calculate complete_date for seeds_and_sections
CREATE TRIGGER "update_seeds_and_sections_complete_date"
AFTER INSERT ON "seeds_and_sections"
FOR EACH ROW
BEGIN
    UPDATE "seeds_and_sections"
    SET "complete_date" = DATE(NEW."start_date", '+' || (SELECT "days_to_germinate" FROM "seeds" WHERE "seed_id" = NEW."seed_id") || ' days')
    WHERE "id" = NEW."id";
END;

-- Views  

-- View for plants and seeds
CREATE VIEW "plant_seed_view" AS
SELECT
    p."plant_id",
    s."seed_id",
    p."plant_name_in_english",
    p."plant_name_in_sinhala",
    p."plant_type",
    p."days_to_maturity",
    s."days_to_germinate",
    p."ideal_sunlight",
    p."ideal_water",
    p."ideal_soil",
    s."direct_sow",
    s."water_soak",
    p."how_to_plant",
    p."notes"
FROM
    "plants" p
LEFT JOIN
    "seeds" s ON p."seed_id" = s."seed_id";

-- View for plants and sections
CREATE VIEW "plant_section_view" AS
SELECT
    pas."id" AS "plants_and_sections_id",
    p."plant_id",
    s."section_id",
    p."plant_name_in_english",
    p."plant_name_in_sinhala",
    s."section_name",
    pas."planted_date",
    pas."days_old",
    pas."harvest_date"
FROM
    "plants_and_sections" pas
JOIN
    "plants" p ON pas."plant_id" = p."plant_id"
JOIN
    "sections" s ON pas."section_id" = s."section_id";

-- View for seeds and sections
CREATE VIEW "seed_section_view" AS
SELECT
    sas."id" AS "seeds_and_sections_id",
    s."seed_id",
    sec."section_id",
    s."seed_name_in_english",
    s."seed_name_in_sinhala",
    sec."section_name",
    sas."start_date",
    sas."days_old",
    sas."complete_date"
FROM
    "seeds_and_sections" sas
JOIN
    "seeds" s ON sas."seed_id" = s."seed_id"
JOIN
    "sections" sec ON sas."section_id" = sec."section_id";

