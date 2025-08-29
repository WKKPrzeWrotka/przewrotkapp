BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "gear_kayaks" ALTER COLUMN "minWeight" DROP NOT NULL;
ALTER TABLE "gear_kayaks" ALTER COLUMN "maxWeight" DROP NOT NULL;

--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250829105547368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250829105547368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
