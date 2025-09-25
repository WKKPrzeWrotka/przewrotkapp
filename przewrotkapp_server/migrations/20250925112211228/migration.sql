BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "gear_photos" CASCADE;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "gear" DROP COLUMN "thumbnailId";
ALTER TABLE "gear" ADD COLUMN "thumbnailUrl" text;

--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250925112211228', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250925112211228', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
