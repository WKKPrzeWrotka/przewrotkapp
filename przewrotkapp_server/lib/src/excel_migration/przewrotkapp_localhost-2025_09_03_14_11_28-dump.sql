--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: gear; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear (
    id bigint NOT NULL,
    "clubId" text NOT NULL,
    manufacturer text,
    model text,
    "friendlyName" text,
    "photoUrls" json
);


ALTER TABLE public.gear OWNER TO postgres;

--
-- Name: gear_belts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_belts (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    length double precision NOT NULL
);


ALTER TABLE public.gear_belts OWNER TO postgres;

--
-- Name: gear_belts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_belts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_belts_id_seq OWNER TO postgres;

--
-- Name: gear_belts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_belts_id_seq OWNED BY public.gear_belts.id;


--
-- Name: gear_clothes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_clothes (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    size text NOT NULL,
    type text NOT NULL,
    "typeDescription" text
);


ALTER TABLE public.gear_clothes OWNER TO postgres;

--
-- Name: gear_clothes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_clothes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_clothes_id_seq OWNER TO postgres;

--
-- Name: gear_clothes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_clothes_id_seq OWNED BY public.gear_clothes.id;


--
-- Name: gear_floatbags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_floatbags (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    volume bigint
);


ALTER TABLE public.gear_floatbags OWNER TO postgres;

--
-- Name: gear_floatbags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_floatbags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_floatbags_id_seq OWNER TO postgres;

--
-- Name: gear_floatbags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_floatbags_id_seq OWNED BY public.gear_floatbags.id;


--
-- Name: gear_helmets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_helmets (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    size text NOT NULL
);


ALTER TABLE public.gear_helmets OWNER TO postgres;

--
-- Name: gear_helmets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_helmets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_helmets_id_seq OWNER TO postgres;

--
-- Name: gear_helmets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_helmets_id_seq OWNED BY public.gear_helmets.id;


--
-- Name: gear_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_id_seq OWNER TO postgres;

--
-- Name: gear_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_id_seq OWNED BY public.gear.id;


--
-- Name: gear_kayaks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_kayaks (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    type text NOT NULL,
    "minWeight" bigint,
    "maxWeight" bigint,
    length bigint NOT NULL
);


ALTER TABLE public.gear_kayaks OWNER TO postgres;

--
-- Name: gear_kayaks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_kayaks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_kayaks_id_seq OWNER TO postgres;

--
-- Name: gear_kayaks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_kayaks_id_seq OWNED BY public.gear_kayaks.id;


--
-- Name: gear_paddles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_paddles (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    type text NOT NULL,
    length double precision NOT NULL,
    rotation bigint NOT NULL
);


ALTER TABLE public.gear_paddles OWNER TO postgres;

--
-- Name: gear_paddles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_paddles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_paddles_id_seq OWNER TO postgres;

--
-- Name: gear_paddles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_paddles_id_seq OWNED BY public.gear_paddles.id;


--
-- Name: gear_pfds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_pfds (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    size text NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.gear_pfds OWNER TO postgres;

--
-- Name: gear_pfds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_pfds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_pfds_id_seq OWNER TO postgres;

--
-- Name: gear_pfds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_pfds_id_seq OWNED BY public.gear_pfds.id;


--
-- Name: gear_spraydecks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_spraydecks (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    "deckSize" text NOT NULL,
    "waistSize" text NOT NULL
);


ALTER TABLE public.gear_spraydecks OWNER TO postgres;

--
-- Name: gear_spraydecks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_spraydecks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_spraydecks_id_seq OWNER TO postgres;

--
-- Name: gear_spraydecks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_spraydecks_id_seq OWNED BY public.gear_spraydecks.id;


--
-- Name: gear_throwbags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear_throwbags (
    id bigint NOT NULL,
    "gearId" bigint NOT NULL,
    length bigint NOT NULL
);


ALTER TABLE public.gear_throwbags OWNER TO postgres;

--
-- Name: gear_throwbags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_throwbags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gear_throwbags_id_seq OWNER TO postgres;

--
-- Name: gear_throwbags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_throwbags_id_seq OWNED BY public.gear_throwbags.id;


--
-- Name: serverpod_cloud_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_cloud_storage (
    id bigint NOT NULL,
    "storageId" text NOT NULL,
    path text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    expiration timestamp without time zone,
    "byteData" bytea NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE public.serverpod_cloud_storage OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_direct_upload; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_cloud_storage_direct_upload (
    id bigint NOT NULL,
    "storageId" text NOT NULL,
    path text NOT NULL,
    expiration timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);


ALTER TABLE public.serverpod_cloud_storage_direct_upload OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_direct_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_direct_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq OWNED BY public.serverpod_cloud_storage_direct_upload.id;


--
-- Name: serverpod_cloud_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_cloud_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_cloud_storage_id_seq OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_cloud_storage_id_seq OWNED BY public.serverpod_cloud_storage.id;


--
-- Name: serverpod_future_call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_future_call (
    id bigint NOT NULL,
    name text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    identifier text
);


ALTER TABLE public.serverpod_future_call OWNER TO postgres;

--
-- Name: serverpod_future_call_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_future_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_future_call_id_seq OWNER TO postgres;

--
-- Name: serverpod_future_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_future_call_id_seq OWNED BY public.serverpod_future_call.id;


--
-- Name: serverpod_health_connection_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_health_connection_info (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    active bigint NOT NULL,
    closing bigint NOT NULL,
    idle bigint NOT NULL,
    granularity bigint NOT NULL
);


ALTER TABLE public.serverpod_health_connection_info OWNER TO postgres;

--
-- Name: serverpod_health_connection_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_health_connection_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_health_connection_info_id_seq OWNER TO postgres;

--
-- Name: serverpod_health_connection_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_health_connection_info_id_seq OWNED BY public.serverpod_health_connection_info.id;


--
-- Name: serverpod_health_metric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_health_metric (
    id bigint NOT NULL,
    name text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    value double precision NOT NULL,
    granularity bigint NOT NULL
);


ALTER TABLE public.serverpod_health_metric OWNER TO postgres;

--
-- Name: serverpod_health_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_health_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_health_metric_id_seq OWNER TO postgres;

--
-- Name: serverpod_health_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_health_metric_id_seq OWNED BY public.serverpod_health_metric.id;


--
-- Name: serverpod_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_log (
    id bigint NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    reference text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    message text NOT NULL,
    error text,
    "stackTrace" text,
    "order" bigint NOT NULL
);


ALTER TABLE public.serverpod_log OWNER TO postgres;

--
-- Name: serverpod_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_log_id_seq OWNED BY public.serverpod_log.id;


--
-- Name: serverpod_message_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_message_log (
    id bigint NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    endpoint text NOT NULL,
    "messageName" text NOT NULL,
    duration double precision NOT NULL,
    error text,
    "stackTrace" text,
    slow boolean NOT NULL,
    "order" bigint NOT NULL
);


ALTER TABLE public.serverpod_message_log OWNER TO postgres;

--
-- Name: serverpod_message_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_message_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_message_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_message_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_message_log_id_seq OWNED BY public.serverpod_message_log.id;


--
-- Name: serverpod_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_method (
    id bigint NOT NULL,
    endpoint text NOT NULL,
    method text NOT NULL
);


ALTER TABLE public.serverpod_method OWNER TO postgres;

--
-- Name: serverpod_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_method_id_seq OWNER TO postgres;

--
-- Name: serverpod_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_method_id_seq OWNED BY public.serverpod_method.id;


--
-- Name: serverpod_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_migrations (
    id bigint NOT NULL,
    module text NOT NULL,
    version text NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.serverpod_migrations OWNER TO postgres;

--
-- Name: serverpod_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_migrations_id_seq OWNER TO postgres;

--
-- Name: serverpod_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_migrations_id_seq OWNED BY public.serverpod_migrations.id;


--
-- Name: serverpod_query_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_query_log (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    query text NOT NULL,
    duration double precision NOT NULL,
    "numRows" bigint,
    error text,
    "stackTrace" text,
    slow boolean NOT NULL,
    "order" bigint NOT NULL
);


ALTER TABLE public.serverpod_query_log OWNER TO postgres;

--
-- Name: serverpod_query_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_query_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_query_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_query_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_query_log_id_seq OWNED BY public.serverpod_query_log.id;


--
-- Name: serverpod_readwrite_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_readwrite_test (
    id bigint NOT NULL,
    number bigint NOT NULL
);


ALTER TABLE public.serverpod_readwrite_test OWNER TO postgres;

--
-- Name: serverpod_readwrite_test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_readwrite_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_readwrite_test_id_seq OWNER TO postgres;

--
-- Name: serverpod_readwrite_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_readwrite_test_id_seq OWNED BY public.serverpod_readwrite_test.id;


--
-- Name: serverpod_runtime_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_runtime_settings (
    id bigint NOT NULL,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);


ALTER TABLE public.serverpod_runtime_settings OWNER TO postgres;

--
-- Name: serverpod_runtime_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_runtime_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_runtime_settings_id_seq OWNER TO postgres;

--
-- Name: serverpod_runtime_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_runtime_settings_id_seq OWNED BY public.serverpod_runtime_settings.id;


--
-- Name: serverpod_session_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_session_log (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    module text,
    endpoint text,
    method text,
    duration double precision,
    "numQueries" bigint,
    slow boolean,
    error text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    touched timestamp without time zone NOT NULL
);


ALTER TABLE public.serverpod_session_log OWNER TO postgres;

--
-- Name: serverpod_session_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_session_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_session_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_session_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_session_log_id_seq OWNED BY public.serverpod_session_log.id;


--
-- Name: gear id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear ALTER COLUMN id SET DEFAULT nextval('public.gear_id_seq'::regclass);


--
-- Name: gear_belts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_belts ALTER COLUMN id SET DEFAULT nextval('public.gear_belts_id_seq'::regclass);


--
-- Name: gear_clothes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_clothes ALTER COLUMN id SET DEFAULT nextval('public.gear_clothes_id_seq'::regclass);


--
-- Name: gear_floatbags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_floatbags ALTER COLUMN id SET DEFAULT nextval('public.gear_floatbags_id_seq'::regclass);


--
-- Name: gear_helmets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_helmets ALTER COLUMN id SET DEFAULT nextval('public.gear_helmets_id_seq'::regclass);


--
-- Name: gear_kayaks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_kayaks ALTER COLUMN id SET DEFAULT nextval('public.gear_kayaks_id_seq'::regclass);


--
-- Name: gear_paddles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_paddles ALTER COLUMN id SET DEFAULT nextval('public.gear_paddles_id_seq'::regclass);


--
-- Name: gear_pfds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_pfds ALTER COLUMN id SET DEFAULT nextval('public.gear_pfds_id_seq'::regclass);


--
-- Name: gear_spraydecks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_spraydecks ALTER COLUMN id SET DEFAULT nextval('public.gear_spraydecks_id_seq'::regclass);


--
-- Name: gear_throwbags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_throwbags ALTER COLUMN id SET DEFAULT nextval('public.gear_throwbags_id_seq'::regclass);


--
-- Name: serverpod_cloud_storage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage ALTER COLUMN id SET DEFAULT nextval('public.serverpod_cloud_storage_id_seq'::regclass);


--
-- Name: serverpod_cloud_storage_direct_upload id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage_direct_upload ALTER COLUMN id SET DEFAULT nextval('public.serverpod_cloud_storage_direct_upload_id_seq'::regclass);


--
-- Name: serverpod_future_call id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_future_call ALTER COLUMN id SET DEFAULT nextval('public.serverpod_future_call_id_seq'::regclass);


--
-- Name: serverpod_health_connection_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_connection_info ALTER COLUMN id SET DEFAULT nextval('public.serverpod_health_connection_info_id_seq'::regclass);


--
-- Name: serverpod_health_metric id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_metric ALTER COLUMN id SET DEFAULT nextval('public.serverpod_health_metric_id_seq'::regclass);


--
-- Name: serverpod_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_log_id_seq'::regclass);


--
-- Name: serverpod_message_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_message_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_message_log_id_seq'::regclass);


--
-- Name: serverpod_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_method ALTER COLUMN id SET DEFAULT nextval('public.serverpod_method_id_seq'::regclass);


--
-- Name: serverpod_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_migrations ALTER COLUMN id SET DEFAULT nextval('public.serverpod_migrations_id_seq'::regclass);


--
-- Name: serverpod_query_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_query_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_query_log_id_seq'::regclass);


--
-- Name: serverpod_readwrite_test id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_readwrite_test ALTER COLUMN id SET DEFAULT nextval('public.serverpod_readwrite_test_id_seq'::regclass);


--
-- Name: serverpod_runtime_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_runtime_settings ALTER COLUMN id SET DEFAULT nextval('public.serverpod_runtime_settings_id_seq'::regclass);


--
-- Name: serverpod_session_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_session_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_session_log_id_seq'::regclass);


--
-- Data for Name: gear; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear (id, "clubId", manufacturer, model, "friendlyName", "photoUrls") FROM stdin;
1	KK-1	Zet	Raptor	\N	\N
2	KK-2	Liquidlogic	Hoss	pomarańczowy	\N
3	KK-3	Pyranha	Inazone	rozmiar 240	\N
4	KK-4	Pyranha	Burn	2; L	\N
5	KK-5	Wave Sport	Habitat	rozmiar 74	\N
6	KK-6	\N	\N	Czerwony zabytek	\N
7	KK-7	Eskimo	Diablo	czerwony	\N
8	KK-8	Lettmann	\N	zielony	\N
9	KK-9	Eskimo	Diablo	czerwono-pomarańczowy	\N
10	KK-10	Eskimo	Diablo	żółto-pomarańczowy	\N
11	KK-11	Pyranha	Inazone	rozmiar 232	\N
12	KK-12	Necky	Gliss	7'11	\N
13	KK-13	Prjion	Delirious	\N	\N
14	KK-14	Prijon	Chopper	110447	\N
15	KK-15	Prijon	Huricane	Żółty (2738)	\N
16	KK-16	Waka	Tuna	\N	\N
17	KK-17	Prijon	Chopper	110431	\N
18	KK-18	Wave Sport	Big Ez	rozmiar 42	\N
19	KK-19	Pyranha	Micro Bat	Banan	\N
20	KK-20	Wave Sport	Diesel	rozmiar 75	\N
21	KK-21	Pyrahna	Burn	M	\N
22	KK-22	Dagger	Redline	\N	\N
23	KK-23	Dagger	Axiom	45086	\N
24	KK-24	\N	\N	Cieknie 2	\N
25	KK-25	Prjion	\N	Pomarańczowy (57347)	\N
26	KK-26	Prijon	Hurricane	Niebieski (5494)	\N
27	KK-27	Prjion	Invader	\N	\N
28	KK-28	Prijon	Tajfun	Marchewa	\N
29	KK-30	Liquidlogic	Stomper	80	\N
30	KK-31	Fluid	Solo	M	\N
31	KK-32	Liquidlogic	Skipp	\N	\N
32	KK-33	Pyranha	Jed	L	\N
33	KK-34	Pyranha	M3	\N	\N
34	KK-35	Wave Sport	Transformer	\N	\N
35	KK-36	Eskimo	Salto	\N	\N
36	KK-37	Dagger	Infrared	\N	\N
37	KK-38	\N	\N	Freestyle Carbon	\N
38	KK-39	Robson	Roadster	\N	\N
39	KK-40	Dagger	Juice	7.1	\N
40	KK-41	Wave Sport	Project	rozmiar 52	\N
41	KK-42	Železny	Igo	\N	\N
42	KK-43	Zet	Veloc	\N	\N
43	KK-44	Jackson	Antix 1.0	M	\N
44	KK-45	Jackson	Antix 1.0	L	\N
45	KK-47	Jackson	Antix 1.0	S	\N
46	KK-46	Dagger	GT	45481	\N
47	KK-48	Exo	Rexy	\N	\N
48	KK-49	Pyranha	Inazone	rozmiar 230	\N
49	KK-50	Pyrahna	Burn	niebieski (M)	\N
50	NULL_1	Liquidlogic	Hoss	żółty	\N
51	NULL_2	Pyrahna	H3	rozmiar 235	\N
52	KK-29	Prjion	Excursion	\N	\N
53	KN-1	Lettman	\N	Kanadyjka	\N
54	KN-2	\N	\N	Bazyli	\N
55	P-01	\N	Listek	\N	\N
56	P-02	\N	Listek	\N	\N
57	P-03	TNP	\N	\N	\N
58	P-04	TNP	\N	\N	\N
59	P-05	\N	Łopata	\N	\N
60	P-06	\N	\N	\N	\N
61	WK-01	TNP	\N	\N	\N
62	WK-02	Dr Kayak	\N	\N	\N
63	WK-03	Dr Kayak	\N	\N	\N
64	WK-04	Dr Kayak	\N	\N	\N
65	WK-05	Dr Kayak	\N	\N	\N
66	WK-06	Dr Kayak	\N	\N	\N
67	WK-07	Dr Kayak	\N	\N	\N
68	WK-08	Dr Kayak	\N	\N	\N
69	WK-09	Dr Kayak	\N	\N	\N
70	WK-10	Dr Kayak	\N	\N	\N
71	WK-11	TNP	Rapa	\N	\N
72	WK-12	TNP	Rapa	\N	\N
73	WK-13	TNP	Rapa	\N	\N
74	WK-14	Panda	\N	\N	\N
75	WK-15	TNP	Rapa	\N	\N
76	WK-16	Dr Kayak	\N	\N	\N
77	WK-17	TNP	\N	\N	\N
78	WK-18	Swat	Egalis	\N	\N
79	WK-19	Dr Kayak	Banan	\N	\N
80	WK-20	Dr Kayak	\N	\N	\N
81	WK-21	Dr Kayak	\N	\N	\N
82	WK-22	Dr Kayak	\N	\N	\N
83	WK-23	Dr Kayak	\N	\N	\N
84	WK-24	TNP	\N	\N	\N
85	WK-25	Dr Kayak	\N	\N	\N
86	WK-26	TNP	Rapa	\N	\N
87	WK-27	TNP	Rapa	\N	\N
88	WK-28	TNP	Rapa	\N	\N
89	WK-29	TNP	Rapa	\N	\N
90	WK-30	TNP	Rapa	\N	\N
91	WK-31	TNP	Rapa	\N	\N
92	WK-32	TNP	Rapa	\N	\N
93	WK-33	TNP	Rapa	\N	\N
94	WK-34	Schlegel	Duralen	\N	\N
95	WK-35	\N	\N	\N	\N
96	WK-36	\N	\N	\N	\N
97	WK-37	\N	\N	\N	\N
98	WK-38	Dr Kayak	Allaround	\N	\N
99	WK-39	TNP	Rapa	\N	\N
100	WD-01	Dr Kayak	\N	\N	\N
101	WD-02	Dr Kayak	\N	\N	\N
102	WD-03	Dr Kayak	\N	\N	\N
103	WD-04	TNP	\N	\N	\N
104	WD-05	Dr Kayak	\N	\N	\N
105	WD-06	\N	\N	\N	\N
106	WD-07	Dr Kayak	\N	\N	\N
107	WD-08	Dr Kayak	\N	\N	\N
108	WD-09	Dr Kayak	\N	\N	\N
109	WD-10	TNP	\N	\N	\N
110	WD-11	\N	\N	\N	\N
111	WD-12	Plastex	\N	\N	\N
112	WD-13	\N	\N	\N	\N
113	WD-14	\N	\N	\N	\N
114	WD-15	Schlegel	Tech III	\N	\N
115	WD-16	Ainsworth	ABS100 all round	\N	\N
116	WD-17	Ainsworth	ABS100 all round	\N	\N
117	WD-18	Ainsworth	ABS100 all round	\N	\N
118	WD-19	Ainsworth	ABS102 assy	\N	\N
119	WD-20	Ainsworth	ABS102 assy	\N	\N
120	WD-24	Swat	Egalis	\N	\N
121	FS-10	Samoróbka	Nizinny	\N	\N
122	FS-12	Samoróbka	Nizinny	\N	\N
123	FS-13	Samoróbka	Nizinny	\N	\N
124	FS-23	Samoróbka	Nizinny	\N	\N
125	FS-30	Samoróbka	Nizinny	\N	\N
126	KFD-01	Noname	Rock Big	\N	\N
127	KFD-02	Noname	Rock Big	\N	\N
128	KFD-03	Noname	Rock Big	\N	\N
129	KFD-04	Noname	Rock Big	\N	\N
130	KFD-05	Noname	Rock Big	\N	\N
131	KFD-06	Noname	Rock Big	\N	\N
132	KFD-07	Noname	Rock Big	\N	\N
133	KFD-08	Noname	Rock Big	\N	\N
134	KFD-09	Noname	Rock Big	\N	\N
135	KFD-10	Hiko	\N	\N	\N
136	KFD-11	Noname	Rock Big	\N	\N
137	KFD-12	Noname	Rock Big	\N	\N
138	KFD-13	Extreme	\N	\N	\N
139	KFD-14	HF	Silverback	\N	\N
140	KFD-15	StomRide	Simple	\N	\N
141	KFD-16	StomRide	Simple	\N	\N
142	KFD-17	StomRide	Escape	\N	\N
143	KFD-18	Palm	Sport	\N	\N
144	KFD-19	Palm	Sport	\N	\N
145	KFD-20	StormRide	Escape	\N	\N
146	KFD-21	Palm	Sport	\N	\N
147	KFD-22	Palm	Sport	\N	\N
148	KFD-23	Noname	Freestyle	\N	\N
149	KFD-24	PeakUK	Whitewater	\N	\N
150	KFD-25	PeakUK	Whitewater	\N	\N
151	KFD-26	PeakUK	Whitewater	\N	\N
152	KFD-27	PeakUK	Whitewater	\N	\N
153	KFD-28	StormRide	Escape	\N	\N
154	KFD-29	PeakUK	Whitewater	\N	\N
155	KFD-30	PeakUK	Whitewater	\N	\N
156	KFD-31	PeakUK	Standard	\N	\N
157	KFD-32	PeakUK	Standard	\N	\N
158	KFD-33	PeakUK	Standard	\N	\N
159	KFD-34	PeakUK	Standard	\N	\N
160	KFD-35	Noname	Rock Big	\N	\N
161	KFM-01	Noname	\N	\N	\N
162	KFM-02	Noname	\N	\N	\N
163	KFM-03	Noname	\N	\N	\N
164	KFM-04	Noname	\N	\N	\N
165	KFM-05	Noname	\N	\N	\N
166	KFM-06	Noname	\N	\N	\N
167	KFM-07	Noname	\N	\N	\N
168	KFM-08	Noname	\N	\N	\N
169	KFM-09	Noname	\N	\N	\N
170	KFM-10	Noname	\N	\N	\N
171	KFM-12	Noname	\N	\N	\N
172	KFM-13	Noname	\N	\N	\N
173	KFM-14	Noname	\N	\N	\N
174	KFM-15	BushSport	\N	\N	\N
175	KFM-16	Noname	\N	\N	\N
176	KFN-01	HikoSport	Nizinny	\N	\N
177	KFN-02	HikoSport	Nizinny	\N	\N
178	KFN-03	Palm	Nizinny	\N	\N
179	AK-03	RTM	euroclub	\N	\N
180	AK-04	RTM	euroclub	\N	\N
181	AK-05	CSR	\N	\N	\N
182	AK-06	RTM	euroclub	\N	\N
183	AK-07	RTM	euroclub	\N	\N
184	AK-08	RTM	euroclub	\N	\N
185	AK-09	RTM	euroclub	\N	\N
186	AK-10	RTM	euroclub	\N	\N
187	AK-11	RTM	euroclub	\N	\N
188	AK-12	RTM	euroclub	\N	\N
189	AK-13	RTM	euroclub	\N	\N
190	AK-14	Sportis	sailor	\N	\N
191	AK-15	Aquarius	\N	\N	\N
192	AK-16	Ratex	\N	\N	\N
193	AK-17	Ratex	\N	\N	\N
194	AK-18	RTM	euroclub	\N	\N
195	AK-19	RTM	\N	\N	\N
196	AK-20	RTM	euroclub	\N	\N
197	AK-21	RTM	euroclub	\N	\N
198	AK-22	Olimp	\N	\N	\N
199	AK-23	Olimp	\N	\N	\N
200	AK-24	Olimp	\N	\N	\N
201	AK-25	Olimp	\N	\N	\N
202	AK-26	Olimp	\N	\N	\N
203	AK-27	Olimp	\N	\N	\N
204	AK-30	Tribord	Secufit	\N	\N
205	AK-35	Aquarius	kv2	mOrL	\N
206	AK-36	Aquarius	kv2	\N	\N
207	AK-37	Aquarius	kv2	\N	\N
208	AK-38	Aquarius	kv2	\N	\N
209	AK-40	CSR	\N	\N	\N
210	AK-41	CSR	\N	\N	\N
211	AK-42	CSR	\N	\N	\N
212	AK-43	CSR	\N	\N	\N
213	AK-44	CSR	\N	\N	\N
214	AK-45	CSR	\N	\N	\N
215	AK-46	CSR	\N	\N	\N
216	AK-47	CSR	\N	\N	\N
217	AK-48	Sportis	\N	LGBT	\N
218	AK-50	Sportis	\N	LGBT	\N
219	AK-51	Aquarius	\N	\N	\N
220	AK-28	Hiko	NR	\N	\N
221	AK-29	Hiko	NR	\N	\N
222	AK-31	NRS	Zen	\N	\N
223	AK-32	YAK	Escape	\N	\N
224	AK-34	Astral	Greenjacket	\N	\N
225	AK-39	Hiko	NR	\N	\N
226	AK-52	Hiko	Cinch	\N	\N
227	AK-53	Hiko	Cinch	\N	\N
228	AK-54	Palm	FX	czerwona	\N
229	AK-55	Palm	FX	niebieska	\N
230	AK-56	Palm	FX	niebieska	\N
231	AK-57	Palm	FX	niebieska	\N
232	AK-58	Hiko	Cinch	\N	\N
233	AK-59	Hiko	Cinch	\N	\N
234	AK-33	Palm	Alpha	\N	\N
235	AK-49	Mustard	\N	\N	\N
236	KS-01	Ruk	Rapid	\N	\N
237	KS-02	Hiko	Buckar00	\N	\N
238	KS-03	Hiko	Buckar00	\N	\N
239	KS-04	Prijon	Surf	\N	\N
240	KS-05	Shred Ready	Standard Fullcat	\N	\N
241	KS-06	Protec	Ace	\N	\N
242	KS-07	Hiko	Vibe	\N	\N
243	KS-08	Hiko	Vibe	\N	\N
244	KS-09	Sweet Protection	Rocker	\N	\N
245	KS-10	Shred Ready	Standard Fullcat	\N	\N
246	KS-11	Sweet Protection	Wanderer II	\N	\N
247	KS-12	WRSI	Current	\N	\N
248	KS-13	Hiko	Buckar00	\N	\N
249	KS-14	Hiko	Vibe	\N	\N
250	KS-15	Hiko	Buckar00	\N	\N
251	KS-16	Hiko	Vibe	\N	\N
252	KS-17	Palm	ap2000	\N	\N
253	KS-18	Palm	ap2000	\N	\N
254	KS-19	Palm	ap2000	\N	\N
255	KS-20	Palm	ap2000	\N	\N
256	KS-21	Protec	Ace	\N	\N
257	KS-22	Palm	ap2000	\N	\N
258	KS-23	Descent	\N	\N	\N
259	KS-24	Protec	Ace	\N	\N
260	KS-25	Wild-water	MIDI	\N	\N
261	KS-26	Prijon	Surf	\N	\N
262	R-1	hf	compact	\N	\N
263	R-2	hf	compact	\N	\N
264	R-3	hf	compact	\N	\N
265	R-4	hf	compact	\N	\N
266	R-5	hf	compact	\N	\N
267	R-6	YAK	\N	z rdzeniem	\N
268	R-7	hf	compact	\N	\N
269	R-8	hf	Weasel	\N	\N
270	R-9	hf	Weasel	\N	\N
271	R-10	hf	Weasel	\N	\N
272	R-11	hf	Weasel	\N	\N
273	OP-1	ProRace	\N	\N	\N
274	OP-2	Olaian/Decathlon	100	\N	\N
275	OP-3	ProRace	\N	\N	\N
276	OP-4	Tribord	SK500	\N	\N
277	OP-5	SA	\N	\N	\N
278	OP-6	ProRace	\N	\N	\N
279	OP-7	Olaian/Decathlon	100	\N	\N
280	OP-8	ProRace	\N	\N	\N
281	OP-9	ProRace	\N	\N	\N
282	OP-10	Tribord	\N	\N	\N
283	OP-11	Hiko	\N	\N	\N
284	OP-12	ProRace	\N	\N	\N
285	OP-13	ProRace	\N	\N	\N
286	O-1	Tribord	\N	\N	\N
287	OK-1	Hiko	\N	\N	\N
288	OK-2	Tribord	SK500	\N	\N
289	OK-3	Yak	Rapid Cag	\N	\N
290	OK-4	Hiko	\N	\N	\N
291	PS-01	\N	\N	Czerwony, zacisk	\N
292	PS-02	\N	\N	Czerwony, zacisk	\N
293	PS-03	\N	\N	Czerwony, zacisk	\N
294	PS-04	\N	\N	Żółty, zacisk	\N
295	PS-05	\N	\N	Niebieski, zacisk	\N
296	PS-06	\N	\N	Niebieski, ratchet	\N
297	PS-07	\N	\N	Niebieski, ratchet	\N
298	PS-08	\N	\N	Niebieski, zacisk	\N
299	PS-09	\N	\N	Żółty, zacisk, duży	\N
300	PS-10	\N	\N	Niebieski, zacisk	\N
301	PS-11	\N	\N	Niebieski, zacisk	\N
302	PS-12	\N	\N	Żółty, 2 częściowy, ratchet	\N
303	PS-13	\N	\N	Czarny, kajakowo, zacisk	\N
304	PS-14	\N	\N	Czarny, kajakowo, zacisk	\N
305	PS-15	\N	\N	Czarny, zacisk, duży	\N
306	KW-01	Pyranha	\N	Tylna	\N
307	KW-02	PeakUK	\N	Tylna	\N
308	KW-03	Prijon	\N	Tylna	\N
309	KW-04	WaterElement	\N	Tylna	\N
310	KW-05	WaterElement	\N	Tylna	\N
311	KW-06	WaterElement	\N	Tylna	\N
312	KW-07	Prijon	\N	Tylna	\N
313	KW-08	Hiko	\N	Tylna	\N
314	KW-09	Hiko	\N	Tylna	\N
315	KW-10	\N	Ponton	Przednia	\N
316	KW-11	Pyranha	\N	Tylna	\N
317	KW-12	Prijon	\N	Przednia	\N
318	KW-13	Hiko	\N	Tylna	\N
319	KW-14	Hiko	\N	Tylna	\N
320	KW-15	PeakUK	STERN	Tylna	\N
321	KW-16	PeakUK	STERN	Tylna	\N
322	KW-17	PeakUK	STERN	Tylna	\N
323	KW-18	PeakUK	STERN	Tylna	\N
324	KW-19	PeakUK	STERN	Tylna	\N
325	KW-20	PeakUK	STERN	Tylna	\N
326	KW-21	PeakUK	STERN	Tylna	\N
327	KW-22	WaterElement	\N	Tylna	\N
328	KW-23	PeakUK	STERN	Tylna	\N
329	KW-24	PeakUK	STERN	Tylna	\N
330	KW-25	PeakUK	STERN	Tylna	\N
331	KW-26	PeakUK	STERN	Tylna	\N
332	KW-27	Vodak sport	\N	Tylna	\N
333	KW-28	Zölzer	\N	Tylna	\N
334	KW-29	\N	\N	Tylna	\N
\.


--
-- Data for Name: gear_belts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_belts (id, "gearId", length) FROM stdin;
1	291	4.5
2	292	4.5
3	293	5
4	294	4.5
5	295	4
6	296	2.3
7	297	3
8	298	3.5
9	299	4
10	300	2.5
11	301	1.7
12	302	5.3
13	303	3
14	304	3
15	305	4.5
\.


--
-- Data for Name: gear_clothes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_clothes (id, "gearId", size, type, "typeDescription") FROM stdin;
1	273	l	neopreneFoam	Long
2	274	xl	neopreneFoam	Short
3	275	xl	neopreneFoam	Long
4	276	s	neopreneFoam	Longjohn
5	277	kidsXl	neopreneFoam	Short
6	278	m	neopreneFoam	Long
7	279	xl	neopreneFoam	Short
8	280	s	neopreneFoam	Long
9	281	l	neopreneFoam	Long
10	282	l	neopreneFoam	Longjohn
11	283	l	neopreneFoam	Longjohn
12	284	xl	neopreneFoam	Long
13	285	s	neopreneFoam	Long
14	286	m	neopreneFoam	Koszulka
15	287	xl	jacket	Sucha przynajmniej kiedyś
16	288	xs	jacket	Żeglarska
17	289	l	jacket	Pół sucha
18	290	l	jacket	Sucha
\.


--
-- Data for Name: gear_floatbags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_floatbags (id, "gearId", volume) FROM stdin;
1	306	\N
2	307	\N
3	308	\N
4	309	\N
5	310	\N
6	311	\N
7	312	\N
8	313	\N
9	314	\N
10	315	\N
11	316	\N
12	317	\N
13	318	\N
14	319	\N
15	320	\N
16	321	\N
17	322	\N
18	323	\N
19	324	\N
20	325	\N
21	326	\N
22	327	\N
23	328	\N
24	329	\N
25	330	\N
26	331	\N
27	332	\N
28	333	\N
29	334	\N
\.


--
-- Data for Name: gear_helmets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_helmets (id, "gearId", size) FROM stdin;
1	236	s
2	237	lOrXl
3	238	sOrM
4	239	sOrM
5	240	m
6	241	m
7	242	mOrL
8	243	mOrL
9	244	mOrL
10	245	l
11	246	l
12	247	sOrM
13	248	sOrM
14	249	mOrL
15	250	lOrXl
16	251	mOrL
17	252	mOrL
18	253	mOrL
19	254	mOrL
20	255	mOrL
21	256	sOrM
22	257	mOrL
23	258	lOrXl
24	259	m
25	260	m
26	261	mOrL
\.


--
-- Data for Name: gear_kayaks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_kayaks (id, "gearId", type, "minWeight", "maxWeight", length) FROM stdin;
1	1	creek	65	105	257
2	2	riverRunner	60	109	235
3	3	fullSlice	85	120	243
4	4	creek	75	127	252
5	5	creek	68	118	245
6	6	zwalkowy	\N	\N	319
7	7	zwalkowy	\N	100	280
8	8	zwalkowy	\N	\N	323
9	9	zwalkowy	\N	100	280
10	10	zwalkowy	\N	100	280
11	11	fullSlice	65	95	234
12	12	halfSlice	70	95	239
13	13	playboat	\N	\N	232
14	14	zwalkowy	\N	\N	294
15	15	zwalkowy	\N	80	266
16	16	creek	65	110	260
17	17	zwalkowy	\N	\N	294
18	18	playboat	50	110	219
19	19	creek	45	80	236
20	20	riverRunner	68	113	259
21	21	creek	55	105	244
22	22	halfSlice	65	100	261
23	23	halfSlice	30	50	207
24	24	zwalkowy	\N	\N	298
25	25	zwalkowy	\N	\N	295
26	26	zwalkowy	\N	80	310
27	27	zwalkowy	50	90	334
28	28	zwalkowy	50	130	390
29	29	creek	50	95	249
30	30	creek	55	110	234
31	31	playboat	50	72	197
32	32	playboat	80	110	187
33	33	creek	70	105	243
34	34	playboat	54	73	181
35	35	creek	\N	\N	243
36	36	fullSlice	45	75	256
37	37	playboat	\N	\N	187
38	38	playboat	\N	\N	243
39	39	riverRunner	77	109	210
40	40	playboat	63	86	196
41	41	playboat	\N	\N	179
42	42	creek	45	70	247
43	43	halfSlice	60	85	234
44	44	halfSlice	75	115	246
45	45	halfSlice	35	65	224
46	46	riverRunner	40	80	239
47	47	halfSlice	65	100	258
48	48	fullSlice	70	105	230
49	49	creek	55	105	244
50	50	riverRunner	60	109	214
51	51	creek	45	95	230
52	52	dwuOsobowy	70	110	517
53	53	kanadyjka	\N	\N	470
54	54	kanadyjka	\N	\N	518
\.


--
-- Data for Name: gear_paddles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_paddles (id, "gearId", type, length, rotation) FROM stdin;
1	55	pagaj	150	0
2	56	pagaj	160	0
3	57	zwalkowe	155	0
4	58	zwalkowe	155	0
5	59	pagaj	155	0
6	60	pagaj	140	0
7	61	zwalkowe	190	60
8	62	zwalkowe	195	60
9	63	zwalkowe	195	60
10	64	zwalkowe	185	60
11	65	zwalkowe	195	60
12	66	zwalkowe	195	60
13	67	zwalkowe	195	60
14	68	zwalkowe	195	60
15	69	zwalkowe	195	60
16	70	zwalkowe	195	60
17	71	gorskie	195	30
18	72	gorskie	192.5	45
19	73	gorskie	190	60
20	74	gorskie	195	60
21	75	gorskie	195	45
22	76	zwalkowe	195	0
23	77	zwalkowe	190	45
24	78	gorskie	200	60
25	79	zwalkowe	195	60
26	80	zwalkowe	190	30
27	81	zwalkowe	205	60
28	82	zwalkowe	195	60
29	83	zwalkowe	195	60
30	84	zwalkowe	200	60
31	85	zwalkowe	195	60
32	86	gorskie	197.5	45
33	87	gorskie	195	45
34	88	gorskie	198	20
35	89	gorskie	191.5	60
36	90	nizinne	187	0
37	91	gorskie	192.5	45
38	92	nizinne	179	0
39	93	gorskie	195	60
40	94	gorskie	192	60
41	95	nizinne	197	60
42	96	nizinne	197	-45
43	97	nizinne	203	90
44	98	zwalkowe	195	60
45	99	gorskie	195	30
46	100	zwalkowe	210	60
47	101	zwalkowe	215	60
48	102	zwalkowe	225	60
49	103	zwalkowe	240	60
50	104	zwalkowe	220	60
51	105	gorskie	220	60
52	106	zwalkowe	225	60
53	107	zwalkowe	225	60
54	108	zwalkowe	215	0
55	109	zwalkowe	210	90
56	110	zwalkowe	210	90
57	111	gorskie	220	90
58	112	nizinne	208	60
59	113	nizinne	208	60
60	114	gorskie	208	90
61	115	nizinne	220	60
62	116	nizinne	220	60
63	117	nizinne	220	60
64	118	nizinne	225	60
65	119	nizinne	225	60
66	120	gorskie	220	-60
\.


--
-- Data for Name: gear_pfds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_pfds (id, "gearId", size, type) FROM stdin;
1	179	xl	nizinna
2	180	xl	nizinna
3	181	sOrM	nizinna
4	182	xxl	nizinna
5	183	xxl	nizinna
6	184	m	nizinna
7	185	m	nizinna
8	186	m	nizinna
9	187	l	nizinna
10	188	m	nizinna
11	189	m	nizinna
12	190	xl	nizinna
13	191	xs	nizinna
14	192	m	nizinna
15	193	mOrL	nizinna
16	194	m	nizinna
17	195	l	nizinna
18	196	l	nizinna
19	197	xl	nizinna
20	198	l	nizinna
21	199	xxl	nizinna
22	200	l	nizinna
23	201	xl	nizinna
24	202	xxl	nizinna
25	203	l	nizinna
26	204	xl	nizinna
27	205	mOrL	nizinna
28	206	xl	nizinna
29	207	m	nizinna
30	208	m	nizinna
31	209	xxl	nizinna
32	210	xxl	nizinna
33	211	xl	nizinna
34	212	xl	nizinna
35	213	xl	nizinna
36	214	xl	nizinna
37	215	mOrL	nizinna
38	216	mOrL	nizinna
39	217	m	nizinna
40	218	l	nizinna
41	219	xl	nizinna
42	220	xl	gorska
43	221	lOrXl	gorska
44	222	lOrXl	gorska
45	223	m	gorska
46	224	mOrL	gorska
47	225	lOrXl	gorska
48	226	lOrXl	gorska
49	227	sOrM	gorska
50	228	mOrL	gorska
51	229	xsOrS	gorska
52	230	mOrL	gorska
53	231	mOrL	gorska
54	232	sOrM	gorska
55	233	lOrXl	gorska
56	234	mOrL	freestyle
57	235	l	nizinna
\.


--
-- Data for Name: gear_spraydecks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_spraydecks (id, "gearId", "deckSize", "waistSize") FROM stdin;
1	121	small	m
2	122	small	m
3	123	small	m
4	124	small	m
5	125	small	m
6	126	big	m
7	127	big	l
8	128	big	xs
9	129	big	l
10	130	big	s
11	131	big	s
12	132	big	xl
13	133	big	m
14	134	big	sOrM
15	135	big	m
16	136	big	l
17	137	big	m
18	138	big	xsOrS
19	139	big	l
20	140	big	xl
21	141	big	l
22	142	big	m
23	143	big	xl
24	144	big	xs
25	145	big	m
26	146	big	xs
27	147	big	mOrL
28	148	big	l
29	149	big	s
30	150	big	s
31	151	big	mOrL
32	152	big	mOrL
33	153	big	xsOrS
34	154	big	mOrL
35	155	big	s
36	156	big	s
37	157	big	s
38	158	huge	s
39	159	big	xs
40	160	big	l
41	161	small	xs
42	162	small	m
43	163	small	s
44	164	small	s
45	165	small	s
46	166	small	s
47	167	small	s
48	168	small	s
49	169	small	s
50	170	small	m
51	171	small	m
52	172	small	xl
53	173	small	m
54	174	small	m
55	175	small	m
56	176	big	m
57	177	big	m
58	178	small	m
\.


--
-- Data for Name: gear_throwbags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear_throwbags (id, "gearId", length) FROM stdin;
1	262	20
2	263	20
3	264	20
4	265	20
5	266	20
6	267	20
7	268	20
8	269	18
9	270	18
10	271	18
11	272	18
\.


--
-- Data for Name: serverpod_cloud_storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_cloud_storage (id, "storageId", path, "addedTime", expiration, "byteData", verified) FROM stdin;
\.


--
-- Data for Name: serverpod_cloud_storage_direct_upload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_cloud_storage_direct_upload (id, "storageId", path, expiration, "authKey") FROM stdin;
\.


--
-- Data for Name: serverpod_future_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_future_call (id, name, "time", "serializedObject", "serverId", identifier) FROM stdin;
\.


--
-- Data for Name: serverpod_health_connection_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_health_connection_info (id, "serverId", "timestamp", active, closing, idle, granularity) FROM stdin;
1	default	2025-09-03 12:07:00	0	0	0	1
2	default	2025-09-03 12:08:00	0	0	0	1
3	default	2025-09-03 12:10:00	0	0	0	1
\.


--
-- Data for Name: serverpod_health_metric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_health_metric (id, name, "serverId", "timestamp", "isHealthy", value, granularity) FROM stdin;
1	serverpod_database	default	2025-09-03 12:07:00	t	0.003863	1
2	serverpod_cpu	default	2025-09-03 12:07:00	t	0.06524658203125	1
3	serverpod_memory	default	2025-09-03 12:07:00	t	0.5086037516593933	1
4	serverpod_database	default	2025-09-03 12:08:00	t	0.002662	1
5	serverpod_cpu	default	2025-09-03 12:08:00	t	0.0843505859375	1
6	serverpod_memory	default	2025-09-03 12:08:00	t	0.5195396542549133	1
7	serverpod_database	default	2025-09-03 12:10:00	t	0.003033	1
8	serverpod_cpu	default	2025-09-03 12:10:00	t	0.1124267578125	1
9	serverpod_memory	default	2025-09-03 12:10:00	t	0.5389905571937561	1
\.


--
-- Data for Name: serverpod_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_log (id, "sessionLogId", "messageId", reference, "serverId", "time", "logLevel", message, error, "stackTrace", "order") FROM stdin;
\.


--
-- Data for Name: serverpod_message_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_message_log (id, "sessionLogId", "serverId", "messageId", endpoint, "messageName", duration, error, "stackTrace", slow, "order") FROM stdin;
\.


--
-- Data for Name: serverpod_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_method (id, endpoint, method) FROM stdin;
\.


--
-- Data for Name: serverpod_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_migrations (id, module, version, "timestamp") FROM stdin;
1	przewrotkapp	20250903120627474	2025-09-03 12:07:01.306864
2	serverpod	20240516151843329	2025-09-03 12:07:01.306864
\.


--
-- Data for Name: serverpod_query_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_query_log (id, "serverId", "sessionLogId", "messageId", query, duration, "numRows", error, "stackTrace", slow, "order") FROM stdin;
\.


--
-- Data for Name: serverpod_readwrite_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_readwrite_test (id, number) FROM stdin;
\.


--
-- Data for Name: serverpod_runtime_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_runtime_settings (id, "logSettings", "logSettingsOverrides", "logServiceCalls", "logMalformedCalls") FROM stdin;
1	{"logLevel":1,"logAllSessions":true,"logAllQueries":false,"logSlowSessions":true,"logStreamingSessionsContinuously":true,"logSlowQueries":true,"logFailedSessions":true,"logFailedQueries":true,"slowSessionDuration":1.0,"slowQueryDuration":1.0}	[]	f	f
\.


--
-- Data for Name: serverpod_session_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_session_log (id, "serverId", "time", module, endpoint, method, duration, "numQueries", slow, error, "stackTrace", "authenticatedUserId", "isOpen", touched) FROM stdin;
\.


--
-- Name: gear_belts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_belts_id_seq', 15, true);


--
-- Name: gear_clothes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_clothes_id_seq', 18, true);


--
-- Name: gear_floatbags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_floatbags_id_seq', 29, true);


--
-- Name: gear_helmets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_helmets_id_seq', 26, true);


--
-- Name: gear_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_id_seq', 334, true);


--
-- Name: gear_kayaks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_kayaks_id_seq', 54, true);


--
-- Name: gear_paddles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_paddles_id_seq', 66, true);


--
-- Name: gear_pfds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_pfds_id_seq', 57, true);


--
-- Name: gear_spraydecks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_spraydecks_id_seq', 58, true);


--
-- Name: gear_throwbags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_throwbags_id_seq', 11, true);


--
-- Name: serverpod_cloud_storage_direct_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_cloud_storage_direct_upload_id_seq', 1, false);


--
-- Name: serverpod_cloud_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_cloud_storage_id_seq', 1, false);


--
-- Name: serverpod_future_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_future_call_id_seq', 1, false);


--
-- Name: serverpod_health_connection_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_health_connection_info_id_seq', 3, true);


--
-- Name: serverpod_health_metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_health_metric_id_seq', 9, true);


--
-- Name: serverpod_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_log_id_seq', 1, false);


--
-- Name: serverpod_message_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_message_log_id_seq', 1, false);


--
-- Name: serverpod_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_method_id_seq', 1, false);


--
-- Name: serverpod_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_migrations_id_seq', 2, true);


--
-- Name: serverpod_query_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_query_log_id_seq', 1, false);


--
-- Name: serverpod_readwrite_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_readwrite_test_id_seq', 1, false);


--
-- Name: serverpod_runtime_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_runtime_settings_id_seq', 1, true);


--
-- Name: serverpod_session_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_session_log_id_seq', 1, false);


--
-- Name: gear_belts gear_belts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_belts
    ADD CONSTRAINT gear_belts_pkey PRIMARY KEY (id);


--
-- Name: gear_clothes gear_clothes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_clothes
    ADD CONSTRAINT gear_clothes_pkey PRIMARY KEY (id);


--
-- Name: gear_floatbags gear_floatbags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_floatbags
    ADD CONSTRAINT gear_floatbags_pkey PRIMARY KEY (id);


--
-- Name: gear_helmets gear_helmets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_helmets
    ADD CONSTRAINT gear_helmets_pkey PRIMARY KEY (id);


--
-- Name: gear_kayaks gear_kayaks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_kayaks
    ADD CONSTRAINT gear_kayaks_pkey PRIMARY KEY (id);


--
-- Name: gear_paddles gear_paddles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_paddles
    ADD CONSTRAINT gear_paddles_pkey PRIMARY KEY (id);


--
-- Name: gear_pfds gear_pfds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_pfds
    ADD CONSTRAINT gear_pfds_pkey PRIMARY KEY (id);


--
-- Name: gear gear_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear
    ADD CONSTRAINT gear_pkey PRIMARY KEY (id);


--
-- Name: gear_spraydecks gear_spraydecks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_spraydecks
    ADD CONSTRAINT gear_spraydecks_pkey PRIMARY KEY (id);


--
-- Name: gear_throwbags gear_throwbags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_throwbags
    ADD CONSTRAINT gear_throwbags_pkey PRIMARY KEY (id);


--
-- Name: serverpod_cloud_storage_direct_upload serverpod_cloud_storage_direct_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage_direct_upload
    ADD CONSTRAINT serverpod_cloud_storage_direct_upload_pkey PRIMARY KEY (id);


--
-- Name: serverpod_cloud_storage serverpod_cloud_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage
    ADD CONSTRAINT serverpod_cloud_storage_pkey PRIMARY KEY (id);


--
-- Name: serverpod_future_call serverpod_future_call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_future_call
    ADD CONSTRAINT serverpod_future_call_pkey PRIMARY KEY (id);


--
-- Name: serverpod_health_connection_info serverpod_health_connection_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_connection_info
    ADD CONSTRAINT serverpod_health_connection_info_pkey PRIMARY KEY (id);


--
-- Name: serverpod_health_metric serverpod_health_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_metric
    ADD CONSTRAINT serverpod_health_metric_pkey PRIMARY KEY (id);


--
-- Name: serverpod_log serverpod_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_log
    ADD CONSTRAINT serverpod_log_pkey PRIMARY KEY (id);


--
-- Name: serverpod_message_log serverpod_message_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_message_log
    ADD CONSTRAINT serverpod_message_log_pkey PRIMARY KEY (id);


--
-- Name: serverpod_method serverpod_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_method
    ADD CONSTRAINT serverpod_method_pkey PRIMARY KEY (id);


--
-- Name: serverpod_migrations serverpod_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_migrations
    ADD CONSTRAINT serverpod_migrations_pkey PRIMARY KEY (id);


--
-- Name: serverpod_query_log serverpod_query_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_query_log
    ADD CONSTRAINT serverpod_query_log_pkey PRIMARY KEY (id);


--
-- Name: serverpod_readwrite_test serverpod_readwrite_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_readwrite_test
    ADD CONSTRAINT serverpod_readwrite_test_pkey PRIMARY KEY (id);


--
-- Name: serverpod_runtime_settings serverpod_runtime_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_runtime_settings
    ADD CONSTRAINT serverpod_runtime_settings_pkey PRIMARY KEY (id);


--
-- Name: serverpod_session_log serverpod_session_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_session_log
    ADD CONSTRAINT serverpod_session_log_pkey PRIMARY KEY (id);


--
-- Name: belts_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX belts_gear_unique_idx ON public.gear_belts USING btree ("gearId");


--
-- Name: clothes_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clothes_gear_unique_idx ON public.gear_clothes USING btree ("gearId");


--
-- Name: floatbags_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX floatbags_gear_unique_idx ON public.gear_floatbags USING btree ("gearId");


--
-- Name: gear_club_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gear_club_id_idx ON public.gear USING btree ("clubId");


--
-- Name: helmets_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX helmets_gear_unique_idx ON public.gear_helmets USING btree ("gearId");


--
-- Name: kayaks_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX kayaks_gear_unique_idx ON public.gear_kayaks USING btree ("gearId");


--
-- Name: paddles_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX paddles_gear_unique_idx ON public.gear_paddles USING btree ("gearId");


--
-- Name: pfds_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pfds_gear_unique_idx ON public.gear_pfds USING btree ("gearId");


--
-- Name: serverpod_cloud_storage_direct_upload_storage_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_cloud_storage_direct_upload_storage_path ON public.serverpod_cloud_storage_direct_upload USING btree ("storageId", path);


--
-- Name: serverpod_cloud_storage_expiration; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_cloud_storage_expiration ON public.serverpod_cloud_storage USING btree (expiration);


--
-- Name: serverpod_cloud_storage_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_cloud_storage_path_idx ON public.serverpod_cloud_storage USING btree ("storageId", path);


--
-- Name: serverpod_future_call_identifier_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_future_call_identifier_idx ON public.serverpod_future_call USING btree (identifier);


--
-- Name: serverpod_future_call_serverId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "serverpod_future_call_serverId_idx" ON public.serverpod_future_call USING btree ("serverId");


--
-- Name: serverpod_future_call_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_future_call_time_idx ON public.serverpod_future_call USING btree ("time");


--
-- Name: serverpod_health_connection_info_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_health_connection_info_timestamp_idx ON public.serverpod_health_connection_info USING btree ("timestamp", "serverId", granularity);


--
-- Name: serverpod_health_metric_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_health_metric_timestamp_idx ON public.serverpod_health_metric USING btree ("timestamp", "serverId", name, granularity);


--
-- Name: serverpod_log_sessionLogId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "serverpod_log_sessionLogId_idx" ON public.serverpod_log USING btree ("sessionLogId");


--
-- Name: serverpod_method_endpoint_method_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_method_endpoint_method_idx ON public.serverpod_method USING btree (endpoint, method);


--
-- Name: serverpod_migrations_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_migrations_ids ON public.serverpod_migrations USING btree (module);


--
-- Name: serverpod_query_log_sessionLogId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON public.serverpod_query_log USING btree ("sessionLogId");


--
-- Name: serverpod_session_log_isopen_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_session_log_isopen_idx ON public.serverpod_session_log USING btree ("isOpen");


--
-- Name: serverpod_session_log_serverid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_session_log_serverid_idx ON public.serverpod_session_log USING btree ("serverId");


--
-- Name: serverpod_session_log_touched_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_session_log_touched_idx ON public.serverpod_session_log USING btree (touched);


--
-- Name: spraydecks_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX spraydecks_gear_unique_idx ON public.gear_spraydecks USING btree ("gearId");


--
-- Name: throwbags_gear_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX throwbags_gear_unique_idx ON public.gear_throwbags USING btree ("gearId");


--
-- Name: gear_belts gear_belts_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_belts
    ADD CONSTRAINT gear_belts_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_clothes gear_clothes_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_clothes
    ADD CONSTRAINT gear_clothes_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_floatbags gear_floatbags_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_floatbags
    ADD CONSTRAINT gear_floatbags_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_helmets gear_helmets_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_helmets
    ADD CONSTRAINT gear_helmets_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_kayaks gear_kayaks_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_kayaks
    ADD CONSTRAINT gear_kayaks_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_paddles gear_paddles_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_paddles
    ADD CONSTRAINT gear_paddles_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_pfds gear_pfds_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_pfds
    ADD CONSTRAINT gear_pfds_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_spraydecks gear_spraydecks_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_spraydecks
    ADD CONSTRAINT gear_spraydecks_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: gear_throwbags gear_throwbags_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear_throwbags
    ADD CONSTRAINT gear_throwbags_fk_0 FOREIGN KEY ("gearId") REFERENCES public.gear(id) ON DELETE CASCADE;


--
-- Name: serverpod_log serverpod_log_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_log
    ADD CONSTRAINT serverpod_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;


--
-- Name: serverpod_message_log serverpod_message_log_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_message_log
    ADD CONSTRAINT serverpod_message_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;


--
-- Name: serverpod_query_log serverpod_query_log_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_query_log
    ADD CONSTRAINT serverpod_query_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

