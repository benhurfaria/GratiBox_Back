--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: adress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adress (
    id integer NOT NULL,
    "Uf" text NOT NULL,
    city text NOT NULL,
    cep text NOT NULL,
    "idUser" integer NOT NULL,
    adress text NOT NULL,
    "deliveryDate" text
);


ALTER TABLE public.adress OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adress_id_seq OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adress_id_seq OWNED BY public.adress.id;


--
-- Name: delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery (
    id integer NOT NULL,
    "idServices" integer NOT NULL,
    date text NOT NULL
);


ALTER TABLE public.delivery OWNER TO postgres;

--
-- Name: delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_id_seq OWNER TO postgres;

--
-- Name: delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_id_seq OWNED BY public.delivery.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    token text NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: userServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userServices" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    "idServices" integer NOT NULL,
    "signDate" timestamp with time zone NOT NULL
);


ALTER TABLE public."userServices" OWNER TO postgres;

--
-- Name: userServicesProducts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userServicesProducts" (
    id integer NOT NULL,
    "idProducts" integer NOT NULL,
    "idUserProducts" integer NOT NULL
);


ALTER TABLE public."userServicesProducts" OWNER TO postgres;

--
-- Name: userServicesProducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."userServicesProducts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userServicesProducts_id_seq" OWNER TO postgres;

--
-- Name: userServicesProducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."userServicesProducts_id_seq" OWNED BY public."userServicesProducts".id;


--
-- Name: userServices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."userServices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userServices_id_seq" OWNER TO postgres;

--
-- Name: userServices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."userServices_id_seq" OWNED BY public."userServices".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;


--
-- Name: adress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress ALTER COLUMN id SET DEFAULT nextval('public.adress_id_seq'::regclass);


--
-- Name: delivery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery ALTER COLUMN id SET DEFAULT nextval('public.delivery_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: userServices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServices" ALTER COLUMN id SET DEFAULT nextval('public."userServices_id_seq"'::regclass);


--
-- Name: userServicesProducts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServicesProducts" ALTER COLUMN id SET DEFAULT nextval('public."userServicesProducts_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adress (id, "Uf", city, cep, "idUser", adress, "deliveryDate") FROM stdin;
1	GO	goiania	74170080	3	rua 145	20
2	GO	Goiânia	74170-080	4	Rua 145, 00	20
3	GO	Goiânia	74170-080	5	Rua 145, 00	segunda
4	GO	Goiânia	74170-080	6	Rua 145, 00	10
5	GO	Goiânia	74170-080	7	Rua 145, 00	10
6	GO	Goiânia	74170-080	8	Rua 145, 00	10
7	GO	Goiânia	74170-080	9	Rua 145, 00	10
8	GO	Goiânia	74170-080	10	Rua 145, 00	20
9	GO	Goiânia	74170-080	11	Rua 145, 00	10
10	GO	Goiânia	74170-080	12	Rua 145, 00	1
11	GO	Goiânia	74170-080	13	Rua 145, 00	10
12	GO	Goiânia	74170-080	14	Rua 145, 00	10
13	GO	Goiânia	74170-080	15	Rua 145, 00	10
14	GO	Goiânia	74170-080	16	Rua 145, 00	1
15	GO	Goiânia	74170-080	17	Rua 145, 00	10
16	GO	Goiânia	74170-080	18	Rua 145, 00	10
17	GO	Goiânia	74170-080	19	Rua 145, 00	20
18	GO	Goiânia	74170-080	20	Rua 145, 00	10
19	GO	Goiânia	74170-080	21	Rua 145, 00	10
20	GO	Goiânia	74170-080	22	Rua 145, 00	1
21	GO	Goiânia	74170-080	25	Rua 145, 00	segunda
22	GO	Goiânia	74170-080	26	Rua 145, 00	segunda
23	GO	Goiânia	74170-080	27	Rua 145, 00	segunda
24	GO	Goiânia	74170-080	28	Rua 145, 00	quarta
25	GO	Goiânia	74170-080	29	Rua 145, 00	segunda
26	GO	Goiânia	74170-080	30	Rua 145, 00	quarta
27	GO	Goiânia	74170-080	31	Rua 145, 00	quarta
28	GO	Goiânia	74170-080	32	Rua 145, 00	quarta
29	GO	Goiânia	74170-080	33	Rua 145, 00	quarta
30	GO	Goiânia	74170-080	34	Rua 145, 00	quarta
31	GO	Goiânia	74170-080	35	Rua 145, 00	quarta
32	GO	Goiânia	74170-080	36	Rua 145, 00	quarta
33	GO	Goiânia	74170-080	37	Rua 145, 00	sexta
34	GO	Goiânia	74170-080	38	Rua 145, 00	20
35	GO	Goiânia	74170-080	39	Rua 145, 00	1
36	GO	Goiânia	74170-080	40	Rua 145, 00	01
37	GO	Goiânia	74170-080	41	Rua 145, 00	20
38	GO	Goiânia	74170-080	42	Rua 145, 00	sexta
39	GO	Goiânia	74170-080	43	Rua 145, 00	10
40	GO	Goiânia	74170-080	51	Rua 145, 00	20
41	GO	Goiânia	74170-080	51	Rua 145, 00	quarta
42	GO	Goiânia	74170-080	56	Rua 145, 00	quarta
43	GO	Goiânia	74170-080	54	Rua 145, 00	segunda
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery (id, "idServices", date) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name) FROM stdin;
1	chas
2	incensos
3	produtos organicos
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name) FROM stdin;
1	semanal
2	mensal
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "idUser", token) FROM stdin;
1	1	10329e08-7f31-465c-a5ed-63d01e3c8e50
2	1	1b9b9219-0722-494c-aa40-7510dc77aebd
3	3	7bc8d23d-bef7-4510-8d7c-3fa3a49c6419
4	3	aff33b7c-f533-486f-9e78-a8144b5452b3
5	3	ed4e5ce2-535d-4092-84b2-6a417ca2a5e6
6	4	1e388b45-1eee-48d5-b736-68891be7cbfa
7	4	13c5ff85-18fd-4d6e-9a52-6e18e7b58020
8	4	c4b86953-3a4c-4097-b128-f19e8b3f27ac
9	4	92b370a1-fc3e-4211-aa0d-f0075be9e501
10	4	91d6eac9-c276-4c26-9882-bc1a777eb0ef
11	4	025c3ac5-479f-4272-8dcd-f98033573242
12	4	5bcef6b7-bf79-4b5e-9130-739c8ae0a7ad
13	4	dc917b23-bc3b-4ad7-a369-35086571a517
14	5	35fe6111-877d-4f2a-a624-d1f5fbb0536f
15	5	3766efce-977e-4708-a87e-e7510a521a09
16	6	ddb5af5f-5d5f-4f8d-9b7e-9e23ff56263e
17	7	fc2c2bd1-1d1c-42f0-8f2d-f055614358e5
18	8	cc95514e-e7be-48b9-8d86-02c7384c4b41
19	9	a50e05fc-28f7-4adb-aad5-d58bf84bd029
20	10	52964086-936c-4049-bc4f-84bdbe0519e8
21	11	f1937126-1028-4090-8364-55096a2e0192
22	12	dd1a1904-abaa-4b68-a486-63f45313eefb
23	13	7fe85d8e-0c68-4100-98f6-67dfcf321362
24	14	fd8a97d2-aca3-4259-80c8-12314bed1500
25	15	2c2c804c-b690-449c-8226-52d45b3985fc
26	16	16727265-1734-49d5-a50d-8ca352809327
27	17	9a28e05c-d479-4d66-888f-dca79b369e94
28	18	ee622868-53da-474b-9e78-1ee472d0c653
29	19	d0b64c66-d862-4faa-8fe6-52bcd4df19d6
30	20	92c57442-eb55-4ccb-ab90-c99ab690bccb
31	20	ebe75794-3b90-4f74-b2c0-e631380ce9d9
32	21	102a3aed-aad3-4845-a6bc-78cb84c0e9d3
33	20	25cc1d8f-7d01-4c88-a1a1-1a9bbfcc65dc
34	22	98aa1a6a-4b19-4c54-959c-78f602c805f2
35	25	4febd5c9-c887-4df5-bce1-fe94effb55d4
36	26	5835f92d-c417-4a8e-adaf-41d21f7191e2
37	27	88144b50-d89c-4f5d-b87a-1c385f02834a
38	28	e82dea2b-9b8a-4951-bebf-7e7f6f6ec8f8
39	29	3f53cbe4-6e00-4434-8f5d-fda4620a8e96
40	30	707af56a-c4b4-44dc-9859-5be28b3636db
41	31	4728428f-a4be-4b5e-9f8a-8ee49939ebe7
42	32	7f04695b-a278-411c-8045-9e2c655d0873
43	33	53e18339-72c6-428c-9fa8-c63b5cb64a59
44	34	e1bd0e4f-f846-4890-af56-25461a5f9d1d
45	34	d26ffcb1-4f34-40f7-960e-d1e8da8445e1
46	35	573ad4bb-9c76-4e53-b8b6-97736c83fdbf
47	36	164aded0-5c6d-4aa4-9f06-ed3d9cc23cb1
48	35	9533eefa-cb75-453d-8a85-af3c6334266d
49	35	0764220f-c1e1-4a31-adcd-00e4a45b5648
50	35	5db0426b-0b9d-4cce-931d-074a3bdd5e62
51	35	de803391-639b-4463-8490-145370090d45
52	35	bcb82064-2290-422d-9a01-31142375d523
53	35	914aaccc-8eb4-44ef-8cdb-463093493985
54	35	a3567add-34bf-450f-819e-624be83c040c
55	35	b4d12372-e2f7-45ae-8e29-9cb979468d7d
56	35	2dc18d9e-bc0b-4d2a-9e83-0118707b1b4a
57	35	88813723-72c7-441a-8d30-602900f320c4
58	35	b44c9c0b-d35a-4cfb-8606-7362104ffd1d
59	35	f91975ce-0e26-46cf-84b0-3bf50f3fb728
60	35	27b8fa76-3db9-4e4c-8e57-f90770c771c5
61	35	b3672292-769f-4612-bb7e-c73485e4464b
62	35	ad96b615-ae8b-4629-9a87-03fa95e9ce57
63	35	bfe342a1-e573-4baa-8b87-73624b3715f7
64	35	c53706b8-b4d6-4338-ba40-9e5c8ca26b90
65	35	65764cac-9d4c-4fa6-bc36-cea4bea5b949
66	35	7463c534-3514-4117-bc33-6a7a71d1296f
67	35	d241f310-6e14-4e8b-9a5c-55c8001eb266
68	35	aa37790b-5f71-45d3-9599-0cd98c8ab1d5
69	37	8a6b20ab-bc01-4837-b811-7b4097edf6da
70	35	5b9dbc7b-5f60-4790-b52d-a9d43efae9e8
71	38	b272ab65-e439-46e4-9c4c-8ce5a8982ee1
72	38	a92e7be0-5565-4314-af23-17ea38c5f37a
73	38	9a0960bc-b562-4c32-b0d2-c869fa26e5ca
74	38	2bce4d1c-70eb-4dbb-818b-fd03a0206c6e
75	38	8c87faee-1ab7-4273-ba82-48153a9fb5b6
76	38	cd1dd6a2-4f09-46e3-a584-121a00b0c941
77	38	62379017-5131-4343-8ee3-cf381531b9ed
78	35	f4a17f5d-a6c3-44d6-9954-dc3f04aa64fa
79	38	b302b3ce-ae43-4292-9688-3a8fc7b5f9cd
80	39	9cc3e897-5212-4ac1-bcc0-1c680190a75e
81	35	1443f5a3-1531-4d8a-a21e-0b798e9cea8c
82	38	4c069142-4e16-4897-bff0-c295c04a8935
83	40	d33def6c-f18b-4947-93ef-b39ade5291c5
84	41	db9f3238-fc1d-4ebe-96b2-cfb8e9243981
85	42	d41e4dbb-3c6f-4808-ad32-657d6b670dab
86	42	8a698b87-c920-4926-9f44-a11db0084f49
87	43	26c826a1-5d38-43fb-80b3-aa31a0ec0a5c
88	43	805d66b5-988e-45d8-9070-4b3b83abf344
89	43	c1696dbb-0e48-499b-ae1e-bc19e315f4dd
90	18	48e13ae9-9384-4df6-b041-62dca83585f4
91	3	5c3f2228-e53c-4996-8d35-5911a81225e0
92	51	f19aa9ba-dcf7-4c57-a18e-4394184cdf64
93	51	d6004656-6228-46ab-b3fc-38403921c29d
94	51	b47fca36-c2c2-4dc0-876d-aaa865a87c8e
95	51	4e61b5d8-15ef-426d-92f2-56274435eb01
96	51	39d4bf77-1390-40b9-99eb-919c262244a9
97	51	3e214510-9445-44ac-88c5-95e675588c8d
98	52	c7cb2016-c1f1-4f85-b8b9-9d78cc76aa51
99	53	02ee7ab5-5455-4a88-be31-34997f077091
100	54	7a540c18-dbf1-4e1a-9b5c-4a8fd2b463db
101	55	8709719c-7e9d-46e5-9954-9d47e29d3e0c
102	55	47c52386-126e-4bf2-a629-6be63e0e6677
103	55	b643fc6e-df17-4efc-859a-d27d4f50cd36
104	56	90939457-385b-499c-b16f-a3f96e8b2de8
105	56	a1c7ab2d-ff20-4981-9ebb-e09d8de5a39b
106	56	812f7c3c-533c-4e60-8a23-dfc7a70146d0
107	56	df2036dc-e4da-4026-9bc6-1550927fdfba
108	54	b0034be7-fa0a-4dbe-8b2c-ac04090471fb
109	54	d19edacd-ce4c-400b-ae27-7b0eb4e122a6
\.


--
-- Data for Name: userServices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userServices" (id, "idUser", "idServices", "signDate") FROM stdin;
8	3	2	2021-11-21 19:29:35.86239-03
12	4	2	2021-11-21 22:44:24.82427-03
13	5	1	2021-11-21 23:24:24.563346-03
14	6	2	2021-11-21 23:27:22.777191-03
15	7	2	2021-11-21 23:40:10.49893-03
16	8	2	2021-11-21 23:43:57.112317-03
17	9	2	2021-11-21 23:55:02.244029-03
18	10	2	2021-11-22 00:01:59.711979-03
19	11	2	2021-11-22 00:07:45.579017-03
20	12	2	2021-11-22 00:09:14.052079-03
21	13	2	2021-11-22 00:11:20.973017-03
22	14	2	2021-11-22 00:12:18.198205-03
23	15	2	2021-11-22 00:14:44.629611-03
24	16	2	2021-11-22 00:24:00.569319-03
25	17	2	2021-11-22 00:25:03.387272-03
26	18	2	2021-11-22 00:26:19.744963-03
27	19	2	2021-11-22 00:29:59.981978-03
28	20	2	2021-11-22 00:32:25.627952-03
29	21	2	2021-11-22 00:33:39.929508-03
30	22	2	2021-11-22 00:35:51.853559-03
31	25	1	2021-11-22 01:41:33.75891-03
32	26	1	2021-11-22 01:44:39.197877-03
33	27	1	2021-11-22 01:50:10.423065-03
34	28	1	2021-11-22 01:51:47.921469-03
35	29	1	2021-11-22 02:02:24.353843-03
36	30	1	2021-11-22 02:04:37.976473-03
37	31	1	2021-11-22 02:06:59.604152-03
38	32	1	2021-11-22 02:11:54.252808-03
39	33	1	2021-11-22 02:15:05.19718-03
40	34	1	2021-11-22 02:19:34.054788-03
41	35	1	2021-11-22 02:23:16.567873-03
42	36	1	2021-11-22 02:25:10.954008-03
43	37	1	2021-11-22 07:57:53.684339-03
44	38	2	2021-11-22 08:00:14.980545-03
45	39	2	2021-11-22 08:29:18.967921-03
46	40	2	2021-11-22 08:39:06.594241-03
47	41	2	2021-11-22 08:40:33.22524-03
48	42	1	2021-11-22 11:02:08.602393-03
49	43	2	2021-11-22 11:03:39.723415-03
50	51	2	2021-11-22 15:11:26.167869-03
51	51	1	2021-11-22 15:17:25.966415-03
52	56	1	2021-11-22 16:19:42.309324-03
53	54	1	2021-11-22 16:22:46.177748-03
\.


--
-- Data for Name: userServicesProducts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userServicesProducts" (id, "idProducts", "idUserProducts") FROM stdin;
1	1	8
2	3	8
3	3	12
4	1	13
5	1	14
6	3	15
7	1	16
8	1	17
9	1	18
10	3	19
11	1	20
12	3	21
13	1	22
14	1	23
15	1	24
16	3	25
17	1	26
18	2	27
19	1	28
20	1	29
21	2	30
22	3	31
23	1	32
24	3	33
25	1	34
26	3	35
27	3	36
28	1	37
29	3	38
30	2	39
31	2	40
32	1	41
33	3	42
34	1	43
35	1	44
36	1	45
37	3	46
38	2	47
39	3	48
40	2	48
41	1	49
42	3	49
43	1	50
44	1	51
45	2	52
46	1	53
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
1	bensasa	ben12333@mail.com	$2b$10$xyteb0ZHArCq55iGxcn6fedMPHxaESe7FA1TO5SFDsqvISuxMqy7G
3	ben	ben10@gmail.com	$2b$10$UnycstId.Z8wxGoS4AH1teCVuK6JNDKttX8vYuWwqWfaxFKWsmaY6
4	xablau	xablau@gmail.com	$2b$10$5etvX6EedIe5c7c.dmlkduS4JhXjQdEbX.usDLaKsQ/ggZex.7rj6
5	xablaj	xablaj@gmail.com	$2b$10$c8DujqIt92DNmaNS8gfNDeCcNf78BngVrmxQr64sBJ5F.9KIQXuoa
6	ben	xablajj@gmail.com	$2b$10$EO8sXVs7NYFe7h3PBCp8cuvLN/1ZH5U6uO8IE7xrdqUf0fW/1QDk6
7	ben	xablauj@gmail.com	$2b$10$gjMfX9nxKtIJelXYS/sebOWiq5/2.zhV5f.diaGR5ai0iFMWFAcoe
8	qisso	qisso@gmail.com	$2b$10$Y523lY9KC9K9lf3Qey7euuP1uhNKW9gGhgvCQkRxFr9f/5eyQslOe
9	brau	bob@gmail.com	$2b$10$lTJ6r3ChI3X1HTjJnsPX5eM2gL/Of/yTBcgaYpvqGZ9/xBMbOay7W
10	fasda	kiztomizy@gmail.com	$2b$10$/x92vI85C4JZ7lYyZzzFs.GfTyCGIi6pSZMA6acSVeesKYNzzYRZC
11	xaq	koasmizy@gmail.com	$2b$10$X8eNnFWOh3upY2zYirpJq.vVCXwH8z75WEx8dicP931mYCVFKZILG
12	meu	deus@gmail.com	$2b$10$v7hBGGWhyjlrXGMPIBN9G.52wPkFbMA8hBkeZUMXw5UOoy8FSwSsa
13	deus	meu@gmail.com	$2b$10$PjRhSg7S9IQ33XaWDStesepQj8izdjENrf2ASsyPfc3G.m9jIL08O
14	deusmeu	priston@gmail.com	$2b$10$sWtn1pdvd0PMnhZIeYBCieyGjNQiU/lj5wczxEZYvyNnwPSPFSUki
15	nossa	calma@gmail.com	$2b$10$A3J17s4zzf1NLR4eLYJFrOso74rUhibMhfP408h7Qgp7lCuZBWGwy
16	pqp	pqp@gmail.com	$2b$10$bEJVAHJAbvCa1EfYu0iqqOgTqtR6DePqRblIThBznjF3BKD4zwgcG
17	asasa	asa@gmail.com	$2b$10$59cFvTN9mEIodxX4FnQfOeOOBABhkhZLLubE7mOgXS4hElXXKbeMu
18	qisso	koas@gmail.com	$2b$10$zPs3/R6.THeVrFp6bTNuQeeKGRYKJGFBU9AK2sgoBI0XpdLMJmreK
19	dasd	dede@gmail.com	$2b$10$jT80yxJI66b2gfVjcZb3muT99zEd5z4PrTp85BEqnu6lzz5M/ds46
20	asds	help@gmail.com	$2b$10$JNztm0ICKlDCRwRsP//TquFIB/a3WhZLPtX1CX.MMsUdIpUnAuqKy
21	asd	putz@gmail.com	$2b$10$DDhu8mgnsR5nPKcmWwQs3.DYxwBMKAcXWjNGPYpfWJYrvBtArNVyi
22	ajuda	ajuda@gmail.com	$2b$10$LGNYwwCAijAxLsUZhZiw7O7NzjE55bN.AW9jPPfNGZqA6kg.uAwQ6
25	koasmizy	kiz@gmail.com	$2b$10$aHiv4syLHZflLnz1TnSd6uvfQOsuPHvct423lpEkHssacA.uQTY3C
26	asd	asd@gmail.com	$2b$10$7Ila/J9aUbn5WmHB28jwAuZV2lHyWJRPbI58VpYV9Z.ExGmWvJiES
27	quebrado	quebrado@gmail.com	$2b$10$2WhEqBQ08ccERW/A0d1Ide7xU7h7xXMe1jW4V25RcLv/IryfmWUgm
28	plo	plo@gmail.com	$2b$10$n/2kJ.y7UkLltdsqbAl.jeqcWJDTTl5Nm6b9b77AcdgmP2eQsked6
29	por	favor@gmail.com	$2b$10$QS6pworwVbckPjIKET5WSeQ4mLMaNn7NyidGEvg0Hsr9Do1VbxcPK
30	favor	por@gmail.com	$2b$10$I7JHjDdIZFTGrTuLtJgbRO3GrMnwMvEz11JxCNqg5n852BlS3qpli
31	check	check@gmail.com	$2b$10$WtEbbYOg391RnqgeSz0kt.N8hFC.0b/nRWD4Mpfr14X0XLq3cNzUO
32	kizto	kizto@gmail.com	$2b$10$LS9TY2PM2f84BgVbm11sMuqwd1mfuebqEcd3a6qcOllIj0mW0Qu.i
33	ads	ads@gmail.com	$2b$10$EvoX23uOjNybQH8nri3tzu5fke9Q2qPODGHZjcjV0byFFa8VF9ZUi
34	saa	saa@gmail.com	$2b$10$cIv/jcM4kEJam9kmV7/jKON52cl.BV30GCnAt5cmlt/TleRVlSIw6
35	kopp	ko@gmail.com	$2b$10$qFBUh8WnoqhnXn5GzTFdK.bTMQFrIhFO0wW/3aEJ2//MlWC3B0eLK
36	vish	vish@gmail.com	$2b$10$tjHpLDCI0ZbyTXyQrIGy..uLWIhSv4LFoI37/ecMelNawH9aZk34W
37	pas	pas@gmail.com	$2b$10$X34KbtsXZ9xiB2.ppVN/w.Nnjyv/NYWEOilGBsTcdYBdAZaTjvNCO
38	zara	zara@gmail.com	$2b$10$fTDMr9M36BPIFujYH443Gud.FDLdneJtepZLOM5YnyjRHtVHSG2gm
39	kaa	kaa@gmail.com	$2b$10$woZebsTdyY7mBBRsFUA7/OyA7Dpsv2ffw5uLcLHGGOguBgmjGsGRy
40	pris	pris@gmail.com	$2b$10$aYhbcu6q1KnizczQlwBGjOnA9WVCQJF6Ffp7q5vJ3WfkJVx0tDAdC
41	koe	koe@gmail.com	$2b$10$nfc4fjiO14U7SSygbvVDMOSe8KHbMOaCvk/H8ywaXybYolDBR8cP2
42	ben	ben@gmail.com	$2b$10$fECI7uRIFL4K187PEoFjoOVIO6EvCleLWZdNA19yny.wwPtOB5W6O
43	ben1	ben1@gmail.com	$2b$10$im/nEXs925E/tGnDMsE90uL4RyazeQLrTBxtrv2On/p3PlzMIkrWq
44	Kim Emmerich MD	Zula_Welch@yahoo.com	$2b$10$u8gsvcUrVYkrRBJQIvUuKuWkNSyQFBLjfeM9H36yZErnZnaUUJPYa
45	Glen Cummerata	Madonna84@hotmail.com	$2b$10$sQuMk19FoDjScZJFSF9Qd.ZD8MgE/rs/udCGrB7y8BWMSOEJiSEqi
46	Ernestine Bins	Therese_Altenwerth@hotmail.com	$2b$10$zJmtWwIitatqL3PHCxGlFee6lXHW1D0lDvOrhpNwtTj0AClz7vjvm
47	Arturo Rempel	Malvina.Bins70@yahoo.com	$2b$10$DvwteUbSrnlYZqbN1B8buOTBfEEz.Lw8W8jGxLRkuBu/4miXtXbeK
48	Iris Kreiger	Jayne_Kuhlman@yahoo.com	$2b$10$BwXzSyPCiD60joS1Ac5dU.Td3s8Y1Vft.xTq5bl/35YXSk0nXwSGG
49	Lorena Wisozk MD	Ramona.West37@hotmail.com	$2b$10$vFavUnbiaYklt9IBVLifmuppIjYwU8DkJsl4QdotNsld5N/ZVu9wy
50	pedro	pedro@gmail.com	$2b$10$dc636Jw4BPSzto3onAzzlOie..mQdJKCpmbom34Tdv8jhAfJPx3au
51	brother	brother@gmail.com	$2b$10$OEJ30SNnFAkt8DhWbGTlM.xW7bC3zMXjIPZtpJcYihVNIQvXV/k2y
52	prizi	prizi@gmail.com	$2b$10$Qd7Ut5xQ7D9wHmiHaCdnhedzhKw.hy9m10mlyEIYpv05SyDgGKnTe
53	lip	lip@gmail.com	$2b$10$2kG3vo2ioGmGEXzr.28LQOHWS6I9X6Sq6Yi.ZIQocNO40wKH8/xge
54	show	show@gmail.com	$2b$10$6mR7JdE1d2mn4GDqmK02N.ayigetpoIYSvRbJPEqstQcJljc/LR3S
55	show	show2@gmail.com	$2b$10$UlcEDpk8OVVUkMEbd5slpuPI3.oh7TjVOarRXSI5wXOxpEExk9i9K
56	xablau	xab@gmail.com	$2b$10$ym0smVT0/A64cioPNqoQWeCYRpjBDsxHp/qinKb24rGLrZEPinuvi
\.


--
-- Name: adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adress_id_seq', 43, true);


--
-- Name: delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 2, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 109, true);


--
-- Name: userServicesProducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."userServicesProducts_id_seq"', 46, true);


--
-- Name: userServices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."userServices_id_seq"', 53, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 56, true);


--
-- Name: adress adress_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress
    ADD CONSTRAINT adress_pk PRIMARY KEY (id);


--
-- Name: users constraint_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT constraint_name UNIQUE (email);


--
-- Name: delivery delivery_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pk PRIMARY KEY (id);


--
-- Name: products products_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pk PRIMARY KEY (id);


--
-- Name: services services_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: userServicesProducts userServicesProducts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServicesProducts"
    ADD CONSTRAINT "userServicesProducts_pk" PRIMARY KEY (id);


--
-- Name: userServices userServices_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServices"
    ADD CONSTRAINT "userServices_pk" PRIMARY KEY (id);


--
-- Name: users user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: adress adress_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress
    ADD CONSTRAINT adress_fk0 FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: delivery delivery_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_fk0 FOREIGN KEY ("idServices") REFERENCES public.services(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: userServicesProducts userServicesProducts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServicesProducts"
    ADD CONSTRAINT "userServicesProducts_fk0" FOREIGN KEY ("idProducts") REFERENCES public.products(id);


--
-- Name: userServicesProducts userServicesProducts_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServicesProducts"
    ADD CONSTRAINT "userServicesProducts_fk1" FOREIGN KEY ("idUserProducts") REFERENCES public."userServices"(id);


--
-- Name: userServices userServices_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServices"
    ADD CONSTRAINT "userServices_fk0" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: userServices userServices_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userServices"
    ADD CONSTRAINT "userServices_fk1" FOREIGN KEY ("idServices") REFERENCES public.services(id);


--
-- PostgreSQL database dump complete
--

