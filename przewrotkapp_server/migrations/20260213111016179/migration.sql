BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "comments" ADD COLUMN "dateCreated" timestamp without time zone NOT NULL DEFAULT '2025-08-30 12:00:00'::timestamp without time zone;
ALTER TABLE "comments" ADD COLUMN "dateResolved" timestamp without time zone;

--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20260213111016179', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260213111016179', "timestamp" = now();

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
