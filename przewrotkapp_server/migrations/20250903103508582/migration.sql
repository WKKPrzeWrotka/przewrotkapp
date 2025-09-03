BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "gear_clothes" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_clothes" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "size" text NOT NULL,
    "type" text NOT NULL,
    "typeDescription" text
);

-- Indexes
CREATE UNIQUE INDEX "clothes_gear_unique_idx" ON "gear_clothes" USING btree ("gearId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_clothes"
    ADD CONSTRAINT "gear_clothes_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250903103508582', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250903103508582', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
