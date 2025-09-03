BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_floatbags" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "volume" bigint
);

-- Indexes
CREATE UNIQUE INDEX "floatbags_gear_unique_idx" ON "gear_floatbags" USING btree ("gearId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_floatbags"
    ADD CONSTRAINT "gear_floatbags_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250903115751467', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250903115751467', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
