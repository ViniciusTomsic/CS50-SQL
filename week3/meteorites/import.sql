.mode csv
.import meteorites.csv temp

DROP TABLE IF EXISTS "meteorites_temp";
DROP TABLE IF EXISTS "meteorites";


CREATE TABLE "meteorites_temp" (
    "id",
    "name" TEXT,
    "class" TEXT,
    "nametype" TEXT,
    "mass" REAL,
    "discovery" DATE,
    "year" DATE,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE "meteorites" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" DATE,
    "year" DATE,
    "lat" REAL,
    "long" REAL
);


INSERT INTO "meteorites_temp" ("name", "class", "nametype", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "nametype", "mass","discovery","year", "lat","long"
FROM "temp";

UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = "";
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = "";
UPDATE "meteorites_temp" SET "lat" =  NULL WHERE "lat" = "";
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = "";

UPDATE  "meteorites_temp"
SET
    mass = ROUND(mass, 2),
    lat = ROUND(lat, 2),
    long = ROUND(long, 2);

DELETE FROM meteorites_temp
WHERE nametype = "Relict";

INSERT INTO meteorites ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM meteorites_temp
ORDER BY "year", "name";
