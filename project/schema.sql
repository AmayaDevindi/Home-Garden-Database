-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it


-- Table for storing plant details
CREATE TABLE "plants" (
    "plant_id" INTEGER,
    "name" TEXT NOT NULL,
    "plant_type" TEXT CHECK("plant_type" IN ('vegetable', 'fruit', 'herb', 'flower', 'ornamental')) NOT NULL,
    "image_path" TEXT, -- Store file paths instead of BLOBs for larger images
    "days_to_maturity" INTEGER NOT NULL CHECK("days_to_maturity" > 0),
    "ideal_sunlight" TEXT CHECK("ideal_sunlight" IN ('bright', 'medium', 'low')) NOT NULL,
    "ideal_water" TEXT CHECK("ideal_water" IN ('high', 'moderate', 'low')) NOT NULL,
    "ideal_soil" TEXT,
    "how_to_plant" TEXT,
    "notes" TEXT,
    PRIMARY KEY("plant_id")
);

-- Table for garden sections
CREATE TABLE "sections" (
    "section_id" INTEGER,
    "name" TEXT NOT NULL,
    "sunlight_exposure" TEXT,
    "has_space" TEXT CHECK("has_space" IN ('yes', 'no')) DEFAULT 'yes',
    "soil_type" TEXT,
    "notes" TEXT,
    PRIMARY KEY("section_id")
);

-- Table for tracking planted instances
CREATE TABLE "planted" (
    "planted_id" INTEGER,
    "plant_id" INTEGER,
    "section_id" INTEGER,
    "date_planted" DATE NOT NULL,
    "days_old" INTEGER DEFAULT 0, -- Initialize to 0, will be updated by trigger
    "days_to_maturity" INTEGER, -- Stores the days to maturity for the planted instance
    PRIMARY KEY("planted_id"),
    FOREIGN KEY("plant_id") REFERENCES "plants"("plant_id"),
    FOREIGN KEY("section_id") REFERENCES "sections"("section_id")
);

-- Table for fertilizers
CREATE TABLE "fertilizers" (
    "fertilizer_id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT CHECK("type" IN ('liquid', 'powder', 'grain', 'soil')),
    "frequency_in_days" INTEGER,
    "ingredients" TEXT,
    "nutrients" TEXT,
    "how_to_use" TEXT,
    "notes" TEXT,
    PRIMARY KEY("fertilizer_id")
);

-- Table for tracking fertilized instances
CREATE TABLE "fertilized" (
    "fertilized_id" INTEGER,
    "plant_id" INTEGER,
    "fertilizer_id" INTEGER,
    "date_fertilized" DATE NOT NULL,
    "next_fertilization_date" DATE GENERATED ALWAYS AS (DATE("date_fertilized", '+' || "frequency_in_days" || ' days')) STORED, -- Calculates the next fertilization date
    PRIMARY KEY("fertilized_id"),
    FOREIGN KEY("plant_id") REFERENCES "plants"("plant_id"),
    FOREIGN KEY("fertilizer_id") REFERENCES "fertilizers"("fertilizer_id")
);

-- Table for germination tracking
CREATE TABLE "germination" (
    "germination_id" INTEGER,
    "name" TEXT NOT NULL, -- Name of the seed/plant type
    "days_to_plant" INTEGER NOT NULL, -- Number of days until planting
    "start_date" DATE NOT NULL, -- Date when germination started
    "plant_date" DATE GENERATED ALWAYS AS (DATE("start_date", '+' || "days_to_plant" || ' days')) STORED, -- Auto-calculates plant date
    "how_to_germinate" TEXT,
    "notes" TEXT,
    PRIMARY KEY("germination_id")
);



-- Trigger to automatically set days_to_maturity when a new plant is planted
CREATE TRIGGER "set_days_to_maturity"
AFTER INSERT ON "planted"
FOR EACH ROW
BEGIN
    UPDATE "planted"
    SET "days_to_maturity" = (SELECT "days_to_maturity" FROM "plants" WHERE "plant_id" = NEW."plant_id")
    WHERE "planted_id" = NEW."planted_id";
END;

-- Trigger to calculate and update 'days_old' on insert and update
CREATE TRIGGER "update_days_old"
AFTER INSERT OR UPDATE OF "date_planted" ON "planted"
FOR EACH ROW
BEGIN
    UPDATE "planted"
    SET "days_old" = CAST((JULIANDAY('now') - JULIANDAY(NEW."date_planted")) AS INTEGER)
    WHERE "planted_id" = NEW."planted_id";
END;

-- Create indexes to speed common searches
CREATE INDEX "plant_name_search" ON "plants" ("name");
CREATE INDEX "plant_type_search" ON "plants" ("plant_type");
CREATE INDEX "section_name_search" ON "sections" ("name");
CREATE INDEX "planted_plant_search" ON "planted" ("plant_id");
CREATE INDEX "planted_section_search" ON "planted" ("section_id");
CREATE INDEX "fertilizer_name_search" ON "fertilizers" ("name");
CREATE INDEX "fertilized_plant_search" ON "fertilized" ("plant_id");
CREATE INDEX "germination_name_search" ON "germination" ("name");

-- View to display plant details with planted information and section information
CREATE VIEW "plant_planted_section_view" AS
SELECT
    p."plant_id",
    p."name" AS "plant_name",
    p."plant_type",
    p."days_to_maturity" AS "plant_maturity",
    pl."planted_id",
    pl."date_planted",
    pl."days_old",
    pl."days_to_maturity" AS "planted_maturity",
    s."section_id",
    s."name" AS "section_name",
    s."sunlight_exposure",
    s."has_space",
    s."soil_type",
    s."notes" AS "section_notes"
FROM
    "plants" p
LEFT JOIN
    "planted" pl ON p."plant_id" = pl."plant_id"
LEFT JOIN
    "sections" s ON pl."section_id" = s."section_id";

-- View to display fertilized plant details with fertilizer information
CREATE VIEW "fertilized_plant_view" AS
SELECT
    p."plant_id",
    p."name" AS "plant_name",
    f."fertilizer_id",
    f."name" AS "fertilizer_name",
    fe."date_fertilized",
    fe."next_fertilization_date"
FROM
    "plants" p
JOIN
    "fertilized" fe ON p."plant_id" = fe."plant_id"
JOIN
    "fertilizers" f ON fe."fertilizer_id" = f."fertilizer_id";
