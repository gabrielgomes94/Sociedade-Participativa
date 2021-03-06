--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-06-04 20:59:37 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "Colabore";
--
-- TOC entry 2425 (class 1262 OID 57344)
-- Name: Colabore; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Colabore" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE "Colabore" OWNER TO postgres;

\connect "Colabore"

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
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 662 (class 1247 OID 57645)
-- Name: type_reaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction OWNER TO postgres;

--
-- TOC entry 672 (class 1247 OID 57738)
-- Name: type_reaction_comments_proposal; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_comments_proposal AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_comments_proposal OWNER TO postgres;

--
-- TOC entry 675 (class 1247 OID 57744)
-- Name: type_reaction_comments_question; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_comments_question AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_comments_question OWNER TO postgres;

--
-- TOC entry 665 (class 1247 OID 57659)
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
-- TOC entry 678 (class 1247 OID 57750)
-- Name: type_reaction_question; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE type_reaction_question AS ENUM (
    'dislike',
    'like'
);


ALTER TYPE type_reaction_question OWNER TO postgres;

--
-- TOC entry 652 (class 1247 OID 57602)
-- Name: users_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE users_gender AS ENUM (
    'female',
    'male'
);


ALTER TYPE users_gender OWNER TO postgres;

--
-- TOC entry 655 (class 1247 OID 57608)
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
-- TOC entry 194 (class 1259 OID 57437)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description character varying(600)
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 57435)
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
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 193
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- TOC entry 196 (class 1259 OID 57448)
-- Name: category_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category_questions (
    id integer NOT NULL,
    question_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE category_questions OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 57446)
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
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 195
-- Name: category_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_questions_id_seq OWNED BY category_questions.id;


--
-- TOC entry 198 (class 1259 OID 57504)
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
-- TOC entry 197 (class 1259 OID 57502)
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
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 197
-- Name: comments_proposal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_proposal_id_seq OWNED BY comments_proposal.id;


--
-- TOC entry 210 (class 1259 OID 57729)
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
-- TOC entry 214 (class 1259 OID 57755)
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
-- TOC entry 202 (class 1259 OID 57530)
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
-- TOC entry 201 (class 1259 OID 57528)
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
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 201
-- Name: comments_proposal_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_proposal_reports_id_seq OWNED BY comments_proposal_reports.id;


--
-- TOC entry 200 (class 1259 OID 57517)
-- Name: comments_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments_question (
    id integer NOT NULL,
    author_id integer NOT NULL,
    question_id integer NOT NULL,
    content character varying(10000) NOT NULL,
    post_date timestamp(0) without time zone,
    post_modified_date timestamp(0) without time zone,
    upvotes integer DEFAULT 0 NOT NULL,
    downvotes integer DEFAULT 0 NOT NULL
);


ALTER TABLE comments_question OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 57515)
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
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 199
-- Name: comments_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_question_id_seq OWNED BY comments_question.id;


--
-- TOC entry 211 (class 1259 OID 57731)
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
-- TOC entry 215 (class 1259 OID 57763)
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
-- TOC entry 204 (class 1259 OID 57543)
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
-- TOC entry 203 (class 1259 OID 57541)
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
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 203
-- Name: comments_question_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_question_reports_id_seq OWNED BY comments_question_reports.id;


--
-- TOC entry 182 (class 1259 OID 57347)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 57345)
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
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 181
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- TOC entry 190 (class 1259 OID 57417)
-- Name: moderator_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE moderator_questions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE moderator_questions OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 57415)
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
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 189
-- Name: moderator_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moderator_questions_id_seq OWNED BY moderator_questions.id;


--
-- TOC entry 213 (class 1259 OID 57735)
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
-- TOC entry 217 (class 1259 OID 57779)
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
-- TOC entry 206 (class 1259 OID 57556)
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
-- TOC entry 205 (class 1259 OID 57554)
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
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 205
-- Name: proposal_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proposal_reports_id_seq OWNED BY proposal_reports.id;


--
-- TOC entry 219 (class 1259 OID 65583)
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
-- TOC entry 220 (class 1259 OID 65585)
-- Name: proposals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposals (
    id integer DEFAULT nextval('proposals_id_seq'::regclass) NOT NULL,
    content character varying(10000) NOT NULL,
    post_date timestamp(0) without time zone,
    post_modified_date timestamp(0) without time zone,
    author_id integer NOT NULL,
    question_id integer NOT NULL,
    rating double precision DEFAULT 0 NOT NULL
);


ALTER TABLE proposals OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 57733)
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
-- TOC entry 216 (class 1259 OID 57771)
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
-- TOC entry 208 (class 1259 OID 57569)
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
-- TOC entry 207 (class 1259 OID 57567)
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
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 207
-- Name: question_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_reports_id_seq OWNED BY question_reports.id;


--
-- TOC entry 186 (class 1259 OID 57382)
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE questions (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    content character varying(10000) NOT NULL,
    post_date timestamp(0) without time zone,
    post_modified_date timestamp(0) without time zone,
    author_id integer NOT NULL,
    district character varying(100),
    city character varying(100),
    state character varying(50),
    country character varying(50),
    status character varying(255) NOT NULL,
    CONSTRAINT questions_status_check CHECK (((status)::text = ANY ((ARRAY['Aberto'::character varying, 'Fechado'::character varying])::text[])))
);


ALTER TABLE questions OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 57380)
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questions_id_seq OWNER TO postgres;

--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 185
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- TOC entry 188 (class 1259 OID 57409)
-- Name: solutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE solutions (
    id integer NOT NULL,
    proposal_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE solutions OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 57407)
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
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 187
-- Name: solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solutions_id_seq OWNED BY solutions.id;


--
-- TOC entry 184 (class 1259 OID 57371)
-- Name: specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE specialties (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(600)
);


ALTER TABLE specialties OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 57369)
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
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 183
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specialties_id_seq OWNED BY specialties.id;


--
-- TOC entry 192 (class 1259 OID 57427)
-- Name: specialty_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE specialty_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    specialty_id integer NOT NULL
);


ALTER TABLE specialty_user OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 57425)
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
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 191
-- Name: specialty_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specialty_user_id_seq OWNED BY specialty_user.id;


--
-- TOC entry 209 (class 1259 OID 57617)
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
-- TOC entry 218 (class 1259 OID 57887)
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
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2174 (class 2604 OID 57581)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 2175 (class 2604 OID 57582)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions ALTER COLUMN id SET DEFAULT nextval('category_questions_id_seq'::regclass);


--
-- TOC entry 2176 (class 2604 OID 57583)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal ALTER COLUMN id SET DEFAULT nextval('comments_proposal_id_seq'::regclass);


--
-- TOC entry 2180 (class 2604 OID 57585)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports ALTER COLUMN id SET DEFAULT nextval('comments_proposal_reports_id_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 57586)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question ALTER COLUMN id SET DEFAULT nextval('comments_question_id_seq'::regclass);


--
-- TOC entry 2181 (class 2604 OID 57588)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports ALTER COLUMN id SET DEFAULT nextval('comments_question_reports_id_seq'::regclass);


--
-- TOC entry 2167 (class 2604 OID 57589)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- TOC entry 2172 (class 2604 OID 57590)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions ALTER COLUMN id SET DEFAULT nextval('moderator_questions_id_seq'::regclass);


--
-- TOC entry 2182 (class 2604 OID 57592)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports ALTER COLUMN id SET DEFAULT nextval('proposal_reports_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 57595)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports ALTER COLUMN id SET DEFAULT nextval('question_reports_id_seq'::regclass);


--
-- TOC entry 2169 (class 2604 OID 57596)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- TOC entry 2171 (class 2604 OID 57597)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions ALTER COLUMN id SET DEFAULT nextval('solutions_id_seq'::regclass);


--
-- TOC entry 2168 (class 2604 OID 57598)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialties ALTER COLUMN id SET DEFAULT nextval('specialties_id_seq'::regclass);


--
-- TOC entry 2173 (class 2604 OID 57599)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user ALTER COLUMN id SET DEFAULT nextval('specialty_user_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 57889)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2394 (class 0 OID 57437)
-- Dependencies: 194
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories VALUES (5, 'Mobilidade Urbana', 'Temas relativos a trânsito, transportes e mobilidade');


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 193
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 5, true);


--
-- TOC entry 2396 (class 0 OID 57448)
-- Dependencies: 196
-- Data for Name: category_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 195
-- Name: category_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_questions_id_seq', 1, false);


--
-- TOC entry 2398 (class 0 OID 57504)
-- Dependencies: 198
-- Data for Name: comments_proposal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO comments_proposal VALUES (26, 2, 1, 'Vestibulum a sem vel massa porta pharetra. Quisque efficitur erat quis ultricies mollis. Suspendisse vel viverra ligula. Quisque scelerisque commodo turpis, ut congue arcu consectetur quis. Aliquam ultrices enim id mi ultrices condimentum. Pellentesque rutrum lorem iaculis, sagittis metus eu, finibus sapien. Pellentesque convallis id magna a consequat. Quisque pretium at lacus et ullamcorper. Vestibulum sit amet sapien id purus mollis pellentesque. Morbi viverra libero non dapibus sodales. Proin rhoncus, metus interdum rutrum fermentum, erat ligula scelerisque ligula, quis accumsan mi erat at mi. ', '2017-03-26 02:40:01', '2017-03-27 02:40:01');
INSERT INTO comments_proposal VALUES (27, 1, 1, ' Ut vehicula vulputate sem, at facilisis neque porta eget. Etiam maximus dolor non elit bibendum semper. Curabitur vitae tincidunt justo, quis lobortis dui. Sed varius, libero ut pellentesque rhoncus, metus est sollicitudin enim, in iaculis sapien ligula ultrices risus. Duis non bibendum ipsum. Vivamus blandit augue massa, id rutrum augue tempor eu. Aliquam viverra euismod sem vel auctor. ', '2017-03-26 02:40:01', NULL);
INSERT INTO comments_proposal VALUES (28, 3, 2, '  Nullam sed urna vitae arcu dictum placerat a vestibulum metus. Maecenas sit amet porttitor ante. Sed a ex sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel viverra est. Sed pellentesque nulla et mauris laoreet, nec porta ligula suscipit. Morbi eu viverra lectus. Donec vestibulum urna sed aliquam tincidunt. Quisque facilisis tincidunt velit, eu varius ex venenatis ac. Vivamus iaculis metus quam, a egestas est sollicitudin at.  ', '2017-04-26 02:40:01', NULL);
INSERT INTO comments_proposal VALUES (29, 5, 2, '   Aliquam erat volutpat. Quisque in tortor accumsan elit lobortis consectetur eu sed orci. Aliquam ultricies rutrum risus, et varius nisi ornare ac. Etiam maximus at arcu vel laoreet. Cras tincidunt, purus et bibendum feugiat, ex risus luctus magna, quis viverra orci lacus vel dolor. Duis ut congue enim. Phasellus in mauris risus. Maecenas nec nisi tellus.   ', '2017-04-26 02:46:01', NULL);
INSERT INTO comments_proposal VALUES (30, 4, 3, '    Maecenas nisl quam, accumsan nec diam at, ultrices dignissim ex. Mauris tristique tortor nec egestas tempor. Proin vitae imperdiet justo, et sodales sem. Fusce sagittis pretium rhoncus. Donec eu leo dapibus, suscipit nisl a, ultrices lacus. Vivamus auctor nisl ac volutpat varius. In velit orci, maximus rutrum sem nec, fringilla interdum magna. Etiam vel interdum sem, a vehicula dui. In a est semper, elementum metus et, tempor turpis. ', '2017-04-26 02:52:01', NULL);


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 197
-- Name: comments_proposal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_proposal_id_seq', 30, true);


--
-- TOC entry 2414 (class 0 OID 57755)
-- Dependencies: 214
-- Data for Name: comments_proposal_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 210
-- Name: comments_proposal_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_proposal_reactions_id_seq', 1, false);


--
-- TOC entry 2402 (class 0 OID 57530)
-- Dependencies: 202
-- Data for Name: comments_proposal_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 201
-- Name: comments_proposal_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_proposal_reports_id_seq', 1, false);


--
-- TOC entry 2400 (class 0 OID 57517)
-- Dependencies: 200
-- Data for Name: comments_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO comments_question VALUES (21, 2, 1, 'Vivamus orci orci, congue sed egestas et, vestibulum ac magna. Curabitur dapibus vehicula mauris, a pulvinar orci placerat vel. Pellentesque sem enim, egestas vel ligula a, fringilla ullamcorper nisl. Curabitur scelerisque, magna id dapibus dapibus, turpis risus interdum elit, nec placerat nibh sapien quis dui. Aliquam id felis fermentum, tincidunt quam at, placerat eros. In nulla nisi, sollicitudin eu dapibus nec, molestie sed enim. Vivamus aliquam, velit id sollicitudin commodo, risus leo pretium mauris, quis euismod quam ante sit amet lacus. Etiam vel faucibus eros. Etiam suscipit pretium lectus, sollicitudin accumsan sapien porttitor ut. Aliquam tristique, purus ut bibendum gravida, ipsum ipsum convallis dolor, in auctor arcu justo in purus. Sed finibus, elit nec tempor imperdiet, lacus dolor consectetur justo, ac suscipit risus elit nec arcu. Donec ac elementum mauris. Aliquam consectetur dictum quam, a aliquam lectus suscipit et. Nam et tincidunt eros. In hac habitasse platea dictumst. ', '2017-03-22 23:11:01', NULL, 0, 0);
INSERT INTO comments_question VALUES (22, 3, 1, ' Fusce ac eros quam. Maecenas bibendum, nunc in consequat bibendum, nibh justo euismod enim, nec pellentesque dolor ipsum id lacus. Sed eleifend est erat, nec ornare tellus interdum ac. Nulla aliquet elit risus, vitae tincidunt leo imperdiet vitae. Nam commodo consequat suscipit. Suspendisse finibus libero quis felis sagittis molestie. Integer justo quam, tincidunt sit amet malesuada eget, tincidunt et orci. Integer at ligula vel eros luctus aliquam. In urna dui, luctus quis leo vitae, tincidunt varius elit. Suspendisse euismod elit vitae orci tincidunt elementum. Cras ut neque sit amet urna aliquam suscipit. Nunc sit amet imperdiet ante, in placerat tortor. Nullam feugiat dolor non viverra pellentesque. ', '2017-03-22 03:12:21', NULL, 0, 0);
INSERT INTO comments_question VALUES (23, 1, 1, ' F Integer eget elit id eros pellentesque luctus. Sed ut lectus id nisi varius vulputate. Cras iaculis tellus id lacus dignissim, non congue sem pulvinar. Vestibulum auctor risus lacus, nec vulputate leo rutrum a. Aenean et quam accumsan, imperdiet lacus ut, sollicitudin dolor. Ut dolor turpis, suscipit quis diam at, maximus aliquet velit. Morbi ut interdum massa, eu viverra urna. Aliquam condimentum, nulla at hendrerit hendrerit, felis augue auctor augue, eu vestibulum dui metus a mi. ', '2017-03-22 03:12:21', NULL, 0, 0);
INSERT INTO comments_question VALUES (24, 1, 2, ' F Integer eget elit id eros pellentesque luctus. Sed ut lectus id nisi varius vulputate. Cras iaculis tellus id lacus dignissim, non congue sem pulvinar. Vestibulum auctor risus lacus, nec vulputate leo rutrum a. Aenean et quam accumsan, imperdiet lacus ut, sollicitudin dolor. Ut dolor turpis, suscipit quis diam at, maximus aliquet velit. Morbi ut interdum massa, eu viverra urna. Aliquam condimentum, nulla at hendrerit hendrerit, felis augue auctor augue, eu vestibulum dui metus a mi. ', '2017-03-22 03:16:21', NULL, 0, 0);


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 199
-- Name: comments_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_question_id_seq', 24, true);


--
-- TOC entry 2415 (class 0 OID 57763)
-- Dependencies: 215
-- Data for Name: comments_question_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 211
-- Name: comments_question_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_question_reactions_id_seq', 1, false);


--
-- TOC entry 2404 (class 0 OID 57543)
-- Dependencies: 204
-- Data for Name: comments_question_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 203
-- Name: comments_question_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_question_reports_id_seq', 1, false);


--
-- TOC entry 2382 (class 0 OID 57347)
-- Dependencies: 182
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO migrations VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO migrations VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO migrations VALUES (3, '2016_12_12_191902_create_specialty_table', 1);
INSERT INTO migrations VALUES (4, '2017_02_16_174408_create_question_table', 1);
INSERT INTO migrations VALUES (5, '2017_02_23_161739_create_proposal_table', 1);
INSERT INTO migrations VALUES (6, '2017_02_23_162543_create_solutions_table', 1);
INSERT INTO migrations VALUES (7, '2017_02_23_162643_create_moderator_question_table', 1);
INSERT INTO migrations VALUES (8, '2017_03_18_203012_create_specialty_user_table', 1);
INSERT INTO migrations VALUES (9, '2017_03_20_221245_create_categories_table', 1);
INSERT INTO migrations VALUES (10, '2017_03_20_221808_create_category_questions_table', 1);
INSERT INTO migrations VALUES (11, '2017_04_20_171911_create_reactions_tables', 1);
INSERT INTO migrations VALUES (12, '2017_04_20_173427_create_comments_tables', 1);
INSERT INTO migrations VALUES (13, '2017_05_04_133514_create_reports_tables', 1);


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 181
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('migrations_id_seq', 13, true);


--
-- TOC entry 2390 (class 0 OID 57417)
-- Dependencies: 190
-- Data for Name: moderator_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO moderator_questions VALUES (5, 1, 1);


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 189
-- Name: moderator_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moderator_questions_id_seq', 5, true);


--
-- TOC entry 2417 (class 0 OID 57779)
-- Dependencies: 217
-- Data for Name: proposal_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proposal_reactions VALUES (1, 1, 1, 5);
INSERT INTO proposal_reactions VALUES (8, 2, 1, 2);


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 213
-- Name: proposal_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposal_reactions_id_seq', 9, true);


--
-- TOC entry 2406 (class 0 OID 57556)
-- Dependencies: 206
-- Data for Name: proposal_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 205
-- Name: proposal_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposal_reports_id_seq', 1, false);


--
-- TOC entry 2420 (class 0 OID 65585)
-- Dependencies: 220
-- Data for Name: proposals; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proposals VALUES (1, 'sadsasadasdasdsadsadasdasda', '2017-02-12 00:00:00', NULL, 1, 7, 0);


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 219
-- Name: proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proposals_id_seq', 18, false);


--
-- TOC entry 2416 (class 0 OID 57771)
-- Dependencies: 216
-- Data for Name: question_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO question_reactions VALUES (7, 1, 1, 'like');
INSERT INTO question_reactions VALUES (8, 2, 1, 'like');
INSERT INTO question_reactions VALUES (9, 3, 1, 'dislike');
INSERT INTO question_reactions VALUES (10, 4, 1, 'like');
INSERT INTO question_reactions VALUES (11, 5, 1, 'like');


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 212
-- Name: question_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_reactions_id_seq', 11, true);


--
-- TOC entry 2408 (class 0 OID 57569)
-- Dependencies: 208
-- Data for Name: question_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 207
-- Name: question_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_reports_id_seq', 1, false);


--
-- TOC entry 2386 (class 0 OID 57382)
-- Dependencies: 186
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO questions VALUES (7, 'In at convallis elit, id tincidunt nisl', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus. Nunc dapibus tortor vel mi dapibus sollicitudin. Etiam posuere lacus quis dolor. Praesent id justo in neque elementum ultrices. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. In convallis. Fusce suscipit libero eget elit. Praesent vitae arcu tempor neque lacinia pretium. Morbi imperdiet, mauris ac auctor dictum, nisl ligula egestas nulla, et sollicitudin sem purus in lacus.

                     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi gravida libero nec velit. Morbi scelerisque luctus velit. Etiam dui sem, fermentum vitae, sagittis id, malesuada in, quam. Proin mattis lacinia justo. Vestibulum facilisis auctor urna. Aliquam in lorem sit amet leo accumsan lacinia. Integer rutrum, orci vestibulum ullamcorper ultricies, lacus quam ultricies odio, vitae placerat pede sem sit amet enim. Phasellus et lorem id felis nonummy placerat. Fusce dui leo, imperdiet in, aliquam sit amet, feugiat eu, orci. Aenean vel massa quis mauris vehicula lacinia. Quisque tincidunt scelerisque libero. Maecenas libero. Etiam dictum tincidunt diam. Donec ipsum massa, ullamcorper in, auctor et, scelerisque sed, est. Suspendisse nisl. Sed convallis magna eu sem. Cras pede libero, dapibus nec, pretium sit amet, tempor quis, urna..', '2017-03-21 02:40:01', NULL, 1, 'Centro', 'Itajubá', 'Minas Gerais', 'Brasil', 'Aberto');
INSERT INTO questions VALUES (8, 'Ut eleifend libero vel malesuada luctus', 'Ad nec consul indoctum temporibus. Quo purto maiestatis necessitatibus ex, facer congue est id, pri solum oblique sanctus no. Usu ex exerci impetus definitionem, quas melius duo id. An mel quod legendos efficiendi. Pri in fabulas molestiae quaerendum, ei delenit nusquam mandamus pro. Sint nonumy menandri pro ad.

                Forensibus consequuntur quo ut. Cu sed ignota gubergren voluptatibus, mel semper disputando no. Partem ignota expetenda in cum, numquam sanctus consetetur in qui, eam enim adhuc ipsum ne. Mea in probo virtute, ut cum iisque posidonium dissentiet. Nisl solum postea usu eu, ius ad constituam scriptorem, usu dico libris sadipscing ea.

                Consul atomorum delicatissimi an his, eum adhuc mandamus neglegentur ad. Duo cu vero posse incorrupte. Et postea quaeque conceptam cum. Pro inani dolorem ad, an per postea senserit. Audiam vivendum consequat eam ex, scaevola dissentias ut vis. No mucius graeci nusquam nec, errem fuisset vim cu. Postulant sapientem sit ne.', '2017-03-11 00:11:01', NULL, 1, 'Centro', 'Itajubá', 'Minas Gerais', 'Brasil', 'Fechado');
INSERT INTO questions VALUES (9, 'Mauris dignissim nunc mauris', ' Donec faucibus nisl sit amet nulla auctor, et ornare ex tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies est vitae arcu bibendum, id commodo risus sodales. Integer placerat accumsan sem sed luctus. Quisque molestie posuere odio, eget interdum nunc feugiat eget. Donec at pellentesque velit. Fusce rutrum imperdiet mi vel sodales. Vestibulum eget scelerisque tellus.

                Duis nec vulputate nulla, sed sollicitudin ligula. Sed id bibendum tellus. Sed nec egestas massa. Proin dapibus libero vitae nibh finibus aliquet. Integer sit amet arcu accumsan, auctor quam sed, lobortis libero. Donec neque nisi, venenatis at tortor sit amet, lacinia mollis massa. Fusce quis arcu ut lacus sagittis ornare imperdiet id ipsum. Vivamus elit purus, scelerisque a justo sed, vulputate cursus diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eu cursus velit, in porttitor ipsum. Sed congue ligula sed risus vehicula bibendum. Aenean feugiat eros vitae efficitur imperdiet.

                Nullam id arcu ut nibh imperdiet luctus. Aliquam varius elementum fermentum. Nam quis enim et elit interdum suscipit vitae at dolor. Duis vestibulum malesuada leo, ut pellentesque velit gravida lobortis. Nullam augue metus, bibendum eget nulla eu, hendrerit vulputate augue. In ac sagittis mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque, felis et consectetur vestibulum, metus magna dignissim nulla, eu sodales felis erat sed velit. Aenean viverra cursus sem, vitae varius risus condimentum eu. ', '2017-04-18 00:11:01', NULL, 2, 'Varginha', 'Itajubá', 'Minas Gerais', 'Brasil', 'Aberto');


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 185
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('questions_id_seq', 9, true);


--
-- TOC entry 2388 (class 0 OID 57409)
-- Dependencies: 188
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 187
-- Name: solutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solutions_id_seq', 1, false);


--
-- TOC entry 2384 (class 0 OID 57371)
-- Dependencies: 184
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO specialties VALUES (11, 'Engenharia', 'Engenharia, blablabla');
INSERT INTO specialties VALUES (12, 'Medicina', 'Medicina');
INSERT INTO specialties VALUES (13, 'Transporte', 'sdhsuhdasdiasodnasd');
INSERT INTO specialties VALUES (14, 'Programação de computadores', 'Programação');
INSERT INTO specialties VALUES (15, 'Direito', 'Quesjfmkopsdkc');


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 183
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specialties_id_seq', 15, true);


--
-- TOC entry 2392 (class 0 OID 57427)
-- Dependencies: 192
-- Data for Name: specialty_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO specialty_user VALUES (6, 1, 1);
INSERT INTO specialty_user VALUES (7, 1, 3);
INSERT INTO specialty_user VALUES (8, 1, 2);
INSERT INTO specialty_user VALUES (9, 1, 4);


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 191
-- Name: specialty_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specialty_user_id_seq', 9, true);


--
-- TOC entry 2409 (class 0 OID 57617)
-- Dependencies: 209
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users VALUES (2, 'Talita', 'Goulart', 'talita@email.com', '$2y$10$i4QQcNwA2n4N5b3YoHqYjepbtMtMzZs.U81VaE.djJa5V5SxFnHEO', NULL, 'female', '1994-12-08', 'Rua Dr João de Azevedo', 386, 'Centro', 'Itajubá', 'Minas Gerais', 'Brasil', '23212223', 0, 0, 'common', NULL, NULL, NULL, true, true, true, true, true, true, true, true, true);
INSERT INTO users VALUES (3, 'Maria', 'José', 'maria@gmail.com', '$2y$10$asoYdeyGyioAmRtS1iqJ/./.OwueJme.DMdzUIWhCCea1cjvp59Au', NULL, 'female', '1994-12-08', 'Rua Interdum et malesuada fames', 223, 'Jardim do Crepúsculo', 'Itajubá', 'Minas Gerais', 'Brasil', '23212223', 0, 0, 'common', NULL, NULL, NULL, true, true, true, true, true, true, true, true, true);
INSERT INTO users VALUES (4, 'João', 'Dias', 'jd@gmail.com', '$2y$10$d930y07DzYfFb2tdZPPnKOi7/5zxcTLt4Gor1JJcVKFqkWcriU8Pu', NULL, 'male', '1994-12-08', 'Rua Interdum et malesuada fames', 223, 'Jardim do Crepúsculo', 'Itajubá', 'Minas Gerais', 'Brasil', '23212223', 0, 0, 'common', NULL, NULL, NULL, true, true, true, true, true, true, true, true, true);
INSERT INTO users VALUES (5, 'Angela', 'José', 'angj@gmail.com', '$2y$10$PL1HsFkFlazcnFO6LH59buq6MeGbZED85xKu1b1Gfm8w3kITJutj2', NULL, 'female', '1994-12-08', 'Rua Interdum et malesuada fames', 223, 'Jardim do Crepúsculo', 'Itajubá', 'Minas Gerais', 'Brasil', '23212223', 0, 0, 'common', NULL, NULL, NULL, true, true, true, true, true, true, true, true, true);
INSERT INTO users VALUES (1, 'Gabriel', 'Gomes da Silva', 'gabrielgomesch@gmail.com', '$2y$10$qMNoIQkSDCvydI84ZlgsgOvqJsJL1OTPrpEQMcU6ObJH3FUK8Rb0e', NULL, 'male', '1994-12-08', 'Rua Santa Isabel', 220, 'Parque Urupês', 'Varginha', 'Minas Gerais', 'Brasil', '23212223', 0, 0, 'admin', 'sweQhYjC16RADHy2HdZGA9f5j2MZugcz79eyZeYOPKt0T5WyvwgL6GxHtf4y', NULL, NULL, true, true, true, true, true, true, true, true, true);


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- TOC entry 2222 (class 2606 OID 57445)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2224 (class 2606 OID 57453)
-- Name: category_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2226 (class 2606 OID 57455)
-- Name: category_questions_question_id_category_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_questions
    ADD CONSTRAINT category_questions_question_id_category_id_unique UNIQUE (question_id, category_id);


--
-- TOC entry 2228 (class 2606 OID 57514)
-- Name: comments_proposal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal
    ADD CONSTRAINT comments_proposal_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 57760)
-- Name: comments_proposal_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reactions
    ADD CONSTRAINT comments_proposal_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2252 (class 2606 OID 57762)
-- Name: comments_proposal_reactions_user_id_comment_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reactions
    ADD CONSTRAINT comments_proposal_reactions_user_id_comment_id_reaction_unique UNIQUE (user_id, comment_id, reaction);


--
-- TOC entry 2232 (class 2606 OID 57538)
-- Name: comments_proposal_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports
    ADD CONSTRAINT comments_proposal_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2234 (class 2606 OID 57540)
-- Name: comments_proposal_reports_user_id_comment_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_proposal_reports
    ADD CONSTRAINT comments_proposal_reports_user_id_comment_id_reason_unique UNIQUE (user_id, comment_id, reason);


--
-- TOC entry 2230 (class 2606 OID 57527)
-- Name: comments_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question
    ADD CONSTRAINT comments_question_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 57768)
-- Name: comments_question_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reactions
    ADD CONSTRAINT comments_question_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 57770)
-- Name: comments_question_reactions_user_id_comment_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reactions
    ADD CONSTRAINT comments_question_reactions_user_id_comment_id_reaction_unique UNIQUE (user_id, comment_id, reaction);


--
-- TOC entry 2236 (class 2606 OID 57551)
-- Name: comments_question_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports
    ADD CONSTRAINT comments_question_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2238 (class 2606 OID 57553)
-- Name: comments_question_reports_user_id_comment_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments_question_reports
    ADD CONSTRAINT comments_question_reports_user_id_comment_id_reason_unique UNIQUE (user_id, comment_id, reason);


--
-- TOC entry 2206 (class 2606 OID 57352)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2214 (class 2606 OID 57422)
-- Name: moderator_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2216 (class 2606 OID 57424)
-- Name: moderator_questions_user_id_question_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderator_questions
    ADD CONSTRAINT moderator_questions_user_id_question_id_unique UNIQUE (user_id, question_id);


--
-- TOC entry 2262 (class 2606 OID 57786)
-- Name: proposal_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 57788)
-- Name: proposal_reactions_user_id_proposal_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reactions
    ADD CONSTRAINT proposal_reactions_user_id_proposal_id_reaction_unique UNIQUE (user_id, proposal_id, reaction);


--
-- TOC entry 2240 (class 2606 OID 57564)
-- Name: proposal_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports
    ADD CONSTRAINT proposal_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2242 (class 2606 OID 57566)
-- Name: proposal_reports_user_id_proposal_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposal_reports
    ADD CONSTRAINT proposal_reports_user_id_proposal_id_reason_unique UNIQUE (user_id, proposal_id, reason);


--
-- TOC entry 2266 (class 2606 OID 65594)
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 57776)
-- Name: question_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 57778)
-- Name: question_reactions_user_id_question_id_reaction_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reactions
    ADD CONSTRAINT question_reactions_user_id_question_id_reaction_unique UNIQUE (user_id, question_id, reaction);


--
-- TOC entry 2244 (class 2606 OID 57577)
-- Name: question_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports
    ADD CONSTRAINT question_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 2246 (class 2606 OID 57579)
-- Name: question_reports_user_id_question_id_reason_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_reports
    ADD CONSTRAINT question_reports_user_id_question_id_reason_unique UNIQUE (user_id, question_id, reason);


--
-- TOC entry 2210 (class 2606 OID 57393)
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2212 (class 2606 OID 57414)
-- Name: solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (id);


--
-- TOC entry 2208 (class 2606 OID 57379)
-- Name: specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 57432)
-- Name: specialty_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2220 (class 2606 OID 57434)
-- Name: specialty_user_user_id_specialty_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialty_user
    ADD CONSTRAINT specialty_user_user_id_specialty_id_unique UNIQUE (user_id, specialty_id);


--
-- TOC entry 2248 (class 2606 OID 57891)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-06-04 20:59:37 BRT

--
-- PostgreSQL database dump complete
--

