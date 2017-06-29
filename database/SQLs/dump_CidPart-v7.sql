--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2017-06-29 13:29:31 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 659 (class 1247 OID 75642)
-- Name: comment_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE comment_type AS ENUM (
    'proposal',
    'question'
);


ALTER TYPE comment_type OWNER TO postgres;

--
-- TOC entry 671 (class 1247 OID 83833)
-- Name: report_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE report_type AS ENUM (
    'questão',
    'proposta',
    'comentário'
);


ALTER TYPE report_type OWNER TO postgres;

--
-- TOC entry 651 (class 1247 OID 74018)
-- Name: status_question; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE status_question AS ENUM (
    'sugerida',
    'em discussão',
    'fechada com solução',
    'fechada sem solução',
    'recusada'
);


ALTER TYPE status_question OWNER TO postgres;

--
-- TOC entry 580 (class 1247 OID 73730)
-- Name: type_reaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction OWNER TO postgres;

--
-- TOC entry 583 (class 1247 OID 73736)
-- Name: type_reaction_comments_proposal; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_comments_proposal AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_comments_proposal OWNER TO postgres;

--
-- TOC entry 586 (class 1247 OID 73742)
-- Name: type_reaction_comments_question; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_comments_question AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_comments_question OWNER TO postgres;

--
-- TOC entry 589 (class 1247 OID 73748)
-- Name: type_reaction_proposal; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_proposal AS ENUM (
    'very bad',
    'bad',
    'ok',
    'good',
    'very good'
);


ALTER TYPE type_reaction_proposal OWNER TO postgres;

--
-- TOC entry 592 (class 1247 OID 73760)
-- Name: type_reaction_question; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_question AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_question OWNER TO postgres;

--
-- TOC entry 595 (class 1247 OID 73766)
-- Name: users_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE users_gender AS ENUM (
    'female',
    'male'
);


ALTER TYPE users_gender OWNER TO postgres;

--
-- TOC entry 598 (class 1247 OID 73772)
-- Name: users_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE users_type AS ENUM (
    'common',
    'manager',
    'moderator',
    'admin'
);


ALTER TYPE users_type OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 73781)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description character varying(600)
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 73787)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO postgres;

--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 182
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- TOC entry 183 (class 1259 OID 73789)
-- Name: category_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category_questions (
    id integer NOT NULL,
    question_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE category_questions OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 73792)
-- Name: category_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_questions_id_seq OWNER TO postgres;

--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 184
-- Name: category_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_questions_id_seq OWNED BY category_questions.id;


--
-- TOC entry 209 (class 1259 OID 75668)
-- Name: comments_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_reactions_id_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_reactions_id_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 75670)
-- Name: comment_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comment_reactions (
    id integer DEFAULT nextval('comments_reactions_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    reaction boolean NOT NULL
);


ALTER TABLE comment_reactions OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 75639)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 75647)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments (
    id integer DEFAULT nextval('comments_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    commentable_id integer NOT NULL,
    commentable_type comment_type NOT NULL,
    content character varying(10000) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    type boolean
);


ALTER TABLE comments OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 73802)
-- Name: comments_proposal_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_proposal_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_proposal_reactions_id_seq OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 73826)
-- Name: comments_question_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_question_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_question_reactions_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 75688)
-- Name: comments_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_reports_id_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_reports_id_seq OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 73840)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 73843)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 188
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- TOC entry 189 (class 1259 OID 73845)
-- Name: moderator_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE moderator_questions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE moderator_questions OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 73848)
-- Name: moderator_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE moderator_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moderator_questions_id_seq OWNER TO postgres;

--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 190
-- Name: moderator_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moderator_questions_id_seq OWNED BY moderator_questions.id;


--
-- TOC entry 191 (class 1259 OID 73850)
-- Name: proposal_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proposal_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_reactions_id_seq OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 73852)
-- Name: proposal_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_reactions (
    id integer DEFAULT nextval('proposal_reactions_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    proposal_id integer NOT NULL,
    reaction integer NOT NULL,
    CONSTRAINT proposal_reactions_reaction_check CHECK ((reaction >= 1)),
    CONSTRAINT proposal_reactions_reaction_check1 CHECK ((reaction <= 5))
);


ALTER TABLE proposal_reactions OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 73866)
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proposals_id_seq
    START WITH 18
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposals_id_seq OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 73868)
-- Name: proposals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposals (
    id integer DEFAULT nextval('proposals_id_seq'::regclass) NOT NULL,
    content character varying(10000) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    rating double precision DEFAULT 0 NOT NULL
);


ALTER TABLE proposals OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 73876)
-- Name: question_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_reactions_id_seq OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 73878)
-- Name: question_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_reactions (
    id integer DEFAULT nextval('question_reactions_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    reaction boolean NOT NULL
);


ALTER TABLE question_reactions OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 74015)
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE questions_id_seq
    START WITH 9
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questions_id_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 74029)
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE questions (
    id integer DEFAULT nextval('questions_id_seq'::regclass) NOT NULL,
    title character varying(150) NOT NULL,
    content character varying(10000) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    user_id integer NOT NULL,
    district character varying(100),
    city character varying(100),
    state character varying(50),
    country character varying(50),
    status status_question NOT NULL,
    solution_id integer
);


ALTER TABLE questions OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 83830)
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 83839)
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reports (
    id integer DEFAULT nextval('reports_id_seq'::regclass) NOT NULL,
    reportable_id integer NOT NULL,
    reportable_type report_type NOT NULL,
    description character varying(10000) NOT NULL,
    created_at timestamp(0) with time zone
);


ALTER TABLE reports OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 73899)
-- Name: solutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE solutions (
    id integer NOT NULL,
    proposal_id integer,
    question_id integer NOT NULL,
    content character varying(10000),
    user_id integer NOT NULL
);


ALTER TABLE solutions OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 73902)
-- Name: solutions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_id_seq OWNER TO postgres;

--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 198
-- Name: solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solutions_id_seq OWNED BY solutions.id;


--
-- TOC entry 199 (class 1259 OID 73904)
-- Name: specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE specialties (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(600)
);


ALTER TABLE specialties OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 73910)
-- Name: specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialties_id_seq OWNER TO postgres;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 200
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specialties_id_seq OWNED BY specialties.id;


--
-- TOC entry 201 (class 1259 OID 73912)
-- Name: specialty_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE specialty_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    specialty_id integer NOT NULL
);


ALTER TABLE specialty_user OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 73915)
-- Name: specialty_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE specialty_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialty_user_id_seq OWNER TO postgres;

--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 202
-- Name: specialty_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specialty_user_id_seq OWNED BY specialty_user.id;


--
-- TOC entry 203 (class 1259 OID 73917)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    lastname character varying(100),
    email character varying(200) NOT NULL,
    password character varying(255) NOT NULL,
    photo_url character varying(255),
    gender users_gender NOT NULL,
    birthday date NOT NULL,
    street character varying(100),
    street_number integer,
    district character varying(100),
    city character varying(100) NOT NULL,
    state character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    zipcode character varying(255),
    score integer DEFAULT 0 NOT NULL,
    level integer DEFAULT 0 NOT NULL,
    type users_type DEFAULT 'common'::users_type NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    show_email boolean DEFAULT true,
    show_birthday boolean DEFAULT true,
    show_age boolean DEFAULT true,
    show_district boolean DEFAULT true,
    show_city boolean DEFAULT true,
    show_state boolean DEFAULT true,
    show_country boolean DEFAULT true,
    show_score boolean DEFAULT true,
    show_level boolean DEFAULT true
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 73935)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2149 (class 2604 OID 73937)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 73938)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions ALTER COLUMN id SET DEFAULT nextval('category_questions_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 73943)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 73944)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions ALTER COLUMN id SET DEFAULT nextval('moderator_questions_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 73948)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions ALTER COLUMN id SET DEFAULT nextval('solutions_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 73949)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialties ALTER COLUMN id SET DEFAULT nextval('specialties_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 73950)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user ALTER COLUMN id SET DEFAULT nextval('specialty_user_id_seq'::regclass);


--
-- TOC entry 2174 (class 2604 OID 73951)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2354 (class 0 OID 73781)
-- Dependencies: 181
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, name, description) FROM stdin;
1	Mobilidade Urbana	Temas relativos a trânsito, transportes e mobilidade
2	Saúde	DSODNSAODNAS[]
3	Educação	dfdklasdnklasdnas[asda
4	Segurança pública	slkdnaslkdnasldkasndaskn
5	Tributação	wdasdasdasdsadasda
6	Obras	sadasdasdasdas
\.


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 182
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 1, true);


--
-- TOC entry 2356 (class 0 OID 73789)
-- Dependencies: 183
-- Data for Name: category_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category_questions (id, question_id, category_id) FROM stdin;
1	1	1
2	2	1
3	3	1
\.


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 184
-- Name: category_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_questions_id_seq', 1, false);


--
-- TOC entry 2383 (class 0 OID 75670)
-- Dependencies: 210
-- Data for Name: comment_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_reactions (id, user_id, comment_id, reaction) FROM stdin;
64	1	8	f
67	1	25	f
65	1	7	t
66	1	24	f
\.


--
-- TOC entry 2381 (class 0 OID 75647)
-- Dependencies: 208
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments (id, user_id, commentable_id, commentable_type, content, created_at, updated_at, type) FROM stdin;
7	3	2	proposal	  Nullam sed urna vitae arcu dictum placerat a vestibulum metus. Maecenas sit amet porttitor ante. Sed a ex sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel viverra est. Sed pellentesque nulla et mauris laoreet, nec porta ligula suscipit. Morbi eu viverra lectus. Donec vestibulum urna sed aliquam tincidunt. Quisque facilisis tincidunt velit, eu varius ex venenatis ac. Vivamus iaculis metus quam, a egestas est sollicitudin at.  	2017-04-26 02:40:01-03	\N	t
8	5	2	proposal	   Aliquam erat volutpat. Quisque in tortor accumsan elit lobortis consectetur eu sed orci. Aliquam ultricies rutrum risus, et varius nisi ornare ac. Etiam maximus at arcu vel laoreet. Cras tincidunt, purus et bibendum feugiat, ex risus luctus magna, quis viverra orci lacus vel dolor. Duis ut congue enim. Phasellus in mauris risus. Maecenas nec nisi tellus.   	2017-04-26 02:46:01-03	\N	f
24	1	2	proposal	FDSDFDSFSDFSDF	2017-06-22 14:08:41-03	2017-06-22 14:08:41-03	f
25	1	2	proposal	FDSDFDSFSDFSDF	2017-06-22 14:13:21-03	2017-06-22 14:13:21-03	t
26	1	2	proposal	FDSDFDSFSDFSDF	2017-06-22 14:25:28-03	2017-06-22 14:25:28-03	t
50	3	1	question	dsadasdsada	2017-02-18 16:05:30-02	\N	f
27	2	1	question	Quisque finibus eros eu felis rhoncus condimentum. Nunc ultricies lorem diam, non fermentum elit aliquet vel. Vestibulum feugiat luctus maximus. Fusce tempus nunc ut quam facilisis, eu laoreet ex aliquet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent feugiat, turpis in consequat rutrum, magna eros tincidunt ligula, eget viverra quam lectus quis ligula. Integer in mi vulputate, faucibus augue eu, commodo nulla. Nunc placerat consequat tortor, ac aliquet purus condimentum id. In eu sapien dignissim, tempus risus ut, maximus sapien. Pellentesque congue, purus at lacinia porttitor, tellus odio sollicitudin tellus, in ornare mi tortor sit amet enim. Pellentesque vitae efficitur nisl. Duis nec dolor massa. Nam gravida lectus fermentum, congue erat vel, laoreet ipsum. Curabitur ut finibus ipsum, eget laoreet dui. Cras porttitor vel neque at tincidunt. Quisque blandit venenatis mauris mattis sodales. Sed posuere lacinia tortor eu consequat. Curabitur at leo quis lacus posuere ullamcorper vitae quis ex. Pellentesque feugiat arcu at purus mollis fermentum. Cras tempor semper neque eget blandit. Praesent erat purus, tempus malesuada ultrices sed, dapibus vitae eros. Vestibulum ut tellus vel mi bibendum aliquet. Duis blandit nulla interdum enim convallis sagittis. Quisque dignissim pulvinar posuere. Morbi sed accumsan magna, et dignissim est. Proin pulvinar sesdalkdalkdan	2018-02-27 13:00:00-03	\N	t
\.


--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 207
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_id_seq', 40, true);


--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 185
-- Name: comments_proposal_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_proposal_reactions_id_seq', 8, true);


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 186
-- Name: comments_question_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_question_reactions_id_seq', 8, true);


--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 209
-- Name: comments_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_reactions_id_seq', 74, true);


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 211
-- Name: comments_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_reports_id_seq', 8, false);


--
-- TOC entry 2360 (class 0 OID 73840)
-- Dependencies: 187
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2016_12_12_191902_create_specialty_table	1
4	2017_02_16_174408_create_question_table	1
5	2017_02_23_161739_create_proposal_table	1
6	2017_02_23_162543_create_solutions_table	1
7	2017_02_23_162643_create_moderator_question_table	1
8	2017_03_18_203012_create_specialty_user_table	1
9	2017_03_20_221245_create_categories_table	1
10	2017_03_20_221808_create_category_questions_table	1
11	2017_04_20_171911_create_reactions_tables	1
12	2017_04_20_173427_create_comments_tables	1
13	2017_05_04_133514_create_reports_tables	1
\.


--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 188
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('migrations_id_seq', 13, true);


--
-- TOC entry 2362 (class 0 OID 73845)
-- Dependencies: 189
-- Data for Name: moderator_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY moderator_questions (id, user_id, question_id) FROM stdin;
1	1	1
\.


--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 190
-- Name: moderator_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moderator_questions_id_seq', 1, true);


--
-- TOC entry 2365 (class 0 OID 73852)
-- Dependencies: 192
-- Data for Name: proposal_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proposal_reactions (id, user_id, proposal_id, reaction) FROM stdin;
72	1	2	4
71	1	4	2
3	3	4	1
4	2	4	2
\.


--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 191
-- Name: proposal_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposal_reactions_id_seq', 72, true);


--
-- TOC entry 2367 (class 0 OID 73868)
-- Dependencies: 194
-- Data for Name: proposals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proposals (id, content, created_at, updated_at, user_id, question_id, rating) FROM stdin;
5	ou tá the brinqueichon uite me, cara? You ar a véri mutchi caspa man. Do you nou the number one xampu contra caspa in the uordi. Luqui aqui Capitachion. Rimouve uarandredi porcenti ofi the caspa ande idrateiti ior hair.\n\n                You puti the xampu in the midiu, from the fronte, from the berrind ande the caspa donti cai io xolder. Pliss, luqui tu me. Not joelzetes. Finixi the cocereichon in the red. Bati, pera ai, you no precisa, you ar a carecaition, you donti révi caspa\n\n                Iu uanti random téxti cara?	2017-04-26 02:46:01-03	\N	2	3	0
4	 Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. \n\n                Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus. 	2017-04-26 02:46:01-03	\N	1	1	1.66666666666666674
2	 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ornare dictum porttitor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam mollis, ante at aliquam pulvinar, urna nulla elementum lectus, vel aliquet velit lacus sit amet enim. Maecenas volutpat ac enim vel placerat. Quisque finibus eros eu felis rhoncus condimentum. Nunc ultricies lorem diam, non fermentum elit aliquet vel. Vestibulum feugiat luctus maximus. Fusce tempus nunc ut quam facilisis, eu laoreet ex aliquet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent feugiat, turpis in consequat rutrum, magna eros tincidunt ligula, eget viverra quam lectus quis ligula. Integer in mi vulputate, faucibus augue eu, commodo nulla. Nunc placerat consequat tortor, ac aliquet purus condimentum id. In eu sapien dignissim, tempus risus ut, maximus sapien. Pellentesque congue, purus at lacinia porttitor, tellus odio sollicitudin tellus, in ornare mi tortor sit amet enim.\n\t\t\t\tPellentesque vitae efficitur nisl. Duis nec dolor massa. Nam gravida lectus fermentum, congue erat vel, laoreet ipsum. Curabitur ut finibus ipsum, eget laoreet dui. Cras porttitor vel neque at tincidunt. Quisque blandit venenatis mauris mattis sodales. Sed posuere lacinia tortor eu consequat. Curabitur at leo quis lacus posuere ullamcorper vitae quis ex. Pellentesque feugiat arcu at purus mollis fermentum. Cras tempor semper neque eget blandit. Praesent erat purus, tempus malesuada ultrices sed, dapibus vitae eros. Vestibulum ut tellus vel mi bibendum aliquet. Duis blandit nulla interdum enim convallis sagittis. Quisque dignissim pulvinar posuere. Morbi sed accumsan magna, et dignissim est. Proin pulvinar sem id est porta varius. \n\t\t\t\tIu uanti random téxti cara?	2017-04-26 02:46:01-03	\N	3	1	4
\.


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 193
-- Name: proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposals_id_seq', 6, true);


--
-- TOC entry 2369 (class 0 OID 73878)
-- Dependencies: 196
-- Data for Name: question_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_reactions (id, user_id, question_id, reaction) FROM stdin;
32	1	3	f
15	1	2	f
49	5	1	t
16	1	1	t
\.


--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 195
-- Name: question_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_reactions_id_seq', 49, true);


--
-- TOC entry 2379 (class 0 OID 74029)
-- Dependencies: 206
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY questions (id, title, content, created_at, updated_at, user_id, district, city, state, country, status, solution_id) FROM stdin;
1	In at convallis elit, id tincidunt nisl	Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus. Nunc dapibus tortor vel mi dapibus sollicitudin. Etiam posuere lacus quis dolor. Praesent id justo in neque elementum ultrices. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. In convallis. Fusce suscipit libero eget elit. Praesent vitae arcu tempor neque lacinia pretium. Morbi imperdiet, mauris ac auctor dictum, nisl ligula egestas nulla, et sollicitudin sem purus in lacus.\n\n                     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi gravida libero nec velit. Morbi scelerisque luctus velit. Etiam dui sem, fermentum vitae, sagittis id, malesuada in, quam. Proin mattis lacinia justo. Vestibulum facilisis auctor urna. Aliquam in lorem sit amet leo accumsan lacinia. Integer rutrum, orci vestibulum ullamcorper ultricies, lacus quam ultricies odio, vitae placerat pede sem sit amet enim. Phasellus et lorem id felis nonummy placerat. Fusce dui leo, imperdiet in, aliquam sit amet, feugiat eu, orci. Aenean vel massa quis mauris vehicula lacinia. Quisque tincidunt scelerisque libero. Maecenas libero. Etiam dictum tincidunt diam. Donec ipsum massa, ullamcorper in, auctor et, scelerisque sed, est. Suspendisse nisl. Sed convallis magna eu sem. Cras pede libero, dapibus nec, pretium sit amet, tempor quis, urna..	2017-03-21 02:40:01-03	\N	1	Centro	Itajubá	Minas Gerais	Brasil	em discussão	\N
2	Ut eleifend libero vel malesuada luctus	Ad nec consul indoctum temporibus. Quo purto maiestatis necessitatibus ex, facer congue est id, pri solum oblique sanctus no. Usu ex exerci impetus definitionem, quas melius duo id. An mel quod legendos efficiendi. Pri in fabulas molestiae quaerendum, ei delenit nusquam mandamus pro. Sint nonumy menandri pro ad.\n\n                Forensibus consequuntur quo ut. Cu sed ignota gubergren voluptatibus, mel semper disputando no. Partem ignota expetenda in cum, numquam sanctus consetetur in qui, eam enim adhuc ipsum ne. Mea in probo virtute, ut cum iisque posidonium dissentiet. Nisl solum postea usu eu, ius ad constituam scriptorem, usu dico libris sadipscing ea.\n\n                Consul atomorum delicatissimi an his, eum adhuc mandamus neglegentur ad. Duo cu vero posse incorrupte. Et postea quaeque conceptam cum. Pro inani dolorem ad, an per postea senserit. Audiam vivendum consequat eam ex, scaevola dissentias ut vis. No mucius graeci nusquam nec, errem fuisset vim cu. Postulant sapientem sit ne.	2017-03-11 00:11:01-03	\N	1	Centro	Itajubá	Minas Gerais	Brasil	em discussão	\N
3	Mauris dignissim nunc mauris	 Donec faucibus nisl sit amet nulla auctor, et ornare ex tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies est vitae arcu bibendum, id commodo risus sodales. Integer placerat accumsan sem sed luctus. Quisque molestie posuere odio, eget interdum nunc feugiat eget. Donec at pellentesque velit. Fusce rutrum imperdiet mi vel sodales. Vestibulum eget scelerisque tellus.\n\n                Duis nec vulputate nulla, sed sollicitudin ligula. Sed id bibendum tellus. Sed nec egestas massa. Proin dapibus libero vitae nibh finibus aliquet. Integer sit amet arcu accumsan, auctor quam sed, lobortis libero. Donec neque nisi, venenatis at tortor sit amet, lacinia mollis massa. Fusce quis arcu ut lacus sagittis ornare imperdiet id ipsum. Vivamus elit purus, scelerisque a justo sed, vulputate cursus diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eu cursus velit, in porttitor ipsum. Sed congue ligula sed risus vehicula bibendum. Aenean feugiat eros vitae efficitur imperdiet.\n\n                Nullam id arcu ut nibh imperdiet luctus. Aliquam varius elementum fermentum. Nam quis enim et elit interdum suscipit vitae at dolor. Duis vestibulum malesuada leo, ut pellentesque velit gravida lobortis. Nullam augue metus, bibendum eget nulla eu, hendrerit vulputate augue. In ac sagittis mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque, felis et consectetur vestibulum, metus magna dignissim nulla, eu sodales felis erat sed velit. Aenean viverra cursus sem, vitae varius risus condimentum eu. 	2017-04-18 00:11:01-03	\N	2	Varginha	Itajubá	Minas Gerais	Brasil	fechada com solução	1
\.


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 205
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('questions_id_seq', 3, true);


--
-- TOC entry 2386 (class 0 OID 83839)
-- Dependencies: 213
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports (id, reportable_id, reportable_type, description, created_at) FROM stdin;
\.


--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 212
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_id_seq', 1, false);


--
-- TOC entry 2370 (class 0 OID 73899)
-- Dependencies: 197
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solutions (id, proposal_id, question_id, content, user_id) FROM stdin;
1	\N	3	Duis nec vulputate nulla, sed sollicitudin ligula. Sed id bibendum tellus. Sed nec egestas massa. Proin dapibus libero vitae nibh finibus aliquet. Integer sit amet arcu accumsan, auctor quam sed, lobortis libero. Donec neque nisi, venenatis at tortor sit amet, lacinia mollis massa. Fusce quis arcu ut lacus sagittis ornare imperdiet id ipsum. Vivamus elit purus, scelerisque a justo sed, vulputate cursus diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eu cursus velit, in porttitor ipsum. Sed congue ligula sed risus vehicula bibendum. Aenean feugiat eros vitae efficitur imperdiet.	2
\.


--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 198
-- Name: solutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solutions_id_seq', 1, false);


--
-- TOC entry 2372 (class 0 OID 73904)
-- Dependencies: 199
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY specialties (id, name, description) FROM stdin;
1	Engenharia	Engenharia, blablabla
2	Medicina	Medicina
3	Transporte	sdhsuhdasdiasodnasd
4	Programação de computadores	Programação
5	Direito	Quesjfmkopsdkc
\.


--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 200
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specialties_id_seq', 5, true);


--
-- TOC entry 2374 (class 0 OID 73912)
-- Dependencies: 201
-- Data for Name: specialty_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY specialty_user (id, user_id, specialty_id) FROM stdin;
1	1	1
2	1	3
3	1	2
4	1	4
\.


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 202
-- Name: specialty_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specialty_user_id_seq', 4, true);


--
-- TOC entry 2376 (class 0 OID 73917)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, lastname, email, password, photo_url, gender, birthday, street, street_number, district, city, state, country, zipcode, score, level, type, remember_token, created_at, updated_at, show_email, show_birthday, show_age, show_district, show_city, show_state, show_country, show_score, show_level) FROM stdin;
2	Talita	Goulart	talita@email.com	$2y$10$pSejMZV0BX3cTTrnHZAzyOwHObznpTLglLYTcCZs.HrTP460rb6wO	\N	female	1994-12-08	Rua Dr João de Azevedo	386	Centro	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	B8FeubT05jFeYRgSXA10ETbbtcQO41O3o5xJQanFQAp23fnPtUTqbUnhXlvJ	\N	\N	t	t	t	t	t	t	t	t	t
3	Maria	José	maria@gmail.com	$2y$10$dl1bpH5VNZLU62qqFX2iku8aKijO8wvKm7RsTMy3FOsrhakV5kFpm	\N	female	1994-12-08	Rua Interdum et malesuada fames	223	Jardim do Crepúsculo	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	AN6aby2EfOnBZ5zpmWGmaejz4NP5jysktfLRVrhLUtTVZZKM8jxMfKuTId8s	\N	\N	t	t	t	t	t	t	t	t	t
4	João	Dias	jd@gmail.com	$2y$10$3P91MRwsolI/WE0Tgct/RevAlPglNog5Vy7QQ0TWfEQMUuDzhkGDm	\N	male	1994-12-08	Rua Interdum et malesuada fames	223	Jardim do Crepúsculo	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	1GinJnaSdwLhtxvf4Iuz2inyUjchJdR5HspxEO9TayImfQwgRYVnTgn3LYDw	\N	\N	t	t	t	t	t	t	t	t	t
5	Angela	José	angj@gmail.com	$2y$10$2tK.v8RbmmTUZ5RSXxcflu9dAgQXjsHJpwDNf6uync0arzSbLwiiu	\N	female	1994-12-08	Rua Interdum et malesuada fames	223	Jardim do Crepúsculo	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	VPduWzESNWidsQGQ3t1bByrNDuknpY19ur0ctwmhAF7427LJxkgXgUk734s5	\N	\N	t	t	t	t	t	t	t	t	t
1	Gabriel	Gomes da Silva	gabrielgomesch@gmail.com	$2y$10$B3l9RuLlxSrW8bPANoQSC.cI3nRaL4SsGEQ4GJyu3jllPBhrR1VcC	\N	male	1994-12-08	Rua Santa Isabel	220	Parque Urupês	Varginha	Minas Gerais	Brasil	23212223	0	0	admin	PLNSb0TerbCWG3lebaywP5TMHIfcVaQfBQ249gaFHB0wLlhbngumTGLKc4kH	\N	\N	t	t	t	t	t	t	t	t	t
\.


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- TOC entry 2180 (class 2606 OID 73953)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 73955)
-- Name: category_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 73957)
-- Name: category_questions_question_id_category_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_question_id_category_id_unique UNIQUE (question_id, category_id);


--
-- TOC entry 2216 (class 2606 OID 75655)
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 75675)
-- Name: comments_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_reactions
    ADD CONSTRAINT comments_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2220 (class 2606 OID 75677)
-- Name: comments_reactions_user_id_comment_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_reactions
    ADD CONSTRAINT comments_reactions_user_id_comment_id_reaction_unique UNIQUE (user_id, comment_id);


--
-- TOC entry 2186 (class 2606 OID 73979)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 73981)
-- Name: moderator_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 73983)
-- Name: moderator_questions_user_id_question_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_user_id_question_id_unique UNIQUE (user_id, question_id);


--
-- TOC entry 2192 (class 2606 OID 73985)
-- Name: proposal_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 75638)
-- Name: proposal_reactions_user_id_proposal_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_user_id_proposal_id_key UNIQUE (user_id, proposal_id);


--
-- TOC entry 2196 (class 2606 OID 73987)
-- Name: proposal_reactions_user_id_proposal_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_user_id_proposal_id_reaction_unique UNIQUE (user_id, proposal_id, reaction);


--
-- TOC entry 2198 (class 2606 OID 73993)
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 73995)
-- Name: question_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 75715)
-- Name: question_reactions_user_id_question_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_user_id_question_id_key UNIQUE (user_id, question_id);


--
-- TOC entry 2214 (class 2606 OID 74037)
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2204 (class 2606 OID 74005)
-- Name: solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (id);


--
-- TOC entry 2206 (class 2606 OID 74007)
-- Name: specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- TOC entry 2208 (class 2606 OID 74009)
-- Name: specialty_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2210 (class 2606 OID 74011)
-- Name: specialty_user_user_id_specialty_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_user_id_specialty_id_unique UNIQUE (user_id, specialty_id);


--
-- TOC entry 2212 (class 2606 OID 74013)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2222 (class 2606 OID 74292)
-- Name: category_questions_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;


--
-- TOC entry 2221 (class 2606 OID 74287)
-- Name: category_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE;


--
-- TOC entry 2237 (class 2606 OID 75656)
-- Name: comments_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_author_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- TOC entry 2238 (class 2606 OID 75678)
-- Name: comments_reactions_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_reactions
    ADD CONSTRAINT comments_reactions_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE;


--
-- TOC entry 2239 (class 2606 OID 75683)
-- Name: comments_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_reactions
    ADD CONSTRAINT comments_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- TOC entry 2224 (class 2606 OID 74447)
-- Name: moderator_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE;


--
-- TOC entry 2223 (class 2606 OID 74442)
-- Name: moderator_questions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2226 (class 2606 OID 74542)
-- Name: proposal_reactions_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id) ON DELETE CASCADE;


--
-- TOC entry 2225 (class 2606 OID 74537)
-- Name: proposal_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- TOC entry 2227 (class 2606 OID 74557)
-- Name: proposals_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_author_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- TOC entry 2228 (class 2606 OID 74562)
-- Name: proposals_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE;


--
-- TOC entry 2229 (class 2606 OID 74567)
-- Name: question_reactions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE;


--
-- TOC entry 2230 (class 2606 OID 74572)
-- Name: question_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- TOC entry 2236 (class 2606 OID 74587)
-- Name: questions_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_author_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- TOC entry 2232 (class 2606 OID 74467)
-- Name: solutions_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_author_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- TOC entry 2233 (class 2606 OID 74472)
-- Name: solutions_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- TOC entry 2231 (class 2606 OID 74462)
-- Name: solutions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE;


--
-- TOC entry 2235 (class 2606 OID 74457)
-- Name: specialty_user_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES specialties(id) ON DELETE CASCADE;


--
-- TOC entry 2234 (class 2606 OID 74452)
-- Name: specialty_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-06-29 13:29:32 BRT

--
-- PostgreSQL database dump complete
--

