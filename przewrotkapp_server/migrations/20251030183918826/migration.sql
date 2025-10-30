BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "favourites_junctions" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "favourites_junctions" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "gearId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "favourites_junctions_index_idx" ON "favourites_junctions" USING btree ("userId", "gearId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "favourites_junctions"
    ADD CONSTRAINT "favourites_junctions_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "favourites_junctions"
    ADD CONSTRAINT "favourites_junctions_fk_1"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20251030183918826', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251030183918826', "timestamp" = now();

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
