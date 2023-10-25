--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: cites; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cites (
    id integer NOT NULL,
    index integer NOT NULL,
    text text NOT NULL,
    author character varying(255) DEFAULT NULL::character varying NOT NULL,
    author_url character varying(255) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public.cites OWNER TO admin;

--
-- Name: cites_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cites_id_seq OWNER TO admin;

--
-- Name: cites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cites_id_seq OWNED BY public.cites.id;


--
-- Name: dict_introduction; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dict_introduction (
    id integer NOT NULL,
    title character varying(255) DEFAULT NULL::character varying NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.dict_introduction OWNER TO admin;

--
-- Name: dict_introduction_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dict_introduction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dict_introduction_id_seq OWNER TO admin;

--
-- Name: dict_introduction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dict_introduction_id_seq OWNED BY public.dict_introduction.id;


--
-- Name: dictionaries; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dictionaries (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying NOT NULL,
    index integer NOT NULL,
    description text NOT NULL,
    zip uuid,
    cover uuid,
    abbreviation character varying(255) DEFAULT NULL::character varying,
    info_url character varying(255) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public.dictionaries OWNER TO admin;

--
-- Name: dictionaries_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dictionaries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dictionaries_id_seq OWNER TO admin;

--
-- Name: dictionaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dictionaries_id_seq OWNED BY public.dictionaries.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO admin;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO admin;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255)
);


ALTER TABLE public.directus_collections OWNER TO admin;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO admin;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO admin;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO admin;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO admin;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO admin;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO admin;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO admin;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO admin;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO admin;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO admin;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO admin;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO admin;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO admin;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO admin;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO admin;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO admin;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO admin;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO admin;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO admin;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO admin;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO admin;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json
);


ALTER TABLE public.directus_settings OWNER TO admin;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO admin;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO admin;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO admin;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);


ALTER TABLE public.directus_users OWNER TO admin;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO admin;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO admin;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: modules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.modules (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying NOT NULL,
    index integer NOT NULL,
    description text,
    route character varying(255) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public.modules OWNER TO admin;

--
-- Name: modules_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modules_id_seq OWNER TO admin;

--
-- Name: modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;


--
-- Name: tipitaka; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tipitaka (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying NOT NULL,
    info_url character varying(255),
    cover uuid NOT NULL,
    zip uuid NOT NULL,
    index integer NOT NULL
);


ALTER TABLE public.tipitaka OWNER TO admin;

--
-- Name: tipitaka_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tipitaka_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipitaka_id_seq OWNER TO admin;

--
-- Name: tipitaka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tipitaka_id_seq OWNED BY public.tipitaka.id;


--
-- Name: cites id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cites ALTER COLUMN id SET DEFAULT nextval('public.cites_id_seq'::regclass);


--
-- Name: dict_introduction id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dict_introduction ALTER COLUMN id SET DEFAULT nextval('public.dict_introduction_id_seq'::regclass);


--
-- Name: dictionaries id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dictionaries ALTER COLUMN id SET DEFAULT nextval('public.dictionaries_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: modules id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);


--
-- Name: tipitaka id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipitaka ALTER COLUMN id SET DEFAULT nextval('public.tipitaka_id_seq'::regclass);


--
-- Data for Name: cites; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cites (id, index, text, author, author_url) FROM stdin;
2	1	It was necessary for a monk to spend time to learn the language of Pāli. The Suttas are written in Pāli and, in order to avoid being misled by imperfect translations, it is better to read them in their original language. One could feel much closer to the Buddha if one reads his discourses in Pāli – “one could almost hear the Buddha’s voice.” Pāli has a deep connection with the ancient world of dhamma.	BHANTE ÑĀṆADĪPA	https://pathpress.org/the-island-within/
1	2	These books of the Pali Canon correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\n	BHANTE ÑĀṆAVĪRA	https://www.nanavira.org/
\.


--
-- Data for Name: dict_introduction; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dict_introduction (id, title, text) FROM stdin;
1	Pali Dictionary	The following dictionaries can meet the needs of learning Pali. Inparticular, the comprehensive dictionary <strong>Digital Pali Dictionary</strong>, which has a large thesaurus and detailed explanations, is a must-have. Other dictionaries are provided as supplements for people with specific needs.
\.


--
-- Data for Name: dictionaries; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dictionaries (id, name, index, description, zip, cover, abbreviation, info_url) FROM stdin;
2	The Pali Text Society's Pali-English Dictionary	2	This work has been selected by scholars as being culturally important, and is part of the knowledge base of civilization as we know it. This work was reproduced from the original artifact, and remains as true to the original work as possible. Therefore, you will see the original copyright references, library stamps (as most of these works have been housed in our most important libraries around the world), and other notations in the work.	ed8f89ee-1371-41e2-8ced-b2151e87d6d5	b4f95e59-4665-4d81-b383-17fd770cb1bd	pts	https://github.com/buddhiko1/pali-mdict
3	New Concise Pali-English Dictionary	3	This Concise Pali-English Dictionary has been prepared mainly for use by students in schools and colleges. The author is not only an eminent Elder of the Buddhist Order but one of the leading Pali scholars recognized both in the East and the West as an authority on the subject. His experience as a teacher and as a writer of textbooks made him admirably suited for the undertaking.	a6d4b5e9-6017-4a16-a149-8d25996af740	9ade5fa5-43c7-4634-9bcb-26a459858683	ncped	https://github.com/buddhiko1/pali-mdict
4	Dictionary Of Pali Proper Names	4	Dictionary of Pali Proper Names is a work of erudition. The author has collected a vast number of entries from Pali canonocal and non-canonical literature on the proper names to make it his magnum opus. It is an indispensable tool for the study of Buddhism.	666c2fca-6240-40cc-a206-5fd5bd00824f	915cd88c-8383-43fa-998d-9c1c01796985	dppn	https://github.com/buddhiko1/pali-mdict
5	Dictionary Of Abbreviation	5	This dictionary is used to explain the abbreviations of book titles and grammatical terms that abound in the dictionary entries.	0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3	b6b7a635-bfd3-4a03-8ee1-d556f8337fba	abbr	https://github.com/buddhiko1/pali-mdict
1	Digital Pali Dictionary	1	DPD is a feature-rich Pali-English dictionary which runs in GoldenDict,or any other application that supports the Stardict format. DPD contains five different dictionaries:<i>Pali to English Dictionary</i>,<i>Pali Roots Dictionary</i>,<i>English to Pali Dictionary</i>,<i>Compound Deconstruction Dictionary</i>, and <i>Abbreviations and Help Dictionary</i>.DPD recognises <strong>1.1 million</strong> unique inflected forms of Pali words.	b4f408d3-0aef-4b95-9d47-999fbd533fa3	7eb966ec-af55-4021-94c1-9851c8e79466	dpd	https://digitalpalidictionary.github.io
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 04:55:52.981+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://0.0.0.0:9000
2	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:00:07.528+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://0.0.0.0:9000
3	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:41:12.421+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	1	\N	http://0.0.0.0:9000
4	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:41:14.387+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	2	\N	http://0.0.0.0:9000
5	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:41:15.767+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	3	\N	http://0.0.0.0:9000
6	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:41:16.985+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	4	\N	http://0.0.0.0:9000
7	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:41:18.863+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	5	\N	http://0.0.0.0:9000
8	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:43:41.228+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	1	\N	http://0.0.0.0:9000
9	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:43:41.238+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	test	\N	http://0.0.0.0:9000
10	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:43:53.118+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	6	\N	http://0.0.0.0:9000
11	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:43:54.144+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	7	\N	http://0.0.0.0:9000
12	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:43:55.213+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	8	\N	http://0.0.0.0:9000
13	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:43:56.191+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	9	\N	http://0.0.0.0:9000
14	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:43:57.426+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	10	\N	http://0.0.0.0:9000
15	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.272+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_roles	680c4884-0fc1-4a5d-8fe7-fe8050833182	\N	http://0.0.0.0:9000
16	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.299+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	11	\N	http://0.0.0.0:9000
17	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.305+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	12	\N	http://0.0.0.0:9000
18	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.311+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	13	\N	http://0.0.0.0:9000
19	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.319+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	14	\N	http://0.0.0.0:9000
20	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.326+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	15	\N	http://0.0.0.0:9000
21	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.332+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	16	\N	http://0.0.0.0:9000
22	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.339+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	17	\N	http://0.0.0.0:9000
23	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.348+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	18	\N	http://0.0.0.0:9000
24	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.353+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	19	\N	http://0.0.0.0:9000
25	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.361+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	20	\N	http://0.0.0.0:9000
26	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.366+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	21	\N	http://0.0.0.0:9000
27	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.371+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	22	\N	http://0.0.0.0:9000
28	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.379+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	23	\N	http://0.0.0.0:9000
29	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.385+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	24	\N	http://0.0.0.0:9000
30	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.393+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	25	\N	http://0.0.0.0:9000
31	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.4+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	26	\N	http://0.0.0.0:9000
32	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.404+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	27	\N	http://0.0.0.0:9000
33	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.413+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	28	\N	http://0.0.0.0:9000
34	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.418+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	29	\N	http://0.0.0.0:9000
35	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.424+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	30	\N	http://0.0.0.0:9000
36	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.431+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	31	\N	http://0.0.0.0:9000
37	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.435+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	32	\N	http://0.0.0.0:9000
38	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.443+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	33	\N	http://0.0.0.0:9000
39	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:53.449+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	34	\N	http://0.0.0.0:9000
40	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:56.992+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	35	\N	http://0.0.0.0:9000
41	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:58.092+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	36	\N	http://0.0.0.0:9000
42	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:44:59.069+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	37	\N	http://0.0.0.0:9000
43	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:45:00.123+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	38	\N	http://0.0.0.0:9000
44	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:45:01.768+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	39	\N	http://0.0.0.0:9000
45	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-05 05:45:59.291+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	40	\N	http://0.0.0.0:9000
46	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-12 02:45:44.572+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://0.0.0.0:9000
47	create	\N	2023-08-12 02:48:10.405+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	4e2ea071-ce85-4a8b-9c3e-51d3d455b584	\N	http://localhost:4200
48	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-12 03:00:08.132+00	172.19.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	4e2ea071-ce85-4a8b-9c3e-51d3d455b584	\N	http://0.0.0.0:9000
49	create	\N	2023-08-12 05:49:43.06+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	38d7e34b-e440-4f14-b63e-244045b539fa	\N	http://localhost:4200
50	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-12 05:51:40.111+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	38d7e34b-e440-4f14-b63e-244045b539fa	\N	http://0.0.0.0:9000
51	create	\N	2023-08-12 05:58:59.647+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	cb79e2bb-1585-45b7-abd5-3e0fea52ab3e	\N	http://localhost:4200
52	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-12 06:00:37.064+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	cb79e2bb-1585-45b7-abd5-3e0fea52ab3e	\N	http://0.0.0.0:9000
53	create	\N	2023-08-12 06:00:49.491+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	70357c1c-dac1-4a7d-989b-d2b7c110069d	\N	http://localhost:4200
54	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-12 06:06:04.04+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://0.0.0.0:9000
55	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-08-12 06:06:13.717+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	70357c1c-dac1-4a7d-989b-d2b7c110069d	\N	http://0.0.0.0:9000
56	create	\N	2023-08-12 06:06:31.311+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
57	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-12 06:08:44.454+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://0.0.0.0:9000
58	update	\N	2023-08-13 08:06:07.831+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
59	update	\N	2023-08-13 08:34:20.506+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
60	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-13 08:34:49.79+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:9000
61	update	\N	2023-08-18 08:38:28.274+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
62	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 08:38:39.331+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
63	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 08:39:13.761+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
64	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 08:39:44.877+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
65	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 08:40:42.278+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
66	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 08:51:55.067+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
67	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 08:52:26.006+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
68	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 08:53:44.022+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
69	update	\N	2023-08-18 09:14:01.739+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
70	login	25f81e5b-9191-4e6d-ad2d-48e294b088be	2023-08-18 09:14:01.839+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://localhost:4200
71	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-01 10:41:11.216+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
72	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:10:56.127+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://0.0.0.0:9000
73	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:55:31.098+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_roles	680c4884-0fc1-4a5d-8fe7-fe8050833182	\N	http://0.0.0.0:9000
74	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:57:36.468+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	28	\N	http://0.0.0.0:9000
75	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:58:46.868+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	4	\N	http://0.0.0.0:9000
76	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:59:06.185+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	2	\N	http://0.0.0.0:9000
77	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:59:08.601+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	3	\N	http://0.0.0.0:9000
78	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:59:12.556+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	1	\N	http://0.0.0.0:9000
79	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 10:59:16.279+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	41	\N	http://0.0.0.0:9000
80	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 11:02:27.368+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	30	\N	http://0.0.0.0:9000
81	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 11:03:41.992+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	40	\N	http://0.0.0.0:9000
82	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 11:04:02.246+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	40	\N	http://0.0.0.0:9000
83	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-02 11:04:25.892+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	42	\N	http://0.0.0.0:9000
84	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-03 11:57:29.968+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_roles	a176c081-381b-4d62-b0cf-3d2b23ec5552	\N	http://0.0.0.0:9000
85	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-03 11:57:49.618+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_roles	a176c081-381b-4d62-b0cf-3d2b23ec5552	\N	http://0.0.0.0:9000
86	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-07 23:59:59.224+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
87	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 00:03:23.985+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
88	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 01:37:03.501+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
89	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 02:02:25.29+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
90	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 02:24:15.214+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
91	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 02:35:59.762+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
92	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 02:54:06.159+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
93	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 02:54:10.011+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
94	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 02:56:21.546+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
95	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 02:58:05.365+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
96	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 03:15:21.792+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
97	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 03:27:02.464+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
98	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 05:24:19.485+00	172.20.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
99	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 06:18:46.517+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	\N	http://0.0.0.0:9000
100	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-08 06:43:21.869+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	43	\N	http://0.0.0.0:9000
101	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-11 02:58:55.743+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
102	create	\N	2023-09-11 06:46:20.794+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	f10a59e1-6834-4402-b80d-854c80942948	\N	http://localhost:4200
103	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-11 07:28:57.027+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
104	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-11 07:30:12.234+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:4200
105	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 02:53:18.143+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	aa4ffc52-6124-43ad-b47c-cd4021d0618e	\N	http://0.0.0.0:9000
106	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:00:15.246+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	2	\N	http://0.0.0.0:9000
107	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:00:49.328+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	3	\N	http://0.0.0.0:9000
108	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:00:49.337+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	zs	\N	http://0.0.0.0:9000
109	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:01:30.186+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	zs	\N	http://0.0.0.0:9000
110	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:01:33.416+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	test	\N	http://0.0.0.0:9000
111	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:04:30.201+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	4	\N	http://0.0.0.0:9000
112	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:04:30.212+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	modules	\N	http://0.0.0.0:9000
113	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:06:27.384+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	5	\N	http://0.0.0.0:9000
114	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:07:04.204+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	6	\N	http://0.0.0.0:9000
115	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:10:17.149+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	7	\N	http://0.0.0.0:9000
116	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:21:31.906+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	6	\N	http://0.0.0.0:9000
117	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:23:24.605+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	8	\N	http://0.0.0.0:9000
118	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 03:30:32.997+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	modules	\N	http://0.0.0.0:9000
119	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:02:33.384+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	7	\N	http://0.0.0.0:9000
120	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:02:42.363+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	8	\N	http://0.0.0.0:9000
121	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:04:00.351+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	1	\N	http://0.0.0.0:9000
122	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:04:56.02+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	2	\N	http://0.0.0.0:9000
123	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:05:30.878+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	3	\N	http://0.0.0.0:9000
124	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:06:41.181+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	4	\N	http://0.0.0.0:9000
125	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:07:51.713+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	5	\N	http://0.0.0.0:9000
126	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:08:03.47+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	5	\N	http://0.0.0.0:9000
127	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:08:35.959+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	6	\N	http://0.0.0.0:9000
128	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 04:09:10.039+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	7	\N	http://0.0.0.0:9000
129	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 08:12:18.453+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	44	\N	http://0.0.0.0:9000
130	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 08:12:26.514+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	45	\N	http://0.0.0.0:9000
131	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 12:41:30.027+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
132	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 12:42:43.312+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
133	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 12:50:37.777+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
134	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 12:54:03.707+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
135	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 12:55:33.267+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
136	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 12:57:32.6+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
137	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 13:01:01.933+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
138	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 13:07:04.11+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
139	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 13:09:52.345+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
140	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 13:14:33.816+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
141	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 13:51:40.644+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
142	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 23:25:49.776+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:9000
143	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 23:26:05.709+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	44	\N	http://localhost:9000
144	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-12 23:42:35.03+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	46	\N	http://localhost:9000
145	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 01:16:57.671+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
146	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 02:49:02.378+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
147	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 02:51:38.003+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
148	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 03:35:20.379+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
149	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 03:40:50.863+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
150	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 03:42:45.167+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
151	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 03:43:59.099+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
152	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 03:47:01.22+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
153	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 04:18:53.934+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
154	create	\N	2023-09-13 07:53:19.625+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	70285e73-f54e-4735-bfa7-5bfa2789358b	\N	http://localhost:8000
155	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 07:54:34.103+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	70285e73-f54e-4735-bfa7-5bfa2789358b	\N	http://localhost:9000
156	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 07:54:52.809+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	f10a59e1-6834-4402-b80d-854c80942948	\N	http://localhost:9000
157	create	\N	2023-09-13 07:54:58.677+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	791b885f-5daa-46b0-a7e7-eacbf299e5ff	\N	http://localhost:8000
158	login	791b885f-5daa-46b0-a7e7-eacbf299e5ff	2023-09-13 08:03:03.008+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	791b885f-5daa-46b0-a7e7-eacbf299e5ff	\N	http://localhost:8000
159	update	\N	2023-09-13 08:05:22.917+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	791b885f-5daa-46b0-a7e7-eacbf299e5ff	\N	http://localhost:8000
160	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 08:10:17.354+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
161	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 08:15:28.455+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	791b885f-5daa-46b0-a7e7-eacbf299e5ff	\N	http://localhost:9000
162	create	\N	2023-09-13 08:16:30.933+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	8bbc6bf2-bddc-4475-b6f0-f8c62234a446	\N	http://localhost:8000
163	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-13 08:21:00.324+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	8bbc6bf2-bddc-4475-b6f0-f8c62234a446	\N	http://localhost:9000
164	create	\N	2023-09-13 08:21:32.386+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	642cc6f5-8e6f-4316-9fe4-53bc9f342c51	\N	http://localhost:8000
165	login	642cc6f5-8e6f-4316-9fe4-53bc9f342c51	2023-09-13 08:22:09.106+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	642cc6f5-8e6f-4316-9fe4-53bc9f342c51	\N	http://localhost:8000
166	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 01:58:59.133+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	modules	1	\N	http://localhost:9000
167	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 03:35:07.333+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	8	\N	http://localhost:9000
168	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 03:40:35.683+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	8	\N	http://localhost:9000
169	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 03:41:25.04+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	5	\N	http://localhost:9000
170	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 04:59:14.122+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	9	\N	http://localhost:9000
171	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 04:59:14.129+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	dictionary	\N	http://localhost:9000
172	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 04:59:43.116+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	10	\N	http://localhost:9000
173	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 05:00:46.765+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	11	\N	http://localhost:9000
174	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:15:49.362+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	aa4ffc52-6124-43ad-b47c-cd4021d0618e	\N	http://localhost:9000
175	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:15:59.984+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_folders	73c9b505-4957-4550-87d3-ccb916dc13ba	\N	http://localhost:9000
176	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:17:40.305+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	12	\N	http://localhost:9000
177	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:18:15.555+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	12	\N	http://localhost:9000
178	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:19:34.798+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	13	\N	http://localhost:9000
179	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:21:02.779+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	14	\N	http://localhost:9000
180	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:24:59.039+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	7eb966ec-af55-4021-94c1-9851c8e79466	\N	http://localhost:9000
181	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:26:43.836+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	b4f408d3-0aef-4b95-9d47-999fbd533fa3	\N	http://localhost:9000
183	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:28:48.209+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	15	\N	http://localhost:9000
185	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:30:25.812+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	9ade5fa5-43c7-4634-9bcb-26a459858683	\N	http://localhost:9000
186	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:30:47.741+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	a6d4b5e9-6017-4a16-a149-8d25996af740	\N	http://localhost:9000
188	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:32:11.46+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	b4f95e59-4665-4d81-b383-17fd770cb1bd	\N	http://localhost:9000
189	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:32:25.835+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	ed8f89ee-1371-41e2-8ced-b2151e87d6d5	\N	http://localhost:9000
191	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:33:28.26+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	915cd88c-8383-43fa-998d-9c1c01796985	\N	http://localhost:9000
192	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:33:50.401+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	666c2fca-6240-40cc-a206-5fd5bd00824f	\N	http://localhost:9000
194	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:34:48.159+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	b6b7a635-bfd3-4a03-8ee1-d556f8337fba	\N	http://localhost:9000
195	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:35:01.85+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3	\N	http://localhost:9000
197	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:38:20.3+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	16	\N	http://localhost:9000
203	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:45:41.045+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	17	\N	http://localhost:9000
204	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:53:11.279+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	18	\N	http://localhost:9000
205	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:53:11.292+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	dict_summary	\N	http://localhost:9000
206	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:53:29.385+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	19	\N	http://localhost:9000
207	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:54:03.306+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	20	\N	http://localhost:9000
209	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:00:07+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	21	\N	http://localhost:9000
210	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:02:17.686+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	22	\N	http://localhost:9000
216	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:13:21.515+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	47	\N	http://localhost:9000
217	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:13:22.861+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	48	\N	http://localhost:9000
223	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:39:20.196+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	dictionary	\N	http://localhost:9000
224	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:40:19.664+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	23	\N	http://localhost:9000
225	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:40:19.677+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	dictionaries	\N	http://localhost:9000
226	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:40:33.006+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	24	\N	http://localhost:9000
227	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:40:46.869+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	25	\N	http://localhost:9000
228	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:41:04.891+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:9000
229	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:41:36.634+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	27	\N	http://localhost:9000
230	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:42:02.378+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	28	\N	http://localhost:9000
231	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:42:49.56+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:9000
232	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:44.775+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	30	\N	http://localhost:9000
233	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:48.876+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	23	\N	http://localhost:9000
234	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:48.91+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	25	\N	http://localhost:9000
235	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:48.947+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	24	\N	http://localhost:9000
236	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:48.978+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:9000
237	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:49.045+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	28	\N	http://localhost:9000
238	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:49.086+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:9000
239	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:49.126+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	30	\N	http://localhost:9000
240	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:51.837+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	23	\N	http://localhost:9000
241	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:51.891+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	25	\N	http://localhost:9000
242	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:51.932+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	24	\N	http://localhost:9000
243	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:51.995+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	30	\N	http://localhost:9000
244	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:52.025+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:9000
245	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:52.055+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	28	\N	http://localhost:9000
246	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:52.083+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:9000
247	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:55.277+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	23	\N	http://localhost:9000
248	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:55.338+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	25	\N	http://localhost:9000
249	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:55.382+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	24	\N	http://localhost:9000
250	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:55.443+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	30	\N	http://localhost:9000
251	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:55.52+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:9000
252	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:55.638+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:9000
253	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:43:55.763+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	28	\N	http://localhost:9000
254	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:45:30.004+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	1	\N	http://localhost:9000
255	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:46:46.397+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	2	\N	http://localhost:9000
256	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:48:19.332+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	3	\N	http://localhost:9000
257	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:49:13.276+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	4	\N	http://localhost:9000
258	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 07:50:02.151+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	5	\N	http://localhost:9000
259	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:04:27.487+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	31	\N	http://localhost:9000
260	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:04:53.138+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	1	\N	http://localhost:9000
261	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:05:14.666+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	2	\N	http://localhost:9000
262	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:05:20.921+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	3	\N	http://localhost:9000
263	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:05:27.04+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	4	\N	http://localhost:9000
264	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:05:32.818+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	5	\N	http://localhost:9000
265	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:06:03.124+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	31	\N	http://localhost:9000
266	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:06:18.273+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	28	\N	http://localhost:9000
267	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:06:24.992+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:9000
268	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:06:31.911+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:9000
269	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:06:42.543+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:9000
270	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:07:03.956+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	25	\N	http://localhost:9000
271	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:07:10.72+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	30	\N	http://localhost:9000
272	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:07:16.908+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	24	\N	http://localhost:9000
273	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:11:34.004+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	49	\N	http://localhost:9000
274	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:11:44.211+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	50	\N	http://localhost:9000
275	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:11:45.533+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	51	\N	http://localhost:9000
276	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:30:35.348+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	dict_summary	\N	http://localhost:9000
277	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:31:10.788+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	32	\N	http://localhost:9000
278	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:31:10.795+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	dict_introduction	\N	http://localhost:9000
279	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:31:20.467+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	33	\N	http://localhost:9000
280	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:31:31.865+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	34	\N	http://localhost:9000
281	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:32:46.028+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	33	\N	http://localhost:9000
283	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:35:33.924+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:9000
282	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:32:54.331+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	34	\N	http://localhost:9000
284	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:36:31.434+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	52	\N	http://localhost:9000
285	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 08:36:45.564+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	53	\N	http://localhost:9000
286	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 09:45:55.531+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dictionaries	1	\N	http://localhost:9000
287	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:00:49.734+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	33	\N	http://localhost:9000
288	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:04:12.828+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dict_introduction	1	\N	http://localhost:9000
289	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:06:21.409+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	30	\N	http://localhost:9000
290	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:06:34.355+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:9000
291	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:06:40.623+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	28	\N	http://localhost:9000
292	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:07:53.465+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	54	\N	http://localhost:9000
293	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:07:57.357+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	55	\N	http://localhost:9000
294	delete	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:08:56.754+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	55	\N	http://localhost:9000
295	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 10:16:24.528+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	56	\N	http://localhost:9000
296	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-20 07:50:02.107+00	192.168.1.3	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Mobile Safari/537.36 EdgA/115.0.1901.196	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://192.168.1.99:8000
297	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-20 08:38:00.718+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dict_introduction	1	\N	http://localhost:9000
298	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-20 09:00:10.617+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	33	\N	http://localhost:9000
299	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-20 09:01:35.268+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	dict_introduction	1	\N	http://localhost:9000
300	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:19:45.898+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	35	\N	http://localhost:9000
301	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:19:45.911+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	tipitaka	\N	http://localhost:9000
302	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:20:29.724+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	36	\N	http://localhost:9000
303	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:20:55.733+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	37	\N	http://localhost:9000
304	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:22:07.242+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	38	\N	http://localhost:9000
305	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:22:41.143+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_folders	94a901e7-5881-427d-939c-23d29dbf2db6	\N	http://localhost:9000
306	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:23:01.996+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	39	\N	http://localhost:9000
307	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:23:12.859+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	36	\N	http://localhost:9000
308	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:23:22.97+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	38	\N	http://localhost:9000
309	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 01:23:31.278+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	39	\N	http://localhost:9000
310	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:31:02.128+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	9b3bc4a4-996e-49ad-a59d-647f8d41513d	\N	http://localhost:9000
311	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:31:21.24+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	7fde8ccf-b0ab-4b01-92e9-6815b97e22fc	\N	http://localhost:9000
312	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:31:26.175+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	tipitaka	1	\N	http://localhost:9000
313	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:32:17.565+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	113af081-3936-48cd-9550-18ec84745753	\N	http://localhost:9000
314	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:32:36.035+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	ad12ba7b-5684-4b50-baa4-0cfe13cbeabb	\N	http://localhost:9000
315	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:32:39.174+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	tipitaka	2	\N	http://localhost:9000
316	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:33:25.926+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	e786dd33-13fd-480c-8470-7b5ba8eb2228	\N	http://localhost:9000
317	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:33:43.676+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	614c793e-3ede-44c2-991e-bd8b7afd125b	\N	http://localhost:9000
318	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:33:46.109+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	tipitaka	3	\N	http://localhost:9000
319	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 00:14:44.685+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	40	\N	http://localhost:9000
320	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 00:15:09.224+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	tipitaka	1	\N	http://localhost:9000
321	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 00:15:15.868+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	tipitaka	2	\N	http://localhost:9000
322	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 00:15:21.367+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	tipitaka	3	\N	http://localhost:9000
323	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 00:15:31.515+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	40	\N	http://localhost:9000
324	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 00:32:17.625+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	tipitaka	\N	http://localhost:9000
325	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:11:58.635+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	57	\N	http://localhost:9000
326	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:45:38.854+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	41	\N	http://localhost:9000
327	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:45:38.863+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_collections	cites	\N	http://localhost:9000
328	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:46:00.983+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	42	\N	http://localhost:9000
329	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:46:12.096+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	43	\N	http://localhost:9000
330	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:46:22.03+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	44	\N	http://localhost:9000
331	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:46:28.318+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	42	\N	http://localhost:9000
332	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:46:36.275+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	43	\N	http://localhost:9000
333	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:46:41.94+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	44	\N	http://localhost:9000
334	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:48:16.336+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	45	\N	http://localhost:9000
335	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:49:23.417+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	46	\N	http://localhost:9000
336	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:49:35.807+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	47	\N	http://localhost:9000
337	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:49:45.19+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	46	\N	http://localhost:9000
338	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:50:02.25+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_fields	47	\N	http://localhost:9000
339	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:50:13.588+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_permissions	58	\N	http://localhost:9000
340	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:53:30.604+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	cites	1	\N	http://localhost:9000
341	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:54:46.211+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	cites	2	\N	http://localhost:9000
342	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:55:02.749+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	cites	1	\N	http://localhost:9000
343	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 01:55:07.532+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	cites	2	\N	http://localhost:9000
344	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 05:17:54.738+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	cites	1	\N	http://localhost:9000
345	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-22 05:19:41.007+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	cites	1	\N	http://localhost:9000
346	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 07:18:39.853+00	192.168.1.99	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
347	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 07:34:06.569+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:9000
348	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 08:01:36.305+00	192.168.1.4	Mozilla/5.0 (Android 13; Mobile; rv:109.0) Gecko/115.0 Firefox/115.0	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://192.168.1.99:8000
349	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 08:08:50.994+00	192.168.1.4	Mozilla/5.0 (Android 13; Mobile; rv:109.0) Gecko/115.0 Firefox/115.0	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://192.168.1.99:8000
350	create	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 08:24:44.979+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_files	cc4be113-7c87-4ca2-812c-744d165a689b	\N	http://localhost:9000
351	update	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 08:24:48.432+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:9000
352	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 08:25:42.695+00	192.168.1.4	Mozilla/5.0 (Android 13; Mobile; rv:109.0) Gecko/115.0 Firefox/115.0	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://192.168.1.99:8000
353	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 08:51:01.355+00	192.168.1.99	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
354	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 09:40:50.382+00	192.168.1.99	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
355	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 10:30:36.291+00	192.168.1.99	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
356	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-10-16 01:30:44.727+00	192.168.1.99	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
357	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-10-16 08:13:51.913+00	192.168.1.99	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:8000
358	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-10-23 23:48:48.266+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:9000
359	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-10-24 01:10:52.95+00	172.22.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:9000
360	login	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-10-24 02:39:38.688+00	172.22.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	http://localhost:9000
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url) FROM stdin;
modules	\N	\N	\N	f	f	\N	\N	t	\N	\N	index	all	\N	\N	\N	\N	open	\N
dictionaries	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N
dict_introduction	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N
tipitaka	\N	\N	\N	f	f	\N	\N	t	\N	\N	index	all	\N	\N	\N	\N	open	\N
cites	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
25	dictionaries	index	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
24	dictionaries	name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
4	modules	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
6	modules	index	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
7	modules	description	\N	input-multiline	{"trim":true}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
32	dict_introduction	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
8	modules	route	\N	input	\N	\N	\N	t	f	5	full	\N	\N	\N	t	\N	\N	\N
5	modules	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
34	dict_introduction	text	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
26	dictionaries	description	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
30	dictionaries	abbreviation	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
29	dictionaries	cover	file	file-image	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
28	dictionaries	zip	file	file	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"}	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
33	dict_introduction	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
35	tipitaka	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
37	tipitaka	info_url	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
36	tipitaka	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
38	tipitaka	cover	file	file-image	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
39	tipitaka	zip	file	file	{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6"}	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
40	tipitaka	index	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
41	cites	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
42	cites	index	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
44	cites	text	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
23	dictionaries	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
46	cites	author	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
31	dictionaries	info_url	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
47	cites	author_url	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
7eb966ec-af55-4021-94c1-9851c8e79466	local	7eb966ec-af55-4021-94c1-9851c8e79466.jpg	dpd.jpg	Dpd	image/jpeg	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:24:59.035669+00	\N	2023-09-14 06:24:59.057+00	\N	47791	1000	1500	\N	\N	\N	\N	\N	{}
b4f408d3-0aef-4b95-9d47-999fbd533fa3	local	b4f408d3-0aef-4b95-9d47-999fbd533fa3.zip	dpd.zip	Dpd	application/zip	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:26:43.826888+00	\N	2023-09-14 06:26:44.588+00	\N	258120360	\N	\N	\N	\N	\N	\N	\N	\N
9ade5fa5-43c7-4634-9bcb-26a459858683	local	9ade5fa5-43c7-4634-9bcb-26a459858683.jpg	ncped.jpg	Ncped	image/jpeg	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:30:25.807612+00	\N	2023-09-14 06:30:25.826+00	\N	50409	1000	1500	\N	\N	\N	\N	\N	{}
a6d4b5e9-6017-4a16-a149-8d25996af740	local	a6d4b5e9-6017-4a16-a149-8d25996af740.zip	ncped.zip	Ncped	application/zip	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:30:47.734126+00	\N	2023-09-14 06:30:47.758+00	\N	846744	\N	\N	\N	\N	\N	\N	\N	\N
b4f95e59-4665-4d81-b383-17fd770cb1bd	local	b4f95e59-4665-4d81-b383-17fd770cb1bd.jpg	pts.jpg	Pts	image/jpeg	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:32:11.455152+00	\N	2023-09-14 06:32:11.475+00	\N	45921	1000	1500	\N	\N	\N	\N	\N	{}
ed8f89ee-1371-41e2-8ced-b2151e87d6d5	local	ed8f89ee-1371-41e2-8ced-b2151e87d6d5.zip	pts.zip	Pts	application/zip	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:32:25.822542+00	\N	2023-09-14 06:32:25.852+00	\N	3853194	\N	\N	\N	\N	\N	\N	\N	\N
915cd88c-8383-43fa-998d-9c1c01796985	local	915cd88c-8383-43fa-998d-9c1c01796985.jpg	dppn.jpg	Dppn	image/jpeg	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:33:28.254068+00	\N	2023-09-14 06:33:28.272+00	\N	50439	1000	1500	\N	\N	\N	\N	\N	{}
666c2fca-6240-40cc-a206-5fd5bd00824f	local	666c2fca-6240-40cc-a206-5fd5bd00824f.zip	dppn.zip	Dppn	application/zip	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:33:50.396156+00	\N	2023-09-14 06:33:50.411+00	\N	465806	\N	\N	\N	\N	\N	\N	\N	\N
b6b7a635-bfd3-4a03-8ee1-d556f8337fba	local	b6b7a635-bfd3-4a03-8ee1-d556f8337fba.jpg	abbr.jpg	Abbr	image/jpeg	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:34:48.15445+00	\N	2023-09-14 06:34:48.17+00	\N	48237	1000	1500	\N	\N	\N	\N	\N	{}
0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3	local	0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3.zip	abbr.zip	Abbr	application/zip	73c9b505-4957-4550-87d3-ccb916dc13ba	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-14 06:35:01.842518+00	\N	2023-09-14 06:35:01.863+00	\N	28161	\N	\N	\N	\N	\N	\N	\N	\N
9b3bc4a4-996e-49ad-a59d-647f8d41513d	local	9b3bc4a4-996e-49ad-a59d-647f8d41513d.jpg	sutta.jpg	Sutta	image/jpeg	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:31:02.116754+00	\N	2023-09-21 03:31:02.201+00	\N	21221	600	900	\N	\N	\N	\N	\N	{}
7fde8ccf-b0ab-4b01-92e9-6815b97e22fc	local	7fde8ccf-b0ab-4b01-92e9-6815b97e22fc.zip	sutta.zip	Sutta	application/zip	94a901e7-5881-427d-939c-23d29dbf2db6	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:31:21.223993+00	\N	2023-09-21 03:31:21.329+00	\N	10588526	\N	\N	\N	\N	\N	\N	\N	\N
113af081-3936-48cd-9550-18ec84745753	local	113af081-3936-48cd-9550-18ec84745753.jpg	vinaya.jpg	Vinaya	image/jpeg	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:32:17.561996+00	\N	2023-09-21 03:32:17.579+00	\N	22286	600	900	\N	\N	\N	\N	\N	{}
ad12ba7b-5684-4b50-baa4-0cfe13cbeabb	local	ad12ba7b-5684-4b50-baa4-0cfe13cbeabb.zip	vinaya.zip	Vinaya	application/zip	94a901e7-5881-427d-939c-23d29dbf2db6	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:32:36.030213+00	\N	2023-09-21 03:32:36.052+00	\N	1481454	\N	\N	\N	\N	\N	\N	\N	\N
e786dd33-13fd-480c-8470-7b5ba8eb2228	local	e786dd33-13fd-480c-8470-7b5ba8eb2228.jpg	abhidhamma.jpg	Abhidhamma	image/jpeg	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:33:25.921705+00	\N	2023-09-21 03:33:25.939+00	\N	25305	600	900	\N	\N	\N	\N	\N	{}
614c793e-3ede-44c2-991e-bd8b7afd125b	local	614c793e-3ede-44c2-991e-bd8b7afd125b.zip	abhidhamma.zip	Abhidhamma	application/zip	94a901e7-5881-427d-939c-23d29dbf2db6	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-21 03:33:43.670328+00	\N	2023-09-21 03:33:43.696+00	\N	3004265	\N	\N	\N	\N	\N	\N	\N	\N
cc4be113-7c87-4ca2-812c-744d165a689b	local	cc4be113-7c87-4ca2-812c-744d165a689b.jpg	test.jpg	Test	image/jpeg	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-09-27 08:24:44.965318+00	\N	2023-09-27 08:24:45.008+00	\N	105238	482	359	\N	\N	\N	\N	\N	{}
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_folders (id, name, parent) FROM stdin;
73c9b505-4957-4550-87d3-ccb916dc13ba	dictionary	\N
94a901e7-5881-427d-939c-23d29dbf2db6	tipitaka	\N
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2023-08-05 04:01:53.153539+00
20201029A	Remove System Relations	2023-08-05 04:01:53.179423+00
20201029B	Remove System Collections	2023-08-05 04:01:53.200308+00
20201029C	Remove System Fields	2023-08-05 04:01:53.232713+00
20201105A	Add Cascade System Relations	2023-08-05 04:01:53.540074+00
20201105B	Change Webhook URL Type	2023-08-05 04:01:53.5822+00
20210225A	Add Relations Sort Field	2023-08-05 04:01:53.610404+00
20210304A	Remove Locked Fields	2023-08-05 04:01:53.630991+00
20210312A	Webhooks Collections Text	2023-08-05 04:01:53.672231+00
20210331A	Add Refresh Interval	2023-08-05 04:01:53.691217+00
20210415A	Make Filesize Nullable	2023-08-05 04:01:53.74156+00
20210416A	Add Collections Accountability	2023-08-05 04:01:53.766988+00
20210422A	Remove Files Interface	2023-08-05 04:01:53.780371+00
20210506A	Rename Interfaces	2023-08-05 04:01:53.831634+00
20210510A	Restructure Relations	2023-08-05 04:01:53.937654+00
20210518A	Add Foreign Key Constraints	2023-08-05 04:01:53.974769+00
20210519A	Add System Fk Triggers	2023-08-05 04:01:54.136363+00
20210521A	Add Collections Icon Color	2023-08-05 04:01:54.161198+00
20210525A	Add Insights	2023-08-05 04:01:54.258188+00
20210608A	Add Deep Clone Config	2023-08-05 04:01:54.281303+00
20210626A	Change Filesize Bigint	2023-08-05 04:01:54.351031+00
20210716A	Add Conditions to Fields	2023-08-05 04:01:54.370246+00
20210721A	Add Default Folder	2023-08-05 04:01:54.405214+00
20210802A	Replace Groups	2023-08-05 04:01:54.427713+00
20210803A	Add Required to Fields	2023-08-05 04:01:54.447786+00
20210805A	Update Groups	2023-08-05 04:01:54.468294+00
20210805B	Change Image Metadata Structure	2023-08-05 04:01:54.489565+00
20210811A	Add Geometry Config	2023-08-05 04:01:54.509144+00
20210831A	Remove Limit Column	2023-08-05 04:01:54.528363+00
20210903A	Add Auth Provider	2023-08-05 04:01:54.610511+00
20210907A	Webhooks Collections Not Null	2023-08-05 04:01:54.652579+00
20210910A	Move Module Setup	2023-08-05 04:01:54.675906+00
20210920A	Webhooks URL Not Null	2023-08-05 04:01:54.886186+00
20210924A	Add Collection Organization	2023-08-05 04:01:54.905566+00
20210927A	Replace Fields Group	2023-08-05 04:01:54.933151+00
20210927B	Replace M2M Interface	2023-08-05 04:01:54.937788+00
20210929A	Rename Login Action	2023-08-05 04:01:54.941759+00
20211007A	Update Presets	2023-08-05 04:01:54.952077+00
20211009A	Add Auth Data	2023-08-05 04:01:54.957315+00
20211016A	Add Webhook Headers	2023-08-05 04:01:54.962433+00
20211103A	Set Unique to User Token	2023-08-05 04:01:54.970713+00
20211103B	Update Special Geometry	2023-08-05 04:01:54.974247+00
20211104A	Remove Collections Listing	2023-08-05 04:01:54.979713+00
20211118A	Add Notifications	2023-08-05 04:01:54.999864+00
20211211A	Add Shares	2023-08-05 04:01:55.029024+00
20211230A	Add Project Descriptor	2023-08-05 04:01:55.03406+00
20220303A	Remove Default Project Color	2023-08-05 04:01:55.046205+00
20220308A	Add Bookmark Icon and Color	2023-08-05 04:01:55.051373+00
20220314A	Add Translation Strings	2023-08-05 04:01:55.056038+00
20220322A	Rename Field Typecast Flags	2023-08-05 04:01:55.06098+00
20220323A	Add Field Validation	2023-08-05 04:01:55.066361+00
20220325A	Fix Typecast Flags	2023-08-05 04:01:55.071257+00
20220325B	Add Default Language	2023-08-05 04:01:55.085447+00
20220402A	Remove Default Value Panel Icon	2023-08-05 04:01:55.097897+00
20220429A	Add Flows	2023-08-05 04:01:55.179965+00
20220429B	Add Color to Insights Icon	2023-08-05 04:01:55.191963+00
20220429C	Drop Non Null From IP of Activity	2023-08-05 04:01:55.203431+00
20220429D	Drop Non Null From Sender of Notifications	2023-08-05 04:01:55.21604+00
20220614A	Rename Hook Trigger to Event	2023-08-05 04:01:55.225041+00
20220801A	Update Notifications Timestamp Column	2023-08-05 04:01:55.252829+00
20220802A	Add Custom Aspect Ratios	2023-08-05 04:01:55.262322+00
20220826A	Add Origin to Accountability	2023-08-05 04:01:55.275652+00
20230401A	Update Material Icons	2023-08-05 04:01:55.301333+00
20230525A	Add Preview Settings	2023-08-05 04:01:55.31081+00
20230526A	Migrate Translation Strings	2023-08-05 04:01:55.340025+00
20230721A	Require Shares Fields	2023-09-12 02:52:32.707596+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
5	\N	directus_users	share	{}	{}	\N	*
11	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_files	create	{}	\N	\N	*
12	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_files	read	{}	\N	\N	*
13	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_files	update	{}	\N	\N	*
14	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_files	delete	{}	\N	\N	*
15	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_dashboards	create	{}	\N	\N	*
16	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_dashboards	read	{}	\N	\N	*
17	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_dashboards	update	{}	\N	\N	*
18	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_dashboards	delete	{}	\N	\N	*
19	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_panels	create	{}	\N	\N	*
20	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_panels	read	{}	\N	\N	*
21	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_panels	update	{}	\N	\N	*
22	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_panels	delete	{}	\N	\N	*
23	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_folders	create	{}	\N	\N	*
24	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_folders	read	{}	\N	\N	*
25	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_folders	update	{}	\N	\N	*
26	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_folders	delete	{}	\N	\N	\N
27	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_users	read	{}	\N	\N	*
29	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_roles	read	{}	\N	\N	*
31	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_shares	create	{}	\N	\N	*
32	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_shares	update	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
33	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_shares	delete	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
34	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_flows	read	{"trigger":{"_eq":"manual"}}	\N	\N	id,name,icon,color,options,trigger
28	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret
41	\N	directus_users	create	{}	{}	\N	*
30	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_shares	read	{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}	\N	\N	*
40	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_users	delete	{"_and":[{"id":{"_eq":"$CURRENT_USER"}}]}	{}	\N	*
42	680c4884-0fc1-4a5d-8fe7-fe8050833182	directus_users	share	{}	{}	\N	*
43	\N	directus_users	read	{}	{}	\N	*
45	680c4884-0fc1-4a5d-8fe7-fe8050833182	modules	read	{}	{}	\N	*
46	\N	modules	read	{}	{}	\N	*
49	\N	dictionaries	read	{}	{}	\N	*
50	680c4884-0fc1-4a5d-8fe7-fe8050833182	dictionaries	read	{}	{}	\N	*
52	\N	dict_introduction	read	{}	{}	\N	*
53	680c4884-0fc1-4a5d-8fe7-fe8050833182	dict_introduction	read	{}	{}	\N	*
54	\N	directus_files	read	{}	{}	\N	*
56	\N	directus_folders	read	{}	{}	\N	*
57	\N	tipitaka	read	{}	{}	\N	*
58	\N	cites	read	{}	{}	\N	*
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
9	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	dictionaries	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
10	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	tipitaka	\N	\N	{"tabular":{"limit":25,"fields":["cover","info_url","name","zip","index"]}}	\N	\N	\N	bookmark	\N
2	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	directus_translations	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
4	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"limit":25,"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
7	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	modules	\N	\N	{"tabular":{"limit":25,"fields":["description","index","name","route"]}}	{"tabular":{"widths":{"description":198}}}	\N	\N	bookmark	\N
1	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"limit":25,"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":3}}	\N	\N	bookmark	\N
11	\N	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	\N	cites	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
4	dictionaries	zip	directus_files	\N	\N	\N	\N	\N	nullify
5	dictionaries	cover	directus_files	\N	\N	\N	\N	\N	nullify
6	tipitaka	cover	directus_files	\N	\N	\N	\N	\N	nullify
7	tipitaka	zip	directus_files	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	2	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	{"id":"e9e84e21-1ad2-4968-9296-ac5d83baf7ef","first_name":"Admin","last_name":"User","email":"buddhiko@outlook.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"a176c081-381b-4d62-b0cf-3d2b23ec5552","token":"**********","last_access":"2023-08-05T04:59:32.699Z","last_page":"/users/e9e84e21-1ad2-4968-9296-ac5d83baf7ef","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"token":"**********"}	\N
2	3	directus_permissions	1	{"role":null,"collection":"directus_users","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
3	4	directus_permissions	2	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
4	5	directus_permissions	3	{"role":null,"collection":"directus_users","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
5	6	directus_permissions	4	{"role":null,"collection":"directus_users","action":"delete","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"delete","fields":["*"],"permissions":{},"validation":{}}	\N
6	7	directus_permissions	5	{"role":null,"collection":"directus_users","action":"share","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"share","fields":["*"],"permissions":{},"validation":{}}	\N
7	8	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	\N
8	9	directus_collections	test	{"singleton":false,"collection":"test"}	{"singleton":false,"collection":"test"}	\N
9	10	directus_permissions	6	{"role":null,"collection":"test","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"test","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
10	11	directus_permissions	7	{"role":null,"collection":"test","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"test","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
11	12	directus_permissions	8	{"role":null,"collection":"test","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"test","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
12	13	directus_permissions	9	{"role":null,"collection":"test","action":"delete","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"test","action":"delete","fields":["*"],"permissions":{},"validation":{}}	\N
13	14	directus_permissions	10	{"role":null,"collection":"test","action":"share","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"test","action":"share","fields":["*"],"permissions":{},"validation":{}}	\N
14	15	directus_roles	680c4884-0fc1-4a5d-8fe7-fe8050833182	{"name":"custom","admin_access":false,"app_access":true}	{"name":"custom","admin_access":false,"app_access":true}	\N
15	16	directus_permissions	11	{"collection":"directus_files","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_files","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
16	17	directus_permissions	12	{"collection":"directus_files","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_files","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
17	18	directus_permissions	13	{"collection":"directus_files","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_files","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
18	19	directus_permissions	14	{"collection":"directus_files","action":"delete","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_files","action":"delete","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
19	20	directus_permissions	15	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
20	21	directus_permissions	16	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
21	22	directus_permissions	17	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
22	23	directus_permissions	18	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
23	24	directus_permissions	19	{"collection":"directus_panels","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_panels","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
24	25	directus_permissions	20	{"collection":"directus_panels","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_panels","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
25	26	directus_permissions	21	{"collection":"directus_panels","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_panels","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
26	27	directus_permissions	22	{"collection":"directus_panels","action":"delete","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_panels","action":"delete","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
63	100	directus_permissions	43	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
27	28	directus_permissions	23	{"collection":"directus_folders","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_folders","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
28	29	directus_permissions	24	{"collection":"directus_folders","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_folders","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
29	30	directus_permissions	25	{"collection":"directus_folders","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_folders","action":"update","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
30	31	directus_permissions	26	{"collection":"directus_folders","action":"delete","permissions":{},"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_folders","action":"delete","permissions":{},"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
31	32	directus_permissions	27	{"collection":"directus_users","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_users","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
32	33	directus_permissions	28	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":["first_name","last_name","email","password","location","title","description","avatar","language","theme","tfa_secret"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":["first_name","last_name","email","password","location","title","description","avatar","language","theme","tfa_secret"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
33	34	directus_permissions	29	{"collection":"directus_roles","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_roles","action":"read","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
34	35	directus_permissions	30	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
35	36	directus_permissions	31	{"collection":"directus_shares","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_shares","action":"create","permissions":{},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
36	37	directus_permissions	32	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
37	38	directus_permissions	33	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
38	39	directus_permissions	34	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":["id","name","icon","color","options","trigger"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":["id","name","icon","color","options","trigger"],"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182"}	\N
39	40	directus_permissions	35	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
40	41	directus_permissions	36	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
41	42	directus_permissions	37	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
42	43	directus_permissions	38	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"delete","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"delete","fields":["*"],"permissions":{},"validation":{}}	\N
43	44	directus_permissions	39	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"share","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"test","action":"share","fields":["*"],"permissions":{},"validation":{}}	\N
44	45	directus_permissions	40	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"delete","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"delete","fields":["*"],"permissions":{},"validation":{}}	\N
45	47	directus_users	4e2ea071-ce85-4a8b-9c3e-51d3d455b584	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
46	49	directus_users	38d7e34b-e440-4f14-b63e-244045b539fa	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
47	51	directus_users	cb79e2bb-1585-45b7-abd5-3e0fea52ab3e	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
48	53	directus_users	70357c1c-dac1-4a7d-989b-d2b7c110069d	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
49	56	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
50	58	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	{"id":"25f81e5b-9191-4e6d-ad2d-48e294b088be","first_name":null,"last_name":null,"email":"19070691505@189.cn","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","token":null,"last_access":"2023-08-12T07:02:32.321Z","last_page":"/content/test","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"password":"**********","status":"active"}	\N
51	59	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	{"id":"25f81e5b-9191-4e6d-ad2d-48e294b088be","first_name":null,"last_name":null,"email":"19070691505@189.cn","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","token":null,"last_access":"2023-08-12T07:02:32.321Z","last_page":"/content/test","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"password":"**********","status":"active"}	\N
52	61	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	{"id":"25f81e5b-9191-4e6d-ad2d-48e294b088be","first_name":null,"last_name":null,"email":"19070691505@189.cn","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","token":null,"last_access":"2023-08-13T08:34:49.793Z","last_page":"/content/test","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"password":"**********","status":"active"}	\N
53	69	directus_users	25f81e5b-9191-4e6d-ad2d-48e294b088be	{"id":"25f81e5b-9191-4e6d-ad2d-48e294b088be","first_name":null,"last_name":null,"email":"19070691505@189.cn","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","token":null,"last_access":"2023-08-18T08:53:44.024Z","last_page":"/content/test","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"password":"**********","status":"active"}	\N
54	73	directus_roles	680c4884-0fc1-4a5d-8fe7-fe8050833182	{"id":"680c4884-0fc1-4a5d-8fe7-fe8050833182","name":"User","icon":"supervised_user_circle","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true,"users":["25f81e5b-9191-4e6d-ad2d-48e294b088be"]}	{"name":"User"}	\N
55	74	directus_permissions	28	{"id":28,"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["first_name","last_name","email","password","location","title","description","avatar","language","theme","tfa_secret"]}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["first_name","last_name","email","password","location","title","description","avatar","language","theme","tfa_secret"]}	\N
56	79	directus_permissions	41	{"role":null,"collection":"directus_users","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
57	80	directus_permissions	30	{"id":30,"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"validation":null,"presets":null,"fields":["*"]}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"validation":null,"presets":null,"fields":["*"]}	\N
58	81	directus_permissions	40	{"id":40,"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"delete","permissions":{"_and":[{"id":{"_eq":null}}]},"validation":{},"presets":null,"fields":["*"]}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"delete","permissions":{"_and":[{"id":{"_eq":null}}]},"validation":{},"presets":null,"fields":["*"]}	\N
59	82	directus_permissions	40	{"id":40,"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"delete","permissions":{"_and":[{"id":{"_eq":"$CURRENT_USER"}}]},"validation":{},"presets":null,"fields":["*"]}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"delete","permissions":{"_and":[{"id":{"_eq":"$CURRENT_USER"}}]},"validation":{},"presets":null,"fields":["*"]}	\N
60	83	directus_permissions	42	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"share","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"directus_users","action":"share","fields":["*"],"permissions":{},"validation":{}}	\N
61	84	directus_roles	a176c081-381b-4d62-b0cf-3d2b23ec5552	{"id":"a176c081-381b-4d62-b0cf-3d2b23ec5552","name":"admin","icon":"verified","description":"$t:admin_description","ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":true,"users":["e9e84e21-1ad2-4968-9296-ac5d83baf7ef"]}	{"name":"admin"}	\N
62	85	directus_roles	a176c081-381b-4d62-b0cf-3d2b23ec5552	{"id":"a176c081-381b-4d62-b0cf-3d2b23ec5552","name":"Admin","icon":"verified","description":"$t:admin_description","ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":true,"users":["e9e84e21-1ad2-4968-9296-ac5d83baf7ef"]}	{"name":"Admin"}	\N
64	102	directus_users	f10a59e1-6834-4402-b80d-854c80942948	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
65	105	directus_files	aa4ffc52-6124-43ad-b47c-cd4021d0618e	{"title":"Last","filename_download":"last.png","type":"image/png","storage":"local"}	{"title":"Last","filename_download":"last.png","type":"image/png","storage":"local"}	\N
66	106	directus_fields	2	{"sort":2,"interface":"input","special":null,"collection":"test","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"test","field":"name"}	\N
67	107	directus_fields	3	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"zs"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"zs"}	\N
68	108	directus_collections	zs	{"singleton":false,"collection":"zs"}	{"singleton":false,"collection":"zs"}	\N
69	111	directus_fields	4	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"modules"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"modules"}	\N
70	112	directus_collections	modules	{"singleton":false,"collection":"modules"}	{"singleton":false,"collection":"modules"}	\N
71	113	directus_fields	5	{"sort":2,"interface":"input","special":null,"required":true,"collection":"modules","field":"name"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"modules","field":"name"}	\N
72	114	directus_fields	6	{"sort":3,"interface":"input","special":null,"collection":"modules","field":"index"}	{"sort":3,"interface":"input","special":null,"collection":"modules","field":"index"}	\N
73	115	directus_fields	7	{"sort":4,"interface":"input-multiline","special":null,"required":true,"options":{"trim":true},"collection":"modules","field":"description"}	{"sort":4,"interface":"input-multiline","special":null,"required":true,"options":{"trim":true},"collection":"modules","field":"description"}	\N
74	116	directus_fields	6	{"id":6,"collection":"modules","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"modules","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
75	117	directus_fields	8	{"sort":5,"interface":"input","special":null,"required":true,"collection":"modules","field":"route"}	{"sort":5,"interface":"input","special":null,"required":true,"collection":"modules","field":"route"}	\N
76	118	directus_collections	modules	{"collection":"modules","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"index","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null}	{"sort_field":"index"}	\N
77	119	directus_fields	7	{"id":7,"collection":"modules","field":"description","special":null,"interface":"input-multiline","options":{"trim":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"modules","field":"description","special":null,"interface":"input-multiline","options":{"trim":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
78	120	directus_fields	8	{"id":8,"collection":"modules","field":"route","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"modules","field":"route","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
79	121	modules	1	{"name":"pali","index":0}	{"name":"pali","index":0}	\N
80	122	modules	2	{"name":"grammar","index":1,"description":"The most important thing about grammar books is not popularity or quantity, but quality. Here are the most important grammar books that must be read by any serious Pali student. We will remake these ebooks if possible for a better reading experience.","route":"grammar"}	{"name":"grammar","index":1,"description":"The most important thing about grammar books is not popularity or quantity, but quality. Here are the most important grammar books that must be read by any serious Pali student. We will remake these ebooks if possible for a better reading experience.","route":"grammar"}	\N
81	123	modules	3	{"name":"dictionary","index":2,"description":"These dictionary collections, which you must have for learning Pali, can be used on Goldendict and Eudic. In order to enhance user experience, we have incorporated special fonts and styles in the design.","route":"dictionary"}	{"name":"dictionary","index":2,"description":"These dictionary collections, which you must have for learning Pali, can be used on Goldendict and Eudic. In order to enhance user experience, we have incorporated special fonts and styles in the design.","route":"dictionary"}	\N
82	124	modules	4	{"name":"Vocabulary","index":3,"description":"Study the vocabulary that is important in Buddha's teaching and frequently appears in Tipitaka. We will make this process as easy and comfortable as we can.","route":"vocabulary"}	{"name":"Vocabulary","index":3,"description":"Study the vocabulary that is important in Buddha's teaching and frequently appears in Tipitaka. We will make this process as easy and comfortable as we can.","route":"vocabulary"}	\N
83	125	modules	5	{"description":"These Tipitaka EPUBs, which are made with custom fonts and styles, can provide a comfortable reading experience for you. Due to limitations in the original data, These EPUBs only contain chapters index.","name":"tipitaka","index":4}	{"description":"These Tipitaka EPUBs, which are made with custom fonts and styles, can provide a comfortable reading experience for you. Due to limitations in the original data, These EPUBs only contain chapters index.","name":"tipitaka","index":4}	\N
84	126	modules	5	{"id":5,"name":"tipitaka","index":4,"description":"These Tipitaka EPUBs, which are made with custom fonts and styles, can provide a comfortable reading experience for you. Due to limitations in the original data, These EPUBs only contain chapters index.","route":"tipitaka"}	{"route":"tipitaka"}	\N
85	127	modules	6	{"name":"reading","index":5,"description":"The reading material comes from the most important teachings of Buddha. The analysis is provided in as much detail as possible. We care about the quality, not the quantity.","route":"reading"}	{"name":"reading","index":5,"description":"The reading material comes from the most important teachings of Buddha. The analysis is provided in as much detail as possible. We care about the quality, not the quantity.","route":"reading"}	\N
86	128	modules	7	{"name":"blog","index":6,"description":"Explore experiences and insights from Bante and other Buddhists.","route":"blog"}	{"name":"blog","index":6,"description":"Explore experiences and insights from Bante and other Buddhists.","route":"blog"}	\N
87	129	directus_permissions	44	{"role":null,"collection":"modules","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"modules","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
88	130	directus_permissions	45	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"modules","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"modules","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
89	144	directus_permissions	46	{"role":null,"collection":"modules","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"modules","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
90	154	directus_users	70285e73-f54e-4735-bfa7-5bfa2789358b	{"email":"buddhiko@ox","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"buddhiko@ox","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
91	157	directus_users	791b885f-5daa-46b0-a7e7-eacbf299e5ff	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
92	159	directus_users	791b885f-5daa-46b0-a7e7-eacbf299e5ff	{"id":"791b885f-5daa-46b0-a7e7-eacbf299e5ff","first_name":null,"last_name":null,"email":"19070691505@189.cn","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","token":null,"last_access":"2023-09-13T08:03:03.011Z","last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"password":"**********","status":"active"}	\N
93	162	directus_users	8bbc6bf2-bddc-4475-b6f0-f8c62234a446	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
94	164	directus_users	642cc6f5-8e6f-4316-9fe4-53bc9f342c51	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	{"email":"19070691505@189.cn","role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","status":"invited"}	\N
95	167	directus_fields	8	{"id":8,"collection":"modules","field":"route","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"modules","field":"route","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
96	168	directus_fields	8	{"id":8,"collection":"modules","field":"route","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"modules","field":"route","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
97	169	directus_fields	5	{"id":5,"collection":"modules","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"modules","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
98	170	directus_fields	9	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dictionary"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dictionary"}	\N
99	171	directus_collections	dictionary	{"singleton":false,"collection":"dictionary"}	{"singleton":false,"collection":"dictionary"}	\N
100	172	directus_fields	10	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"name"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"name"}	\N
101	173	directus_fields	11	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"description"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"description"}	\N
102	175	directus_folders	73c9b505-4957-4550-87d3-ccb916dc13ba	{"name":"dictionary"}	{"name":"dictionary"}	\N
103	176	directus_fields	12	{"sort":4,"interface":"file-image","special":["file"],"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"collection":"dictionary","field":"cover"}	{"sort":4,"interface":"file-image","special":["file"],"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"collection":"dictionary","field":"cover"}	\N
104	177	directus_fields	12	{"id":12,"collection":"dictionary","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionary","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
180	259	directus_fields	31	{"sort":8,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"info_url"}	{"sort":8,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"info_url"}	\N
105	178	directus_fields	13	{"sort":5,"interface":"file","special":["file"],"required":true,"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"collection":"dictionary","field":"mdict"}	{"sort":5,"interface":"file","special":["file"],"required":true,"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"collection":"dictionary","field":"mdict"}	\N
106	179	directus_fields	14	{"sort":6,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"download","type":"normal","url":"{{mdict.id}}"}]},"collection":"dictionary","field":"links-3m9yer"}	{"sort":6,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"download","type":"normal","url":"{{mdict.id}}"}]},"collection":"dictionary","field":"links-3m9yer"}	\N
107	180	directus_files	7eb966ec-af55-4021-94c1-9851c8e79466	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dpd","filename_download":"dpd.jpg","type":"image/jpeg","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dpd","filename_download":"dpd.jpg","type":"image/jpeg","storage":"local"}	\N
108	181	directus_files	b4f408d3-0aef-4b95-9d47-999fbd533fa3	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dpd","filename_download":"dpd.zip","type":"application/zip","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dpd","filename_download":"dpd.zip","type":"application/zip","storage":"local"}	\N
110	183	directus_fields	15	{"sort":6,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"index"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"index"}	\N
112	185	directus_files	9ade5fa5-43c7-4634-9bcb-26a459858683	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Ncped","filename_download":"ncped.jpg","type":"image/jpeg","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Ncped","filename_download":"ncped.jpg","type":"image/jpeg","storage":"local"}	\N
113	186	directus_files	a6d4b5e9-6017-4a16-a149-8d25996af740	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Ncped","filename_download":"ncped.zip","type":"application/zip","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Ncped","filename_download":"ncped.zip","type":"application/zip","storage":"local"}	\N
115	188	directus_files	b4f95e59-4665-4d81-b383-17fd770cb1bd	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Pts","filename_download":"pts.jpg","type":"image/jpeg","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Pts","filename_download":"pts.jpg","type":"image/jpeg","storage":"local"}	\N
116	189	directus_files	ed8f89ee-1371-41e2-8ced-b2151e87d6d5	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Pts","filename_download":"pts.zip","type":"application/zip","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Pts","filename_download":"pts.zip","type":"application/zip","storage":"local"}	\N
118	191	directus_files	915cd88c-8383-43fa-998d-9c1c01796985	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dppn","filename_download":"dppn.jpg","type":"image/jpeg","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dppn","filename_download":"dppn.jpg","type":"image/jpeg","storage":"local"}	\N
119	192	directus_files	666c2fca-6240-40cc-a206-5fd5bd00824f	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dppn","filename_download":"dppn.zip","type":"application/zip","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Dppn","filename_download":"dppn.zip","type":"application/zip","storage":"local"}	\N
121	194	directus_files	b6b7a635-bfd3-4a03-8ee1-d556f8337fba	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Abbr","filename_download":"abbr.jpg","type":"image/jpeg","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Abbr","filename_download":"abbr.jpg","type":"image/jpeg","storage":"local"}	\N
122	195	directus_files	0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Abbr","filename_download":"abbr.zip","type":"application/zip","storage":"local"}	{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba","title":"Abbr","filename_download":"abbr.zip","type":"application/zip","storage":"local"}	\N
124	197	directus_fields	16	{"sort":7,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"abbreviation"}	{"sort":7,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"abbreviation"}	\N
130	203	directus_fields	17	{"sort":8,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"download","type":"normal","url":"{{mdict}}"}]},"collection":"dictionary","field":"links-inhsuh"}	{"sort":8,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"download","type":"normal","url":"{{mdict}}"}]},"collection":"dictionary","field":"links-inhsuh"}	\N
131	204	directus_fields	18	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dict_summary"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dict_summary"}	\N
132	205	directus_collections	dict_summary	{"singleton":true,"collection":"dict_summary"}	{"singleton":true,"collection":"dict_summary"}	\N
133	206	directus_fields	19	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dict_summary","field":"title"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dict_summary","field":"title"}	\N
134	207	directus_fields	20	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dict_summary","field":"text"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dict_summary","field":"text"}	\N
136	209	directus_fields	21	{"sort":8,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"info","type":"normal","url":"https://github.com/buddhiko1/pali-mdict"}]},"collection":"dictionary","field":"links-j3viii"}	{"sort":8,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"info","type":"normal","url":"https://github.com/buddhiko1/pali-mdict"}]},"collection":"dictionary","field":"links-j3viii"}	\N
137	210	directus_fields	22	{"sort":8,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"info_url"}	{"sort":8,"interface":"input","special":null,"required":true,"collection":"dictionary","field":"info_url"}	\N
159	238	directus_fields	29	{"id":29,"collection":"dictionaries","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"cover","sort":6,"group":null}	\N
143	216	directus_permissions	47	{"role":null,"collection":"dictionary","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"dictionary","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
144	217	directus_permissions	48	{"role":null,"collection":"dict_summary","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"dict_summary","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
145	224	directus_fields	23	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dictionaries"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dictionaries"}	\N
146	225	directus_collections	dictionaries	{"singleton":false,"collection":"dictionaries"}	{"singleton":false,"collection":"dictionaries"}	\N
147	226	directus_fields	24	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"name"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"name"}	\N
148	227	directus_fields	25	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"index"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"index"}	\N
149	228	directus_fields	26	{"sort":4,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"description"}	{"sort":4,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"description"}	\N
150	229	directus_fields	27	{"sort":5,"interface":"file-image","special":["file"],"required":true,"collection":"dictionaries","field":"cover"}	{"sort":5,"interface":"file-image","special":["file"],"required":true,"collection":"dictionaries","field":"cover"}	\N
151	230	directus_fields	28	{"sort":6,"interface":"file","special":["file"],"required":true,"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"collection":"dictionaries","field":"zip"}	{"sort":6,"interface":"file","special":["file"],"required":true,"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"collection":"dictionaries","field":"zip"}	\N
152	231	directus_fields	29	{"sort":7,"interface":"file-image","special":["file"],"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"required":true,"collection":"dictionaries","field":"cover"}	{"sort":7,"interface":"file-image","special":["file"],"options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"required":true,"collection":"dictionaries","field":"cover"}	\N
153	232	directus_fields	30	{"sort":8,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"abbreviation"}	{"sort":8,"interface":"input","special":null,"required":true,"collection":"dictionaries","field":"abbreviation"}	\N
154	233	directus_fields	23	{"id":23,"collection":"dictionaries","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"id","sort":1,"group":null}	\N
155	234	directus_fields	25	{"id":25,"collection":"dictionaries","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"index","sort":2,"group":null}	\N
156	235	directus_fields	24	{"id":24,"collection":"dictionaries","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"name","sort":3,"group":null}	\N
157	236	directus_fields	26	{"id":26,"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"description","sort":4,"group":null}	\N
158	237	directus_fields	28	{"id":28,"collection":"dictionaries","field":"zip","special":["file"],"interface":"file","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"zip","sort":5,"group":null}	\N
160	239	directus_fields	30	{"id":30,"collection":"dictionaries","field":"abbreviation","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"abbreviation","sort":7,"group":null}	\N
168	247	directus_fields	23	{"id":23,"collection":"dictionaries","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"id","sort":1,"group":null}	\N
169	248	directus_fields	25	{"id":25,"collection":"dictionaries","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"index","sort":2,"group":null}	\N
170	249	directus_fields	24	{"id":24,"collection":"dictionaries","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"name","sort":3,"group":null}	\N
171	250	directus_fields	30	{"id":30,"collection":"dictionaries","field":"abbreviation","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"abbreviation","sort":4,"group":null}	\N
172	251	directus_fields	26	{"id":26,"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"description","sort":5,"group":null}	\N
173	252	directus_fields	29	{"id":29,"collection":"dictionaries","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"cover","sort":6,"group":null}	\N
174	253	directus_fields	28	{"id":28,"collection":"dictionaries","field":"zip","special":["file"],"interface":"file","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"zip","sort":7,"group":null}	\N
161	240	directus_fields	23	{"id":23,"collection":"dictionaries","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"id","sort":1,"group":null}	\N
162	241	directus_fields	25	{"id":25,"collection":"dictionaries","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"index","sort":2,"group":null}	\N
163	242	directus_fields	24	{"id":24,"collection":"dictionaries","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"name","sort":3,"group":null}	\N
164	243	directus_fields	30	{"id":30,"collection":"dictionaries","field":"abbreviation","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"abbreviation","sort":4,"group":null}	\N
165	244	directus_fields	26	{"id":26,"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"description","sort":5,"group":null}	\N
166	245	directus_fields	28	{"id":28,"collection":"dictionaries","field":"zip","special":["file"],"interface":"file","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"zip","sort":6,"group":null}	\N
167	246	directus_fields	29	{"id":29,"collection":"dictionaries","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"cover","sort":7,"group":null}	\N
175	254	dictionaries	1	{"index":1,"name":"Digital Pali Dictionary","abbreviation":"dpd","description":"DPD is a feature-rich Pali-English dictionary which runs in GoldenDict, or any other application that supports the Stardict format. DPD contains five different dictionaries:Pali to English Dictionary,Pali Roots Dictionary,English to Pali Dictionary,Compound Deconstruction Dictionary, and Abbreviations and Help Dictionary.DPD recognises 1.1 million unique inflected forms of Pali words.","cover":"7eb966ec-af55-4021-94c1-9851c8e79466","zip":"b4f408d3-0aef-4b95-9d47-999fbd533fa3"}	{"index":1,"name":"Digital Pali Dictionary","abbreviation":"dpd","description":"DPD is a feature-rich Pali-English dictionary which runs in GoldenDict, or any other application that supports the Stardict format. DPD contains five different dictionaries:Pali to English Dictionary,Pali Roots Dictionary,English to Pali Dictionary,Compound Deconstruction Dictionary, and Abbreviations and Help Dictionary.DPD recognises 1.1 million unique inflected forms of Pali words.","cover":"7eb966ec-af55-4021-94c1-9851c8e79466","zip":"b4f408d3-0aef-4b95-9d47-999fbd533fa3"}	\N
176	255	dictionaries	2	{"index":2,"name":"The Pali Text Society's Pali-English Dictionary","abbreviation":"pts","description":"This work has been selected by scholars as being culturally important, and is part of the knowledge base of civilization as we know it. This work was reproduced from the original artifact, and remains as true to the original work as possible. Therefore, you will see the original copyright references, library stamps (as most of these works have been housed in our most important libraries around the world), and other notations in the work.","cover":"b4f95e59-4665-4d81-b383-17fd770cb1bd","zip":"ed8f89ee-1371-41e2-8ced-b2151e87d6d5"}	{"index":2,"name":"The Pali Text Society's Pali-English Dictionary","abbreviation":"pts","description":"This work has been selected by scholars as being culturally important, and is part of the knowledge base of civilization as we know it. This work was reproduced from the original artifact, and remains as true to the original work as possible. Therefore, you will see the original copyright references, library stamps (as most of these works have been housed in our most important libraries around the world), and other notations in the work.","cover":"b4f95e59-4665-4d81-b383-17fd770cb1bd","zip":"ed8f89ee-1371-41e2-8ced-b2151e87d6d5"}	\N
177	256	dictionaries	3	{"index":3,"name":"New Concise Pali-English Dictionary","abbreviation":"ncped","description":"This Concise Pali-English Dictionary has been prepared mainly for use by students in schools and colleges. The author is not only an eminent Elder of the Buddhist Order but one of the leading Pali scholars recognized both in the East and the West as an authority on the subject. His experience as a teacher and as a writer of textbooks made him admirably suited for the undertaking.","cover":"9ade5fa5-43c7-4634-9bcb-26a459858683","zip":"a6d4b5e9-6017-4a16-a149-8d25996af740"}	{"index":3,"name":"New Concise Pali-English Dictionary","abbreviation":"ncped","description":"This Concise Pali-English Dictionary has been prepared mainly for use by students in schools and colleges. The author is not only an eminent Elder of the Buddhist Order but one of the leading Pali scholars recognized both in the East and the West as an authority on the subject. His experience as a teacher and as a writer of textbooks made him admirably suited for the undertaking.","cover":"9ade5fa5-43c7-4634-9bcb-26a459858683","zip":"a6d4b5e9-6017-4a16-a149-8d25996af740"}	\N
178	257	dictionaries	4	{"index":4,"name":"Dictionary Of Pali Proper Names","abbreviation":"dppn","description":"Dictionary of Pali Proper Names is a work of erudition. The author has collected a vast number of entries from Pali canonocal and non-canonical literature on the proper names to make it his magnum opus. It is an indispensable tool for the study of Buddhism.","cover":"915cd88c-8383-43fa-998d-9c1c01796985","zip":"666c2fca-6240-40cc-a206-5fd5bd00824f"}	{"index":4,"name":"Dictionary Of Pali Proper Names","abbreviation":"dppn","description":"Dictionary of Pali Proper Names is a work of erudition. The author has collected a vast number of entries from Pali canonocal and non-canonical literature on the proper names to make it his magnum opus. It is an indispensable tool for the study of Buddhism.","cover":"915cd88c-8383-43fa-998d-9c1c01796985","zip":"666c2fca-6240-40cc-a206-5fd5bd00824f"}	\N
179	258	dictionaries	5	{"index":5,"name":"Dictionary Of Abbreviation","abbreviation":"abbr","description":"This dictionary is used to explain the abbreviations of book titles and grammatical terms that abound in the dictionary entries.","cover":"b6b7a635-bfd3-4a03-8ee1-d556f8337fba","zip":"0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3"}	{"index":5,"name":"Dictionary Of Abbreviation","abbreviation":"abbr","description":"This dictionary is used to explain the abbreviations of book titles and grammatical terms that abound in the dictionary entries.","cover":"b6b7a635-bfd3-4a03-8ee1-d556f8337fba","zip":"0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3"}	\N
181	260	dictionaries	1	{"id":1,"name":"Digital Pali Dictionary","index":1,"description":"DPD is a feature-rich Pali-English dictionary which runs in GoldenDict, or any other application that supports the Stardict format. DPD contains five different dictionaries:Pali to English Dictionary,Pali Roots Dictionary,English to Pali Dictionary,Compound Deconstruction Dictionary, and Abbreviations and Help Dictionary.DPD recognises 1.1 million unique inflected forms of Pali words.","zip":"b4f408d3-0aef-4b95-9d47-999fbd533fa3","cover":"7eb966ec-af55-4021-94c1-9851c8e79466","abbreviation":"dpd","info_url":"https://digitalpalidictionary.github.io"}	{"info_url":"https://digitalpalidictionary.github.io"}	\N
182	261	dictionaries	2	{"id":2,"name":"The Pali Text Society's Pali-English Dictionary","index":2,"description":"This work has been selected by scholars as being culturally important, and is part of the knowledge base of civilization as we know it. This work was reproduced from the original artifact, and remains as true to the original work as possible. Therefore, you will see the original copyright references, library stamps (as most of these works have been housed in our most important libraries around the world), and other notations in the work.","zip":"ed8f89ee-1371-41e2-8ced-b2151e87d6d5","cover":"b4f95e59-4665-4d81-b383-17fd770cb1bd","abbreviation":"pts","info_url":"https://github.com/buddhiko1/pali-mdict"}	{"info_url":"https://github.com/buddhiko1/pali-mdict"}	\N
183	262	dictionaries	3	{"id":3,"name":"New Concise Pali-English Dictionary","index":3,"description":"This Concise Pali-English Dictionary has been prepared mainly for use by students in schools and colleges. The author is not only an eminent Elder of the Buddhist Order but one of the leading Pali scholars recognized both in the East and the West as an authority on the subject. His experience as a teacher and as a writer of textbooks made him admirably suited for the undertaking.","zip":"a6d4b5e9-6017-4a16-a149-8d25996af740","cover":"9ade5fa5-43c7-4634-9bcb-26a459858683","abbreviation":"ncped","info_url":"https://github.com/buddhiko1/pali-mdict"}	{"info_url":"https://github.com/buddhiko1/pali-mdict"}	\N
184	263	dictionaries	4	{"id":4,"name":"Dictionary Of Pali Proper Names","index":4,"description":"Dictionary of Pali Proper Names is a work of erudition. The author has collected a vast number of entries from Pali canonocal and non-canonical literature on the proper names to make it his magnum opus. It is an indispensable tool for the study of Buddhism.","zip":"666c2fca-6240-40cc-a206-5fd5bd00824f","cover":"915cd88c-8383-43fa-998d-9c1c01796985","abbreviation":"dppn","info_url":"https://github.com/buddhiko1/pali-mdict"}	{"info_url":"https://github.com/buddhiko1/pali-mdict"}	\N
185	264	dictionaries	5	{"id":5,"name":"Dictionary Of Abbreviation","index":5,"description":"This dictionary is used to explain the abbreviations of book titles and grammatical terms that abound in the dictionary entries.","zip":"0a3b0b4e-d0e2-4e95-a8ca-bde8d7e40bb3","cover":"b6b7a635-bfd3-4a03-8ee1-d556f8337fba","abbreviation":"abbr","info_url":"https://github.com/buddhiko1/pali-mdict"}	{"info_url":"https://github.com/buddhiko1/pali-mdict"}	\N
186	265	directus_fields	31	{"id":31,"collection":"dictionaries","field":"info_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"info_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
187	266	directus_fields	28	{"id":28,"collection":"dictionaries","field":"zip","special":["file"],"interface":"file","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"zip","special":["file"],"interface":"file","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
188	267	directus_fields	29	{"id":29,"collection":"dictionaries","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
189	268	directus_fields	26	{"id":26,"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
190	269	directus_fields	26	{"id":26,"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
191	270	directus_fields	25	{"id":25,"collection":"dictionaries","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
193	272	directus_fields	24	{"id":24,"collection":"dictionaries","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
194	273	directus_permissions	49	{"role":null,"collection":"dictionaries","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"dictionaries","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
192	271	directus_fields	30	{"id":30,"collection":"dictionaries","field":"abbreviation","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"abbreviation","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
195	274	directus_permissions	50	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"dictionaries","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"dictionaries","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
196	275	directus_permissions	51	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"dict_summary","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"dict_summary","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
197	277	directus_fields	32	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dict_introduction"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"dict_introduction"}	\N
198	278	directus_collections	dict_introduction	{"singleton":true,"collection":"dict_introduction"}	{"singleton":true,"collection":"dict_introduction"}	\N
199	279	directus_fields	33	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dict_introduction","field":"title"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"dict_introduction","field":"title"}	\N
200	280	directus_fields	34	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dict_introduction","field":"text"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"dict_introduction","field":"text"}	\N
201	281	directus_fields	33	{"id":33,"collection":"dict_introduction","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dict_introduction","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
202	282	directus_fields	34	{"id":34,"collection":"dict_introduction","field":"text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dict_introduction","field":"text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
203	283	directus_fields	26	{"id":26,"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"description","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
204	284	directus_permissions	52	{"role":null,"collection":"dict_introduction","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"dict_introduction","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
205	285	directus_permissions	53	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"dict_introduction","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"680c4884-0fc1-4a5d-8fe7-fe8050833182","collection":"dict_introduction","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
206	286	dictionaries	1	{"id":1,"name":"Digital Pali Dictionary","index":1,"description":"DPD is a feature-rich Pali-English dictionary which runs in GoldenDict,or any other application that supports the Stardict format. DPD contains five different dictionaries:<i>Pali to English Dictionary</i>,<i>Pali Roots Dictionary</i>,<i>English to Pali Dictionary</i>,<i>Compound Deconstruction Dictionary</i>, and <i>Abbreviations and Help Dictionary</i>.DPD recognises <strong>1.1 million</strong> unique inflected forms of Pali words.","zip":"b4f408d3-0aef-4b95-9d47-999fbd533fa3","cover":"7eb966ec-af55-4021-94c1-9851c8e79466","abbreviation":"dpd","info_url":"https://digitalpalidictionary.github.io"}	{"description":"DPD is a feature-rich Pali-English dictionary which runs in GoldenDict,or any other application that supports the Stardict format. DPD contains five different dictionaries:<i>Pali to English Dictionary</i>,<i>Pali Roots Dictionary</i>,<i>English to Pali Dictionary</i>,<i>Compound Deconstruction Dictionary</i>, and <i>Abbreviations and Help Dictionary</i>.DPD recognises <strong>1.1 million</strong> unique inflected forms of Pali words."}	\N
207	287	directus_fields	33	{"id":33,"collection":"dict_introduction","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dict_introduction","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
208	288	dict_introduction	1	{"title":"Pali Dictionary","text":"The following dictionaries can meet the needs of learning Pali. Inparticular, the comprehensive dictionary <strong>Digital Pali Dictionary</strong>, which has a large thesaurus and detailed explanations, is a must-have. Other dictionaries are provided as supplements for people with specific needs."}	{"title":"Pali Dictionary","text":"The following dictionaries can meet the needs of learning Pali. Inparticular, the comprehensive dictionary <strong>Digital Pali Dictionary</strong>, which has a large thesaurus and detailed explanations, is a must-have. Other dictionaries are provided as supplements for people with specific needs."}	\N
209	289	directus_fields	30	{"id":30,"collection":"dictionaries","field":"abbreviation","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"abbreviation","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
210	290	directus_fields	29	{"id":29,"collection":"dictionaries","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"cover","special":["file"],"interface":"file-image","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
211	291	directus_fields	28	{"id":28,"collection":"dictionaries","field":"zip","special":["file"],"interface":"file","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dictionaries","field":"zip","special":["file"],"interface":"file","options":{"folder":"73c9b505-4957-4550-87d3-ccb916dc13ba"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
212	292	directus_permissions	54	{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
213	293	directus_permissions	55	{"role":null,"collection":"directus_folders","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_folders","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
214	295	directus_permissions	56	{"role":null,"collection":"directus_folders","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_folders","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
215	297	dict_introduction	1	{"id":1,"title":"Pali Dictionary","text":"The following dictionaries can meet the needs of learning Pali. Inparticular, the comprehensive dictionary <strong>Digital Pali Dictionary</swtrong>, which has a large thesaurus and detailed explanations, is a must-have. Other dictionaries are provided as supplements for people with specific needs."}	{"text":"The following dictionaries can meet the needs of learning Pali. Inparticular, the comprehensive dictionary <strong>Digital Pali Dictionary</swtrong>, which has a large thesaurus and detailed explanations, is a must-have. Other dictionaries are provided as supplements for people with specific needs."}	\N
216	298	directus_fields	33	{"id":33,"collection":"dict_introduction","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"dict_introduction","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
217	299	dict_introduction	1	{"id":1,"title":"Pali Dictionary","text":"The following dictionaries can meet the needs of learning Pali. Inparticular, the comprehensive dictionary <strong>Digital Pali Dictionary</strong>, which has a large thesaurus and detailed explanations, is a must-have. Other dictionaries are provided as supplements for people with specific needs."}	{"text":"The following dictionaries can meet the needs of learning Pali. Inparticular, the comprehensive dictionary <strong>Digital Pali Dictionary</strong>, which has a large thesaurus and detailed explanations, is a must-have. Other dictionaries are provided as supplements for people with specific needs."}	\N
218	300	directus_fields	35	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"tipitaka"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"tipitaka"}	\N
219	301	directus_collections	tipitaka	{"singleton":false,"collection":"tipitaka"}	{"singleton":false,"collection":"tipitaka"}	\N
220	302	directus_fields	36	{"sort":2,"interface":"input","special":null,"required":true,"collection":"tipitaka","field":"name"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"tipitaka","field":"name"}	\N
221	303	directus_fields	37	{"sort":3,"interface":"input","special":null,"required":true,"collection":"tipitaka","field":"info_url"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"tipitaka","field":"info_url"}	\N
222	304	directus_fields	38	{"sort":4,"interface":"file-image","special":["file"],"required":true,"collection":"tipitaka","field":"cover"}	{"sort":4,"interface":"file-image","special":["file"],"required":true,"collection":"tipitaka","field":"cover"}	\N
223	305	directus_folders	94a901e7-5881-427d-939c-23d29dbf2db6	{"name":"tipitaka"}	{"name":"tipitaka"}	\N
224	306	directus_fields	39	{"sort":5,"interface":"file","special":["file"],"required":true,"options":{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6"},"collection":"tipitaka","field":"zip"}	{"sort":5,"interface":"file","special":["file"],"required":true,"options":{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6"},"collection":"tipitaka","field":"zip"}	\N
225	307	directus_fields	36	{"id":36,"collection":"tipitaka","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"tipitaka","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
226	308	directus_fields	38	{"id":38,"collection":"tipitaka","field":"cover","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"tipitaka","field":"cover","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
227	309	directus_fields	39	{"id":39,"collection":"tipitaka","field":"zip","special":["file"],"interface":"file","options":{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"tipitaka","field":"zip","special":["file"],"interface":"file","options":{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
228	310	directus_files	9b3bc4a4-996e-49ad-a59d-647f8d41513d	{"title":"Sutta","filename_download":"sutta.jpg","type":"image/jpeg","storage":"local"}	{"title":"Sutta","filename_download":"sutta.jpg","type":"image/jpeg","storage":"local"}	\N
229	311	directus_files	7fde8ccf-b0ab-4b01-92e9-6815b97e22fc	{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6","title":"Sutta","filename_download":"sutta.zip","type":"application/zip","storage":"local"}	{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6","title":"Sutta","filename_download":"sutta.zip","type":"application/zip","storage":"local"}	\N
230	312	tipitaka	1	{"name":"sutta","info_url":"https://github.com/buddhiko1/pali-epub","cover":"9b3bc4a4-996e-49ad-a59d-647f8d41513d","zip":"7fde8ccf-b0ab-4b01-92e9-6815b97e22fc"}	{"name":"sutta","info_url":"https://github.com/buddhiko1/pali-epub","cover":"9b3bc4a4-996e-49ad-a59d-647f8d41513d","zip":"7fde8ccf-b0ab-4b01-92e9-6815b97e22fc"}	\N
231	313	directus_files	113af081-3936-48cd-9550-18ec84745753	{"title":"Vinaya","filename_download":"vinaya.jpg","type":"image/jpeg","storage":"local"}	{"title":"Vinaya","filename_download":"vinaya.jpg","type":"image/jpeg","storage":"local"}	\N
232	314	directus_files	ad12ba7b-5684-4b50-baa4-0cfe13cbeabb	{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6","title":"Vinaya","filename_download":"vinaya.zip","type":"application/zip","storage":"local"}	{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6","title":"Vinaya","filename_download":"vinaya.zip","type":"application/zip","storage":"local"}	\N
233	315	tipitaka	2	{"name":"vinaya","info_url":"https://github.com/buddhiko1/pali-epub","cover":"113af081-3936-48cd-9550-18ec84745753","zip":"ad12ba7b-5684-4b50-baa4-0cfe13cbeabb"}	{"name":"vinaya","info_url":"https://github.com/buddhiko1/pali-epub","cover":"113af081-3936-48cd-9550-18ec84745753","zip":"ad12ba7b-5684-4b50-baa4-0cfe13cbeabb"}	\N
234	316	directus_files	e786dd33-13fd-480c-8470-7b5ba8eb2228	{"title":"Abhidhamma","filename_download":"abhidhamma.jpg","type":"image/jpeg","storage":"local"}	{"title":"Abhidhamma","filename_download":"abhidhamma.jpg","type":"image/jpeg","storage":"local"}	\N
235	317	directus_files	614c793e-3ede-44c2-991e-bd8b7afd125b	{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6","title":"Abhidhamma","filename_download":"abhidhamma.zip","type":"application/zip","storage":"local"}	{"folder":"94a901e7-5881-427d-939c-23d29dbf2db6","title":"Abhidhamma","filename_download":"abhidhamma.zip","type":"application/zip","storage":"local"}	\N
236	318	tipitaka	3	{"name":"abhidhamma","info_url":"https://github.com/buddhiko1/pali-epub","cover":"e786dd33-13fd-480c-8470-7b5ba8eb2228","zip":"614c793e-3ede-44c2-991e-bd8b7afd125b"}	{"name":"abhidhamma","info_url":"https://github.com/buddhiko1/pali-epub","cover":"e786dd33-13fd-480c-8470-7b5ba8eb2228","zip":"614c793e-3ede-44c2-991e-bd8b7afd125b"}	\N
237	319	directus_fields	40	{"sort":6,"interface":"input","special":null,"required":true,"collection":"tipitaka","field":"index"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"tipitaka","field":"index"}	\N
238	320	tipitaka	1	{"id":1,"name":"sutta","info_url":"https://github.com/buddhiko1/pali-epub","cover":"9b3bc4a4-996e-49ad-a59d-647f8d41513d","zip":"7fde8ccf-b0ab-4b01-92e9-6815b97e22fc","index":1}	{"index":1}	\N
239	321	tipitaka	2	{"id":2,"name":"vinaya","info_url":"https://github.com/buddhiko1/pali-epub","cover":"113af081-3936-48cd-9550-18ec84745753","zip":"ad12ba7b-5684-4b50-baa4-0cfe13cbeabb","index":2}	{"index":2}	\N
240	322	tipitaka	3	{"id":3,"name":"abhidhamma","info_url":"https://github.com/buddhiko1/pali-epub","cover":"e786dd33-13fd-480c-8470-7b5ba8eb2228","zip":"614c793e-3ede-44c2-991e-bd8b7afd125b","index":3}	{"index":3}	\N
241	323	directus_fields	40	{"id":40,"collection":"tipitaka","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"tipitaka","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
242	324	directus_collections	tipitaka	{"collection":"tipitaka","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"index","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null}	{"sort_field":"index"}	\N
243	325	directus_permissions	57	{"role":null,"collection":"tipitaka","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"tipitaka","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
244	326	directus_fields	41	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"cites"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"cites"}	\N
245	327	directus_collections	cites	{"singleton":false,"collection":"cites"}	{"singleton":false,"collection":"cites"}	\N
246	328	directus_fields	42	{"sort":2,"interface":"input","special":null,"required":true,"collection":"cites","field":"index"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"cites","field":"index"}	\N
247	329	directus_fields	43	{"sort":3,"interface":"input","special":null,"required":true,"collection":"cites","field":"frome"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"cites","field":"frome"}	\N
248	330	directus_fields	44	{"sort":4,"interface":"input-multiline","special":null,"required":true,"collection":"cites","field":"text"}	{"sort":4,"interface":"input-multiline","special":null,"required":true,"collection":"cites","field":"text"}	\N
249	331	directus_fields	42	{"id":42,"collection":"cites","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"cites","field":"index","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
251	333	directus_fields	44	{"id":44,"collection":"cites","field":"text","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"cites","field":"text","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
252	334	directus_fields	45	{"sort":5,"interface":"input","special":null,"required":true,"collection":"cites","field":"auth"}	{"sort":5,"interface":"input","special":null,"required":true,"collection":"cites","field":"auth"}	\N
253	335	directus_fields	46	{"sort":5,"interface":"input","special":null,"required":true,"collection":"cites","field":"author"}	{"sort":5,"interface":"input","special":null,"required":true,"collection":"cites","field":"author"}	\N
255	337	directus_fields	46	{"id":46,"collection":"cites","field":"author","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"cites","field":"author","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
257	339	directus_permissions	58	{"role":null,"collection":"cites","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"cites","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
258	340	cites	1	{"index":1,"text":"These books of the Pali Canon correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\\n","author":"BHANTE ÑĀṆAVĪRA","author_url":"https://www.nanavira.org/"}	{"index":1,"text":"These books of the Pali Canon correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\\n","author":"BHANTE ÑĀṆAVĪRA","author_url":"https://www.nanavira.org/"}	\N
261	343	cites	2	{"id":2,"index":1,"text":"It was necessary for a monk to spend time to learn the language of Pāli. The Suttas are written in Pāli and, in order to avoid being misled by imperfect translations, it is better to read them in their original language. One could feel much closer to the Buddha if one reads his discourses in Pāli – “one could almost hear the Buddha’s voice.” Pāli has a deep connection with the ancient world of dhamma.","author":"BHANTE ÑĀṆADĪPA","author_url":"https://pathpress.org/the-island-within/"}	{"index":1}	\N
250	332	directus_fields	43	{"id":43,"collection":"cites","field":"frome","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"cites","field":"frome","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
254	336	directus_fields	47	{"sort":6,"interface":"input","special":null,"required":true,"collection":"cites","field":"author_url"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"cites","field":"author_url"}	\N
256	338	directus_fields	47	{"id":47,"collection":"cites","field":"author_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"cites","field":"author_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
259	341	cites	2	{"index":2,"text":"It was necessary for a monk to spend time to learn the language of Pāli. The Suttas are written in Pāli and, in order to avoid being misled by imperfect translations, it is better to read them in their original language. One could feel much closer to the Buddha if one reads his discourses in Pāli – “one could almost hear the Buddha’s voice.” Pāli has a deep connection with the ancient world of dhamma.","author":"BHANTE ÑĀṆADĪPA","author_url":"https://pathpress.org/the-island-within/"}	{"index":2,"text":"It was necessary for a monk to spend time to learn the language of Pāli. The Suttas are written in Pāli and, in order to avoid being misled by imperfect translations, it is better to read them in their original language. One could feel much closer to the Buddha if one reads his discourses in Pāli – “one could almost hear the Buddha’s voice.” Pāli has a deep connection with the ancient world of dhamma.","author":"BHANTE ÑĀṆADĪPA","author_url":"https://pathpress.org/the-island-within/"}	\N
260	342	cites	1	{"id":1,"index":2,"text":"These books of the Pali Canon correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\\n","author":"BHANTE ÑĀṆAVĪRA","author_url":"https://www.nanavira.org/"}	{"index":2}	\N
262	344	cites	1	{"id":1,"index":2,"text":"These books correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\\n","author":"BHANTE ÑĀṆAVĪRA","author_url":"https://www.nanavira.org/"}	{"text":"These books correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\\n"}	\N
263	345	cites	1	{"id":1,"index":2,"text":"These books of the Pali Canon correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\\n","author":"BHANTE ÑĀṆAVĪRA","author_url":"https://www.nanavira.org/"}	{"text":"These books of the Pali Canon correctly represent the Buddhaʼs Teachings and can be regarded as trustworthy throughout. (Vinayapiṭaka:)Suttavibhaṅga, Mahāvagga, Cūḷavagga; (Suttapiṭaka:) Dīghanikāya,Majjhimanikāya, Saṃyuttanikāya, Aṅguttaranikāya, Suttanipāta,Dhammapada, Udāna, Itivuttaka, Theratherīgāthā. No other Pali books whatsoever should be taken as authoritative; and ignorance of them (and particularly of the traditional Commentaries) may be counted as a positive advantage, as leaving less to be unlearned.\\n"}	\N
264	350	directus_files	cc4be113-7c87-4ca2-812c-744d165a689b	{"title":"Test","filename_download":"test.jpg","type":"image/jpeg","storage":"local"}	{"title":"Test","filename_download":"test.jpg","type":"image/jpeg","storage":"local"}	\N
265	351	directus_users	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	{"id":"e9e84e21-1ad2-4968-9296-ac5d83baf7ef","first_name":"Admin","last_name":"User","email":"buddhiko@outlook.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":"cc4be113-7c87-4ca2-812c-744d165a689b","language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"a176c081-381b-4d62-b0cf-3d2b23ec5552","token":"**********","last_access":"2023-09-27T08:19:58.793Z","last_page":"/users/e9e84e21-1ad2-4968-9296-ac5d83baf7ef","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"avatar":"cc4be113-7c87-4ca2-812c-744d165a689b"}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
680c4884-0fc1-4a5d-8fe7-fe8050833182	User	supervised_user_circle	\N	\N	f	f	t
a176c081-381b-4d62-b0cf-3d2b23ec5552	Admin	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
QClCL14WtWZ9xY0tnoONIPPhc5hiplG24iEOYVF4dF-slLI_Z3tC9RHp4cS77fpY	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-10-31 00:05:47.005+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	\N	http://localhost:9000
KMpImH-j2ymKP5UYyZmSBCqA6Pbve8hC39bJJIANwFBh2oL6noUuHpxUkXhsxqWT	e9e84e21-1ad2-4968-9296-ac5d83baf7ef	2023-11-01 09:09:07.422+00	172.22.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	\N	http://localhost:9000
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios) FROM stdin;
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM stdin;
e9e84e21-1ad2-4968-9296-ac5d83baf7ef	Admin	User	buddhiko@outlook.com	$argon2id$v=19$m=65536,t=3,p=4$lfpN/ic9kNWvTno5jyBTnQ$E0AgGYexlvIiakDLW0iwGyMfFmx1cMMuiIUrDjITdes	\N	\N	\N	\N	cc4be113-7c87-4ca2-812c-744d165a689b	\N	auto	\N	active	a176c081-381b-4d62-b0cf-3d2b23ec5552	SwZVWhOBmlaVZZ1P3rNmd1BnfKirayNg	2023-10-25 09:09:07.425+00	/settings/data-model	default	\N	\N	t
642cc6f5-8e6f-4316-9fe4-53bc9f342c51	\N	\N	19070691505@189.cn	$argon2id$v=19$m=65536,t=3,p=4$cEvnD9REOwI0c3CYnnRtng$eSn6cG1YfKyYOodyYBr++YBQd9h4wgitbNqGDl8vmEQ	\N	\N	\N	\N	\N	\N	auto	\N	active	680c4884-0fc1-4a5d-8fe7-fe8050833182	\N	2023-09-13 08:22:09.109+00	\N	default	\N	\N	t
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.modules (id, name, index, description, route) FROM stdin;
2	grammar	1	The most important thing about grammar books is not popularity or quantity, but quality. Here are the most important grammar books that must be read by any serious Pali student. We will remake these ebooks if possible for a better reading experience.	grammar
3	dictionary	2	These dictionary collections, which you must have for learning Pali, can be used on Goldendict and Eudic. In order to enhance user experience, we have incorporated special fonts and styles in the design.	dictionary
4	Vocabulary	3	Study the vocabulary that is important in Buddha's teaching and frequently appears in Tipitaka. We will make this process as easy and comfortable as we can.	vocabulary
5	tipitaka	4	These Tipitaka EPUBs, which are made with custom fonts and styles, can provide a comfortable reading experience for you. Due to limitations in the original data, These EPUBs only contain chapters index.	tipitaka
6	reading	5	The reading material comes from the most important teachings of Buddha. The analysis is provided in as much detail as possible. We care about the quality, not the quantity.	reading
7	blog	6	Explore experiences and insights from Bante and other Buddhists.	blog
\.


--
-- Data for Name: tipitaka; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipitaka (id, name, info_url, cover, zip, index) FROM stdin;
1	sutta	https://github.com/buddhiko1/pali-epub	9b3bc4a4-996e-49ad-a59d-647f8d41513d	7fde8ccf-b0ab-4b01-92e9-6815b97e22fc	1
2	vinaya	https://github.com/buddhiko1/pali-epub	113af081-3936-48cd-9550-18ec84745753	ad12ba7b-5684-4b50-baa4-0cfe13cbeabb	2
3	abhidhamma	https://github.com/buddhiko1/pali-epub	e786dd33-13fd-480c-8470-7b5ba8eb2228	614c793e-3ede-44c2-991e-bd8b7afd125b	3
\.


--
-- Name: cites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cites_id_seq', 2, true);


--
-- Name: dict_introduction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dict_introduction_id_seq', 1, true);


--
-- Name: dictionaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dictionaries_id_seq', 5, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 360, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 47, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 58, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 11, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 7, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 265, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.modules_id_seq', 7, true);


--
-- Name: tipitaka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipitaka_id_seq', 3, true);


--
-- Name: cites cites_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cites
    ADD CONSTRAINT cites_pkey PRIMARY KEY (id);


--
-- Name: dict_introduction dict_introduction_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dict_introduction
    ADD CONSTRAINT dict_introduction_pkey PRIMARY KEY (id);


--
-- Name: dictionaries dictionaries_index_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dictionaries
    ADD CONSTRAINT dictionaries_index_unique UNIQUE (index);


--
-- Name: dictionaries dictionaries_name_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dictionaries
    ADD CONSTRAINT dictionaries_name_unique UNIQUE (name);


--
-- Name: dictionaries dictionaries_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dictionaries
    ADD CONSTRAINT dictionaries_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: modules modules_index_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_index_unique UNIQUE (index);


--
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- Name: tipitaka tipitaka_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipitaka
    ADD CONSTRAINT tipitaka_pkey PRIMARY KEY (id);


--
-- Name: dictionaries dictionaries_cover_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dictionaries
    ADD CONSTRAINT dictionaries_cover_foreign FOREIGN KEY (cover) REFERENCES public.directus_files(id);


--
-- Name: dictionaries dictionaries_zip_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dictionaries
    ADD CONSTRAINT dictionaries_zip_foreign FOREIGN KEY (zip) REFERENCES public.directus_files(id);


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: tipitaka tipitaka_cover_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipitaka
    ADD CONSTRAINT tipitaka_cover_foreign FOREIGN KEY (cover) REFERENCES public.directus_files(id);


--
-- Name: tipitaka tipitaka_zip_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipitaka
    ADD CONSTRAINT tipitaka_zip_foreign FOREIGN KEY (zip) REFERENCES public.directus_files(id);


--
-- PostgreSQL database dump complete
--

