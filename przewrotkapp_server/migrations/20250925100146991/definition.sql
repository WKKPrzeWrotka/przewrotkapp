BEGIN;

--
-- Class Comment as table comments
--
CREATE TABLE "comments" (
    "id" bigserial PRIMARY KEY,
    "byId" bigint NOT NULL,
    "gearId" bigint,
    "type" text NOT NULL,
    "text" text NOT NULL,
    "hoursForResolving" bigint,
    "resolved" boolean NOT NULL DEFAULT false,
    "resolvedById" bigint
);

-- Indexes
CREATE INDEX "comment_by_idx" ON "comments" USING btree ("byId");
CREATE INDEX "comment_gear_idx" ON "comments" USING btree ("gearId");
CREATE INDEX "comment_resolved_by_idx" ON "comments" USING btree ("resolvedById");

--
-- Class ExtraUserInfo as table extra_user_infos
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
-- Class FavouritesJunction as table favourites_junctions
--
CREATE TABLE "favourites_junctions" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "extraUserInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "favourites_junctions_index_idx" ON "favourites_junctions" USING btree ("gearId", "extraUserInfoId");

--
-- Class Gear as table gear
--
CREATE TABLE "gear" (
    "id" bigserial PRIMARY KEY,
    "clubId" text NOT NULL,
    "type" text NOT NULL,
    "manufacturer" text,
    "model" text,
    "friendlyName" text,
    "photoUrls" json,
    "thumbnailId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "gear_club_id_idx" ON "gear" USING btree ("clubId");

--
-- Class GearBelt as table gear_belts
--
CREATE TABLE "gear_belts" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "length" double precision NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "belts_gear_unique_idx" ON "gear_belts" USING btree ("gearId");

--
-- Class GearClothing as table gear_clothes
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
-- Class GearFloatbag as table gear_floatbags
--
CREATE TABLE "gear_floatbags" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "volume" bigint
);

-- Indexes
CREATE UNIQUE INDEX "floatbags_gear_unique_idx" ON "gear_floatbags" USING btree ("gearId");

--
-- Class GearHelmet as table gear_helmets
--
CREATE TABLE "gear_helmets" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "size" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "helmets_gear_unique_idx" ON "gear_helmets" USING btree ("gearId");

--
-- Class GearKayak as table gear_kayaks
--
CREATE TABLE "gear_kayaks" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "minWeight" bigint,
    "maxWeight" bigint,
    "length" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "kayaks_gear_unique_idx" ON "gear_kayaks" USING btree ("gearId");

--
-- Class GearPaddle as table gear_paddles
--
CREATE TABLE "gear_paddles" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "length" double precision NOT NULL,
    "rotation" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "paddles_gear_unique_idx" ON "gear_paddles" USING btree ("gearId");

--
-- Class GearPfd as table gear_pfds
--
CREATE TABLE "gear_pfds" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "size" text NOT NULL,
    "type" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "pfds_gear_unique_idx" ON "gear_pfds" USING btree ("gearId");

--
-- Class GearPhoto as table gear_photos
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
-- Class GearSpraydeck as table gear_spraydecks
--
CREATE TABLE "gear_spraydecks" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "deckSize" text NOT NULL,
    "waistSize" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "spraydecks_gear_unique_idx" ON "gear_spraydecks" USING btree ("gearId");

--
-- Class GearThrowbag as table gear_throwbags
--
CREATE TABLE "gear_throwbags" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "length" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "throwbags_gear_unique_idx" ON "gear_throwbags" USING btree ("gearId");

--
-- Class RentalJunction as table rental_junctions
--
CREATE TABLE "rental_junctions" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "rentalId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "rental_junctions_index_idx" ON "rental_junctions" USING btree ("gearId", "rentalId");

--
-- Class Rental as table rentals
--
CREATE TABLE "rentals" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "lastModified" timestamp without time zone NOT NULL,
    "from" timestamp without time zone NOT NULL,
    "to" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "rentals_users_unique_idx" ON "rentals" USING btree ("userInfoId");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Class AuthKey as table serverpod_auth_key
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- Class EmailAuth as table serverpod_email_auth
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- Class EmailCreateAccountRequest as table serverpod_email_create_request
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- Class EmailFailedSignIn as table serverpod_email_failed_sign_in
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- Class EmailReset as table serverpod_email_reset
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- Class GoogleRefreshToken as table serverpod_google_refresh_token
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- Class UserImage as table serverpod_user_image
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- Class UserInfo as table serverpod_user_info
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");

--
-- Foreign relations for "comments" table
--
ALTER TABLE ONLY "comments"
    ADD CONSTRAINT "comments_fk_0"
    FOREIGN KEY("byId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "comments"
    ADD CONSTRAINT "comments_fk_1"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "comments"
    ADD CONSTRAINT "comments_fk_2"
    FOREIGN KEY("resolvedById")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "extra_user_infos" table
--
ALTER TABLE ONLY "extra_user_infos"
    ADD CONSTRAINT "extra_user_infos_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "favourites_junctions" table
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
-- Foreign relations for "gear" table
--
ALTER TABLE ONLY "gear"
    ADD CONSTRAINT "gear_fk_0"
    FOREIGN KEY("thumbnailId")
    REFERENCES "gear_photos"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_belts" table
--
ALTER TABLE ONLY "gear_belts"
    ADD CONSTRAINT "gear_belts_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_clothes" table
--
ALTER TABLE ONLY "gear_clothes"
    ADD CONSTRAINT "gear_clothes_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_floatbags" table
--
ALTER TABLE ONLY "gear_floatbags"
    ADD CONSTRAINT "gear_floatbags_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_helmets" table
--
ALTER TABLE ONLY "gear_helmets"
    ADD CONSTRAINT "gear_helmets_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_kayaks" table
--
ALTER TABLE ONLY "gear_kayaks"
    ADD CONSTRAINT "gear_kayaks_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_paddles" table
--
ALTER TABLE ONLY "gear_paddles"
    ADD CONSTRAINT "gear_paddles_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_pfds" table
--
ALTER TABLE ONLY "gear_pfds"
    ADD CONSTRAINT "gear_pfds_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_photos" table
--
ALTER TABLE ONLY "gear_photos"
    ADD CONSTRAINT "gear_photos_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_spraydecks" table
--
ALTER TABLE ONLY "gear_spraydecks"
    ADD CONSTRAINT "gear_spraydecks_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_throwbags" table
--
ALTER TABLE ONLY "gear_throwbags"
    ADD CONSTRAINT "gear_throwbags_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "rental_junctions" table
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
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "rentals" table
--
ALTER TABLE ONLY "rentals"
    ADD CONSTRAINT "rentals_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
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
