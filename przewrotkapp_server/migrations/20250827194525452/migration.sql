BEGIN;

--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "gear_club_id_idx" ON "gear" USING btree ("clubId");

--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250827194525452', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250827194525452', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
