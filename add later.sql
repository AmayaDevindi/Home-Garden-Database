-- Table for fertilizers
CREATE TABLE "fertilizers" (
    "fertilizer_id" INTEGER,
    "fertilizer_name" TEXT NOT NULL,
    "fertilizer_type" TEXT CHECK("type" IN ('liquid', 'powder', 'grain', 'soil')),
    "frequency_in_days" INTEGER,
    "ingredients" TEXT,
    "nutrients" TEXT,
    "how_to_use" TEXT,
    "notes" TEXT,
    PRIMARY KEY("fertilizer_id")
);

-- Table for tracking fertilized instances--trigger
CREATE TABLE "plants_and_fertilizers" (
    "id" INTEGER,
    "plant_id" INTEGER,
    "fertilizer_id" INTEGER,
    "last_date_fertilized" DATE NOT NULL,
    "next_fertilization_date" DATE ,-- Calculates the next fertilization date
    PRIMARY KEY("id"),
    FOREIGN KEY("plant_id") REFERENCES "plants"("plant_id"),
    FOREIGN KEY("fertilizer_id") REFERENCES "fertilizers"("fertilizer_id")
);

CREATE INDEX "fertilizer_name_search" ON "fertilizers" ("fertilizer_name");
CREATE INDEX "fertilizer_type_search" ON "fertilizers" ("fertilizer_type");

CREATE INDEX "fertilized_plant_search" ON "plants_and_fertilizers" ("plant_id");

-- Trigger to calculate next_fertilization_date for plants_and_fertilizers
CREATE TRIGGER "update_plants_and_fertilizers_next_date"
AFTER INSERT ON "plants_and_fertilizers"
FOR EACH ROW
BEGIN
    UPDATE "plants_and_fertilizers"
    SET "next_fertilization_date" = DATE(NEW."last_date_fertilized", '+' || (SELECT "frequency_in_days" FROM "fertilizers" WHERE "fertilizer_id" = NEW."fertilizer_id") || ' days')
    WHERE "id" = NEW."id";
END;

-- View for plants and fertilizers
CREATE VIEW "plant_fertilizer_view" AS
SELECT
    paf."id" AS "plants_and_fertilizers_id",
    p."plant_id",
    f."fertilizer_id",
    p."plant_name_in_english",
    p."plant_name_in_sinhala",
    f."fertilizer_name",
    paf."last_date_fertilized",
    paf."next_fertilization_date"
FROM
    "plants_and_fertilizers" paf
JOIN
    "plants" p ON paf."plant_id" = p."plant_id"
JOIN
    "fertilizers" f ON paf."fertilizer_id" = f."fertilizer_id";