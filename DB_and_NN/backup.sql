--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-21 01:17:43

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
-- TOC entry 230 (class 1259 OID 24739)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    admin_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    middle_name character varying(50),
    company_id integer
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24738)
-- Name: admins_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_admin_id_seq OWNER TO postgres;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 229
-- Name: admins_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_admin_id_seq OWNED BY public.admins.admin_id;


--
-- TOC entry 228 (class 1259 OID 24719)
-- Name: chatmessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chatmessages (
    message_id integer NOT NULL,
    sender_id integer,
    receiver_id integer,
    message_text text NOT NULL,
    send_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.chatmessages OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24718)
-- Name: chatmessages_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chatmessages_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chatmessages_message_id_seq OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 227
-- Name: chatmessages_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chatmessages_message_id_seq OWNED BY public.chatmessages.message_id;


--
-- TOC entry 222 (class 1259 OID 24658)
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    company_id integer NOT NULL,
    company_name character varying(100) NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24657)
-- Name: companies_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_company_id_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 221
-- Name: companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_company_id_seq OWNED BY public.companies.company_id;


--
-- TOC entry 220 (class 1259 OID 24651)
-- Name: hobbies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hobbies (
    hobby_id integer NOT NULL,
    hobby_name character varying(100) NOT NULL
);


ALTER TABLE public.hobbies OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24650)
-- Name: hobbies_hobby_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hobbies_hobby_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hobbies_hobby_id_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 219
-- Name: hobbies_hobby_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hobbies_hobby_id_seq OWNED BY public.hobbies.hobby_id;


--
-- TOC entry 218 (class 1259 OID 24644)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    position_id integer NOT NULL,
    position_name character varying(100) NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24643)
-- Name: positions_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.positions_position_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 217
-- Name: positions_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_position_id_seq OWNED BY public.positions.position_id;


--
-- TOC entry 216 (class 1259 OID 24637)
-- Name: programminglanguages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programminglanguages (
    language_id integer NOT NULL,
    language_name character varying(100) NOT NULL
);


ALTER TABLE public.programminglanguages OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24636)
-- Name: programminglanguages_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programminglanguages_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programminglanguages_language_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 215
-- Name: programminglanguages_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programminglanguages_language_id_seq OWNED BY public.programminglanguages.language_id;


--
-- TOC entry 232 (class 1259 OID 24751)
-- Name: requestedusers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requestedusers (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    middle_name character varying(50),
    company_id integer,
    experience_years integer,
    position_id integer
);


ALTER TABLE public.requestedusers OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24750)
-- Name: requestedusers_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requestedusers_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requestedusers_user_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 231
-- Name: requestedusers_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requestedusers_user_id_seq OWNED BY public.requestedusers.user_id;


--
-- TOC entry 225 (class 1259 OID 24688)
-- Name: userhobbies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userhobbies (
    user_id integer NOT NULL,
    hobby_id integer NOT NULL
);


ALTER TABLE public.userhobbies OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24703)
-- Name: userprogramminglanguages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userprogramminglanguages (
    user_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.userprogramminglanguages OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24670)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    middle_name character varying(50),
    company_id integer,
    experience_years integer,
    position_id integer,
    email character varying(100),
    password_hash character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24669)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4684 (class 2604 OID 24742)
-- Name: admins admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN admin_id SET DEFAULT nextval('public.admins_admin_id_seq'::regclass);


--
-- TOC entry 4682 (class 2604 OID 24722)
-- Name: chatmessages message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chatmessages ALTER COLUMN message_id SET DEFAULT nextval('public.chatmessages_message_id_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 24661)
-- Name: companies company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN company_id SET DEFAULT nextval('public.companies_company_id_seq'::regclass);


--
-- TOC entry 4679 (class 2604 OID 24654)
-- Name: hobbies hobby_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hobbies ALTER COLUMN hobby_id SET DEFAULT nextval('public.hobbies_hobby_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 24647)
-- Name: positions position_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN position_id SET DEFAULT nextval('public.positions_position_id_seq'::regclass);


--
-- TOC entry 4677 (class 2604 OID 24640)
-- Name: programminglanguages language_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programminglanguages ALTER COLUMN language_id SET DEFAULT nextval('public.programminglanguages_language_id_seq'::regclass);


--
-- TOC entry 4685 (class 2604 OID 24754)
-- Name: requestedusers user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestedusers ALTER COLUMN user_id SET DEFAULT nextval('public.requestedusers_user_id_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 24673)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4875 (class 0 OID 24739)
-- Dependencies: 230
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (admin_id, first_name, last_name, middle_name, company_id) FROM stdin;
\.


--
-- TOC entry 4873 (class 0 OID 24719)
-- Dependencies: 228
-- Data for Name: chatmessages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chatmessages (message_id, sender_id, receiver_id, message_text, send_time) FROM stdin;
\.


--
-- TOC entry 4867 (class 0 OID 24658)
-- Dependencies: 222
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (company_id, company_name) FROM stdin;
1	Company A
2	Company B
3	Company C
\.


--
-- TOC entry 4865 (class 0 OID 24651)
-- Dependencies: 220
-- Data for Name: hobbies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hobbies (hobby_id, hobby_name) FROM stdin;
4	Photography
5	Cooking
6	Reading
7	Traveling
8	Drawing
9	Music
10	Cycling
11	Skiing
12	Winemaking
13	Knitting
14	Gardening
15	Dancing
16	Yoga
17	Fitness
18	Crafting
19	Learning foreign languages
20	Playing musical instruments
21	Movies and cinematography
22	Running
23	Photoshop and image editing
\.


--
-- TOC entry 4863 (class 0 OID 24644)
-- Dependencies: 218
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (position_id, position_name) FROM stdin;
1	Software Engineer
2	Data Scientist
3	Product Manager
\.


--
-- TOC entry 4861 (class 0 OID 24637)
-- Dependencies: 216
-- Data for Name: programminglanguages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programminglanguages (language_id, language_name) FROM stdin;
1	Python
2	JavaScript
3	Java
4	C++
5	C#
6	Swift
7	Ruby
8	Kotlin
9	Go
10	TypeScript
11	Rust
12	PHP
13	SQL
14	HTML
15	CSS
16	Scala
17	R
18	Perl
19	Haskell
20	Lua
\.


--
-- TOC entry 4877 (class 0 OID 24751)
-- Dependencies: 232
-- Data for Name: requestedusers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requestedusers (user_id, first_name, last_name, middle_name, company_id, experience_years, position_id) FROM stdin;
\.


--
-- TOC entry 4870 (class 0 OID 24688)
-- Dependencies: 225
-- Data for Name: userhobbies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userhobbies (user_id, hobby_id) FROM stdin;
\.


--
-- TOC entry 4871 (class 0 OID 24703)
-- Dependencies: 226
-- Data for Name: userprogramminglanguages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userprogramminglanguages (user_id, language_id) FROM stdin;
1	4
1	9
1	10
\.


--
-- TOC entry 4869 (class 0 OID 24670)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, first_name, last_name, middle_name, company_id, experience_years, position_id, email, password_hash) FROM stdin;
1	max	maxbetov	none	2	3	2	lolkek@gmail.com	4825
14	asasasas	asasasas	asasasasas	1	1	1	lolkek@gmail.com	pidorasMAX
15	asasasas	asasasas	asasasasas	1	1	1	lolkek@gmail.com	pidorasMAX
16	111111	22222	33333	1	2	3	lolkek@gmail.com	pidorasMAX
\.


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 229
-- Name: admins_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_admin_id_seq', 3, true);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 227
-- Name: chatmessages_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chatmessages_message_id_seq', 3, true);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 221
-- Name: companies_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_company_id_seq', 3, true);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 219
-- Name: hobbies_hobby_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hobbies_hobby_id_seq', 23, true);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 217
-- Name: positions_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.positions_position_id_seq', 3, true);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 215
-- Name: programminglanguages_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programminglanguages_language_id_seq', 3, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 231
-- Name: requestedusers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requestedusers_user_id_seq', 3, true);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 16, true);


--
-- TOC entry 4703 (class 2606 OID 24744)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (admin_id);


--
-- TOC entry 4701 (class 2606 OID 24727)
-- Name: chatmessages chatmessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chatmessages
    ADD CONSTRAINT chatmessages_pkey PRIMARY KEY (message_id);


--
-- TOC entry 4693 (class 2606 OID 24663)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);


--
-- TOC entry 4691 (class 2606 OID 24656)
-- Name: hobbies hobbies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hobbies
    ADD CONSTRAINT hobbies_pkey PRIMARY KEY (hobby_id);


--
-- TOC entry 4689 (class 2606 OID 24649)
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (position_id);


--
-- TOC entry 4687 (class 2606 OID 24642)
-- Name: programminglanguages programminglanguages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programminglanguages
    ADD CONSTRAINT programminglanguages_pkey PRIMARY KEY (language_id);


--
-- TOC entry 4705 (class 2606 OID 24758)
-- Name: requestedusers requestedusers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestedusers
    ADD CONSTRAINT requestedusers_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4697 (class 2606 OID 24692)
-- Name: userhobbies userhobbies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userhobbies
    ADD CONSTRAINT userhobbies_pkey PRIMARY KEY (user_id, hobby_id);


--
-- TOC entry 4699 (class 2606 OID 24707)
-- Name: userprogramminglanguages userprogramminglanguages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprogramminglanguages
    ADD CONSTRAINT userprogramminglanguages_pkey PRIMARY KEY (user_id, language_id);


--
-- TOC entry 4695 (class 2606 OID 24677)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4714 (class 2606 OID 24745)
-- Name: admins admins_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(company_id);


--
-- TOC entry 4712 (class 2606 OID 24733)
-- Name: chatmessages chatmessages_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chatmessages
    ADD CONSTRAINT chatmessages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(user_id);


--
-- TOC entry 4713 (class 2606 OID 24728)
-- Name: chatmessages chatmessages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chatmessages
    ADD CONSTRAINT chatmessages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(user_id);


--
-- TOC entry 4715 (class 2606 OID 24759)
-- Name: requestedusers requestedusers_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestedusers
    ADD CONSTRAINT requestedusers_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(company_id);


--
-- TOC entry 4716 (class 2606 OID 24764)
-- Name: requestedusers requestedusers_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestedusers
    ADD CONSTRAINT requestedusers_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.positions(position_id);


--
-- TOC entry 4708 (class 2606 OID 24698)
-- Name: userhobbies userhobbies_hobby_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userhobbies
    ADD CONSTRAINT userhobbies_hobby_id_fkey FOREIGN KEY (hobby_id) REFERENCES public.hobbies(hobby_id);


--
-- TOC entry 4709 (class 2606 OID 24693)
-- Name: userhobbies userhobbies_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userhobbies
    ADD CONSTRAINT userhobbies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4710 (class 2606 OID 24713)
-- Name: userprogramminglanguages userprogramminglanguages_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprogramminglanguages
    ADD CONSTRAINT userprogramminglanguages_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.programminglanguages(language_id);


--
-- TOC entry 4711 (class 2606 OID 24708)
-- Name: userprogramminglanguages userprogramminglanguages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprogramminglanguages
    ADD CONSTRAINT userprogramminglanguages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4706 (class 2606 OID 24678)
-- Name: users users_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(company_id);


--
-- TOC entry 4707 (class 2606 OID 24683)
-- Name: users users_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.positions(position_id);


-- Completed on 2024-04-21 01:17:44

--
-- PostgreSQL database dump complete
--

