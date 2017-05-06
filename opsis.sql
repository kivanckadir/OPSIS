--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.19
-- Dumped by pg_dump version 9.2.19
-- Started on 2017-05-06 00:53:21

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2036 (class 1262 OID 24576)
-- Dependencies: 2035
-- Name: OPSIS; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "OPSIS" IS 'OPSIS - Özel Psikiyatri Kliniği Sistemi';


--
-- TOC entry 1 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 176 (class 1259 OID 25438)
-- Name: doktor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE doktor (
    did integer NOT NULL,
    tckn bigint NOT NULL,
    ad character varying(30) NOT NULL,
    soyad character varying(30) NOT NULL,
    cinsiyet character varying(5) NOT NULL,
    telefon bigint,
    email character varying(30),
    adres character varying(500),
    kullaniciadi character varying(30) NOT NULL,
    sifre character varying(30) NOT NULL
);


ALTER TABLE public.doktor OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 25436)
-- Name: doktor_did_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE doktor_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doktor_did_seq OWNER TO postgres;

--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 175
-- Name: doktor_did_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE doktor_did_seq OWNED BY doktor.did;


--
-- TOC entry 174 (class 1259 OID 25425)
-- Name: hasta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hasta (
    hid integer NOT NULL,
    tckn bigint NOT NULL,
    ad character varying(30) NOT NULL,
    soyad character varying(30) NOT NULL,
    cinsiyet character varying(5) NOT NULL,
    telefon bigint,
    email character varying(30),
    adres character varying(500)
);


ALTER TABLE public.hasta OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 25423)
-- Name: hasta_hid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hasta_hid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hasta_hid_seq OWNER TO postgres;

--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 173
-- Name: hasta_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hasta_hid_seq OWNED BY hasta.hid;


--
-- TOC entry 184 (class 1259 OID 25482)
-- Name: nott; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nott (
    nid integer NOT NULL,
    icerik character varying(500) NOT NULL,
    did integer NOT NULL,
    hid integer NOT NULL
);


ALTER TABLE public.nott OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25478)
-- Name: nott_did_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nott_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nott_did_seq OWNER TO postgres;

--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 182
-- Name: nott_did_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nott_did_seq OWNED BY nott.did;


--
-- TOC entry 183 (class 1259 OID 25480)
-- Name: nott_hid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nott_hid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nott_hid_seq OWNER TO postgres;

--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 183
-- Name: nott_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nott_hid_seq OWNED BY nott.hid;


--
-- TOC entry 181 (class 1259 OID 25476)
-- Name: nott_nid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nott_nid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nott_nid_seq OWNER TO postgres;

--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 181
-- Name: nott_nid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nott_nid_seq OWNED BY nott.nid;


--
-- TOC entry 188 (class 1259 OID 25511)
-- Name: randevu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE randevu (
    rdvid integer NOT NULL,
    did integer NOT NULL,
    hid integer NOT NULL,
    tarih date NOT NULL,
    saat time without time zone NOT NULL
);


ALTER TABLE public.randevu OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25507)
-- Name: randevu_did_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE randevu_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.randevu_did_seq OWNER TO postgres;

--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 186
-- Name: randevu_did_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE randevu_did_seq OWNED BY randevu.did;


--
-- TOC entry 187 (class 1259 OID 25509)
-- Name: randevu_hid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE randevu_hid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.randevu_hid_seq OWNER TO postgres;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 187
-- Name: randevu_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE randevu_hid_seq OWNED BY randevu.hid;


--
-- TOC entry 185 (class 1259 OID 25503)
-- Name: randevu_rdvid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE randevu_rdvid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.randevu_rdvid_seq OWNER TO postgres;

--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 185
-- Name: randevu_rdvid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE randevu_rdvid_seq OWNED BY randevu.rdvid;


--
-- TOC entry 180 (class 1259 OID 25455)
-- Name: recete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recete (
    rid integer NOT NULL,
    icerik character varying(500) NOT NULL,
    did integer NOT NULL,
    hid integer NOT NULL
);


ALTER TABLE public.recete OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 25451)
-- Name: recete_did_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recete_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recete_did_seq OWNER TO postgres;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 178
-- Name: recete_did_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recete_did_seq OWNED BY recete.did;


--
-- TOC entry 179 (class 1259 OID 25453)
-- Name: recete_hid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recete_hid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recete_hid_seq OWNER TO postgres;

--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 179
-- Name: recete_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recete_hid_seq OWNED BY recete.hid;


--
-- TOC entry 177 (class 1259 OID 25449)
-- Name: recete_rid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recete_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recete_rid_seq OWNER TO postgres;

--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 177
-- Name: recete_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recete_rid_seq OWNED BY recete.rid;


--
-- TOC entry 172 (class 1259 OID 25412)
-- Name: sekreter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sekreter (
    sid integer NOT NULL,
    tckn bigint NOT NULL,
    ad character varying(30) NOT NULL,
    soyad character varying(30) NOT NULL,
    cinsiyet character varying(5) NOT NULL,
    telefon bigint,
    email character varying(30),
    adres character varying(500),
    kullaniciadi character varying(30) NOT NULL,
    sifre character varying(30) NOT NULL
);


ALTER TABLE public.sekreter OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 25410)
-- Name: sekreter_sid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sekreter_sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sekreter_sid_seq OWNER TO postgres;

--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 171
-- Name: sekreter_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sekreter_sid_seq OWNED BY sekreter.sid;


--
-- TOC entry 170 (class 1259 OID 25399)
-- Name: yonetici; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE yonetici (
    yid integer NOT NULL,
    tckn bigint NOT NULL,
    ad character varying(30) NOT NULL,
    soyad character varying(30) NOT NULL,
    cinsiyet character varying(5) NOT NULL,
    telefon bigint,
    email character varying(30),
    adres character varying(500),
    kullaniciadi character varying(30) NOT NULL,
    sifre character varying(30) NOT NULL
);


ALTER TABLE public.yonetici OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 25397)
-- Name: yonetici_yid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE yonetici_yid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yonetici_yid_seq OWNER TO postgres;

--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 169
-- Name: yonetici_yid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE yonetici_yid_seq OWNED BY yonetici.yid;


--
-- TOC entry 1867 (class 2604 OID 25441)
-- Name: did; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doktor ALTER COLUMN did SET DEFAULT nextval('doktor_did_seq'::regclass);


--
-- TOC entry 1866 (class 2604 OID 25428)
-- Name: hid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hasta ALTER COLUMN hid SET DEFAULT nextval('hasta_hid_seq'::regclass);


--
-- TOC entry 1871 (class 2604 OID 25485)
-- Name: nid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nott ALTER COLUMN nid SET DEFAULT nextval('nott_nid_seq'::regclass);


--
-- TOC entry 1872 (class 2604 OID 25486)
-- Name: did; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nott ALTER COLUMN did SET DEFAULT nextval('nott_did_seq'::regclass);


--
-- TOC entry 1873 (class 2604 OID 25487)
-- Name: hid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nott ALTER COLUMN hid SET DEFAULT nextval('nott_hid_seq'::regclass);


--
-- TOC entry 1874 (class 2604 OID 25514)
-- Name: rdvid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY randevu ALTER COLUMN rdvid SET DEFAULT nextval('randevu_rdvid_seq'::regclass);


--
-- TOC entry 1875 (class 2604 OID 25516)
-- Name: did; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY randevu ALTER COLUMN did SET DEFAULT nextval('randevu_did_seq'::regclass);


--
-- TOC entry 1876 (class 2604 OID 25517)
-- Name: hid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY randevu ALTER COLUMN hid SET DEFAULT nextval('randevu_hid_seq'::regclass);


--
-- TOC entry 1868 (class 2604 OID 25458)
-- Name: rid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recete ALTER COLUMN rid SET DEFAULT nextval('recete_rid_seq'::regclass);


--
-- TOC entry 1869 (class 2604 OID 25459)
-- Name: did; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recete ALTER COLUMN did SET DEFAULT nextval('recete_did_seq'::regclass);


--
-- TOC entry 1870 (class 2604 OID 25460)
-- Name: hid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recete ALTER COLUMN hid SET DEFAULT nextval('recete_hid_seq'::regclass);


--
-- TOC entry 1865 (class 2604 OID 25415)
-- Name: sid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sekreter ALTER COLUMN sid SET DEFAULT nextval('sekreter_sid_seq'::regclass);


--
-- TOC entry 1864 (class 2604 OID 25402)
-- Name: yid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY yonetici ALTER COLUMN yid SET DEFAULT nextval('yonetici_yid_seq'::regclass);


--
-- TOC entry 2018 (class 0 OID 25438)
-- Dependencies: 176
-- Data for Name: doktor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO doktor (did, tckn, ad, soyad, cinsiyet, telefon, email, adres, kullaniciadi, sifre) VALUES (1, 2224448, 'Selim', 'Tuncay', 'Erkek', 5547280238, 'selimtuncay@gmail.com', NULL, 'selim', 'tuncay1');
INSERT INTO doktor (did, tckn, ad, soyad, cinsiyet, telefon, email, adres, kullaniciadi, sifre) VALUES (2, 12121, 'Murat', 'Sarı', 'Erkek', 4545687, NULL, NULL, 'mut', 'at');
INSERT INTO doktor (did, tckn, ad, soyad, cinsiyet, telefon, email, adres, kullaniciadi, sifre) VALUES (3, 5487, 'Hasan', 'Masah', 'Erkek', 5454, NULL, NULL, 'has', 'an');
INSERT INTO doktor (did, tckn, ad, soyad, cinsiyet, telefon, email, adres, kullaniciadi, sifre) VALUES (4, 56454, 'Nuriye', 'Kazıkazan', 'Kadın', 4545, NULL, NULL, 'nur', 'iye');


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 175
-- Name: doktor_did_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('doktor_did_seq', 1, false);


--
-- TOC entry 2016 (class 0 OID 25425)
-- Dependencies: 174
-- Data for Name: hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (206, 122121121, 'qqqqqqq', 'wwwwwwww', 'Erkek', 323232, '', '');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (207, 999099000, 'ewqqwe', 'qweewq', 'Erkek', 990990, '', '');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (142, 2224456042, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (143, 22245645440, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (144, 2255140, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (145, 221156645640, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (147, 22864335640, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (148, 286450622440, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (149, 4484560, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (150, 2846456240, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (151, 226829440, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (152, 224801, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (153, 224246440, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (154, 22240042, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (155, 22265445440, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');
INSERT INTO hasta (hid, tckn, ad, soyad, cinsiyet, telefon, email, adres) VALUES (156, 224565540, 'Kadir', 'Kıvanç', 'Erkek', 54545, 'dsfsf', 'asdasdasdasd');


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 173
-- Name: hasta_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hasta_hid_seq', 208, true);


--
-- TOC entry 2026 (class 0 OID 25482)
-- Dependencies: 184
-- Data for Name: nott; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 182
-- Name: nott_did_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nott_did_seq', 1, false);


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 183
-- Name: nott_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nott_hid_seq', 1, false);


--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 181
-- Name: nott_nid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nott_nid_seq', 1, false);


--
-- TOC entry 2030 (class 0 OID 25511)
-- Dependencies: 188
-- Data for Name: randevu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO randevu (rdvid, did, hid, tarih, saat) VALUES (44, 2, 150, '2017-05-04', '13:15:00');


--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 186
-- Name: randevu_did_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('randevu_did_seq', 4, true);


--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 187
-- Name: randevu_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('randevu_hid_seq', 4, true);


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 185
-- Name: randevu_rdvid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('randevu_rdvid_seq', 46, true);


--
-- TOC entry 2022 (class 0 OID 25455)
-- Dependencies: 180
-- Data for Name: recete; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 178
-- Name: recete_did_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recete_did_seq', 1, false);


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 179
-- Name: recete_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recete_hid_seq', 1, false);


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 177
-- Name: recete_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recete_rid_seq', 1, false);


--
-- TOC entry 2014 (class 0 OID 25412)
-- Dependencies: 172
-- Data for Name: sekreter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sekreter (sid, tckn, ad, soyad, cinsiyet, telefon, email, adres, kullaniciadi, sifre) VALUES (1, 22244049614, 'Kadir', 'Kıvanç', 'Erkek', 5547280238, 'kivanckadir@hotmail.com', 'Cibali Mah. Cibali Cad. No: 16 Daire: 6 Fatih/İSTANBUL', 'kivanckadir', '111');


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 171
-- Name: sekreter_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sekreter_sid_seq', 1, true);


--
-- TOC entry 2012 (class 0 OID 25399)
-- Dependencies: 170
-- Data for Name: yonetici; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO yonetici (yid, tckn, ad, soyad, cinsiyet, telefon, email, adres, kullaniciadi, sifre) VALUES (1, 26655, 'Atakan', 'Dizdöven', 'Erkek', 1545464, 'atakannn@gmail.com', NULL, 'ata', 'kan');


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 169
-- Name: yonetici_yid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('yonetici_yid_seq', 1, false);


--
-- TOC entry 1890 (class 2606 OID 25446)
-- Name: doktor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY doktor
    ADD CONSTRAINT doktor_pkey PRIMARY KEY (did);


--
-- TOC entry 1892 (class 2606 OID 25448)
-- Name: doktor_tckn_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY doktor
    ADD CONSTRAINT doktor_tckn_key UNIQUE (tckn);


--
-- TOC entry 1886 (class 2606 OID 25433)
-- Name: hasta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hasta
    ADD CONSTRAINT hasta_pkey PRIMARY KEY (hid);


--
-- TOC entry 1888 (class 2606 OID 25435)
-- Name: hasta_tckn_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hasta
    ADD CONSTRAINT hasta_tckn_key UNIQUE (tckn);


--
-- TOC entry 1896 (class 2606 OID 25492)
-- Name: nott_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nott
    ADD CONSTRAINT nott_pkey PRIMARY KEY (nid);


--
-- TOC entry 1898 (class 2606 OID 25519)
-- Name: randevu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY randevu
    ADD CONSTRAINT randevu_pkey PRIMARY KEY (rdvid);


--
-- TOC entry 1894 (class 2606 OID 25465)
-- Name: recete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recete
    ADD CONSTRAINT recete_pkey PRIMARY KEY (rid);


--
-- TOC entry 1882 (class 2606 OID 25420)
-- Name: sekreter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sekreter
    ADD CONSTRAINT sekreter_pkey PRIMARY KEY (sid);


--
-- TOC entry 1884 (class 2606 OID 25422)
-- Name: sekreter_tckn_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sekreter
    ADD CONSTRAINT sekreter_tckn_key UNIQUE (tckn);


--
-- TOC entry 1878 (class 2606 OID 25407)
-- Name: yonetici_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY yonetici
    ADD CONSTRAINT yonetici_pkey PRIMARY KEY (yid);


--
-- TOC entry 1880 (class 2606 OID 25409)
-- Name: yonetici_tckn_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY yonetici
    ADD CONSTRAINT yonetici_tckn_key UNIQUE (tckn);


--
-- TOC entry 1901 (class 2606 OID 32795)
-- Name: nott_did_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nott
    ADD CONSTRAINT nott_did_fkey FOREIGN KEY (did) REFERENCES doktor(did) ON DELETE CASCADE;


--
-- TOC entry 1902 (class 2606 OID 32800)
-- Name: nott_hid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nott
    ADD CONSTRAINT nott_hid_fkey FOREIGN KEY (hid) REFERENCES hasta(hid) ON DELETE CASCADE;


--
-- TOC entry 1904 (class 2606 OID 32790)
-- Name: randevu_did_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY randevu
    ADD CONSTRAINT randevu_did_fkey FOREIGN KEY (did) REFERENCES doktor(did) ON DELETE CASCADE;


--
-- TOC entry 1903 (class 2606 OID 32780)
-- Name: randevu_hid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY randevu
    ADD CONSTRAINT randevu_hid_fkey FOREIGN KEY (hid) REFERENCES hasta(hid) ON DELETE CASCADE;


--
-- TOC entry 1900 (class 2606 OID 32825)
-- Name: recete_did_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recete
    ADD CONSTRAINT recete_did_fkey FOREIGN KEY (did) REFERENCES doktor(did) ON DELETE CASCADE;


--
-- TOC entry 1899 (class 2606 OID 32810)
-- Name: recete_hid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recete
    ADD CONSTRAINT recete_hid_fkey FOREIGN KEY (hid) REFERENCES hasta(hid) ON DELETE CASCADE;


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-05-06 00:53:21

--
-- PostgreSQL database dump complete
--

