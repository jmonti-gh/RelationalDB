--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses_nbr integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 4, 1);
INSERT INTO public.games VALUES (2, 7, 2);
INSERT INTO public.games VALUES (3, 7, 3);
INSERT INTO public.games VALUES (4, 6, 1);
INSERT INTO public.games VALUES (5, 533, 4);
INSERT INTO public.games VALUES (6, 44, 4);
INSERT INTO public.games VALUES (7, 177, 5);
INSERT INTO public.games VALUES (8, 871, 5);
INSERT INTO public.games VALUES (9, 783, 4);
INSERT INTO public.games VALUES (10, 723, 4);
INSERT INTO public.games VALUES (11, 18, 4);
INSERT INTO public.games VALUES (12, 142, 6);
INSERT INTO public.games VALUES (13, 172, 6);
INSERT INTO public.games VALUES (14, 712, 7);
INSERT INTO public.games VALUES (15, 841, 7);
INSERT INTO public.games VALUES (16, 568, 6);
INSERT INTO public.games VALUES (17, 812, 6);
INSERT INTO public.games VALUES (18, 230, 6);
INSERT INTO public.games VALUES (19, 11, 2);
INSERT INTO public.games VALUES (20, 7, 3);
INSERT INTO public.games VALUES (21, 358, 8);
INSERT INTO public.games VALUES (22, 157, 8);
INSERT INTO public.games VALUES (23, 304, 9);
INSERT INTO public.games VALUES (24, 300, 9);
INSERT INTO public.games VALUES (25, 650, 8);
INSERT INTO public.games VALUES (26, 573, 8);
INSERT INTO public.games VALUES (27, 568, 8);
INSERT INTO public.games VALUES (28, 9, 1);
INSERT INTO public.games VALUES (29, 77, 10);
INSERT INTO public.games VALUES (30, 738, 10);
INSERT INTO public.games VALUES (31, 106, 11);
INSERT INTO public.games VALUES (32, 24, 11);
INSERT INTO public.games VALUES (33, 345, 10);
INSERT INTO public.games VALUES (34, 329, 10);
INSERT INTO public.games VALUES (35, 122, 10);
INSERT INTO public.games VALUES (36, 11, 12);
INSERT INTO public.games VALUES (37, 554, 13);
INSERT INTO public.games VALUES (38, 750, 13);
INSERT INTO public.games VALUES (39, 145, 14);
INSERT INTO public.games VALUES (40, 929, 14);
INSERT INTO public.games VALUES (41, 213, 13);
INSERT INTO public.games VALUES (42, 814, 13);
INSERT INTO public.games VALUES (43, 280, 13);
INSERT INTO public.games VALUES (44, 11, 15);
INSERT INTO public.games VALUES (45, 828, 16);
INSERT INTO public.games VALUES (46, 714, 16);
INSERT INTO public.games VALUES (47, 989, 17);
INSERT INTO public.games VALUES (48, 594, 17);
INSERT INTO public.games VALUES (49, 90, 16);
INSERT INTO public.games VALUES (50, 297, 16);
INSERT INTO public.games VALUES (51, 758, 16);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Marta');
INSERT INTO public.users VALUES (2, 'Peter');
INSERT INTO public.users VALUES (3, 'Maria');
INSERT INTO public.users VALUES (4, 'user_1670610655811');
INSERT INTO public.users VALUES (5, 'user_1670610655810');
INSERT INTO public.users VALUES (6, 'user_1670610862773');
INSERT INTO public.users VALUES (7, 'user_1670610862772');
INSERT INTO public.users VALUES (8, 'user_1670611390315');
INSERT INTO public.users VALUES (9, 'user_1670611390314');
INSERT INTO public.users VALUES (10, 'user_1670611498229');
INSERT INTO public.users VALUES (11, 'user_1670611498228');
INSERT INTO public.users VALUES (12, 'Polo');
INSERT INTO public.users VALUES (13, 'user_1670611659039');
INSERT INTO public.users VALUES (14, 'user_1670611659038');
INSERT INTO public.users VALUES (15, 'Juan');
INSERT INTO public.users VALUES (16, 'user_1670611757871');
INSERT INTO public.users VALUES (17, 'user_1670611757870');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 51, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--