---Sequencias

CREATE SEQUENCE comments_proposal_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE comments_question_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE question_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE proposal_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

---
-- Criação de tipos enum
---

CREATE TYPE type_reaction_comments_proposal AS ENUM('dislike', 'like');
CREATE TYPE type_reaction_comments_question AS ENUM('dislike', 'like');
CREATE TYPE type_reaction_question AS ENUM('dislike', 'like');
--- TABLE: reaction comments proposal




DROP TABLE IF EXISTS public.comments_proposal_reactions;
CREATE TABLE public.comments_proposal_reactions
(
  id integer NOT NULL DEFAULT nextval('comments_proposal_reactions_id_seq'::regclass),
  user_id integer NOT NULL,
  comment_id integer NOT NULL,
  reaction type_reaction_comments_proposal NOT NULL,
  CONSTRAINT comments_proposal_reactions_pkey PRIMARY KEY (id),
  CONSTRAINT comments_proposal_reactions_user_id_comment_id_reaction_unique UNIQUE (user_id, comment_id, reaction)
)WITH (
  OIDS=FALSE
);
ALTER TABLE public.comments_proposal_reactions
  OWNER TO postgres;


DROP TABLE IF EXISTS public.comments_question_reactions;
CREATE TABLE public.comments_question_reactions
(
  id integer NOT NULL DEFAULT nextval('comments_question_reactions_id_seq'::regclass),
  user_id integer NOT NULL,
  comment_id integer NOT NULL,
  reaction type_reaction_comments_question NOT NULL,
  CONSTRAINT comments_question_reactions_pkey PRIMARY KEY (id),
  CONSTRAINT comments_question_reactions_user_id_comment_id_reaction_unique UNIQUE (user_id, comment_id, reaction)
)WITH (
  OIDS=FALSE
);
ALTER TABLE public.comments_question_reactions
  OWNER TO postgres;


DROP TABLE IF EXISTS public.question_reactions;
CREATE TABLE public.question_reactions
(
  id integer NOT NULL DEFAULT nextval('question_reactions_id_seq'::regclass),
  user_id integer NOT NULL,
  question_id integer NOT NULL,
  reaction type_reaction_question NOT NULL,
  CONSTRAINT question_reactions_pkey PRIMARY KEY (id),
  CONSTRAINT question_reactions_user_id_question_id_reaction_unique UNIQUE (user_id, question_id, reaction)  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.question_reactions
  OWNER TO postgres;


DROP TABLE IF EXISTS public.proposal_reactions;
CREATE TABLE public.proposal_reactions
(
  id integer NOT NULL DEFAULT nextval('proposal_reactions_id_seq'::regclass),
  user_id integer NOT NULL,
  proposal_id integer NOT NULL,
  reaction integer NOT NULL CHECK(reaction>=1) CHECK(reaction<=5),
  CONSTRAINT proposal_reactions_pkey PRIMARY KEY (id),
  CONSTRAINT proposal_reactions_user_id_proposal_id_reaction_unique UNIQUE (user_id, proposal_id, reaction)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.proposal_reactions
  OWNER TO postgres;