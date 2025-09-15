BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "extra_user_infos" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "phoneNumber" text,
    "discordUsername" text,
    "socialLinks" json NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "extra_user_info_user_info_unique_idx" ON "extra_user_infos" USING btree ("userInfoId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "favourites_junctions" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "extraUserInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "favourites_junctions_index_idx" ON "favourites_junctions" USING btree ("gearId", "extraUserInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "extra_user_infos"
    ADD CONSTRAINT "extra_user_infos_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "favourites_junctions"
    ADD CONSTRAINT "favourites_junctions_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "favourites_junctions"
    ADD CONSTRAINT "favourites_junctions_fk_1"
    FOREIGN KEY("extraUserInfoId")
    REFERENCES "extra_user_infos"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250915172131900', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250915172131900', "timestamp" = now();

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
