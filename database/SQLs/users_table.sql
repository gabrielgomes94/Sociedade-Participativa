--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-06-03 18:14:37 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 57355)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--


CREATE TYPE users_gender AS ENUM('female', 'male');
CREATE TYPE users_type AS ENUM('common', 'manager', 'moderator', 'admin');

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
    type users_type DEFAULT 'common' NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,           
    show_email boolean DEFAULT TRUE,
    show_birthday boolean DEFAULT TRUE,
    show_age boolean DEFAULT TRUE,
    show_district boolean DEFAULT TRUE,
    show_city boolean DEFAULT TRUE,
    show_state boolean DEFAULT TRUE,
    show_country boolean DEFAULT TRUE,
    show_score boolean DEFAULT TRUE,
    show_level boolean DEFAULT TRUE,
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 57353)
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
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 183
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2129 (class 2604 OID 57600)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2249 (class 0 OID 57355)
-- Dependencies: 184
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, lastname, email, password, photo_url, gender, birthday, street, street_number, district, city, state, country, zipcode, score, level, type, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 183
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 2133 (class 2606 OID 57368)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2017-06-03 18:14:38 BRT

--
-- PostgreSQL database dump complete
--

