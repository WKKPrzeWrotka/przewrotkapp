BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "gear" ADD COLUMN "_rentalsGearRentalsId" bigint;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "rentals" (
    "id" bigserial PRIMARY KEY,
    "created" timestamp without time zone NOT NULL,
    "lastModified" timestamp without time zone NOT NULL,
    "from" timestamp without time zone NOT NULL,
    "to" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear"
    ADD CONSTRAINT "gear_fk_0"
    FOREIGN KEY("_rentalsGearRentalsId")
    REFERENCES "rentals"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250905111035418', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250905111035418', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
