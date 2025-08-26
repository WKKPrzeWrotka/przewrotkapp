BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_belts" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "length" double precision NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "belts_gear_unique_idx" ON "gear_data_belts" USING btree ("gearId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_clothes" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "typeDescription" text
);

-- Indexes
CREATE UNIQUE INDEX "clothes_gear_unique_idx" ON "gear_data_clothes" USING btree ("gearId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_helmets" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "size" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "helmets_gear_unique_idx" ON "gear_data_helmets" USING btree ("gearId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_kayaks" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "minWeight" bigint NOT NULL,
    "maxWeight" bigint NOT NULL,
    "length" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "kayaks_gear_unique_idx" ON "gear_data_kayaks" USING btree ("gearId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_paddles" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "length" double precision NOT NULL,
    "rotation" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "paddles_gear_unique_idx" ON "gear_data_paddles" USING btree ("gearId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_pfds" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "size" text NOT NULL,
    "type" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "pfds_gear_unique_idx" ON "gear_data_pfds" USING btree ("gearId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_spraydecks" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "deckSize" text NOT NULL,
    "waistSize" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "spraydecks_gear_unique_idx" ON "gear_data_spraydecks" USING btree ("gearId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gear_data_throwbags" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "length" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "throwbags_gear_unique_idx" ON "gear_data_throwbags" USING btree ("gearId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_belts"
    ADD CONSTRAINT "gear_data_belts_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_clothes"
    ADD CONSTRAINT "gear_data_clothes_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_helmets"
    ADD CONSTRAINT "gear_data_helmets_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_kayaks"
    ADD CONSTRAINT "gear_data_kayaks_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_paddles"
    ADD CONSTRAINT "gear_data_paddles_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_pfds"
    ADD CONSTRAINT "gear_data_pfds_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_spraydecks"
    ADD CONSTRAINT "gear_data_spraydecks_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gear_data_throwbags"
    ADD CONSTRAINT "gear_data_throwbags_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250826213448197', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250826213448197', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
