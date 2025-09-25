BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "gear" ADD COLUMN "thumbnailId" bigint;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_photos" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint,
    "width" bigint NOT NULL,
    "height" bigint NOT NULL,
    "blurhash" text,
    "path" text NOT NULL
);

-- Indexes
CREATE INDEX "gear_photos_gear_unique_idx" ON "gear_photos" USING btree ("gearId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear"
    ADD CONSTRAINT "gear_fk_0"
    FOREIGN KEY("thumbnailId")
    REFERENCES "gear_photos"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_photos"
    ADD CONSTRAINT "gear_photos_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250925100146991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250925100146991', "timestamp" = now();

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
