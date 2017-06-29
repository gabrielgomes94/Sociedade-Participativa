--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-06-05 21:29:56 BRT

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
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 695 (class 1247 OID 74018)
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
-- TOC entry 587 (class 1247 OID 73730)
-- Name: type_reaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction OWNER TO postgres;

--
-- TOC entry 590 (class 1247 OID 73736)
-- Name: type_reaction_comments_proposal; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_comments_proposal AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_comments_proposal OWNER TO postgres;

--
-- TOC entry 593 (class 1247 OID 73742)
-- Name: type_reaction_comments_question; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_comments_question AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_comments_question OWNER TO postgres;

--
-- TOC entry 596 (class 1247 OID 73748)
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
-- TOC entry 599 (class 1247 OID 73760)
-- Name: type_reaction_question; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_question AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_question OWNER TO postgres;

--
-- TOC entry 602 (class 1247 OID 73766)
-- Name: users_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE users_gender AS ENUM (
    'female',
    'male'
);


ALTER TYPE users_gender OWNER TO postgres;

--
-- TOC entry 605 (class 1247 OID 73772)
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
-- TOC entry 2463 (class 0 OID 0)
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
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 184
-- Name: category_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_questions_id_seq OWNED BY category_questions.id;


--
-- TOC entry 185 (class 1259 OID 73794)
-- Name: comments_proposal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments_proposal (
    id integer NOT NULL,
    author_id integer NOT NULL,
    proposal_id integer NOT NULL,
    content character varying(10000) NOT NULL,
    post_date timestamp(0) without time zone,
    post_modified_date timestamp(0) without time zone
);


ALTER TABLE comments_proposal OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 73800)
-- Name: comments_proposal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_proposal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_proposal_id_seq OWNER TO postgres;

--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 186
-- Name: comments_proposal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_proposal_id_seq OWNED BY comments_proposal.id;


--
-- TOC entry 187 (class 1259 OID 73802)
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
-- TOC entry 188 (class 1259 OID 73804)
-- Name: comments_proposal_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments_proposal_reactions (
    id integer DEFAULT nextval('comments_proposal_reactions_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    reaction type_reaction_comments_proposal NOT NULL
);


ALTER TABLE comments_proposal_reactions OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 73808)
-- Name: comments_proposal_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments_proposal_reports (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE comments_proposal_reports OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 73814)
-- Name: comments_proposal_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_proposal_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_proposal_reports_id_seq OWNER TO postgres;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 190
-- Name: comments_proposal_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_proposal_reports_id_seq OWNED BY comments_proposal_reports.id;


--
-- TOC entry 191 (class 1259 OID 73816)
-- Name: comments_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments_question (
    id integer NOT NULL,
    author_id integer NOT NULL,
    question_id integer NOT NULL,
    content character varying(10000) NOT NULL,
    post_date timestamp(0) without time zone,
    post_modified_date timestamp(0) without time zone
);


ALTER TABLE comments_question OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 73824)
-- Name: comments_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_question_id_seq OWNER TO postgres;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 192
-- Name: comments_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_question_id_seq OWNED BY comments_question.id;


--
-- TOC entry 193 (class 1259 OID 73826)
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
-- TOC entry 194 (class 1259 OID 73828)
-- Name: comments_question_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments_question_reactions (
    id integer DEFAULT nextval('comments_question_reactions_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    reaction type_reaction_comments_question NOT NULL
);


ALTER TABLE comments_question_reactions OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 73832)
-- Name: comments_question_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments_question_reports (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE comments_question_reports OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 73838)
-- Name: comments_question_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_question_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_question_reports_id_seq OWNER TO postgres;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 196
-- Name: comments_question_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_question_reports_id_seq OWNED BY comments_question_reports.id;


--
-- TOC entry 197 (class 1259 OID 73840)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 73843)
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
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 198
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- TOC entry 199 (class 1259 OID 73845)
-- Name: moderator_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE moderator_questions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE moderator_questions OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 73848)
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
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 200
-- Name: moderator_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moderator_questions_id_seq OWNED BY moderator_questions.id;


--
-- TOC entry 201 (class 1259 OID 73850)
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
-- TOC entry 202 (class 1259 OID 73852)
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
-- TOC entry 203 (class 1259 OID 73858)
-- Name: proposal_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_reports (
    id integer NOT NULL,
    user_id integer NOT NULL,
    proposal_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE proposal_reports OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 73864)
-- Name: proposal_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proposal_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_reports_id_seq OWNER TO postgres;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 204
-- Name: proposal_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proposal_reports_id_seq OWNED BY proposal_reports.id;


--
-- TOC entry 205 (class 1259 OID 73866)
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
-- TOC entry 206 (class 1259 OID 73868)
-- Name: proposals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposals (
    id integer DEFAULT nextval('proposals_id_seq'::regclass) NOT NULL,
    content character varying(10000) NOT NULL,
    post_date timestamp(0) without time zone,
    post_modified_date timestamp(0) without time zone,
    author_id integer NOT NULL,
    question_id integer NOT NULL,
    rating double precision DEFAULT 0 NOT NULL,
    type boolean
);


ALTER TABLE proposals OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 73876)
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
-- TOC entry 208 (class 1259 OID 73878)
-- Name: question_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_reactions (
    id integer DEFAULT nextval('question_reactions_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    reaction type_reaction_question NOT NULL
);


ALTER TABLE question_reactions OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 73882)
-- Name: question_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_reports (
    id integer NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE question_reports OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 73888)
-- Name: question_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_reports_id_seq OWNER TO postgres;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 210
-- Name: question_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_reports_id_seq OWNED BY question_reports.id;


--
-- TOC entry 219 (class 1259 OID 74015)
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
-- TOC entry 220 (class 1259 OID 74029)
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE questions (
    id integer DEFAULT nextval('questions_id_seq'::regclass) NOT NULL,
    title character varying(150) NOT NULL,
    content character varying(10000) NOT NULL,
    post_date timestamp(0) without time zone,
    post_modified_date timestamp(0) without time zone,
    author_id integer NOT NULL,
    district character varying(100),
    city character varying(100),
    state character varying(50),
    country character varying(50),
    status status_question NOT NULL,
    solution_id integer
);


ALTER TABLE questions OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 73899)
-- Name: solutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE solutions (
    id integer NOT NULL,
    proposal_id integer,
    question_id integer NOT NULL,
    content character varying(10000),
    author_id integer NOT NULL
);


ALTER TABLE solutions OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 73902)
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
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 212
-- Name: solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solutions_id_seq OWNED BY solutions.id;


--
-- TOC entry 213 (class 1259 OID 73904)
-- Name: specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE specialties (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(600)
);


ALTER TABLE specialties OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 73910)
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
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 214
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specialties_id_seq OWNED BY specialties.id;


--
-- TOC entry 215 (class 1259 OID 73912)
-- Name: specialty_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE specialty_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    specialty_id integer NOT NULL
);


ALTER TABLE specialty_user OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 73915)
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
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 216
-- Name: specialty_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specialty_user_id_seq OWNED BY specialty_user.id;


--
-- TOC entry 217 (class 1259 OID 73917)
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
-- TOC entry 218 (class 1259 OID 73935)
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
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2171 (class 2604 OID 73937)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 2172 (class 2604 OID 73938)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions ALTER COLUMN id SET DEFAULT nextval('category_questions_id_seq'::regclass);


--
-- TOC entry 2173 (class 2604 OID 73939)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal ALTER COLUMN id SET DEFAULT nextval('comments_proposal_id_seq'::regclass);


--
-- TOC entry 2175 (class 2604 OID 73940)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports ALTER COLUMN id SET DEFAULT nextval('comments_proposal_reports_id_seq'::regclass);


--
-- TOC entry 2176 (class 2604 OID 73941)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question ALTER COLUMN id SET DEFAULT nextval('comments_question_id_seq'::regclass);


--
-- TOC entry 2178 (class 2604 OID 73942)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports ALTER COLUMN id SET DEFAULT nextval('comments_question_reports_id_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 73943)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- TOC entry 2180 (class 2604 OID 73944)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions ALTER COLUMN id SET DEFAULT nextval('moderator_questions_id_seq'::regclass);


--
-- TOC entry 2184 (class 2604 OID 73945)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports ALTER COLUMN id SET DEFAULT nextval('proposal_reports_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 73946)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports ALTER COLUMN id SET DEFAULT nextval('question_reports_id_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 73948)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions ALTER COLUMN id SET DEFAULT nextval('solutions_id_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 73949)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialties ALTER COLUMN id SET DEFAULT nextval('specialties_id_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 73950)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user ALTER COLUMN id SET DEFAULT nextval('specialty_user_id_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 73951)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2415 (class 0 OID 73781)
-- Dependencies: 181
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, name, description) FROM stdin;
5	Mobilidade Urbana	Temas relativos a trânsito, transportes e mobilidade
\.


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 182
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 5, true);


--
-- TOC entry 2417 (class 0 OID 73789)
-- Dependencies: 183
-- Data for Name: category_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category_questions (id, question_id, category_id) FROM stdin;
\.


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 184
-- Name: category_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_questions_id_seq', 1, false);


--
-- TOC entry 2419 (class 0 OID 73794)
-- Dependencies: 185
-- Data for Name: comments_proposal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments_proposal (id, author_id, proposal_id, content, post_date, post_modified_date) FROM stdin;
\.


--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 186
-- Name: comments_proposal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_proposal_id_seq', 30, true);


--
-- TOC entry 2422 (class 0 OID 73804)
-- Dependencies: 188
-- Data for Name: comments_proposal_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments_proposal_reactions (id, user_id, comment_id, reaction) FROM stdin;
\.


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 187
-- Name: comments_proposal_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_proposal_reactions_id_seq', 1, false);


--
-- TOC entry 2423 (class 0 OID 73808)
-- Dependencies: 189
-- Data for Name: comments_proposal_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments_proposal_reports (id, user_id, comment_id, reason, description) FROM stdin;
\.


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 190
-- Name: comments_proposal_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_proposal_reports_id_seq', 1, false);


--
-- TOC entry 2425 (class 0 OID 73816)
-- Dependencies: 191
-- Data for Name: comments_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments_question (id, author_id, question_id, content, post_date, post_modified_date) FROM stdin;
\.


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 192
-- Name: comments_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_question_id_seq', 24, true);


--
-- TOC entry 2428 (class 0 OID 73828)
-- Dependencies: 194
-- Data for Name: comments_question_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments_question_reactions (id, user_id, comment_id, reaction) FROM stdin;
\.


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 193
-- Name: comments_question_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_question_reactions_id_seq', 1, false);


--
-- TOC entry 2429 (class 0 OID 73832)
-- Dependencies: 195
-- Data for Name: comments_question_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments_question_reports (id, user_id, comment_id, reason, description) FROM stdin;
\.


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 196
-- Name: comments_question_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_question_reports_id_seq', 1, false);


--
-- TOC entry 2431 (class 0 OID 73840)
-- Dependencies: 197
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
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 198
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('migrations_id_seq', 13, true);


--
-- TOC entry 2433 (class 0 OID 73845)
-- Dependencies: 199
-- Data for Name: moderator_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY moderator_questions (id, user_id, question_id) FROM stdin;
\.


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 200
-- Name: moderator_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moderator_questions_id_seq', 5, true);


--
-- TOC entry 2436 (class 0 OID 73852)
-- Dependencies: 202
-- Data for Name: proposal_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proposal_reactions (id, user_id, proposal_id, reaction) FROM stdin;
\.


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 201
-- Name: proposal_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposal_reactions_id_seq', 9, true);


--
-- TOC entry 2437 (class 0 OID 73858)
-- Dependencies: 203
-- Data for Name: proposal_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proposal_reports (id, user_id, proposal_id, reason, description) FROM stdin;
\.


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 204
-- Name: proposal_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposal_reports_id_seq', 1, false);


--
-- TOC entry 2440 (class 0 OID 73868)
-- Dependencies: 206
-- Data for Name: proposals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proposals (id, content, post_date, post_modified_date, author_id, question_id, rating, type) FROM stdin;
\.


--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 205
-- Name: proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposals_id_seq', 18, false);


--
-- TOC entry 2442 (class 0 OID 73878)
-- Dependencies: 208
-- Data for Name: question_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_reactions (id, user_id, question_id, reaction) FROM stdin;
\.


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 207
-- Name: question_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_reactions_id_seq', 11, true);


--
-- TOC entry 2443 (class 0 OID 73882)
-- Dependencies: 209
-- Data for Name: question_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_reports (id, user_id, question_id, reason, description) FROM stdin;
\.


--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 210
-- Name: question_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_reports_id_seq', 1, false);


--
-- TOC entry 2454 (class 0 OID 74029)
-- Dependencies: 220
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY questions (id, title, content, post_date, post_modified_date, author_id, district, city, state, country, status, solution_id) FROM stdin;
\.


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 219
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('questions_id_seq', 9, false);


--
-- TOC entry 2445 (class 0 OID 73899)
-- Dependencies: 211
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solutions (id, proposal_id, question_id, content, author_id) FROM stdin;
\.


--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 212
-- Name: solutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solutions_id_seq', 1, false);


--
-- TOC entry 2447 (class 0 OID 73904)
-- Dependencies: 213
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY specialties (id, name, description) FROM stdin;
11	Engenharia	Engenharia, blablabla
12	Medicina	Medicina
13	Transporte	sdhsuhdasdiasodnasd
14	Programação de computadores	Programação
15	Direito	Quesjfmkopsdkc
\.


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 214
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specialties_id_seq', 15, true);


--
-- TOC entry 2449 (class 0 OID 73912)
-- Dependencies: 215
-- Data for Name: specialty_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY specialty_user (id, user_id, specialty_id) FROM stdin;
\.


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 216
-- Name: specialty_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specialty_user_id_seq', 9, true);


--
-- TOC entry 2451 (class 0 OID 73917)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, lastname, email, password, photo_url, gender, birthday, street, street_number, district, city, state, country, zipcode, score, level, type, remember_token, created_at, updated_at, show_email, show_birthday, show_age, show_district, show_city, show_state, show_country, show_score, show_level) FROM stdin;
2	Talita	Goulart	talita@email.com	$2y$10$i4QQcNwA2n4N5b3YoHqYjepbtMtMzZs.U81VaE.djJa5V5SxFnHEO	\N	female	1994-12-08	Rua Dr João de Azevedo	386	Centro	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	\N	\N	\N	t	t	t	t	t	t	t	t	t
3	Maria	José	maria@gmail.com	$2y$10$asoYdeyGyioAmRtS1iqJ/./.OwueJme.DMdzUIWhCCea1cjvp59Au	\N	female	1994-12-08	Rua Interdum et malesuada fames	223	Jardim do Crepúsculo	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	\N	\N	\N	t	t	t	t	t	t	t	t	t
4	João	Dias	jd@gmail.com	$2y$10$d930y07DzYfFb2tdZPPnKOi7/5zxcTLt4Gor1JJcVKFqkWcriU8Pu	\N	male	1994-12-08	Rua Interdum et malesuada fames	223	Jardim do Crepúsculo	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	\N	\N	\N	t	t	t	t	t	t	t	t	t
5	Angela	José	angj@gmail.com	$2y$10$PL1HsFkFlazcnFO6LH59buq6MeGbZED85xKu1b1Gfm8w3kITJutj2	\N	female	1994-12-08	Rua Interdum et malesuada fames	223	Jardim do Crepúsculo	Itajubá	Minas Gerais	Brasil	23212223	0	0	common	\N	\N	\N	t	t	t	t	t	t	t	t	t
1	Gabriel	Gomes da Silva	gabrielgomesch@gmail.com	$2y$10$qMNoIQkSDCvydI84ZlgsgOvqJsJL1OTPrpEQMcU6ObJH3FUK8Rb0e	\N	male	1994-12-08	Rua Santa Isabel	220	Parque Urupês	Varginha	Minas Gerais	Brasil	23212223	0	0	admin	sweQhYjC16RADHy2HdZGA9f5j2MZugcz79eyZeYOPKt0T5WyvwgL6GxHtf4y	\N	\N	t	t	t	t	t	t	t	t	t
\.


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- TOC entry 2207 (class 2606 OID 73953)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2209 (class 2606 OID 73955)
-- Name: category_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 73957)
-- Name: category_questions_question_id_category_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_question_id_category_id_unique UNIQUE (question_id, category_id);


--
-- TOC entry 2213 (class 2606 OID 73959)
-- Name: comments_proposal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal
    ADD CONSTRAINT comments_proposal_pkey PRIMARY KEY (id);


--
-- TOC entry 2215 (class 2606 OID 73961)
-- Name: comments_proposal_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reactions
    ADD CONSTRAINT comments_proposal_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2217 (class 2606 OID 73963)
-- Name: comments_proposal_reactions_user_id_comment_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reactions
    ADD CONSTRAINT comments_proposal_reactions_user_id_comment_id_reaction_unique UNIQUE (user_id, comment_id, reaction);


--
-- TOC entry 2219 (class 2606 OID 73965)
-- Name: comments_proposal_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports
    ADD CONSTRAINT comments_proposal_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 73967)
-- Name: comments_proposal_reports_user_id_comment_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports
    ADD CONSTRAINT comments_proposal_reports_user_id_comment_id_reason_unique UNIQUE (user_id, comment_id, reason);


--
-- TOC entry 2223 (class 2606 OID 73969)
-- Name: comments_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question
    ADD CONSTRAINT comments_question_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 73971)
-- Name: comments_question_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reactions
    ADD CONSTRAINT comments_question_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2227 (class 2606 OID 73973)
-- Name: comments_question_reactions_user_id_comment_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reactions
    ADD CONSTRAINT comments_question_reactions_user_id_comment_id_reaction_unique UNIQUE (user_id, comment_id, reaction);


--
-- TOC entry 2229 (class 2606 OID 73975)
-- Name: comments_question_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports
    ADD CONSTRAINT comments_question_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2231 (class 2606 OID 73977)
-- Name: comments_question_reports_user_id_comment_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports
    ADD CONSTRAINT comments_question_reports_user_id_comment_id_reason_unique UNIQUE (user_id, comment_id, reason);


--
-- TOC entry 2233 (class 2606 OID 73979)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2235 (class 2606 OID 73981)
-- Name: moderator_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2237 (class 2606 OID 73983)
-- Name: moderator_questions_user_id_question_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_user_id_question_id_unique UNIQUE (user_id, question_id);


--
-- TOC entry 2239 (class 2606 OID 73985)
-- Name: proposal_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2241 (class 2606 OID 73987)
-- Name: proposal_reactions_user_id_proposal_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_user_id_proposal_id_reaction_unique UNIQUE (user_id, proposal_id, reaction);


--
-- TOC entry 2243 (class 2606 OID 73989)
-- Name: proposal_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports
    ADD CONSTRAINT proposal_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 73991)
-- Name: proposal_reports_user_id_proposal_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports
    ADD CONSTRAINT proposal_reports_user_id_proposal_id_reason_unique UNIQUE (user_id, proposal_id, reason);


--
-- TOC entry 2247 (class 2606 OID 73993)
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 73995)
-- Name: question_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 73997)
-- Name: question_reactions_user_id_question_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_user_id_question_id_reaction_unique UNIQUE (user_id, question_id, reaction);


--
-- TOC entry 2253 (class 2606 OID 73999)
-- Name: question_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports
    ADD CONSTRAINT question_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 74001)
-- Name: question_reports_user_id_question_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports
    ADD CONSTRAINT question_reports_user_id_question_id_reason_unique UNIQUE (user_id, question_id, reason);


--
-- TOC entry 2267 (class 2606 OID 74037)
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 74005)
-- Name: solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 74007)
-- Name: specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 74009)
-- Name: specialty_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 74011)
-- Name: specialty_user_user_id_specialty_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_user_id_specialty_id_unique UNIQUE (user_id, specialty_id);


--
-- TOC entry 2265 (class 2606 OID 74013)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 74041)
-- Name: category_questions_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- TOC entry 2269 (class 2606 OID 74046)
-- Name: category_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- TOC entry 2271 (class 2606 OID 74075)
-- Name: comments_proposal_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal
    ADD CONSTRAINT comments_proposal_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- TOC entry 2270 (class 2606 OID 74070)
-- Name: comments_proposal_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal
    ADD CONSTRAINT comments_proposal_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- TOC entry 2273 (class 2606 OID 74085)
-- Name: comments_proposal_reactions_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reactions
    ADD CONSTRAINT comments_proposal_reactions_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES comments_proposal(id);


--
-- TOC entry 2272 (class 2606 OID 74080)
-- Name: comments_proposal_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reactions
    ADD CONSTRAINT comments_proposal_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2275 (class 2606 OID 74095)
-- Name: comments_proposal_reports_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports
    ADD CONSTRAINT comments_proposal_reports_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES comments_proposal(id);


--
-- TOC entry 2274 (class 2606 OID 74090)
-- Name: comments_proposal_reports_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports
    ADD CONSTRAINT comments_proposal_reports_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2276 (class 2606 OID 74104)
-- Name: comments_question_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question
    ADD CONSTRAINT comments_question_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- TOC entry 2277 (class 2606 OID 74109)
-- Name: comments_question_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question
    ADD CONSTRAINT comments_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- TOC entry 2279 (class 2606 OID 74119)
-- Name: comments_question_reactions_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reactions
    ADD CONSTRAINT comments_question_reactions_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES comments_question(id);


--
-- TOC entry 2278 (class 2606 OID 74114)
-- Name: comments_question_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reactions
    ADD CONSTRAINT comments_question_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2281 (class 2606 OID 74129)
-- Name: comments_question_reports_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports
    ADD CONSTRAINT comments_question_reports_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES comments_question(id);


--
-- TOC entry 2280 (class 2606 OID 74124)
-- Name: comments_question_reports_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports
    ADD CONSTRAINT comments_question_reports_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2283 (class 2606 OID 74152)
-- Name: moderator_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- TOC entry 2282 (class 2606 OID 74134)
-- Name: moderator_questions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2284 (class 2606 OID 74157)
-- Name: proposal_reactions_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- TOC entry 2285 (class 2606 OID 74162)
-- Name: proposal_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2287 (class 2606 OID 74172)
-- Name: proposal_reports_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports
    ADD CONSTRAINT proposal_reports_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- TOC entry 2286 (class 2606 OID 74167)
-- Name: proposal_reports_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports
    ADD CONSTRAINT proposal_reports_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2288 (class 2606 OID 74177)
-- Name: proposals_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- TOC entry 2289 (class 2606 OID 74216)
-- Name: proposals_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- TOC entry 2291 (class 2606 OID 74229)
-- Name: question_reactions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- TOC entry 2290 (class 2606 OID 74224)
-- Name: question_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2293 (class 2606 OID 74239)
-- Name: question_reports_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports
    ADD CONSTRAINT question_reports_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- TOC entry 2292 (class 2606 OID 74234)
-- Name: question_reports_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports
    ADD CONSTRAINT question_reports_user_id_fkey FOREIGN KEY (user_id) REFERENCES question_reports(id);


--
-- TOC entry 2299 (class 2606 OID 74244)
-- Name: questions_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- TOC entry 2300 (class 2606 OID 74282)
-- Name: questions_solution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_solution_id_fkey FOREIGN KEY (solution_id) REFERENCES solutions(id);


--
-- TOC entry 2294 (class 2606 OID 74249)
-- Name: solutions_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- TOC entry 2296 (class 2606 OID 74259)
-- Name: solutions_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- TOC entry 2295 (class 2606 OID 74254)
-- Name: solutions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- TOC entry 2297 (class 2606 OID 74272)
-- Name: specialty_user_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES specialties(id);


--
-- TOC entry 2298 (class 2606 OID 74277)
-- Name: specialty_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-06-05 21:29:56 BRT

--
-- PostgreSQL database dump complete
--

