BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "gear" DROP CONSTRAINT "gear_fk_0";
ALTER TABLE "gear" DROP COLUMN "_rentalsGearRentalsId";
--
-- ACTION CREATE TABLE
--
CREATE TABLE "rental_junctions" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "rentalId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "rental_junctions_index_idx" ON "rental_junctions" USING btree ("gearId", "rentalId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "rental_junctions"
    ADD CONSTRAINT "rental_junctions_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "rental_junctions"
    ADD CONSTRAINT "rental_junctions_fk_1"
    FOREIGN KEY("rentalId")
    REFERENCES "rentals"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250905120553583', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250905120553583', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
