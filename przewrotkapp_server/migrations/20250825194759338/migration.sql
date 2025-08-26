BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear" (
    "id" bigserial PRIMARY KEY,
    "clubId" text NOT NULL,
    "manufacturer" text,
    "model" text,
    "friendlyName" text,
    "photoUrls" json
);


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250825194759338', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825194759338', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
