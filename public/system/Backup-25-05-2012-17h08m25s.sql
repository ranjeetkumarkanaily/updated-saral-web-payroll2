--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attendance_configurations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attendance_configurations (
    id integer NOT NULL,
    attendance character varying(255),
    short_name character varying(255),
    salary_calendar_days character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.attendance_configurations OWNER TO postgres;

--
-- Name: attendance_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attendance_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendance_configurations_id_seq OWNER TO postgres;

--
-- Name: attendance_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attendance_configurations_id_seq OWNED BY attendance_configurations.id;


--
-- Name: attendance_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attendance_configurations_id_seq', 2, true);


--
-- Name: audits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE audits (
    id integer NOT NULL,
    auditable_id integer,
    auditable_type character varying(255),
    associated_id integer,
    associated_type character varying(255),
    user_id integer,
    user_type character varying(255),
    username character varying(255),
    action character varying(255),
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying(255),
    remote_address character varying(255),
    created_at timestamp without time zone
);


ALTER TABLE public.audits OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audits_id_seq OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE audits_id_seq OWNED BY audits.id;


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('audits_id_seq', 610, true);


--
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE branches (
    id integer NOT NULL,
    branch_name character varying(255),
    responsible_person character varying(255),
    address character varying(255),
    pf_group_id integer,
    esi_group_id integer,
    pt_group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    esi_applicable boolean
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO postgres;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE branches_id_seq OWNED BY branches.id;


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('branches_id_seq', 4, true);


--
-- Name: classification_headings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE classification_headings (
    id integer NOT NULL,
    classification_heading_name character varying(255),
    display_order integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.classification_headings OWNER TO postgres;

--
-- Name: classification_headings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classification_headings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classification_headings_id_seq OWNER TO postgres;

--
-- Name: classification_headings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE classification_headings_id_seq OWNED BY classification_headings.id;


--
-- Name: classification_headings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classification_headings_id_seq', 1, true);


--
-- Name: classifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE classifications (
    id integer NOT NULL,
    classification_heading_id integer,
    classification_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.classifications OWNER TO postgres;

--
-- Name: classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifications_id_seq OWNER TO postgres;

--
-- Name: classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE classifications_id_seq OWNED BY classifications.id;


--
-- Name: classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classifications_id_seq', 1, true);


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE companies (
    id integer NOT NULL,
    companyname character varying(255),
    responsible_person character varying(255),
    address character varying(255),
    website character varying(255),
    dateofestablishment date,
    pf boolean,
    esi boolean,
    phonenumber1 character varying(255),
    phonenumber2 character varying(255),
    address2 character varying(255),
    address3 character varying(255),
    email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pt boolean,
    tds boolean,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('companies_id_seq', 1, true);


--
-- Name: company_documents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE company_documents (
    id integer NOT NULL,
    remarks character varying(255),
    company_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    file_path_file_name character varying(255),
    file_path_content_type character varying(255),
    file_path_file_size integer
);


ALTER TABLE public.company_documents OWNER TO postgres;

--
-- Name: company_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE company_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_documents_id_seq OWNER TO postgres;

--
-- Name: company_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE company_documents_id_seq OWNED BY company_documents.id;


--
-- Name: company_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('company_documents_id_seq', 1, false);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(255),
    currency character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 242, true);


--
-- Name: country_settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE country_settings (
    id integer NOT NULL,
    country character varying(255),
    time_zone character varying(255),
    currency character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.country_settings OWNER TO postgres;

--
-- Name: country_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE country_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_settings_id_seq OWNER TO postgres;

--
-- Name: country_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE country_settings_id_seq OWNED BY country_settings.id;


--
-- Name: country_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('country_settings_id_seq', 3, true);


--
-- Name: employee_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee_details (
    id integer NOT NULL,
    employee_id integer,
    effective_date date,
    salary_group_id integer,
    allotted_gross numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    classification hstore,
    branch_id integer,
    financial_institution_id integer,
    attendance_configuration_id integer,
    bank_account_number character varying(255),
    effective_to date,
    pan character varying(255),
    pan_effective_date date,
    international_worker boolean
);


ALTER TABLE public.employee_details OWNER TO postgres;

--
-- Name: employee_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employee_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_details_id_seq OWNER TO postgres;

--
-- Name: employee_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employee_details_id_seq OWNED BY employee_details.id;


--
-- Name: employee_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_details_id_seq', 4, true);


--
-- Name: employee_statutories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee_statutories (
    id integer NOT NULL,
    employee_id integer,
    pan character varying(255),
    pan_effective_date date,
    pf_number character varying(255),
    pf_effective_date date,
    esi_number character varying(255),
    esi_effective_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    zero_pt boolean,
    zero_pension boolean,
    vol_pf boolean,
    vol_pf_percentage double precision,
    vol_pf_amount double precision
);


ALTER TABLE public.employee_statutories OWNER TO postgres;

--
-- Name: employee_statutories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employee_statutories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_statutories_id_seq OWNER TO postgres;

--
-- Name: employee_statutories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employee_statutories_id_seq OWNED BY employee_statutories.id;


--
-- Name: employee_statutories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_statutories_id_seq', 1, false);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    empname character varying(255),
    date_of_joining date,
    date_of_leaving date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date_of_birth date,
    marital_status character varying(255),
    father_name character varying(255),
    spouse_name character varying(255),
    gender character varying(255),
    present_res_no character varying(255),
    present_res_name character varying(255),
    present_street character varying(255),
    present_locality character varying(255),
    present_city character varying(255),
    present_state_id integer,
    perm_res_no character varying(255),
    perm_res_name character varying(255),
    perm_street character varying(255),
    perm_locality character varying(255),
    perm_city character varying(255),
    perm_state_id integer,
    perm_sameas_present boolean,
    email character varying(255),
    mobile character varying(255),
    refno character varying(255),
    restrct_pf boolean DEFAULT false,
    probation_period integer,
    probation_complete_date date,
    confirmation_date date,
    salary_start_date date,
    retirement_date date,
    handicapped boolean,
    emergency_contact_number character varying(255),
    official_mail_id character varying(255),
    leaving_reason character varying(255)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employees_id_seq', 43, true);


--
-- Name: esi_calculated_values; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE esi_calculated_values (
    id integer NOT NULL,
    esi_gross numeric(8,2),
    esi_amount numeric(8,2),
    esi_employer_amount numeric(8,2),
    employee_id integer,
    effective_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.esi_calculated_values OWNER TO postgres;

--
-- Name: esi_calculated_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE esi_calculated_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.esi_calculated_values_id_seq OWNER TO postgres;

--
-- Name: esi_calculated_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE esi_calculated_values_id_seq OWNED BY esi_calculated_values.id;


--
-- Name: esi_calculated_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('esi_calculated_values_id_seq', 1, false);


--
-- Name: esi_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE esi_details (
    id integer NOT NULL,
    branch_id integer,
    esi_group_id integer,
    esi_effective_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.esi_details OWNER TO postgres;

--
-- Name: esi_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE esi_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.esi_details_id_seq OWNER TO postgres;

--
-- Name: esi_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE esi_details_id_seq OWNED BY esi_details.id;


--
-- Name: esi_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('esi_details_id_seq', 2, true);


--
-- Name: esi_group_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE esi_group_rates (
    id integer NOT NULL,
    esi_group_id integer,
    employee_rate double precision,
    employer_rate double precision,
    cut_off double precision,
    minimum_limit_dailywage double precision,
    round_off character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.esi_group_rates OWNER TO postgres;

--
-- Name: esi_group_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE esi_group_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.esi_group_rates_id_seq OWNER TO postgres;

--
-- Name: esi_group_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE esi_group_rates_id_seq OWNED BY esi_group_rates.id;


--
-- Name: esi_group_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('esi_group_rates_id_seq', 1, false);


--
-- Name: esi_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE esi_groups (
    id integer NOT NULL,
    esi_group_name character varying(255),
    address character varying(255),
    esi_no character varying(255),
    esi_local_office character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id character varying(255),
    password character varying(255)
);


ALTER TABLE public.esi_groups OWNER TO postgres;

--
-- Name: esi_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE esi_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.esi_groups_id_seq OWNER TO postgres;

--
-- Name: esi_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE esi_groups_id_seq OWNED BY esi_groups.id;


--
-- Name: esi_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('esi_groups_id_seq', 2, true);


--
-- Name: financial_institutions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE financial_institutions (
    id integer NOT NULL,
    name character varying(255),
    address_line1 character varying(255),
    address_line2 character varying(255),
    address_line3 character varying(255),
    address_line4 character varying(255),
    pincode character varying(255),
    branch_code character varying(255),
    email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.financial_institutions OWNER TO postgres;

--
-- Name: financial_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE financial_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.financial_institutions_id_seq OWNER TO postgres;

--
-- Name: financial_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE financial_institutions_id_seq OWNED BY financial_institutions.id;


--
-- Name: financial_institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('financial_institutions_id_seq', 1, true);


--
-- Name: holidays; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE holidays (
    id integer NOT NULL,
    attendance_configuration_id integer,
    holiday_date date,
    description character varying(255),
    national_holiday boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.holidays OWNER TO postgres;

--
-- Name: holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE holidays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holidays_id_seq OWNER TO postgres;

--
-- Name: holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE holidays_id_seq OWNED BY holidays.id;


--
-- Name: holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('holidays_id_seq', 1, false);


--
-- Name: hr_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_categories (
    id integer NOT NULL,
    category_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.hr_categories OWNER TO postgres;

--
-- Name: hr_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hr_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hr_categories_id_seq OWNER TO postgres;

--
-- Name: hr_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hr_categories_id_seq OWNED BY hr_categories.id;


--
-- Name: hr_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hr_categories_id_seq', 33, true);


--
-- Name: hr_category_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_category_details (
    id integer NOT NULL,
    hr_category_id integer,
    name character varying(255),
    data_type character varying(255),
    required boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.hr_category_details OWNER TO postgres;

--
-- Name: hr_category_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hr_category_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hr_category_details_id_seq OWNER TO postgres;

--
-- Name: hr_category_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hr_category_details_id_seq OWNED BY hr_category_details.id;


--
-- Name: hr_category_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hr_category_details_id_seq', 169, true);


--
-- Name: hr_masters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_masters (
    id integer NOT NULL,
    hr_category_id integer,
    employee_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_values hstore
);


ALTER TABLE public.hr_masters OWNER TO postgres;

--
-- Name: hr_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hr_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hr_masters_id_seq OWNER TO postgres;

--
-- Name: hr_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hr_masters_id_seq OWNED BY hr_masters.id;


--
-- Name: hr_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hr_masters_id_seq', 25, true);


--
-- Name: leave_definitions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE leave_definitions (
    id integer NOT NULL,
    leave_name character varying(255),
    short_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.leave_definitions OWNER TO postgres;

--
-- Name: leave_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE leave_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_definitions_id_seq OWNER TO postgres;

--
-- Name: leave_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE leave_definitions_id_seq OWNED BY leave_definitions.id;


--
-- Name: leave_definitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('leave_definitions_id_seq', 1, false);


--
-- Name: leave_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE leave_details (
    id integer NOT NULL,
    employee_id integer,
    leave_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.leave_details OWNER TO postgres;

--
-- Name: leave_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE leave_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_details_id_seq OWNER TO postgres;

--
-- Name: leave_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE leave_details_id_seq OWNED BY leave_details.id;


--
-- Name: leave_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('leave_details_id_seq', 1, false);


--
-- Name: leave_opening_balances; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE leave_opening_balances (
    id integer NOT NULL,
    leave_definition_id integer,
    employee_id integer,
    opening_balance double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.leave_opening_balances OWNER TO postgres;

--
-- Name: leave_opening_balances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE leave_opening_balances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_opening_balances_id_seq OWNER TO postgres;

--
-- Name: leave_opening_balances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE leave_opening_balances_id_seq OWNED BY leave_opening_balances.id;


--
-- Name: leave_opening_balances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('leave_opening_balances_id_seq', 1, false);


--
-- Name: option_settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE option_settings (
    id integer NOT NULL,
    country_id character varying(255),
    time_zone character varying(255),
    currency character varying(255),
    recruitment boolean,
    lv_atdn_mgmt boolean,
    appraisal boolean,
    training boolean,
    help_desk boolean,
    travel_cummute boolean,
    pf_applicable boolean,
    esi_applicable boolean,
    pt_applicable boolean,
    multi_state_pt boolean,
    multi_pt boolean,
    tds_applicable boolean,
    multi_branch boolean,
    multi_hr boolean,
    allow_brnch_admin boolean,
    approval_flow boolean,
    audit_trail boolean,
    remibursement boolean,
    bonus_and_exgratia boolean,
    gratuity boolean,
    loans_adv boolean,
    arrears boolean,
    attdn_intgration boolean,
    asset_tracker boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    voluntary_pf boolean DEFAULT false,
    salary_calc character varying(255)
);


ALTER TABLE public.option_settings OWNER TO postgres;

--
-- Name: option_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE option_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.option_settings_id_seq OWNER TO postgres;

--
-- Name: option_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE option_settings_id_seq OWNED BY option_settings.id;


--
-- Name: option_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('option_settings_id_seq', 1, true);


--
-- Name: paymonths; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE paymonths (
    id integer NOT NULL,
    month_year integer,
    number_of_days integer,
    from_date date,
    to_date date,
    month_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.paymonths OWNER TO postgres;

--
-- Name: paymonths_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE paymonths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paymonths_id_seq OWNER TO postgres;

--
-- Name: paymonths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE paymonths_id_seq OWNED BY paymonths.id;


--
-- Name: paymonths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('paymonths_id_seq', 3, true);


--
-- Name: pf_calculated_values; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pf_calculated_values (
    id integer NOT NULL,
    pf_earning numeric(8,2),
    pf_amount numeric(8,2),
    epf_amount numeric(8,2),
    eps_amount numeric(8,2),
    vol_pf_amount numeric(8,2),
    employee_id integer,
    effective_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pf_calculated_values OWNER TO postgres;

--
-- Name: pf_calculated_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pf_calculated_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pf_calculated_values_id_seq OWNER TO postgres;

--
-- Name: pf_calculated_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pf_calculated_values_id_seq OWNED BY pf_calculated_values.id;


--
-- Name: pf_calculated_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pf_calculated_values_id_seq', 1, false);


--
-- Name: pf_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pf_details (
    id integer NOT NULL,
    branch_id integer,
    pf_group_id integer,
    pf_effective_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pf_details OWNER TO postgres;

--
-- Name: pf_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pf_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pf_details_id_seq OWNER TO postgres;

--
-- Name: pf_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pf_details_id_seq OWNED BY pf_details.id;


--
-- Name: pf_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pf_details_id_seq', 25, true);


--
-- Name: pf_group_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pf_group_rates (
    id integer NOT NULL,
    pf_group_id integer,
    paymonth_id integer,
    account_number_21 double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pension_fund double precision,
    epf double precision,
    account_number_02 double precision,
    account_number_22 double precision,
    round_off character varying(255),
    restrict_employer_share boolean,
    restrict_employee_share_to_employer_share boolean,
    employer_epf double precision,
    cutoff double precision,
    effective_date date
);


ALTER TABLE public.pf_group_rates OWNER TO postgres;

--
-- Name: pf_group_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pf_group_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pf_group_rates_id_seq OWNER TO postgres;

--
-- Name: pf_group_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pf_group_rates_id_seq OWNED BY pf_group_rates.id;


--
-- Name: pf_group_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pf_group_rates_id_seq', 1, true);


--
-- Name: pf_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pf_groups (
    id integer NOT NULL,
    pf_group character varying(255),
    pf_number character varying(255),
    db_file_code character varying(255),
    extension integer,
    address character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id character varying(255),
    password character varying(255)
);


ALTER TABLE public.pf_groups OWNER TO postgres;

--
-- Name: pf_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pf_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pf_groups_id_seq OWNER TO postgres;

--
-- Name: pf_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pf_groups_id_seq OWNED BY pf_groups.id;


--
-- Name: pf_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pf_groups_id_seq', 2, true);


--
-- Name: pt_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pt_details (
    id integer NOT NULL,
    branch_id integer,
    pt_group_id integer,
    pt_effective_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pt_details OWNER TO postgres;

--
-- Name: pt_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pt_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pt_details_id_seq OWNER TO postgres;

--
-- Name: pt_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pt_details_id_seq OWNED BY pt_details.id;


--
-- Name: pt_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pt_details_id_seq', 4, true);


--
-- Name: pt_group_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pt_group_rates (
    id integer NOT NULL,
    pt_group_id integer,
    paymonth_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pt_group_rates OWNER TO postgres;

--
-- Name: pt_group_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pt_group_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pt_group_rates_id_seq OWNER TO postgres;

--
-- Name: pt_group_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pt_group_rates_id_seq OWNED BY pt_group_rates.id;


--
-- Name: pt_group_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pt_group_rates_id_seq', 2, true);


--
-- Name: pt_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pt_groups (
    id integer NOT NULL,
    name character varying(255),
    state_id integer,
    certificate_no character varying(255),
    pto_circle_no character varying(255),
    address character varying(255),
    return_period character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pt_groups OWNER TO postgres;

--
-- Name: pt_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pt_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pt_groups_id_seq OWNER TO postgres;

--
-- Name: pt_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pt_groups_id_seq OWNED BY pt_groups.id;


--
-- Name: pt_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pt_groups_id_seq', 1, true);


--
-- Name: pt_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pt_rates (
    id integer NOT NULL,
    pt_group_id integer,
    paymonth_id integer,
    min_sal_range numeric,
    max_sal_range numeric,
    pt numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pt_rates OWNER TO postgres;

--
-- Name: pt_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pt_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pt_rates_id_seq OWNER TO postgres;

--
-- Name: pt_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pt_rates_id_seq OWNED BY pt_rates.id;


--
-- Name: pt_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pt_rates_id_seq', 1, false);


--
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salaries (
    id integer NOT NULL,
    effective_date date,
    salary_amount numeric(8,2),
    employee_id integer,
    employee_detail_id integer,
    salary_head_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    salary_group_detail_id integer,
    actual_salary_amount numeric(8,2)
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- Name: salaries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salaries_id_seq OWNER TO postgres;

--
-- Name: salaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salaries_id_seq OWNED BY salaries.id;


--
-- Name: salaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salaries_id_seq', 1, false);


--
-- Name: salary_allotments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salary_allotments (
    id integer NOT NULL,
    employee_id integer,
    employee_detail_id integer,
    effective_date date,
    salary_head_id integer,
    salary_allotment numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    salary_group_detail_id integer
);


ALTER TABLE public.salary_allotments OWNER TO postgres;

--
-- Name: salary_allotments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salary_allotments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salary_allotments_id_seq OWNER TO postgres;

--
-- Name: salary_allotments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salary_allotments_id_seq OWNED BY salary_allotments.id;


--
-- Name: salary_allotments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salary_allotments_id_seq', 17, true);


--
-- Name: salary_group_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salary_group_details (
    id integer NOT NULL,
    calc_type character varying(255),
    calculation character varying(255),
    based_on character varying(255),
    salary_group_id integer,
    salary_head_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pf_applicability boolean,
    pf_percentage numeric,
    print_name character varying(255),
    print_order integer,
    esi_applicability boolean,
    esi_percentage numeric,
    pt_applicability boolean,
    pt_percentage numeric
);


ALTER TABLE public.salary_group_details OWNER TO postgres;

--
-- Name: salary_group_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salary_group_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salary_group_details_id_seq OWNER TO postgres;

--
-- Name: salary_group_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salary_group_details_id_seq OWNED BY salary_group_details.id;


--
-- Name: salary_group_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salary_group_details_id_seq', 12, true);


--
-- Name: salary_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salary_groups (
    id integer NOT NULL,
    salary_group_name character varying(255),
    based_on_gross boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.salary_groups OWNER TO postgres;

--
-- Name: salary_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salary_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salary_groups_id_seq OWNER TO postgres;

--
-- Name: salary_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salary_groups_id_seq OWNED BY salary_groups.id;


--
-- Name: salary_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salary_groups_id_seq', 3, true);


--
-- Name: salary_heads; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salary_heads (
    id integer NOT NULL,
    head_name character varying(255),
    short_name character varying(255),
    salary_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.salary_heads OWNER TO postgres;

--
-- Name: salary_heads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salary_heads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salary_heads_id_seq OWNER TO postgres;

--
-- Name: salary_heads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salary_heads_id_seq OWNED BY salary_heads.id;


--
-- Name: salary_heads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salary_heads_id_seq', 8, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    state_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('states_id_seq', 29, true);


--
-- Name: upload_file_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE upload_file_types (
    id integer NOT NULL,
    max_file_size integer,
    file_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.upload_file_types OWNER TO postgres;

--
-- Name: upload_file_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE upload_file_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_types_id_seq OWNER TO postgres;

--
-- Name: upload_file_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE upload_file_types_id_seq OWNED BY upload_file_types.id;


--
-- Name: upload_file_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('upload_file_types_id_seq', 1, false);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE attendance_configurations ALTER COLUMN id SET DEFAULT nextval('attendance_configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE audits ALTER COLUMN id SET DEFAULT nextval('audits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE branches ALTER COLUMN id SET DEFAULT nextval('branches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE classification_headings ALTER COLUMN id SET DEFAULT nextval('classification_headings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE classifications ALTER COLUMN id SET DEFAULT nextval('classifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE company_documents ALTER COLUMN id SET DEFAULT nextval('company_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE country_settings ALTER COLUMN id SET DEFAULT nextval('country_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE employee_details ALTER COLUMN id SET DEFAULT nextval('employee_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE employee_statutories ALTER COLUMN id SET DEFAULT nextval('employee_statutories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE esi_calculated_values ALTER COLUMN id SET DEFAULT nextval('esi_calculated_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE esi_details ALTER COLUMN id SET DEFAULT nextval('esi_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE esi_group_rates ALTER COLUMN id SET DEFAULT nextval('esi_group_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE esi_groups ALTER COLUMN id SET DEFAULT nextval('esi_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE financial_institutions ALTER COLUMN id SET DEFAULT nextval('financial_institutions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE holidays ALTER COLUMN id SET DEFAULT nextval('holidays_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE hr_categories ALTER COLUMN id SET DEFAULT nextval('hr_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE hr_category_details ALTER COLUMN id SET DEFAULT nextval('hr_category_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE hr_masters ALTER COLUMN id SET DEFAULT nextval('hr_masters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE leave_definitions ALTER COLUMN id SET DEFAULT nextval('leave_definitions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE leave_details ALTER COLUMN id SET DEFAULT nextval('leave_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE leave_opening_balances ALTER COLUMN id SET DEFAULT nextval('leave_opening_balances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE option_settings ALTER COLUMN id SET DEFAULT nextval('option_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE paymonths ALTER COLUMN id SET DEFAULT nextval('paymonths_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pf_calculated_values ALTER COLUMN id SET DEFAULT nextval('pf_calculated_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pf_details ALTER COLUMN id SET DEFAULT nextval('pf_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pf_group_rates ALTER COLUMN id SET DEFAULT nextval('pf_group_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pf_groups ALTER COLUMN id SET DEFAULT nextval('pf_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pt_details ALTER COLUMN id SET DEFAULT nextval('pt_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pt_group_rates ALTER COLUMN id SET DEFAULT nextval('pt_group_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pt_groups ALTER COLUMN id SET DEFAULT nextval('pt_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pt_rates ALTER COLUMN id SET DEFAULT nextval('pt_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE salaries ALTER COLUMN id SET DEFAULT nextval('salaries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE salary_allotments ALTER COLUMN id SET DEFAULT nextval('salary_allotments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE salary_group_details ALTER COLUMN id SET DEFAULT nextval('salary_group_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE salary_groups ALTER COLUMN id SET DEFAULT nextval('salary_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE salary_heads ALTER COLUMN id SET DEFAULT nextval('salary_heads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE upload_file_types ALTER COLUMN id SET DEFAULT nextval('upload_file_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: attendance_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attendance_configurations (id, attendance, short_name, salary_calendar_days, created_at, updated_at) FROM stdin;
1	<Master List>	MASTER	Actual Day / Month	2012-04-05 09:30:31.565964	2012-04-05 09:30:31.565964
2	Karnataka	KTK	Actual Days / Month	2012-04-05 10:13:36.394771	2012-04-05 10:13:36.394771
\.


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, created_at) FROM stdin;
1	1	User	\N	\N	\N	\N	\N	create	---\nusername: admin\npassword: default\n	1	\N	\N	2012-04-05 09:30:30.759149
2	1	SalaryHead	\N	\N	\N	\N	\N	create	---\nhead_name: Basic\nshort_name: BASIC\nsalary_type: Earnings\n	1	\N	\N	2012-04-05 09:30:30.895706
3	2	SalaryHead	\N	\N	\N	\N	\N	create	---\nhead_name: PF\nshort_name: PF\nsalary_type: Deductions\n	1	\N	\N	2012-04-05 09:30:30.91279
4	3	SalaryHead	\N	\N	\N	\N	\N	create	---\nhead_name: ESI\nshort_name: ESI\nsalary_type: Deductions\n	1	\N	\N	2012-04-05 09:30:30.927918
5	4	SalaryHead	\N	\N	\N	\N	\N	create	---\nhead_name: PT\nshort_name: PT\nsalary_type: Deductions\n	1	\N	\N	2012-04-05 09:30:30.943663
6	1	State	\N	\N	\N	\N	\N	create	---\nstate_name: Andhra Pradesh\n	1	\N	\N	2012-04-05 09:30:30.994045
7	2	State	\N	\N	\N	\N	\N	create	---\nstate_name: Arunachal Pradesh\n	1	\N	\N	2012-04-05 09:30:31.011701
8	3	State	\N	\N	\N	\N	\N	create	---\nstate_name: Assam\n	1	\N	\N	2012-04-05 09:30:31.026049
9	4	State	\N	\N	\N	\N	\N	create	---\nstate_name: Bihar\n	1	\N	\N	2012-04-05 09:30:31.042421
10	5	State	\N	\N	\N	\N	\N	create	---\nstate_name: Chhattisgarh\n	1	\N	\N	2012-04-05 09:30:31.05927
11	6	State	\N	\N	\N	\N	\N	create	---\nstate_name: Delhi\n	1	\N	\N	2012-04-05 09:30:31.075748
12	7	State	\N	\N	\N	\N	\N	create	---\nstate_name: Goa\n	1	\N	\N	2012-04-05 09:30:31.092342
13	8	State	\N	\N	\N	\N	\N	create	---\nstate_name: Gujarat\n	1	\N	\N	2012-04-05 09:30:31.10954
14	9	State	\N	\N	\N	\N	\N	create	---\nstate_name: Haryana\n	1	\N	\N	2012-04-05 09:30:31.126545
15	10	State	\N	\N	\N	\N	\N	create	---\nstate_name: Himachal Pradesh\n	1	\N	\N	2012-04-05 09:30:31.142368
16	11	State	\N	\N	\N	\N	\N	create	---\nstate_name: Jammu and Kashmir\n	1	\N	\N	2012-04-05 09:30:31.159288
17	12	State	\N	\N	\N	\N	\N	create	---\nstate_name: Jharkhand\n	1	\N	\N	2012-04-05 09:30:31.175986
18	13	State	\N	\N	\N	\N	\N	create	---\nstate_name: Karnataka\n	1	\N	\N	2012-04-05 09:30:31.192745
19	14	State	\N	\N	\N	\N	\N	create	---\nstate_name: Kerala\n	1	\N	\N	2012-04-05 09:30:31.20958
20	15	State	\N	\N	\N	\N	\N	create	---\nstate_name: Madhya Pradesh\n	1	\N	\N	2012-04-05 09:30:31.226339
21	16	State	\N	\N	\N	\N	\N	create	---\nstate_name: Maharastra\n	1	\N	\N	2012-04-05 09:30:31.242359
22	17	State	\N	\N	\N	\N	\N	create	---\nstate_name: Manipur\n	1	\N	\N	2012-04-05 09:30:31.259339
23	18	State	\N	\N	\N	\N	\N	create	---\nstate_name: Meghalaya\n	1	\N	\N	2012-04-05 09:30:31.275859
24	19	State	\N	\N	\N	\N	\N	create	---\nstate_name: Mizoram\n	1	\N	\N	2012-04-05 09:30:31.292494
25	20	State	\N	\N	\N	\N	\N	create	---\nstate_name: Nagaland\n	1	\N	\N	2012-04-05 09:30:31.309525
26	21	State	\N	\N	\N	\N	\N	create	---\nstate_name: Orrisa\n	1	\N	\N	2012-04-05 09:30:31.326912
27	22	State	\N	\N	\N	\N	\N	create	---\nstate_name: Panjab\n	1	\N	\N	2012-04-05 09:30:31.342599
28	23	State	\N	\N	\N	\N	\N	create	---\nstate_name: Pondicherry\n	1	\N	\N	2012-04-05 09:30:31.359444
29	24	State	\N	\N	\N	\N	\N	create	---\nstate_name: Rajasthan\n	1	\N	\N	2012-04-05 09:30:31.375878
30	25	State	\N	\N	\N	\N	\N	create	---\nstate_name: Sikkim\n	1	\N	\N	2012-04-05 09:30:31.392485
31	26	State	\N	\N	\N	\N	\N	create	---\nstate_name: Tamil Nadu\n	1	\N	\N	2012-04-05 09:30:31.409705
32	27	State	\N	\N	\N	\N	\N	create	---\nstate_name: Tripura\n	1	\N	\N	2012-04-05 09:30:31.426649
33	28	State	\N	\N	\N	\N	\N	create	---\nstate_name: Uttaranchal\n	1	\N	\N	2012-04-05 09:30:31.442497
34	29	State	\N	\N	\N	\N	\N	create	---\nstate_name: Uttar Pradesh\n	1	\N	\N	2012-04-05 09:30:31.459478
35	1	AttendanceConfiguration	\N	\N	\N	\N	\N	create	---\nattendance: <Master List>\nshort_name: MASTER\nsalary_calendar_days: Actual Day / Month\n	1	\N	\N	2012-04-05 09:30:31.575884
36	1	FinancialInstitution	\N	\N	\N	\N	\N	create	---\nname: CASH\naddress_line1: address\naddress_line2: address\naddress_line3: address\naddress_line4: address\npincode: 560076\nbranch_code: branch_code\nemail: email\n	1	\N	\N	2012-04-05 09:30:31.641808
37	1	Company	\N	\N	1	User	\N	create	---\ncompanyname: Company PVT LTD\nresponsible_person: HSN\naddress: ! '#17,,1ST A CROSS'\nwebsite: www.relyonsoft.com\ndateofestablishment: 2012-01-01\npf: true\nesi: true\nphonenumber1: '9019592573'\nphonenumber2: ''\naddress2: 5TH BLOCK, Rajajinagar\naddress3: BANGALORE-95\nemail: hsn@relyonsoft.com\npt: true\ntds: true\nphoto_file_name: 11838101.cms\nphoto_content_type: application/octet-stream\nphoto_file_size: 16990\n	1	\N	127.0.0.1	2012-04-05 10:12:02.978444
38	1	Paymonth	\N	\N	1	User	\N	create	---\nmonth_year: 24145\nnumber_of_days: 31\nfrom_date: 2012-01-01\nto_date: 2012-01-31\nmonth_name: Jan/2012\n	1	\N	127.0.0.1	2012-04-05 10:12:22.116073
39	1	ClassificationHeading	\N	\N	1	User	\N	create	---\nclassification_heading_name: SSE\ndisplay_order: 1\n	1	\N	127.0.0.1	2012-04-05 10:13:02.692693
40	1	Classification	\N	\N	1	User	\N	create	---\nclassification_heading_id: 1\nclassification_name: Developer\n	1	\N	127.0.0.1	2012-04-05 10:13:10.887036
41	1	HrCategory	\N	\N	1	User	\N	create	---\ncategory_name: Family\n	1	\N	127.0.0.1	2012-04-05 10:13:26.446117
42	2	AttendanceConfiguration	\N	\N	1	User	\N	create	---\nattendance: Karnataka\nshort_name: KTK\nsalary_calendar_days: Actual Days / Month\n	1	\N	127.0.0.1	2012-04-05 10:13:36.403709
43	1	PfGroup	\N	\N	1	User	\N	create	---\npf_group: Karnataka\npf_number: '1234560'\ndb_file_code: IFC0212\nextension: 1\naddress: Bangalore\n	1	\N	127.0.0.1	2012-04-05 10:14:04.508659
44	1	PfGroupRate	\N	\N	1	User	\N	create	---\npf_group_id: 1\npaymonth_id: 1\naccount_number_21: 2.0\npension_fund: 4.0\nepf: 12.0\naccount_number_02: 20.0\naccount_number_22: 1.0\nround_off: Nearest Rupee\nrestrict_employer_share: false\nrestrict_employee_share_to_employer_share: false\nemployer_epf: 8.0\ncutoff: 6500.0\neffective_date: \n	1	\N	127.0.0.1	2012-04-05 10:14:26.633471
45	1	PfGroupRate	\N	\N	1	User	\N	update	---\neffective_date:\n- \n- 2012-01-01\n	2	\N	127.0.0.1	2012-04-05 10:14:26.671319
46	1	PtGroup	\N	\N	1	User	\N	create	---\nname: Karnataka\nstate_id: 13\ncertificate_no: KAR123456\npto_circle_no: '125632'\naddress: Bangalore\nreturn_period: Yearly\n	1	\N	127.0.0.1	2012-04-05 10:14:47.971762
47	1	PtGroupRate	\N	\N	1	User	\N	create	---\npt_group_id: 1\npaymonth_id: 1\n	1	\N	127.0.0.1	2012-04-05 10:14:53.83248
48	1	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:49.879001
49	2	Employee	\N	\N	1	User	\N	create	---\nempname: Shivarudraiah .D\ndate_of_joining: 2004-04-04\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: shivugowda84@gmail.com\nmobile: ''\nrefno: V2040402\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.051668
50	3	Employee	\N	\N	1	User	\N	create	---\nempname: Umesh Venkatesh\ndate_of_joining: 2004-12-01\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vumesh@v2soft.com\nmobile: ''\nrefno: V2120403\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.098266
133	5	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 1\nsalary_allotment: 0.0\nsalary_group_detail_id: 1\n	1	\N	127.0.0.1	2012-04-12 05:50:51.846442
134	1	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 1500.0\n	2	\N	127.0.0.1	2012-04-12 05:52:21.372612
51	4	Employee	\N	\N	1	User	\N	create	---\nempname: Varchasvi Shankar\ndate_of_joining: 2005-09-30\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vshankar@v2soft.com\nmobile: ''\nrefno: V2050904\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.14691
52	5	Employee	\N	\N	1	User	\N	create	---\nempname: Rajan .M\ndate_of_joining: 2005-12-05\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajan.m@v2softindia.com\nmobile: ''\nrefno: V2120513\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.238105
53	6	Employee	\N	\N	1	User	\N	create	---\nempname: Vinod Prabha .T\ndate_of_joining: 2006-04-19\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vinod@v2softindia.com\nmobile: ''\nrefno: V2040622\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.290382
54	7	Employee	\N	\N	1	User	\N	create	---\nempname: Vinay .V\ndate_of_joining: 2006-11-07\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vinay@v2softindia.com\nmobile: ''\nrefno: V2110643\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.413749
55	8	Employee	\N	\N	1	User	\N	create	---\nempname: Y.Sivanaga Prasad\ndate_of_joining: 2007-10-18\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ysiva@v2softindia.com\nmobile: ''\nrefno: V2071180\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.496196
56	9	Employee	\N	\N	1	User	\N	create	---\nempname: Veeramani\ndate_of_joining: 2008-01-16\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: veeramani@v2softindia.com\nmobile: ''\nrefno: V2080184\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.513809
57	10	Employee	\N	\N	1	User	\N	create	---\nempname: Sumathi.K.N\ndate_of_joining: 2008-05-08\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Female\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: skakarla@v2soft.com\nmobile: ''\nrefno: V20508122\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.537551
58	11	Employee	\N	\N	1	User	\N	create	---\nempname: George Steven Kharmujai\ndate_of_joining: 2008-06-16\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: gskharmujai@v2softindia.com\nmobile: ''\nrefno: V20608133\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.553986
59	12	Employee	\N	\N	1	User	\N	create	---\nempname: Muktish.K.G\ndate_of_joining: 2008-08-03\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: mgopalkrishna@v2soft.com\nmobile: ''\nrefno: V20709202\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.571768
60	13	Employee	\N	\N	1	User	\N	create	---\nempname: Devaraja H.T.\ndate_of_joining: 2009-02-24\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: devaraja_ht@v2softindia.com\nmobile: ''\nrefno: V20209182\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.588304
61	14	Employee	\N	\N	1	User	\N	create	---\nempname: Ram Kumar .S\ndate_of_joining: 2009-04-06\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ramkumar@v2softindia.com\nmobile: ''\nrefno: V20409184\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.604327
62	15	Employee	\N	\N	1	User	\N	create	---\nempname: Nagabushan S.K.\ndate_of_joining: 2009-11-05\ndate_of_leaving: 2012-01-25\ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: nkarnic@v2soft.com\nmobile: ''\nrefno: V21009210\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.620951
63	16	Employee	\N	\N	1	User	\N	create	---\nempname: Rajendran .M\ndate_of_joining: 2009-11-18\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajendran.m@v2softindia.com\nmobile: ''\nrefno: V21109213\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.638008
64	17	Employee	\N	\N	1	User	\N	create	---\nempname: Ramalingeshwar Goud T\ndate_of_joining: 2009-11-14\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ramu.g@v2softindia.com\nmobile: ''\nrefno: V21005280\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.654402
135	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 100.0\n	2	\N	127.0.0.1	2012-04-12 05:52:21.394316
136	3	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 12500.0\n	2	\N	127.0.0.1	2012-04-12 05:52:21.427341
137	4	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- \n	2	\N	127.0.0.1	2012-04-12 05:52:21.443248
65	18	Employee	\N	\N	1	User	\N	create	---\nempname: Ashok Kumar .V\ndate_of_joining: 2009-11-26\ndate_of_leaving: 2012-01-15\ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ashokkumar.v@v2softindia.com\nmobile: ''\nrefno: V21109214\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.670844
66	19	Employee	\N	\N	1	User	\N	create	---\nempname: Ravichandran .J\ndate_of_joining: 2009-12-31\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ravichandran.j@v2softindia.com\nmobile: ''\nrefno: V20912217\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.689387
67	20	Employee	\N	\N	1	User	\N	create	---\nempname: Suryakanth\ndate_of_joining: 2010-02-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ysuryakanth@v2softindia.com\nmobile: ''\nrefno: V21002289\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.712978
68	21	Employee	\N	\N	1	User	\N	create	---\nempname: Vikram Simha B.S.\ndate_of_joining: 2011-05-11\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vsimha@v2soft.com\nmobile: ''\nrefno: V21003273\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.729329
69	22	Employee	\N	\N	1	User	\N	create	---\nempname: Karthik .J\ndate_of_joining: 2010-03-13\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: karthikj@v2softindia.com\nmobile: ''\nrefno: V21003330\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.746054
70	23	Employee	\N	\N	1	User	\N	create	---\nempname: Vikas Patil\ndate_of_joining: 2010-03-29\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: pvikas@v2softindia.com\nmobile: ''\nrefno: V21003287\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.762931
71	24	Employee	\N	\N	1	User	\N	create	---\nempname: Mugilan .M\ndate_of_joining: 2010-04-05\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: mmugilan@v2softindia.com\nmobile: ''\nrefno: V21004274\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.77986
72	25	Employee	\N	\N	1	User	\N	create	---\nempname: Fayaz Khan Bahamany\ndate_of_joining: 2010-06-15\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: kfayaz@v2softindia.com\nmobile: ''\nrefno: V21006284\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.796112
73	26	Employee	\N	\N	1	User	\N	create	---\nempname: Bharatesh .K\ndate_of_joining: 2010-07-26\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: kbharathesh@v2softindia.com\nmobile: ''\nrefno: V21007291\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.813922
74	27	Employee	\N	\N	1	User	\N	create	---\nempname: Anil Kumar Y V N\ndate_of_joining: 2010-08-16\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: akumar@v2soft.com\nmobile: ''\nrefno: V21008293\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.829795
75	28	Employee	\N	\N	1	User	\N	create	---\nempname: Narasimha Raju .V\ndate_of_joining: 2010-08-30\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rnarasimha@v2softindia.com\nmobile: ''\nrefno: V21008294\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.846096
76	29	Employee	\N	\N	1	User	\N	create	---\nempname: Ajith Kumar Shetty\ndate_of_joining: 2010-09-14\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: akumar@v2softindia.com\nmobile: ''\nrefno: V21009297\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.862809
77	30	Employee	\N	\N	1	User	\N	create	---\nempname: Shankar Kanakam\ndate_of_joining: 2010-10-15\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: kshankar@v2softindia.com\nmobile: ''\nrefno: V21010303\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 06:00:50.880246
78	1	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:57.76171
138	5	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 25000.0\n	2	\N	127.0.0.1	2012-04-12 05:52:21.461012
141	3	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 12500.0\n- 0.0\n	3	\N	127.0.0.1	2012-04-12 05:52:47.238018
142	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 100.0\n- 0.0\n	3	\N	127.0.0.1	2012-04-12 05:52:47.253158
79	2	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Shivarudraiah .D\ndate_of_joining: 2004-04-04\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: shivugowda84@gmail.com\nmobile: ''\nrefno: V2040402\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:57.946115
80	3	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Umesh Venkatesh\ndate_of_joining: 2004-12-01\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vumesh@v2soft.com\nmobile: ''\nrefno: V2120403\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:57.960445
81	4	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Varchasvi Shankar\ndate_of_joining: 2005-09-30\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vshankar@v2soft.com\nmobile: ''\nrefno: V2050904\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:57.977359
82	5	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Rajan .M\ndate_of_joining: 2005-12-05\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajan.m@v2softindia.com\nmobile: ''\nrefno: V2120513\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:57.996433
83	6	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Vinod Prabha .T\ndate_of_joining: 2006-04-19\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vinod@v2softindia.com\nmobile: ''\nrefno: V2040622\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.022226
84	7	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Vinay .V\ndate_of_joining: 2006-11-07\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vinay@v2softindia.com\nmobile: ''\nrefno: V2110643\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.044177
85	8	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Y.Sivanaga Prasad\ndate_of_joining: 2007-10-18\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ysiva@v2softindia.com\nmobile: ''\nrefno: V2071180\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.061533
86	9	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Veeramani\ndate_of_joining: 2008-01-16\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: veeramani@v2softindia.com\nmobile: ''\nrefno: V2080184\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.078286
87	10	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Sumathi.K.N\ndate_of_joining: 2008-05-08\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Female\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: skakarla@v2soft.com\nmobile: ''\nrefno: V20508122\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.094699
88	11	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: George Steven Kharmujai\ndate_of_joining: 2008-06-16\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: gskharmujai@v2softindia.com\nmobile: ''\nrefno: V20608133\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.112994
89	12	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Muktish.K.G\ndate_of_joining: 2008-08-03\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: mgopalkrishna@v2soft.com\nmobile: ''\nrefno: V20709202\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.127777
90	13	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Devaraja H.T.\ndate_of_joining: 2009-02-24\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: devaraja_ht@v2softindia.com\nmobile: ''\nrefno: V20209182\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.145494
91	14	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Ram Kumar .S\ndate_of_joining: 2009-04-06\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ramkumar@v2softindia.com\nmobile: ''\nrefno: V20409184\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.16141
92	15	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Nagabushan S.K.\ndate_of_joining: 2009-11-05\ndate_of_leaving: 2012-01-25\ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: nkarnic@v2soft.com\nmobile: ''\nrefno: V21009210\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.177422
93	16	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Rajendran .M\ndate_of_joining: 2009-11-18\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajendran.m@v2softindia.com\nmobile: ''\nrefno: V21109213\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.194904
139	5	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 25000.0\n- 0.0\n	3	\N	127.0.0.1	2012-04-12 05:52:47.183053
94	17	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Ramalingeshwar Goud T\ndate_of_joining: 2009-11-14\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ramu.g@v2softindia.com\nmobile: ''\nrefno: V21005280\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.211907
95	18	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Ashok Kumar .V\ndate_of_joining: 2009-11-26\ndate_of_leaving: 2012-01-15\ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ashokkumar.v@v2softindia.com\nmobile: ''\nrefno: V21109214\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.22751
96	19	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Ravichandran .J\ndate_of_joining: 2009-12-31\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ravichandran.j@v2softindia.com\nmobile: ''\nrefno: V20912217\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.244664
97	20	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Suryakanth\ndate_of_joining: 2010-02-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ysuryakanth@v2softindia.com\nmobile: ''\nrefno: V21002289\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.260797
98	21	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Vikram Simha B.S.\ndate_of_joining: 2011-05-11\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: vsimha@v2soft.com\nmobile: ''\nrefno: V21003273\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.27829
99	22	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Karthik .J\ndate_of_joining: 2010-03-13\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: karthikj@v2softindia.com\nmobile: ''\nrefno: V21003330\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.297907
100	23	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Vikas Patil\ndate_of_joining: 2010-03-29\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: pvikas@v2softindia.com\nmobile: ''\nrefno: V21003287\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.319449
101	24	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Mugilan .M\ndate_of_joining: 2010-04-05\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: mmugilan@v2softindia.com\nmobile: ''\nrefno: V21004274\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.337038
102	25	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Fayaz Khan Bahamany\ndate_of_joining: 2010-06-15\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: kfayaz@v2softindia.com\nmobile: ''\nrefno: V21006284\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.353375
103	26	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Bharatesh .K\ndate_of_joining: 2010-07-26\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: kbharathesh@v2softindia.com\nmobile: ''\nrefno: V21007291\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.370363
104	27	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Anil Kumar Y V N\ndate_of_joining: 2010-08-16\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: akumar@v2soft.com\nmobile: ''\nrefno: V21008293\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.389104
105	28	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Narasimha Raju .V\ndate_of_joining: 2010-08-30\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rnarasimha@v2softindia.com\nmobile: ''\nrefno: V21008294\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.411118
106	29	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Ajith Kumar Shetty\ndate_of_joining: 2010-09-14\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: akumar@v2softindia.com\nmobile: ''\nrefno: V21009297\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.42745
107	30	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: Shankar Kanakam\ndate_of_joining: 2010-10-15\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 4\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: kshankar@v2softindia.com\nmobile: ''\nrefno: V21010303\nrestrct_pf: false\n	2	\N	\N	2012-04-09 08:51:58.444919
108	31	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 08:54:08.489267
140	4	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- \n- 0.0\n	3	\N	127.0.0.1	2012-04-12 05:52:47.218513
109	31	Employee	\N	\N	1	User	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	2	\N	127.0.0.1	2012-04-09 08:54:22.295852
110	32	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 08:55:53.283204
111	32	Employee	\N	\N	1	User	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	2	\N	127.0.0.1	2012-04-09 08:55:56.446951
112	33	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-09 08:56:48.151284
113	33	Employee	\N	\N	1	User	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	2	\N	127.0.0.1	2012-04-09 08:56:52.926035
114	34	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-11 10:36:04.6102
115	34	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	2	\N	\N	2012-04-11 11:03:48.598063
116	35	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-11 11:04:16.576319
117	1	Branch	\N	\N	1	User	\N	create	---\nbranch_name: BANGALORE\nresponsible_person: HSN\naddress: WOC\npf_group_id: 1\nesi_group_id: \npt_group_id: 1\nesi_applicable: false\n	1	\N	127.0.0.1	2012-04-12 05:31:09.275014
118	5	SalaryHead	\N	\N	1	User	\N	create	---\nhead_name: DA\nshort_name: DA\nsalary_type: Earnings\n	1	\N	127.0.0.1	2012-04-12 05:36:58.99686
119	6	SalaryHead	\N	\N	1	User	\N	create	---\nhead_name: HRA\nshort_name: HRA\nsalary_type: Earnings\n	1	\N	127.0.0.1	2012-04-12 05:37:11.958046
120	7	SalaryHead	\N	\N	1	User	\N	create	---\nhead_name: CONVEYANCE\nshort_name: Conv\nsalary_type: Earnings\n	1	\N	127.0.0.1	2012-04-12 05:37:25.352808
121	8	SalaryHead	\N	\N	1	User	\N	create	---\nhead_name: SPCL ALL\nshort_name: Spl All\nsalary_type: Earnings\n	1	\N	127.0.0.1	2012-04-12 05:37:39.299967
122	1	SalaryGroup	\N	\N	1	User	\N	create	---\nsalary_group_name: Salary Structure\nbased_on_gross: false\n	1	\N	127.0.0.1	2012-04-12 05:38:05.404079
123	1	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Pay Days\nsalary_group_id: 1\nsalary_head_id: 1\npf_applicability: false\npf_percentage: \nprint_name: BASIC\nprint_order: 1\n	1	\N	127.0.0.1	2012-04-12 05:38:21.544696
124	2	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Pay Days\nsalary_group_id: 1\nsalary_head_id: 5\npf_applicability: false\npf_percentage: \nprint_name: DA\nprint_order: 2\n	1	\N	127.0.0.1	2012-04-12 05:39:20.653692
125	3	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Present Days\nsalary_group_id: 1\nsalary_head_id: 6\npf_applicability: false\npf_percentage: \nprint_name: HRA\nprint_order: 3\n	1	\N	127.0.0.1	2012-04-12 05:39:41.724581
126	4	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Present Days\nsalary_group_id: 1\nsalary_head_id: 7\npf_applicability: false\npf_percentage: \nprint_name: Conveyance\nprint_order: 4\n	1	\N	127.0.0.1	2012-04-12 05:39:58.828914
127	5	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Pay Days\nsalary_group_id: 1\nsalary_head_id: 8\npf_applicability: false\npf_percentage: \nprint_name: Spl Allowance\nprint_order: 5\n	1	\N	127.0.0.1	2012-04-12 05:40:25.44315
128	1	EmployeeDetail	\N	\N	1	User	\N	create	---\nemployee_id: 35\neffective_date: 2012-01-01\nsalary_group_id: 1\nallotted_gross: \nclassification: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  SSE: Developer\nbranch_id: 1\nfinancial_institution_id: 1\nattendance_configuration_id: 2\nbank_account_number: '123456'\neffective_to: \npan: PAN Not Avbl\npan_effective_date: \n	1	\N	127.0.0.1	2012-04-12 05:50:51.688828
129	1	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 8\nsalary_allotment: 0.0\nsalary_group_detail_id: 5\n	1	\N	127.0.0.1	2012-04-12 05:50:51.780561
130	2	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 7\nsalary_allotment: 0.0\nsalary_group_detail_id: 4\n	1	\N	127.0.0.1	2012-04-12 05:50:51.797687
131	3	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 6\nsalary_allotment: 0.0\nsalary_group_detail_id: 3\n	1	\N	127.0.0.1	2012-04-12 05:50:51.812558
132	4	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 5\nsalary_allotment: 0.0\nsalary_group_detail_id: 2\n	1	\N	127.0.0.1	2012-04-12 05:50:51.829724
143	1	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 1500.0\n- 0.0\n	3	\N	127.0.0.1	2012-04-12 05:52:47.26873
144	1	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 1500.0\n	4	\N	127.0.0.1	2012-04-12 05:53:58.850346
145	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 100.0\n	4	\N	127.0.0.1	2012-04-12 05:53:58.872809
146	3	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 12500.0\n	4	\N	127.0.0.1	2012-04-12 05:53:58.888923
147	5	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 25000.0\n	4	\N	127.0.0.1	2012-04-12 05:53:58.90894
148	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 100.0\n- 1000.0\n	5	\N	127.0.0.1	2012-04-12 05:55:06.301697
149	5	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 25000.0\n- 0.0\n	5	\N	127.0.0.1	2012-04-12 05:55:41.3526
150	3	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 12500.0\n- 0.0\n	5	\N	127.0.0.1	2012-04-12 05:55:41.382084
151	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 1000.0\n- 0.0\n	6	\N	127.0.0.1	2012-04-12 05:55:41.395737
152	1	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 1500.0\n- 0.0\n	5	\N	127.0.0.1	2012-04-12 05:55:41.412253
153	1	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 1500.0\n	6	\N	127.0.0.1	2012-04-12 06:16:37.924936
154	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 1000.0\n	7	\N	127.0.0.1	2012-04-12 06:16:37.953709
155	3	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 12500.0\n	6	\N	127.0.0.1	2012-04-12 06:16:37.96756
156	5	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 25000.0\n	6	\N	127.0.0.1	2012-04-12 06:16:37.986379
157	5	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 25000.0\n- 0.0\n	7	\N	127.0.0.1	2012-04-12 06:17:03.66466
158	3	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 12500.0\n- 0.0\n	7	\N	127.0.0.1	2012-04-12 06:17:03.704835
159	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 1000.0\n- 0.0\n	8	\N	127.0.0.1	2012-04-12 06:17:03.71708
160	1	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 1500.0\n- 0.0\n	7	\N	127.0.0.1	2012-04-12 06:17:03.733694
161	1	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 1500.0\n	8	\N	127.0.0.1	2012-04-12 06:17:34.7019
162	2	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 1000.0\n	9	\N	127.0.0.1	2012-04-12 06:17:34.731458
163	3	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 12500.0\n	8	\N	127.0.0.1	2012-04-12 06:17:34.748078
164	5	SalaryAllotment	\N	\N	1	User	\N	update	---\nsalary_allotment:\n- 0.0\n- 25000.0\n	8	\N	127.0.0.1	2012-04-12 06:17:34.766735
165	36	Employee	\N	\N	\N	\N	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Female\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: \nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: \nrefno: V2030501\nrestrct_pf: false\n	1	\N	\N	2012-04-12 09:47:13.058846
166	35	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	2	\N	\N	2012-04-12 09:56:12.607038
167	1	EmployeeDetail	\N	\N	\N	\N	\N	destroy	---\nemployee_id: 35\neffective_date: 2012-01-01\nsalary_group_id: 1\nallotted_gross: \nclassification:\n  SSE: Developer\nbranch_id: 1\nfinancial_institution_id: 1\nattendance_configuration_id: 2\nbank_account_number: '123456'\neffective_to: \npan: PAN Not Avbl\npan_effective_date: \n	2	\N	\N	2012-04-12 09:56:12.700084
168	1	SalaryAllotment	\N	\N	\N	\N	\N	destroy	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 8\nsalary_allotment: 1500.0\nsalary_group_detail_id: 5\n	9	\N	\N	2012-04-12 09:56:12.731329
169	2	SalaryAllotment	\N	\N	\N	\N	\N	destroy	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 7\nsalary_allotment: 1000.0\nsalary_group_detail_id: 4\n	10	\N	\N	2012-04-12 09:56:12.737079
170	3	SalaryAllotment	\N	\N	\N	\N	\N	destroy	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 6\nsalary_allotment: 12500.0\nsalary_group_detail_id: 3\n	9	\N	\N	2012-04-12 09:56:12.741654
171	4	SalaryAllotment	\N	\N	\N	\N	\N	destroy	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 5\nsalary_allotment: 0.0\nsalary_group_detail_id: 2\n	4	\N	\N	2012-04-12 09:56:12.746031
172	5	SalaryAllotment	\N	\N	\N	\N	\N	destroy	---\nemployee_id: 35\nemployee_detail_id: 1\neffective_date: 2012-01-01\nsalary_head_id: 1\nsalary_allotment: 25000.0\nsalary_group_detail_id: 1\n	9	\N	\N	2012-04-12 09:56:12.749856
173	36	Employee	\N	\N	\N	\N	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: \nfather_name: \nspouse_name: \ngender: Female\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: \nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: \nrefno: V2030501\nrestrct_pf: false\n	2	\N	\N	2012-04-12 09:56:13.060594
174	37	Employee	\N	\N	1	User	\N	create	---\nempname: Ranjeet\ndate_of_joining: 2012-01-01\ndate_of_leaving: \ndate_of_birth: 1981-09-13\nmarital_status: ''\nfather_name: A N S\nspouse_name: ''\ngender: Male\npresent_res_no: 5/14\npresent_res_name: Maha\npresent_street: C R L/o\npresent_locality: Roopena Agrahara\npresent_city: Bangalore\npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ranjet.kumar@relyonsoft.com\nmobile: '9019592573'\nrefno: '1002'\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-12 09:57:10.363067
175	37	Employee	\N	\N	1	User	\N	update	---\nempname:\n- Ranjeet\n- Ranjeet1\n	2	\N	127.0.0.1	2012-04-12 10:04:55.572355
176	38	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Female\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-12 10:10:51.324749
177	38	Employee	\N	\N	1	User	\N	destroy	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Female\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	2	\N	127.0.0.1	2012-04-12 10:19:49.0034
199	43	Employee	\N	\N	1	User	\N	update	---\nempname:\n- ! 'D.S. '\n- D.S. Srinivas 1\n	2	\N	127.0.0.1	2012-04-14 05:30:28.176156
200	2	PtGroupRate	\N	\N	1	User	\N	create	---\npt_group_id: 1\npaymonth_id: 3\n	1	\N	127.0.0.1	2012-04-16 06:18:31.088073
178	39	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: SINGLE\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\n	1	\N	127.0.0.1	2012-04-12 10:19:49.155562
179	39	Employee	\N	\N	1	User	\N	update	---\ngender:\n- Male\n- Female\n	2	\N	127.0.0.1	2012-04-12 10:52:26.015827
180	39	Employee	\N	\N	1	User	\N	update	---\nempname:\n- D.S. Srinivas\n- D.S. Srinivas1\nmarital_status:\n- SINGLE\n- Married\ngender:\n- Female\n- Male\n	3	\N	127.0.0.1	2012-04-12 10:53:44.000692
181	1	Paymonth	\N	\N	1	User	\N	destroy	---\nmonth_year: 24145\nnumber_of_days: 31\nfrom_date: 2012-01-01\nto_date: 2012-01-31\nmonth_name: Jan/2012\n	2	\N	127.0.0.1	2012-04-14 05:15:31.549578
182	1	PfGroupRate	\N	\N	1	User	\N	destroy	---\npf_group_id: 1\npaymonth_id: 1\naccount_number_21: 2.0\npension_fund: 4.0\nepf: 12.0\naccount_number_02: 20.0\naccount_number_22: 1.0\nround_off: Nearest Rupee\nrestrict_employer_share: false\nrestrict_employee_share_to_employer_share: false\nemployer_epf: 8.0\ncutoff: 6500.0\neffective_date: 2012-01-01\n	3	\N	127.0.0.1	2012-04-14 05:15:31.879319
183	1	PtGroupRate	\N	\N	1	User	\N	destroy	---\npt_group_id: 1\npaymonth_id: 1\n	2	\N	127.0.0.1	2012-04-14 05:15:31.942105
184	2	Paymonth	\N	\N	1	User	\N	create	---\nmonth_year: 24144\nnumber_of_days: 31\nfrom_date: 2011-12-01\nto_date: 2011-12-31\nmonth_name: Dec/2011\n	1	\N	127.0.0.1	2012-04-14 05:15:43.35809
185	3	Paymonth	\N	\N	1	User	\N	create	---\nmonth_year: 24145\nnumber_of_days: 31\nfrom_date: 2012-01-01\nto_date: 2012-01-31\nmonth_name: Jan/2012\n	1	\N	127.0.0.1	2012-04-14 05:15:51.631295
186	40	Employee	\N	\N	1	User	\N	create	---\nempname: Aditya Swaroop\ndate_of_joining: 2011-01-01\ndate_of_leaving: \ndate_of_birth: 1985-10-13\nmarital_status: Single\nfather_name: Binay Kumar Verma\nspouse_name: \ngender: Male\npresent_res_no: 304\npresent_res_name: GR Queen's Amber Apartment\npresent_street: Banarghatta Road\npresent_locality: Onkar Nagar\npresent_city: Bangalore\npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: !str\n  str: aditya.swaroop@relyonsoft.com\n  url: mailto:aditya.swaroop@relyonsoft.com\n  fragment: \nmobile: '9916911955.0'\nrefno: '1005'\nrestrct_pf: false\npan: PAN Applied\npan_effective_date: \n	1	\N	127.0.0.1	2012-04-14 05:24:56.375524
187	41	Employee	\N	\N	1	User	\N	create	---\nempname: Ranjeet\ndate_of_joining: 2011-01-01\ndate_of_leaving: \ndate_of_birth: 1985-10-13\nmarital_status: Single\nfather_name: Binay Kumar Verma\nspouse_name: \ngender: Male\npresent_res_no: 304\npresent_res_name: GR Queen's Amber Apartment\npresent_street: Banarghatta Road\npresent_locality: Onkar Nagar\npresent_city: Bangalore\npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: !str\n  str: Ranjeet.kumar@relyonsoft.com\n  url: mailto:Ranjeet.kumar@relyonsoft.com\n  fragment: \nmobile: '9916911955.0'\nrefno: '1001'\nrestrct_pf: false\npan: PAN Applied\npan_effective_date: \n	1	\N	127.0.0.1	2012-04-14 05:24:56.416759
188	40	Employee	\N	\N	1	User	\N	update	---\npresent_res_no:\n- '304'\n- 304\n	2	\N	127.0.0.1	2012-04-14 05:25:33.242619
189	41	Employee	\N	\N	1	User	\N	update	---\nempname:\n- Ranjeet\n- Ranjeet kumar\npresent_res_no:\n- '304'\n- 304\n	2	\N	127.0.0.1	2012-04-14 05:25:33.286956
190	40	Employee	\N	\N	1	User	\N	update	---\nempname:\n- Aditya Swaroop\n- Aditya Swaroop1\npresent_res_no:\n- '304'\n- 304\n	3	\N	127.0.0.1	2012-04-14 05:25:56.702253
191	41	Employee	\N	\N	1	User	\N	update	---\nempname:\n- Ranjeet kumar\n- Ranjeet kumar 1\npresent_res_no:\n- '304'\n- 304\n	3	\N	127.0.0.1	2012-04-14 05:25:56.729046
192	41	Employee	\N	\N	1	User	\N	destroy	---\nempname: Ranjeet kumar 1\ndate_of_joining: 2011-01-01\ndate_of_leaving: \ndate_of_birth: 1985-10-13\nmarital_status: Single\nfather_name: Binay Kumar Verma\nspouse_name: \ngender: Male\npresent_res_no: '304'\npresent_res_name: GR Queen's Amber Apartment\npresent_street: Banarghatta Road\npresent_locality: Onkar Nagar\npresent_city: Bangalore\npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: Ranjeet.kumar@relyonsoft.com\nmobile: '9916911955.0'\nrefno: '1001'\nrestrct_pf: false\npan: PAN Applied\npan_effective_date: \n	4	\N	127.0.0.1	2012-04-14 05:27:15.564222
193	40	Employee	\N	\N	1	User	\N	destroy	---\nempname: Aditya Swaroop1\ndate_of_joining: 2011-01-01\ndate_of_leaving: \ndate_of_birth: 1985-10-13\nmarital_status: Single\nfather_name: Binay Kumar Verma\nspouse_name: \ngender: Male\npresent_res_no: '304'\npresent_res_name: GR Queen's Amber Apartment\npresent_street: Banarghatta Road\npresent_locality: Onkar Nagar\npresent_city: Bangalore\npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: aditya.swaroop@relyonsoft.com\nmobile: '9916911955.0'\nrefno: '1005'\nrestrct_pf: false\npan: PAN Applied\npan_effective_date: \n	4	\N	127.0.0.1	2012-04-14 05:27:18.164715
194	39	Employee	\N	\N	1	User	\N	destroy	---\nempname: D.S. Srinivas1\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: Married\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\npan: \npan_effective_date: \n	4	\N	127.0.0.1	2012-04-14 05:27:20.14078
195	37	Employee	\N	\N	1	User	\N	destroy	---\nempname: Ranjeet1\ndate_of_joining: 2012-01-01\ndate_of_leaving: \ndate_of_birth: 1981-09-13\nmarital_status: ''\nfather_name: A N S\nspouse_name: ''\ngender: Male\npresent_res_no: 5/14\npresent_res_name: Maha\npresent_street: C R L/o\npresent_locality: Roopena Agrahara\npresent_city: Bangalore\npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: ranjet.kumar@relyonsoft.com\nmobile: '9019592573'\nrefno: '1002'\nrestrct_pf: false\npan: \npan_effective_date: \n	3	\N	127.0.0.1	2012-04-14 05:27:22.155746
196	42	Employee	\N	\N	1	User	\N	create	---\nempname: D.S. Srinivas\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: Married\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav@v2soft.com\nmobile: ''\nrefno: V2030501\nrestrct_pf: false\npan: PAN Applied\npan_effective_date: \n	1	\N	127.0.0.1	2012-04-14 05:29:15.483688
197	43	Employee	\N	\N	1	User	\N	create	---\nempname: ! 'D.S. '\ndate_of_joining: 2003-05-23\ndate_of_leaving: \ndate_of_birth: 1980-04-01\nmarital_status: Married\nfather_name: \nspouse_name: \ngender: Male\npresent_res_no: \npresent_res_name: \npresent_street: \npresent_locality: \npresent_city: \npresent_state_id: 13\nperm_res_no: \nperm_res_name: \nperm_street: \nperm_locality: \nperm_city: \nperm_state_id: \nperm_sameas_present: \nemail: rajannav1@v2soft.com\nmobile: ''\nrefno: V2030503\nrestrct_pf: false\npan: PAN Applied\npan_effective_date: \n	1	\N	127.0.0.1	2012-04-14 05:29:15.51997
198	42	Employee	\N	\N	1	User	\N	update	---\ngender:\n- Male\n- Female\n	2	\N	127.0.0.1	2012-04-14 05:30:28.1487
201	1	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 1\nname: Name\ndata_type: \nrequired: true\n	1	\N	127.0.0.1	2012-04-16 06:19:48.393248
202	2	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 1\nname: Age\ndata_type: \nrequired: true\n	1	\N	127.0.0.1	2012-04-16 06:21:00.776781
203	3	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 1\nname: Relation\ndata_type: \nrequired: true\n	1	\N	127.0.0.1	2012-04-16 06:21:34.352704
204	1	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 1\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name: Saajan\n  Age: '12'\n  Relation: Brother\n	1	\N	127.0.0.1	2012-04-16 06:22:15.963451
205	2	Branch	\N	\N	1	User	\N	create	---\nbranch_name: BANGALORE\nresponsible_person: HSN\naddress: WOC\npf_group_id: \nesi_group_id: \npt_group_id: \nesi_applicable: \n	1	\N	127.0.0.1	2012-04-16 10:13:26.85387
206	2	Branch	\N	\N	1	User	\N	destroy	---\nbranch_name: BANGALORE\nresponsible_person: HSN\naddress: WOC\npf_group_id: \nesi_group_id: \npt_group_id: \nesi_applicable: \n	2	\N	127.0.0.1	2012-04-16 10:14:30.348128
207	2	PfGroup	\N	\N	1	User	\N	create	---\npf_group: Tamil Nadu\npf_number: TN123456\ndb_file_code: IFC0212\nextension: 3\naddress: Chennai\n	1	\N	127.0.0.1	2012-04-17 05:18:10.075338
208	2	EmployeeDetail	\N	\N	1	User	\N	create	---\nemployee_id: 42\neffective_date: 2012-04-01\nsalary_group_id: 1\nallotted_gross: \nclassification: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  SSE: ''\nbranch_id: 1\nfinancial_institution_id: 1\nattendance_configuration_id: \nbank_account_number: ''\neffective_to: \npan: \npan_effective_date: \n	1	\N	127.0.0.1	2012-04-17 06:42:27.812974
209	6	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 2\neffective_date: 2012-04-01\nsalary_head_id: 8\nsalary_allotment: 0.0\nsalary_group_detail_id: 5\n	1	\N	127.0.0.1	2012-04-17 06:42:27.93945
210	7	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 2\neffective_date: 2012-04-01\nsalary_head_id: 7\nsalary_allotment: 0.0\nsalary_group_detail_id: 4\n	1	\N	127.0.0.1	2012-04-17 06:42:27.966112
211	8	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 2\neffective_date: 2012-04-01\nsalary_head_id: 6\nsalary_allotment: 0.0\nsalary_group_detail_id: 3\n	1	\N	127.0.0.1	2012-04-17 06:42:27.980784
212	9	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 2\neffective_date: 2012-04-01\nsalary_head_id: 5\nsalary_allotment: 0.0\nsalary_group_detail_id: 2\n	1	\N	127.0.0.1	2012-04-17 06:42:27.997601
213	10	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 2\neffective_date: 2012-04-01\nsalary_head_id: 1\nsalary_allotment: 0.0\nsalary_group_detail_id: 1\n	1	\N	127.0.0.1	2012-04-17 06:42:28.013848
214	2	SalaryGroup	\N	\N	1	User	\N	create	---\nsalary_group_name: Salary Structure 1\nbased_on_gross: false\n	1	\N	127.0.0.1	2012-04-17 06:42:45.681346
215	6	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Present Days\nsalary_group_id: 2\nsalary_head_id: 1\npf_applicability: false\npf_percentage: \nprint_name: BASIC\nprint_order: 1\n	1	\N	127.0.0.1	2012-04-17 06:43:00.87713
216	7	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Pay Days\nsalary_group_id: 2\nsalary_head_id: 6\npf_applicability: false\npf_percentage: \nprint_name: HRA\nprint_order: 2\n	1	\N	127.0.0.1	2012-04-17 06:43:15.690987
217	8	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Present Days\nsalary_group_id: 2\nsalary_head_id: 5\npf_applicability: false\npf_percentage: \nprint_name: DA\nprint_order: 3\n	1	\N	127.0.0.1	2012-04-17 06:43:30.323295
218	3	EmployeeDetail	\N	\N	1	User	\N	create	---\nemployee_id: 42\neffective_date: 2012-05-01\nsalary_group_id: 2\nallotted_gross: \nclassification: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  SSE: Developer\nbranch_id: 1\nfinancial_institution_id: 1\nattendance_configuration_id: 2\nbank_account_number: ''\neffective_to: \npan: \npan_effective_date: \n	1	\N	127.0.0.1	2012-04-17 06:43:50.36284
219	11	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 3\neffective_date: 2012-05-01\nsalary_head_id: 5\nsalary_allotment: 0.0\nsalary_group_detail_id: 8\n	1	\N	127.0.0.1	2012-04-17 06:43:50.390333
220	12	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 3\neffective_date: 2012-05-01\nsalary_head_id: 6\nsalary_allotment: 0.0\nsalary_group_detail_id: 7\n	1	\N	127.0.0.1	2012-04-17 06:43:50.404842
221	13	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 3\neffective_date: 2012-05-01\nsalary_head_id: 1\nsalary_allotment: 0.0\nsalary_group_detail_id: 6\n	1	\N	127.0.0.1	2012-04-17 06:43:50.506378
222	2	EmployeeDetail	\N	\N	1	User	\N	update	---\neffective_to:\n- \n- 2012-04-30\n	2	\N	127.0.0.1	2012-04-17 06:43:50.521894
223	3	SalaryGroup	\N	\N	1	User	\N	create	---\nsalary_group_name: Developer\nbased_on_gross: false\n	1	\N	127.0.0.1	2012-04-17 06:45:44.684713
224	9	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Present Days\nsalary_group_id: 3\nsalary_head_id: 1\npf_applicability: false\npf_percentage: \nprint_name: BASIC\nprint_order: 1\n	1	\N	127.0.0.1	2012-04-17 06:45:57.876587
225	10	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Present Days\nsalary_group_id: 3\nsalary_head_id: 5\npf_applicability: false\npf_percentage: \nprint_name: DA\nprint_order: 2\n	1	\N	127.0.0.1	2012-04-17 06:46:09.643902
226	11	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Every Month\ncalculation: ''\nbased_on: Present Days\nsalary_group_id: 3\nsalary_head_id: 6\npf_applicability: false\npf_percentage: \nprint_name: HRA\nprint_order: 3\n	1	\N	127.0.0.1	2012-04-17 06:46:28.576207
227	12	SalaryGroupDetail	\N	\N	1	User	\N	create	---\ncalc_type: Lumpsum\ncalculation: ''\nbased_on: Independent Days\nsalary_group_id: 3\nsalary_head_id: 8\npf_applicability: false\npf_percentage: \nprint_name: Spl Allowance\nprint_order: 4\n	1	\N	127.0.0.1	2012-04-17 06:46:48.467635
228	4	EmployeeDetail	\N	\N	1	User	\N	create	---\nemployee_id: 42\neffective_date: 2012-06-01\nsalary_group_id: 3\nallotted_gross: \nclassification: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  SSE: Developer\nbranch_id: 1\nfinancial_institution_id: 1\nattendance_configuration_id: 2\nbank_account_number: ''\neffective_to: \npan: \npan_effective_date: \n	1	\N	127.0.0.1	2012-04-17 06:47:08.304924
229	14	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 4\neffective_date: 2012-06-01\nsalary_head_id: 8\nsalary_allotment: 0.0\nsalary_group_detail_id: 12\n	1	\N	127.0.0.1	2012-04-17 06:47:08.325836
230	15	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 4\neffective_date: 2012-06-01\nsalary_head_id: 6\nsalary_allotment: 0.0\nsalary_group_detail_id: 11\n	1	\N	127.0.0.1	2012-04-17 06:47:08.339966
231	16	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 4\neffective_date: 2012-06-01\nsalary_head_id: 5\nsalary_allotment: 0.0\nsalary_group_detail_id: 10\n	1	\N	127.0.0.1	2012-04-17 06:47:08.356317
232	17	SalaryAllotment	\N	\N	1	User	\N	create	---\nemployee_id: 42\nemployee_detail_id: 4\neffective_date: 2012-06-01\nsalary_head_id: 1\nsalary_allotment: 0.0\nsalary_group_detail_id: 9\n	1	\N	127.0.0.1	2012-04-17 06:47:08.373852
233	3	EmployeeDetail	\N	\N	1	User	\N	update	---\neffective_to:\n- \n- 2012-05-31\n	2	\N	127.0.0.1	2012-04-17 06:47:08.388828
294	3	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 1\nname: Relation\ndata_type: \nrequired: true\n	2	\N	127.0.0.1	2012-05-07 09:43:09.886697
234	2	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 1\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name: sdsd\n  Age: ''\n  Relation: ''\n	1	\N	127.0.0.1	2012-04-18 06:31:07.457664
235	2	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 1\nemployee_id: 42\ncategory_values:\n  Age: ''\n  Name: sdsd\n  Relation: ''\n	2	\N	127.0.0.1	2012-04-18 06:31:17.73383
236	3	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 1\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name: dfdf\n  Age: ''\n  Relation: ''\n	1	\N	127.0.0.1	2012-04-18 06:31:50.128771
237	3	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 1\nemployee_id: 42\ncategory_values:\n  Age: ''\n  Name: dfdf\n  Relation: ''\n	2	\N	127.0.0.1	2012-04-18 06:31:53.535861
238	1	EsiGroup	\N	\N	1	User	\N	create	---\nesi_group_name: Karnataka\naddress: Bangalore\nesi_no: '123654789'\nesi_local_office: Raja Ji Nagar\n	1	\N	127.0.0.1	2012-04-18 11:52:27.829224
239	2	EsiGroup	\N	\N	1	User	\N	create	---\nesi_group_name: Karnataka1\naddress: Bangalore\nesi_no: '123654789'\nesi_local_office: Raja Ji Nagar\n	1	\N	127.0.0.1	2012-04-18 11:52:37.653454
240	3	Branch	\N	\N	1	User	\N	create	---\nbranch_name: CHENNAI\nresponsible_person: HSN\naddress: WOC\npf_group_id: \nesi_group_id: \npt_group_id: \nesi_applicable: \n	1	\N	127.0.0.1	2012-04-19 04:55:38.141329
242	3	Branch	\N	\N	1	User	\N	destroy	---\nbranch_name: CHENNAI\nresponsible_person: HSN\naddress: WOC\npf_group_id: \nesi_group_id: \npt_group_id: \nesi_applicable: \n	2	\N	127.0.0.1	2012-04-19 05:52:20.361358
243	4	Branch	\N	\N	1	User	\N	create	---\nbranch_name: CHENNAI\nresponsible_person: HSN\naddress: WOC\npf_group_id: \nesi_group_id: \npt_group_id: \nesi_applicable: \n	1	\N	127.0.0.1	2012-04-19 05:52:38.830874
245	4	Branch	\N	\N	\N	\N	\N	update	---\npf_group_id:\n- \n- 2\n	2	\N	\N	2012-04-19 05:56:55.640557
246	4	Branch	\N	\N	\N	\N	\N	update	---\npt_group_id:\n- \n- 1\n	3	\N	\N	2012-04-19 06:00:47.860065
247	4	Branch	\N	\N	\N	\N	\N	update	---\nesi_group_id:\n- \n- 1\n	4	\N	\N	2012-04-19 06:00:53.903897
248	4	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- 1\n	5	\N	127.0.0.1	2012-04-19 06:06:05.130388
249	4	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	6	\N	127.0.0.1	2012-04-19 06:07:28.781919
250	4	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- 1\n	7	\N	127.0.0.1	2012-04-19 06:10:31.052081
251	4	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	8	\N	127.0.0.1	2012-04-19 06:15:14.854717
252	4	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- \n	9	\N	127.0.0.1	2012-04-19 06:15:22.757453
253	4	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- \n- 1\n	10	\N	127.0.0.1	2012-04-19 06:15:52.173735
254	4	Branch	\N	\N	1	User	\N	update	---\nesi_group_id:\n- 1\n- \n	11	\N	127.0.0.1	2012-04-19 06:21:39.914136
255	4	Branch	\N	\N	1	User	\N	update	---\npt_group_id:\n- 1\n- \n	12	\N	127.0.0.1	2012-04-19 06:21:52.836231
256	4	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- \n	13	\N	127.0.0.1	2012-04-19 06:22:01.269688
257	4	Branch	\N	\N	1	User	\N	destroy	---\nbranch_name: CHENNAI\nresponsible_person: HSN\naddress: WOC\npf_group_id: \nesi_group_id: \npt_group_id: \nesi_applicable: \n	14	\N	127.0.0.1	2012-04-20 09:05:57.830193
259	1	Branch	\N	\N	\N	\N	\N	update	---\npf_group_id:\n- 1\n- 2\n	2	\N	\N	2012-04-20 09:11:17.056657
260	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- \n	3	\N	127.0.0.1	2012-04-20 11:19:08.904498
261	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- \n- 1\n	4	\N	127.0.0.1	2012-04-20 11:22:46.151427
262	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	5	\N	127.0.0.1	2012-04-20 11:22:59.025992
263	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- 1\n	6	\N	127.0.0.1	2012-04-20 11:23:18.99199
264	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- \n	7	\N	127.0.0.1	2012-04-20 11:23:24.857495
265	1	Branch	\N	\N	1	User	\N	update	---\npt_group_id:\n- 1\n- \n	8	\N	127.0.0.1	2012-04-20 12:08:47.487302
266	1	Branch	\N	\N	1	User	\N	update	---\npt_group_id:\n- \n- 1\n	9	\N	127.0.0.1	2012-04-20 12:08:51.041169
267	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- \n- 1\n	10	\N	127.0.0.1	2012-04-20 12:08:58.47709
268	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	11	\N	127.0.0.1	2012-04-20 12:09:08.759028
269	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- 1\n	12	\N	127.0.0.1	2012-04-20 12:12:08.856569
270	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	13	\N	127.0.0.1	2012-04-20 12:12:16.045371
271	1	Branch	\N	\N	1	User	\N	update	---\npt_group_id:\n- 1\n- \n	14	\N	127.0.0.1	2012-04-20 12:15:34.199403
272	1	Branch	\N	\N	1	User	\N	update	---\npt_group_id:\n- \n- 1\n	15	\N	127.0.0.1	2012-04-23 09:57:04.413885
273	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- 1\n	16	\N	127.0.0.1	2012-04-23 09:58:22.924703
274	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- \n	17	\N	127.0.0.1	2012-04-23 09:58:25.266093
275	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- \n- 1\n	18	\N	127.0.0.1	2012-04-23 09:58:34.317723
276	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	19	\N	127.0.0.1	2012-04-24 06:36:18.426439
277	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- 1\n	20	\N	127.0.0.1	2012-04-24 06:36:28.122215
278	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- \n	21	\N	127.0.0.1	2012-04-24 06:36:32.805157
279	1	Branch	\N	\N	1	User	\N	update	---\npt_group_id:\n- 1\n- \n	22	\N	127.0.0.1	2012-04-24 06:37:13.487057
280	1	Branch	\N	\N	1	User	\N	update	---\nesi_group_id:\n- \n- 1\n	23	\N	127.0.0.1	2012-04-24 07:02:01.018993
281	1	Branch	\N	\N	1	User	\N	update	---\nesi_group_id:\n- 1\n- 2\n	24	\N	127.0.0.1	2012-04-24 07:02:05.71363
282	1	Branch	\N	\N	1	User	\N	update	---\nesi_group_id:\n- 2\n- \n	25	\N	127.0.0.1	2012-04-24 07:02:46.991734
283	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- \n- 1\n	26	\N	127.0.0.1	2012-04-25 09:57:49.854459
284	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	27	\N	127.0.0.1	2012-04-25 09:58:22.952344
285	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 2\n- 1\n	28	\N	127.0.0.1	2012-04-25 09:58:32.226651
286	1	Branch	\N	\N	1	User	\N	update	---\npf_group_id:\n- 1\n- 2\n	29	\N	127.0.0.1	2012-04-26 05:07:59.262612
287	1	Branch	\N	\N	1	User	\N	update	---\npt_group_id:\n- \n- 1\n	30	\N	127.0.0.1	2012-04-26 05:08:55.028309
295	2	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 1\nname: Age\ndata_type: \nrequired: true\n	2	\N	127.0.0.1	2012-05-07 09:43:21.234213
296	1	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 1\nname: Name\ndata_type: \nrequired: true\n	2	\N	127.0.0.1	2012-05-07 09:43:26.967025
301	2	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Personal\n	1	\N	\N	2012-05-07 09:59:41.644033
302	4	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Employee Name\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 09:59:41.697824
303	5	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Employee ID\ndata_type: Integer\nrequired: true\n	1	\N	\N	2012-05-07 09:59:41.712841
304	6	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Blood Group\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 09:59:41.727992
305	7	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Cast Category\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 09:59:41.744183
306	8	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Qualification\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 09:59:41.760876
307	9	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Nationality\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 09:59:41.777513
308	10	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Driving Lic No\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 09:59:41.794141
309	11	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 2\nname: Language Known\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 09:59:41.811141
310	3	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Personal\n	1	\N	\N	2012-05-07 10:02:15.311657
311	12	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Employee Name\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:25.910962
312	13	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Employee ID\ndata_type: Integer\nrequired: true\n	1	\N	\N	2012-05-07 10:25:25.941577
313	14	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Blood Group\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:25.956728
314	15	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Cast Category\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:25.973529
315	16	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Qualification\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:25.990246
316	17	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Nationality\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.015433
317	18	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Driving Lic No\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.032973
318	19	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: \nname: Language Known\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.049423
319	4	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Passport\n	1	\N	\N	2012-05-07 10:25:26.073547
320	20	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 4\nname: Number\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.093742
321	21	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 4\nname: Issued At\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.107923
322	22	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 4\nname: Issued date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.12484
323	23	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 4\nname: Expiry Date\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.141508
324	5	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Family\n	1	\N	\N	2012-05-07 10:25:26.15956
325	24	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 5\nname: Name Of Relative\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.17532
326	25	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 5\nname: Relation\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.191457
327	26	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 5\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.207957
328	27	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 5\nname: Date of Birth\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.224731
329	28	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 5\nname: Dependent\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.241405
330	29	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 5\nname: Nominee\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.258049
331	6	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Education\n	1	\N	\N	2012-05-07 10:25:26.276297
332	30	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 6\nname: Qualification\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.291819
333	31	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 6\nname: University\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.308137
334	32	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 6\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.324769
335	33	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 6\nname: Percentage\ndata_type: Decimal\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.341381
336	34	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 6\nname: Year Passed\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.358076
337	7	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Training\n	1	\N	\N	2012-05-07 10:25:26.376192
338	35	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 7\nname: Training Name\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.392568
339	36	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 7\nname: Location\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.492034
340	37	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 7\nname: Comments\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.508303
341	38	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 7\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.52489
342	39	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 7\nname: From Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.541586
343	40	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 7\nname: To Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.558129
344	8	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Accident\n	1	\N	\N	2012-05-07 10:25:26.576178
345	41	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 8\nname: Accident\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.591919
346	42	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 8\nname: Location\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.60857
347	43	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 8\nname: Compensation\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.625073
348	44	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 8\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.641663
349	45	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 8\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.658533
350	9	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Disciplinary Actions\n	1	\N	\N	2012-05-07 10:25:26.676589
351	46	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 9\nname: Memo\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.692207
352	47	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 9\nname: Issued By\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.708608
353	48	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 9\nname: Comments\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.725308
354	49	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 9\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.742139
355	50	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 9\nname: Issued Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.75853
356	10	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Extracurricular Event\n	1	\N	\N	2012-05-07 10:25:26.77655
357	51	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 10\nname: Game/Activity\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.792229
358	52	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 10\nname: Event\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.808719
359	53	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 10\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.825315
360	54	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 10\nname: From Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.841994
361	55	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 10\nname: To Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.858485
362	11	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Extracurricular Award\n	1	\N	\N	2012-05-07 10:25:26.876654
363	56	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 11\nname: Game/Activity\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.892146
364	57	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 11\nname: Award\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:25:26.908753
365	58	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 11\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.925414
366	59	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 11\nname: From Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.942014
367	60	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 10\nname: To Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.958461
368	12	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: General\n	1	\N	\N	2012-05-07 10:25:26.976842
369	61	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 12\nname: Description\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:26.992473
370	62	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 12\nname: Details\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:25:27.008845
371	63	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 12\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:25:27.025504
372	13	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Personal\n	1	\N	\N	2012-05-07 10:30:42.725931
373	64	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Employee Name\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:42.768644
374	65	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Employee ID\ndata_type: Integer\nrequired: true\n	1	\N	\N	2012-05-07 10:30:42.780798
375	66	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Blood Group\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.788097
376	67	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Cast Category\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.796344
377	68	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Qualification\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.80467
378	69	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Nationality\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.813076
379	70	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Driving Lic No\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.821689
380	71	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 13\nname: Language Known\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.829778
381	14	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Passport\n	1	\N	\N	2012-05-07 10:30:42.839492
382	72	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 14\nname: Number\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.846494
383	73	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 14\nname: Issued At\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.85503
384	74	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 14\nname: Issued date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.863245
385	75	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 14\nname: Expiry Date\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.871881
386	15	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Family\n	1	\N	\N	2012-05-07 10:30:42.880692
387	76	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 15\nname: Name Of Relative\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:42.888091
388	77	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 15\nname: Relation\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.896455
389	78	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 15\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.904905
390	79	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 15\nname: Date of Birth\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.913111
391	80	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 15\nname: Dependent\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.921376
392	81	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 15\nname: Nominee\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.929775
393	16	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Education\n	1	\N	\N	2012-05-07 10:30:42.939206
394	82	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 16\nname: Qualification\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:42.947091
395	83	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 16\nname: University\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:42.95522
396	84	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 16\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.963257
397	85	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 16\nname: Percentage\ndata_type: Decimal\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.971572
398	86	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 16\nname: Year Passed\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-07 10:30:42.99062
399	17	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Training\n	1	\N	\N	2012-05-07 10:30:43.008342
400	87	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 17\nname: Training Name\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.023828
401	88	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 17\nname: Location\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.040746
402	89	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 17\nname: Comments\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.057955
403	90	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 17\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.073956
404	91	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 17\nname: From Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.090498
405	92	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 17\nname: To Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.107182
406	18	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Accident\n	1	\N	\N	2012-05-07 10:30:43.125075
407	93	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 18\nname: Accident\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.140837
408	94	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 18\nname: Location\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.15765
409	95	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 18\nname: Compensation\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.174127
410	96	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 18\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.190634
411	97	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 18\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.207332
412	19	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Disciplinary Actions\n	1	\N	\N	2012-05-07 10:30:43.225215
413	98	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 19\nname: Memo\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.240938
414	99	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 19\nname: Issued By\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.257781
415	100	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 19\nname: Comments\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.274324
416	101	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 19\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.290738
417	102	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 19\nname: Issued Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.307284
418	20	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Extracurricular Event\n	1	\N	\N	2012-05-07 10:30:43.325173
419	103	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 20\nname: Game/Activity\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.341142
420	104	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 20\nname: Event\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.357829
421	105	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 20\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.374734
422	106	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 20\nname: From Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.391018
423	107	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 20\nname: To Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.40762
424	21	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Extracurricular Award\n	1	\N	\N	2012-05-07 10:30:43.425271
425	108	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 21\nname: Game/Activity\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.441101
426	109	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 21\nname: Award\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-07 10:30:43.457869
427	110	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 21\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.474575
428	111	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 21\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.490784
429	22	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: General\n	1	\N	\N	2012-05-07 10:30:43.508695
430	112	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 22\nname: Description\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.524315
431	113	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 22\nname: Details\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.541256
432	114	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 22\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-07 10:30:43.557902
433	4	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-07 10:32:30.557958
434	4	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-07 10:32:41.296369
435	5	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 15\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name Of Relative: ''\n  Relation: ''\n  Remarks: ''\n  Date of Birth: ''\n  Dependent: ''\n  Nominee: ''\n	1	\N	127.0.0.1	2012-05-07 10:32:52.838469
436	5	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 15\nemployee_id: 42\ncategory_values:\n  Nominee: ''\n  Remarks: ''\n  Relation: ''\n  Dependent: ''\n  Date of Birth: ''\n  Name Of Relative: ''\n	2	\N	127.0.0.1	2012-05-07 10:32:57.783433
437	23	HrCategory	\N	\N	1	User	\N	create	---\ncategory_name: Test1\n	1	\N	127.0.0.1	2012-05-07 10:33:24.099051
438	115	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 23\nname: Age\ndata_type: \nrequired: true\n	1	\N	127.0.0.1	2012-05-07 10:33:36.561117
439	6	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 21\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Game/Activity: ''\n  Award: ''\n  Remarks: ''\n  Date: ''\n	1	\N	127.0.0.1	2012-05-07 10:37:38.437252
440	6	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 21\nemployee_id: 42\ncategory_values:\n  Date: ''\n  Award: ''\n  Remarks: ''\n  Game/Activity: ''\n	2	\N	127.0.0.1	2012-05-07 10:38:09.555649
441	7	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 23\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Age: ''\n	1	\N	127.0.0.1	2012-05-07 10:38:19.712814
442	7	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 23\nemployee_id: 42\ncategory_values:\n  Age: ''\n	2	\N	127.0.0.1	2012-05-07 11:16:22.862108
443	8	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:07:26.949842
444	8	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:15:23.27576
445	9	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:15:25.125655
446	9	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:18:30.941815
447	10	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:18:32.841165
448	11	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:21:28.355714
482	77	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 15\nname: Relation\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.083487
449	12	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:22:50.528868
450	12	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:23:17.983801
451	11	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:23:20.250266
452	10	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:23:22.210134
453	13	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:23:23.718705
454	14	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: kanaily\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:23:47.840381
455	15	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: j\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:26:23.819381
456	15	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: j\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:27:23.085424
457	14	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: kanaily\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:27:26.120827
458	13	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:27:28.531013
459	16	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:27:30.322312
460	16	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:29:13.263773
461	17	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:29:15.967758
462	18	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Employee Name: ''\n  Employee ID: ''\n  Blood Group: ''\n  Cast Category: ''\n  Qualification: ''\n  Nationality: ''\n  Driving Lic No: ''\n  Language Known: ''\n	1	\N	127.0.0.1	2012-05-08 09:31:30.819214
463	18	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:32:18.56262
464	17	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 13\nemployee_id: 42\ncategory_values:\n  Blood Group: ''\n  Employee ID: ''\n  Nationality: ''\n  Cast Category: ''\n  Employee Name: ''\n  Qualification: ''\n  Driving Lic No: ''\n  Language Known: ''\n	2	\N	127.0.0.1	2012-05-08 09:32:25.551338
465	19	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 14\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Number: ''\n  Issued At: ''\n  Issued date: ''\n  Expiry Date: ''\n	1	\N	127.0.0.1	2012-05-08 09:32:55.815594
466	19	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 14\nemployee_id: 42\ncategory_values:\n  Number: ''\n  Issued At: ''\n  Expiry Date: ''\n  Issued date: ''\n	2	\N	127.0.0.1	2012-05-08 09:33:15.768016
467	23	HrCategory	\N	\N	1	User	\N	destroy	---\ncategory_name: Test1\n	2	\N	127.0.0.1	2012-05-08 09:34:10.424866
468	115	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 23\nname: Age\ndata_type: \nrequired: true\n	2	\N	127.0.0.1	2012-05-08 09:34:10.458796
469	64	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Employee Name\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:24.899478
470	65	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Employee ID\ndata_type: Integer\nrequired: true\n	2	\N	\N	2012-05-08 09:35:24.976628
471	66	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Blood Group\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:24.98334
472	67	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Cast Category\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:24.99359
473	68	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Qualification\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.008873
474	69	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Nationality\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.016594
475	70	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Driving Lic No\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.025613
476	71	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 13\nname: Language Known\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.033366
477	72	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 14\nname: Number\ndata_type: Integer\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.042181
478	73	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 14\nname: Issued At\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.050651
479	74	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 14\nname: Issued date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.059599
480	75	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 14\nname: Expiry Date\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.067405
481	76	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 15\nname: Name Of Relative\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.075638
483	78	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 15\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.092843
484	79	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 15\nname: Date of Birth\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.100694
485	80	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 15\nname: Dependent\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.109045
486	81	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 15\nname: Nominee\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.118887
487	82	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 16\nname: Qualification\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.134834
488	83	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 16\nname: University\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.142172
489	84	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 16\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.150274
490	85	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 16\nname: Percentage\ndata_type: Decimal\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.159278
491	86	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 16\nname: Year Passed\ndata_type: Integer\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.167528
492	87	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 17\nname: Training Name\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.17517
493	88	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 17\nname: Location\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.195275
494	89	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 17\nname: Comments\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.209747
495	90	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 17\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.226702
496	91	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 17\nname: From Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.233384
497	92	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 17\nname: To Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.242673
498	93	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 18\nname: Accident\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.250171
499	94	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 18\nname: Location\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.259039
500	95	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 18\nname: Compensation\ndata_type: Integer\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.26755
501	96	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 18\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.277488
502	97	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 18\nname: Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.292699
503	98	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 19\nname: Memo\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.301394
504	99	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 19\nname: Issued By\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.309306
505	100	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 19\nname: Comments\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.318418
506	101	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 19\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.325643
507	102	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 19\nname: Issued Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.333784
508	103	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 20\nname: Game/Activity\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.342401
509	104	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 20\nname: Event\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.354109
510	105	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 20\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.370383
511	106	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 20\nname: From Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.385373
512	107	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 20\nname: To Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.401922
513	108	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 21\nname: Game/Activity\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.418126
514	109	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 21\nname: Award\ndata_type: String\nrequired: true\n	2	\N	\N	2012-05-08 09:35:25.427205
515	110	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 21\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.44328
516	111	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 21\nname: Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.454946
517	112	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 22\nname: Description\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.468245
518	113	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 22\nname: Details\ndata_type: String\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.476727
519	114	HrCategoryDetail	\N	\N	\N	\N	\N	destroy	---\nhr_category_id: 22\nname: Date\ndata_type: Date\nrequired: false\n	2	\N	\N	2012-05-08 09:35:25.484482
520	13	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Personal\n	2	\N	\N	2012-05-08 09:35:36.829657
521	14	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Passport\n	2	\N	\N	2012-05-08 09:35:36.856868
522	15	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Family\n	2	\N	\N	2012-05-08 09:35:36.878933
523	16	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Education\n	2	\N	\N	2012-05-08 09:35:36.89456
524	17	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Training\n	2	\N	\N	2012-05-08 09:35:36.914272
525	18	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Accident\n	2	\N	\N	2012-05-08 09:35:36.928972
526	19	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Disciplinary Actions\n	2	\N	\N	2012-05-08 09:35:36.945468
527	20	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Extracurricular Event\n	2	\N	\N	2012-05-08 09:35:36.961152
528	21	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: Extracurricular Award\n	2	\N	\N	2012-05-08 09:35:36.978773
529	22	HrCategory	\N	\N	\N	\N	\N	destroy	---\ncategory_name: General\n	2	\N	\N	2012-05-08 09:35:36.994531
530	24	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Personal\n	1	\N	\N	2012-05-08 09:37:11.299718
531	116	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 24\nname: Blood Group\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.380977
532	117	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 24\nname: Cast Category\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.400435
533	118	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 24\nname: Qualification\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.407693
534	119	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 24\nname: Nationality\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.415897
535	120	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 24\nname: Driving Lic No\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.424367
536	121	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 24\nname: Language Known\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.43258
537	25	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Passport\n	1	\N	\N	2012-05-08 09:37:11.444852
538	122	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 25\nname: Number\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.459267
539	123	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 25\nname: Issued At\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.475472
540	124	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 25\nname: Issued date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.49195
541	125	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 25\nname: Expiry Date\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.508668
542	26	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Family\n	1	\N	\N	2012-05-08 09:37:11.518438
543	126	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 26\nname: Name Of Relative\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:11.533894
544	127	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 26\nname: Relation\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.550634
545	128	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 26\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.567365
546	129	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 26\nname: Date of Birth\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.583683
547	130	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 26\nname: Dependent\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.592179
548	131	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 26\nname: Nominee\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.618257
549	27	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Education\n	1	\N	\N	2012-05-08 09:37:11.636107
550	132	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 27\nname: Qualification\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:11.652325
551	133	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 27\nname: University\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:11.668729
552	134	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 27\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.68504
553	135	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 27\nname: Percentage\ndata_type: Decimal\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.701851
554	136	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 27\nname: Year Passed\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.719015
555	28	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Training\n	1	\N	\N	2012-05-08 09:37:11.736172
556	137	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 28\nname: Training Name\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:11.752108
557	138	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 28\nname: Location\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:11.769034
558	139	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 28\nname: Comments\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.785371
559	140	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 28\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.801708
560	141	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 28\nname: From Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.818537
561	142	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 28\nname: To Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.834986
562	29	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Accident\n	1	\N	\N	2012-05-08 09:37:11.853304
563	143	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 29\nname: Accident\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:11.868869
564	144	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 29\nname: Location\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.885162
565	145	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 29\nname: Compensation\ndata_type: Integer\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.901921
566	146	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 29\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.918633
567	147	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 29\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:11.935216
568	30	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Disciplinary Actions\n	1	\N	\N	2012-05-08 09:37:11.967742
569	148	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 30\nname: Memo\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:11.993566
570	149	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 30\nname: Issued By\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.010086
571	150	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 30\nname: Comments\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.027139
572	151	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 30\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.043518
573	152	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 30\nname: Issued Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.060694
574	31	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Extracurricular Event\n	1	\N	\N	2012-05-08 09:37:12.078314
575	153	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 31\nname: Game/Activity\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:12.093661
576	154	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 31\nname: Event\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:12.110313
577	155	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 31\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.127136
578	156	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 31\nname: From Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.143774
579	157	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 31\nname: To Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.160596
580	32	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: Extracurricular Award\n	1	\N	\N	2012-05-08 09:37:12.178199
581	158	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 32\nname: Game/Activity\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:12.193722
582	159	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 32\nname: Award\ndata_type: String\nrequired: true\n	1	\N	\N	2012-05-08 09:37:12.210281
583	160	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 32\nname: Remarks\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.227277
584	161	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 32\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.243775
585	33	HrCategory	\N	\N	\N	\N	\N	create	---\ncategory_name: General\n	1	\N	\N	2012-05-08 09:37:12.262144
586	162	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 33\nname: Description\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.277163
587	163	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 33\nname: Details\ndata_type: String\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.293679
588	164	HrCategoryDetail	\N	\N	\N	\N	\N	create	---\nhr_category_id: 33\nname: Date\ndata_type: Date\nrequired: false\n	1	\N	\N	2012-05-08 09:37:12.310321
589	20	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name Of Relative: sweqweq\n  Relation: ''\n  Remarks: ''\n  Date of Birth: ''\n  Dependent: ''\n  Nominee: ''\n	1	\N	127.0.0.1	2012-05-22 08:47:54.292231
590	20	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values:\n  Nominee: ''\n  Remarks: ''\n  Relation: ''\n  Dependent: ''\n  Date of Birth: ''\n  Name Of Relative: sweqweq\n	2	\N	127.0.0.1	2012-05-22 08:48:34.56216
591	21	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name Of Relative: ''\n  Relation: ''\n  Remarks: ''\n  Date of Birth: ''\n  Dependent: ''\n  Nominee: ''\n	1	\N	127.0.0.1	2012-05-22 08:53:41.014931
592	21	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values:\n  Nominee: ''\n  Remarks: ''\n  Relation: ''\n  Dependent: ''\n  Date of Birth: ''\n  Name Of Relative: ''\n	2	\N	127.0.0.1	2012-05-22 08:55:13.893906
593	22	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name Of Relative: rewqrwerwe\n  Relation: ''\n  Remarks: ''\n  Date of Birth: ''\n  Dependent: ''\n  Nominee: ''\n	1	\N	127.0.0.1	2012-05-22 08:55:19.985492
594	22	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values:\n  Nominee: ''\n  Remarks: ''\n  Relation: ''\n  Dependent: ''\n  Date of Birth: ''\n  Name Of Relative: rewqrwerwe\n	2	\N	127.0.0.1	2012-05-22 08:55:25.25757
595	23	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name Of Relative: sfdgsfd\n  Relation: ''\n  Remarks: ''\n  Date of Birth: ''\n  Dependent: ''\n  Nominee: ''\n	1	\N	127.0.0.1	2012-05-22 08:55:40.407999
596	23	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values:\n  Nominee: ''\n  Remarks: ''\n  Relation: ''\n  Dependent: ''\n  Date of Birth: ''\n  Name Of Relative: sfdgsfd\n	2	\N	127.0.0.1	2012-05-22 08:55:44.684767
597	24	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name Of Relative: '90'\n  Relation: ''\n  Remarks: ''\n  Date of Birth: ''\n  Dependent: ''\n  Nominee: ''\n	1	\N	127.0.0.1	2012-05-22 09:33:42.318089
598	24	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 26\nemployee_id: 43\ncategory_values:\n  Nominee: ''\n  Remarks: ''\n  Relation: ''\n  Dependent: ''\n  Date of Birth: ''\n  Name Of Relative: '90'\n	2	\N	127.0.0.1	2012-05-22 09:33:45.841214
599	25	HrMaster	\N	\N	1	User	\N	create	---\nhr_category_id: 26\nemployee_id: 42\ncategory_values: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  Name Of Relative: qwqww\n  Relation: qwwq\n  Remarks: qwq\n  Date of Birth: wq\n  Dependent: qwqw\n  Nominee: qwwq\n	1	\N	127.0.0.1	2012-05-23 09:24:46.902191
600	25	HrMaster	\N	\N	1	User	\N	destroy	---\nhr_category_id: 26\nemployee_id: 42\ncategory_values:\n  Nominee: qwwq\n  Remarks: qwq\n  Relation: qwwq\n  Dependent: qwqw\n  Date of Birth: wq\n  Name Of Relative: qwqww\n	2	\N	127.0.0.1	2012-05-23 09:24:52.627293
601	164	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 33\nname: Date\ndata_type: Date\nrequired: false\n	2	\N	127.0.0.1	2012-05-23 09:25:11.598456
602	163	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 33\nname: Details\ndata_type: String\nrequired: false\n	2	\N	127.0.0.1	2012-05-23 09:28:31.607203
603	162	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 33\nname: Description\ndata_type: String\nrequired: false\n	2	\N	127.0.0.1	2012-05-23 09:29:45.238414
604	161	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 32\nname: Date\ndata_type: Date\nrequired: false\n	2	\N	127.0.0.1	2012-05-23 09:33:09.226382
605	160	HrCategoryDetail	\N	\N	1	User	\N	destroy	---\nhr_category_id: 32\nname: Remarks\ndata_type: String\nrequired: false\n	2	\N	127.0.0.1	2012-05-23 09:33:15.737874
606	165	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 32\nname: Remarks\ndata_type: \nrequired: false\n	1	\N	127.0.0.1	2012-05-23 09:35:07.924779
607	166	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 32\nname: Date\ndata_type: \nrequired: false\n	1	\N	127.0.0.1	2012-05-23 09:35:14.000491
608	167	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 33\nname: Description\ndata_type: \nrequired: false\n	1	\N	127.0.0.1	2012-05-23 09:35:30.455829
609	168	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 33\nname: Details\ndata_type: \nrequired: false\n	1	\N	127.0.0.1	2012-05-23 09:35:38.480155
610	169	HrCategoryDetail	\N	\N	1	User	\N	create	---\nhr_category_id: 33\nname: Date\ndata_type: \nrequired: false\n	1	\N	127.0.0.1	2012-05-23 09:35:46.377506
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY branches (id, branch_name, responsible_person, address, pf_group_id, esi_group_id, pt_group_id, created_at, updated_at, esi_applicable) FROM stdin;
1	BANGALORE	HSN	WOC	2	\N	1	2012-04-12 05:31:08.980364	2012-04-26 05:08:55.030965	f
\.


--
-- Data for Name: classification_headings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY classification_headings (id, classification_heading_name, display_order, created_at, updated_at) FROM stdin;
1	SSE	1	2012-04-05 10:13:02.683935	2012-04-05 10:13:02.683935
\.


--
-- Data for Name: classifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY classifications (id, classification_heading_id, classification_name, created_at, updated_at) FROM stdin;
1	1	Developer	2012-04-05 10:13:10.877855	2012-04-05 10:13:10.877855
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY companies (id, companyname, responsible_person, address, website, dateofestablishment, pf, esi, phonenumber1, phonenumber2, address2, address3, email, created_at, updated_at, pt, tds, photo_file_name, photo_content_type, photo_file_size) FROM stdin;
1	Company PVT LTD	HSN	#17,,1ST A CROSS	www.relyonsoft.com	2012-01-01	t	t	9019592573		5TH BLOCK, Rajajinagar	BANGALORE-95	hsn@relyonsoft.com	2012-04-05 10:12:02.732988	2012-04-05 10:12:02.732988	t	t	11838101.cms	application/octet-stream	16990
\.


--
-- Data for Name: company_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY company_documents (id, remarks, company_id, created_at, updated_at, file_path_file_name, file_path_content_type, file_path_file_size) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (id, name, currency, created_at, updated_at) FROM stdin;
1	Afghanistan	Afghanistan Afghani	2012-05-15 06:01:54.805379	2012-05-15 06:01:54.805379
2	Albania	Albanian Lek	2012-05-15 06:01:54.900964	2012-05-15 06:01:54.900964
3	Algeria	Algerian Dinar	2012-05-15 06:01:54.908621	2012-05-15 06:01:54.908621
4	Angola	Angolan New Kwanza	2012-05-15 06:01:54.917008	2012-05-15 06:01:54.917008
5	United Arab Emirates	Arab Emirates Dirham	2012-05-15 06:01:54.925338	2012-05-15 06:01:54.925338
6	Argentina	Argentine Peso	2012-05-15 06:01:54.933684	2012-05-15 06:01:54.933684
7	Armenia	Armenian Dram	2012-05-15 06:01:54.941999	2012-05-15 06:01:54.941999
8	Aruba	Aruban Guilder	2012-05-15 06:01:54.950386	2012-05-15 06:01:54.950386
9	Australia	Australian Dollar	2012-05-15 06:01:54.958768	2012-05-15 06:01:54.958768
10	Cocos (Keeling) Islands	Australian Dollar	2012-05-15 06:01:54.967145	2012-05-15 06:01:54.967145
11	Kiribati	Australian Dollar	2012-05-15 06:01:54.975404	2012-05-15 06:01:54.975404
12	Nauru	Australian Dollar	2012-05-15 06:01:54.983649	2012-05-15 06:01:54.983649
13	Norfolk Island	Australian Dollar	2012-05-15 06:01:54.992103	2012-05-15 06:01:54.992103
14	Tuvalu	Australian Dollar	2012-05-15 06:01:55.000318	2012-05-15 06:01:55.000318
15	Christmas Island	Australian Dollar	2012-05-15 06:01:55.008681	2012-05-15 06:01:55.008681
16	Heard Island and McDonald Islands	Australian Dollar	2012-05-15 06:01:55.016973	2012-05-15 06:01:55.016973
17	Azerbaijan	Azerbaijanian Manat	2012-05-15 06:01:55.025329	2012-05-15 06:01:55.025329
18	Bahamas	Bahamian Dollar	2012-05-15 06:01:55.033612	2012-05-15 06:01:55.033612
19	Bahrain	Bahraini Dinar	2012-05-15 06:01:55.041988	2012-05-15 06:01:55.041988
20	Bangladesh	Bangladeshi Taka	2012-05-15 06:01:55.050319	2012-05-15 06:01:55.050319
21	Barbados	Barbados Dollar	2012-05-15 06:01:55.066054	2012-05-15 06:01:55.066054
22	Belarus	Belarussian Ruble	2012-05-15 06:01:55.075682	2012-05-15 06:01:55.075682
23	Belize	Belize Dollar	2012-05-15 06:01:55.084105	2012-05-15 06:01:55.084105
24	Bermuda	Bermudian Dollar	2012-05-15 06:01:55.09238	2012-05-15 06:01:55.09238
25	Bhutan	Bhutan Ngultrum	2012-05-15 06:01:55.100609	2012-05-15 06:01:55.100609
26	Bolivia	Boliviano	2012-05-15 06:01:55.109017	2012-05-15 06:01:55.109017
27	Botswana	Botswana Pula	2012-05-15 06:01:55.117252	2012-05-15 06:01:55.117252
28	Brazil	Brazilian Real	2012-05-15 06:01:55.125593	2012-05-15 06:01:55.125593
29	Brunei Darussalam	Brunei Dollar	2012-05-15 06:01:55.133923	2012-05-15 06:01:55.133923
30	Bulgaria	Bulgarian Lev	2012-05-15 06:01:55.142277	2012-05-15 06:01:55.142277
31	Burundi	Burundi Franc	2012-05-15 06:01:55.150601	2012-05-15 06:01:55.150601
32	Senegal	CFA Franc BCEAO	2012-05-15 06:01:55.158908	2012-05-15 06:01:55.158908
33	Mali	CFA Franc BCEAO	2012-05-15 06:01:55.167415	2012-05-15 06:01:55.167415
34	Burkina Faso	CFA Franc BCEAO	2012-05-15 06:01:55.175607	2012-05-15 06:01:55.175607
35	Benin	CFA Franc BCEAO	2012-05-15 06:01:55.184084	2012-05-15 06:01:55.184084
36	Ivory Coast	CFA Franc BCEAO	2012-05-15 06:01:55.192348	2012-05-15 06:01:55.192348
37	Togo	CFA Franc BCEAO	2012-05-15 06:01:55.200571	2012-05-15 06:01:55.200571
38	Niger	CFA Franc BCEAO	2012-05-15 06:01:55.208955	2012-05-15 06:01:55.208955
39	Chad	CFA Franc BCEAO	2012-05-15 06:01:55.217254	2012-05-15 06:01:55.217254
40	Equatorial Guinea	CFA Franc BCEAO	2012-05-15 06:01:55.225699	2012-05-15 06:01:55.225699
41	Congo	CFA Franc BCEAO	2012-05-15 06:01:55.234056	2012-05-15 06:01:55.234056
42	Gabon	CFA Franc BCEAO	2012-05-15 06:01:55.242357	2012-05-15 06:01:55.242357
43	Cameroon	CFA Franc BCEAO	2012-05-15 06:01:55.250692	2012-05-15 06:01:55.250692
44	Central African Republic	CFA Franc BCEAO	2012-05-15 06:01:55.259007	2012-05-15 06:01:55.259007
45	Wallis and Futuna Islands	CFP Franc	2012-05-15 06:01:55.267516	2012-05-15 06:01:55.267516
46	Polynesia (French)	CFP Franc	2012-05-15 06:01:55.275744	2012-05-15 06:01:55.275744
47	New Caledonia (French)	CFP Franc	2012-05-15 06:01:55.284177	2012-05-15 06:01:55.284177
48	Canada	Canadian Dollar	2012-05-15 06:01:55.292454	2012-05-15 06:01:55.292454
49	Cape Verde	Cape Verde Escudo	2012-05-15 06:01:55.300672	2012-05-15 06:01:55.300672
50	Cayman Islands	Cayman Islands Dollar	2012-05-15 06:01:55.309043	2012-05-15 06:01:55.309043
51	Chile	Chilean Peso	2012-05-15 06:01:55.317363	2012-05-15 06:01:55.317363
52	Colombia	Colombian Peso	2012-05-15 06:01:55.32583	2012-05-15 06:01:55.32583
53	Comoros	Comoros Franc	2012-05-15 06:01:55.334107	2012-05-15 06:01:55.334107
54	Costa Rica	Costa Rican Colon	2012-05-15 06:01:55.342487	2012-05-15 06:01:55.342487
55	Croatia	Croatian Kuna	2012-05-15 06:01:55.350731	2012-05-15 06:01:55.350731
56	Cuba	Cuban Peso	2012-05-15 06:01:55.359023	2012-05-15 06:01:55.359023
57	Cyprus	Cyprus Pound	2012-05-15 06:01:55.36752	2012-05-15 06:01:55.36752
58	Czech Rep.	Czech Koruna	2012-05-15 06:01:55.375743	2012-05-15 06:01:55.375743
59	Denmark	Danish Krone	2012-05-15 06:01:55.384234	2012-05-15 06:01:55.384234
60	Faroe Islands	Danish Krone	2012-05-15 06:01:55.392477	2012-05-15 06:01:55.392477
61	Greenland	Danish Krone	2012-05-15 06:01:55.400666	2012-05-15 06:01:55.400666
62	Macedonia	Denar	2012-05-15 06:01:55.40909	2012-05-15 06:01:55.40909
63	Serbia	Dinar	2012-05-15 06:01:55.417373	2012-05-15 06:01:55.417373
64	Djibouti	Djibouti Franc	2012-05-15 06:01:55.425686	2012-05-15 06:01:55.425686
65	Sao Tome and Principe	Dobra	2012-05-15 06:01:55.43405	2012-05-15 06:01:55.43405
66	Dominican Republic	Dominican Peso	2012-05-15 06:01:55.442338	2012-05-15 06:01:55.442338
67	Dominica	East Caribbean Dollar	2012-05-15 06:01:55.450646	2012-05-15 06:01:55.450646
68	Saint Vincent & Grenadines	East Caribbean Dollar	2012-05-15 06:01:55.459012	2012-05-15 06:01:55.459012
69	Antigua and Barbuda	East Caribbean Dollar	2012-05-15 06:01:55.467588	2012-05-15 06:01:55.467588
70	Saint Lucia	East Caribbean Dollar	2012-05-15 06:01:55.475813	2012-05-15 06:01:55.475813
71	Anguilla	East Caribbean Dollar	2012-05-15 06:01:55.484184	2012-05-15 06:01:55.484184
72	Montserrat	East Caribbean Dollar	2012-05-15 06:01:55.492567	2012-05-15 06:01:55.492567
73	Saint Kitts & Nevis Anguilla	East Caribbean Dollar	2012-05-15 06:01:55.500688	2012-05-15 06:01:55.500688
74	Antarctica	East Caribbean Dollar	2012-05-15 06:01:55.50904	2012-05-15 06:01:55.50904
75	Grenada	East Caribbean Dollar	2012-05-15 06:01:55.517452	2012-05-15 06:01:55.517452
76	Ecuador	Ecuador Sucre	2012-05-15 06:01:55.525763	2012-05-15 06:01:55.525763
77	Egypt	Egyptian Pound	2012-05-15 06:01:55.534127	2012-05-15 06:01:55.534127
78	El Salvador	El Salvador Colon	2012-05-15 06:01:55.542428	2012-05-15 06:01:55.542428
79	Eritrea	Eritrean Nakfa	2012-05-15 06:01:55.550735	2012-05-15 06:01:55.550735
80	Estonia	Estonian Kroon	2012-05-15 06:01:55.559107	2012-05-15 06:01:55.559107
81	Ethiopia	Ethiopian Birr	2012-05-15 06:01:55.567614	2012-05-15 06:01:55.567614
82	Greece	Euro	2012-05-15 06:01:55.575812	2012-05-15 06:01:55.575812
83	Spain	Euro	2012-05-15 06:01:55.584288	2012-05-15 06:01:55.584288
84	European Union	Euro	2012-05-15 06:01:55.592604	2012-05-15 06:01:55.592604
85	Guadeloupe (French)	Euro	2012-05-15 06:01:55.600754	2012-05-15 06:01:55.600754
86	Martinique (French)	Euro	2012-05-15 06:01:55.609126	2012-05-15 06:01:55.609126
87	Vatican	Euro	2012-05-15 06:01:55.617456	2012-05-15 06:01:55.617456
88	Andorra	Euro	2012-05-15 06:01:55.625847	2012-05-15 06:01:55.625847
89	Finland	Euro	2012-05-15 06:01:55.634102	2012-05-15 06:01:55.634102
90	France	Euro	2012-05-15 06:01:55.642437	2012-05-15 06:01:55.642437
91	French Guiana	Euro	2012-05-15 06:01:55.65074	2012-05-15 06:01:55.65074
92	French Southern Territories	Euro	2012-05-15 06:01:55.659103	2012-05-15 06:01:55.659103
93	Austria	Euro	2012-05-15 06:01:55.667556	2012-05-15 06:01:55.667556
94	Luxembourg	Euro	2012-05-15 06:01:55.675804	2012-05-15 06:01:55.675804
95	Portugal	Euro	2012-05-15 06:01:55.684262	2012-05-15 06:01:55.684262
96	Reunion (French)	Euro	2012-05-15 06:01:55.69253	2012-05-15 06:01:55.69253
97	Belgium	Euro	2012-05-15 06:01:55.700752	2012-05-15 06:01:55.700752
98	Monaco	Euro	2012-05-15 06:01:55.709089	2012-05-15 06:01:55.709089
99	Germany	Euro	2012-05-15 06:01:55.717453	2012-05-15 06:01:55.717453
100	Saint Pierre and Miquelon	Euro	2012-05-15 06:01:55.725787	2012-05-15 06:01:55.725787
101	Mayotte	Euro	2012-05-15 06:01:55.734107	2012-05-15 06:01:55.734107
102	Ireland	Euro	2012-05-15 06:01:55.742413	2012-05-15 06:01:55.742413
103	Netherlands	Euro	2012-05-15 06:01:55.750727	2012-05-15 06:01:55.750727
104	Montenegro	Euro	2012-05-15 06:01:55.759092	2012-05-15 06:01:55.759092
105	Italy	Euro	2012-05-15 06:01:55.767499	2012-05-15 06:01:55.767499
106	Falkland Islands	Falkland Islands Pound	2012-05-15 06:01:55.775827	2012-05-15 06:01:55.775827
107	Fiji	Fiji Dollar	2012-05-15 06:01:55.784248	2012-05-15 06:01:55.784248
108	Congo, Dem. Republic	Francs	2012-05-15 06:01:55.792485	2012-05-15 06:01:55.792485
109	Gambia	Gambian Dalasi	2012-05-15 06:01:55.800764	2012-05-15 06:01:55.800764
110	Georgia	Georgian Lari	2012-05-15 06:01:55.809078	2012-05-15 06:01:55.809078
111	Ghana	Ghanaian Cedi	2012-05-15 06:01:55.81749	2012-05-15 06:01:55.81749
112	Gibraltar	Gibraltar Pound	2012-05-15 06:01:55.825858	2012-05-15 06:01:55.825858
113	Guinea	Guinea Franc	2012-05-15 06:01:55.834165	2012-05-15 06:01:55.834165
114	Guinea Bissau	Guinea-Bissau Peso	2012-05-15 06:01:55.842515	2012-05-15 06:01:55.842515
115	Haiti	Haitian Gourde	2012-05-15 06:01:55.850824	2012-05-15 06:01:55.850824
116	Honduras	Honduran Lempira	2012-05-15 06:01:55.859194	2012-05-15 06:01:55.859194
117	Hong Kong	Hong Kong Dollar	2012-05-15 06:01:55.867582	2012-05-15 06:01:55.867582
118	Hungary	Hungarian Forint	2012-05-15 06:01:55.875954	2012-05-15 06:01:55.875954
119	Iceland	Iceland Krona	2012-05-15 06:01:55.884386	2012-05-15 06:01:55.884386
120	India	Indian Rupee	2012-05-15 06:01:55.892585	2012-05-15 06:01:55.892585
121	Indonesia	Indonesian Rupiah	2012-05-15 06:01:55.900873	2012-05-15 06:01:55.900873
122	Iran	Iranian Rial	2012-05-15 06:01:55.909194	2012-05-15 06:01:55.909194
123	Iraq	Iraqi Dinar	2012-05-15 06:01:55.917561	2012-05-15 06:01:55.917561
124	Israel	Israeli New Shekel	2012-05-15 06:01:55.925973	2012-05-15 06:01:55.925973
125	San Marino	Italian Lira	2012-05-15 06:01:55.934189	2012-05-15 06:01:55.934189
126	Jamaica	Jamaica Dollar	2012-05-15 06:01:55.942657	2012-05-15 06:01:55.942657
127	Japan	Japanese Yen	2012-05-15 06:01:55.950844	2012-05-15 06:01:55.950844
128	Jordan	Jordanian Dinar	2012-05-15 06:01:55.959194	2012-05-15 06:01:55.959194
129	Cambodia	Kampuchean Riel	2012-05-15 06:01:55.96751	2012-05-15 06:01:55.96751
130	Kazakhstan	Kazakhstan Tenge	2012-05-15 06:01:55.975912	2012-05-15 06:01:55.975912
131	Kenya	Kenyan Shilling	2012-05-15 06:01:55.984387	2012-05-15 06:01:55.984387
132	Korea-South	Korean Won	2012-05-15 06:01:55.992711	2012-05-15 06:01:55.992711
133	Kuwait	Kuwaiti Dinar	2012-05-15 06:01:56.00093	2012-05-15 06:01:56.00093
134	Laos	Lao Kip	2012-05-15 06:01:56.009189	2012-05-15 06:01:56.009189
135	Latvia	Latvian Lats	2012-05-15 06:01:56.017579	2012-05-15 06:01:56.017579
136	Lebanon	Lebanese Pound	2012-05-15 06:01:56.025854	2012-05-15 06:01:56.025854
137	Lesotho	Lesotho Loti	2012-05-15 06:01:56.03415	2012-05-15 06:01:56.03415
138	Liberia	Liberian Dollar	2012-05-15 06:01:56.042522	2012-05-15 06:01:56.042522
139	Libya	Libyan Dinar	2012-05-15 06:01:56.050819	2012-05-15 06:01:56.050819
140	Lithuania	Lithuanian Litas	2012-05-15 06:01:56.059189	2012-05-15 06:01:56.059189
141	Macau	Macau Pataca	2012-05-15 06:01:56.067485	2012-05-15 06:01:56.067485
142	Madagascar	Malagasy Franc	2012-05-15 06:01:56.075942	2012-05-15 06:01:56.075942
143	Malawi	Malawi Kwacha	2012-05-15 06:01:56.084355	2012-05-15 06:01:56.084355
144	Malaysia	Malaysian Ringgit	2012-05-15 06:01:56.092571	2012-05-15 06:01:56.092571
145	Maldives	Maldive Rufiyaa	2012-05-15 06:01:56.100864	2012-05-15 06:01:56.100864
146	Malta	Maltese Lira	2012-05-15 06:01:56.109198	2012-05-15 06:01:56.109198
147	Turkmenistan	Manat	2012-05-15 06:01:56.117578	2012-05-15 06:01:56.117578
148	Bosnia-Herzegovina	Marka	2012-05-15 06:01:56.125918	2012-05-15 06:01:56.125918
149	Mauritania	Mauritanian Ouguiya	2012-05-15 06:01:56.134236	2012-05-15 06:01:56.134236
150	Mauritius	Mauritius Rupee	2012-05-15 06:01:56.14267	2012-05-15 06:01:56.14267
151	Mexico	Mexican Nuevo Peso	2012-05-15 06:01:56.150904	2012-05-15 06:01:56.150904
152	Moldova	Moldovan Leu	2012-05-15 06:01:56.159252	2012-05-15 06:01:56.159252
153	Mongolia	Mongolian Tugrik	2012-05-15 06:01:56.167559	2012-05-15 06:01:56.167559
154	Morocco	Moroccan Dirham	2012-05-15 06:01:56.17605	2012-05-15 06:01:56.17605
155	Western Sahara	Moroccan Dirham	2012-05-15 06:01:56.184438	2012-05-15 06:01:56.184438
156	Mozambique	Mozambique Metical	2012-05-15 06:01:56.192647	2012-05-15 06:01:56.192647
157	Myanmar	Myanmar Kyat	2012-05-15 06:01:56.200954	2012-05-15 06:01:56.200954
158	Namibia	Namibia Dollar	2012-05-15 06:01:56.209261	2012-05-15 06:01:56.209261
159	Nepal	Nepalese Rupee	2012-05-15 06:01:56.217597	2012-05-15 06:01:56.217597
160	Netherlands Antilles	Netherlands Antillean Guilder	2012-05-15 06:01:56.225945	2012-05-15 06:01:56.225945
161	Cook Islands	New Zealand Dollar	2012-05-15 06:01:56.23423	2012-05-15 06:01:56.23423
162	Tokelau	New Zealand Dollar	2012-05-15 06:01:56.24261	2012-05-15 06:01:56.24261
163	New Zealand	New Zealand Dollar	2012-05-15 06:01:56.250884	2012-05-15 06:01:56.250884
164	Niue	New Zealand Dollar	2012-05-15 06:01:56.259258	2012-05-15 06:01:56.259258
165	Pitcairn Island	New Zealand Dollar	2012-05-15 06:01:56.267576	2012-05-15 06:01:56.267576
166	Nicaragua	Nicaraguan Cordoba Oro	2012-05-15 06:01:56.275965	2012-05-15 06:01:56.275965
167	Nigeria	Nigerian Naira	2012-05-15 06:01:56.28444	2012-05-15 06:01:56.28444
168	Korea-North	North Korean Won	2012-05-15 06:01:56.292655	2012-05-15 06:01:56.292655
169	Bouvet Island	Norwegian Krone	2012-05-15 06:01:56.300931	2012-05-15 06:01:56.300931
170	Norway	Norwegian Krone	2012-05-15 06:01:56.309246	2012-05-15 06:01:56.309246
171	Svalbard and Jan Mayen Islands	Norwegian Krone	2012-05-15 06:01:56.317586	2012-05-15 06:01:56.317586
172	Oman	Omani Rial	2012-05-15 06:01:56.325935	2012-05-15 06:01:56.325935
173	Pakistan	Pakistan Rupee	2012-05-15 06:01:56.334218	2012-05-15 06:01:56.334218
174	Panama	Panamanian Balboa	2012-05-15 06:01:56.342582	2012-05-15 06:01:56.342582
175	Papua New Guinea	Papua New Guinea Kina	2012-05-15 06:01:56.350899	2012-05-15 06:01:56.350899
176	Paraguay	Paraguay Guarani	2012-05-15 06:01:56.35923	2012-05-15 06:01:56.35923
177	Peru	Peruvian Nuevo Sol	2012-05-15 06:01:56.367556	2012-05-15 06:01:56.367556
178	Philippines	Philippine Peso	2012-05-15 06:01:56.376091	2012-05-15 06:01:56.376091
179	Poland	Polish Zloty	2012-05-15 06:01:56.384447	2012-05-15 06:01:56.384447
180	South Georgia & South Sandwich Islands	Pound Sterling	2012-05-15 06:01:56.392634	2012-05-15 06:01:56.392634
181	Guernsey	Pound Sterling	2012-05-15 06:01:56.400954	2012-05-15 06:01:56.400954
182	Great Britain	Pound Sterling	2012-05-15 06:01:56.409252	2012-05-15 06:01:56.409252
183	Isle of Man	Pound Sterling	2012-05-15 06:01:56.417582	2012-05-15 06:01:56.417582
184	U.K.	Pound Sterling	2012-05-15 06:01:56.426049	2012-05-15 06:01:56.426049
185	Jersey	Pound Sterling	2012-05-15 06:01:56.434361	2012-05-15 06:01:56.434361
186	Qatar	Qatari Rial	2012-05-15 06:01:56.518058	2012-05-15 06:01:56.518058
187	Romania	Romanian Leu	2012-05-15 06:01:56.60971	2012-05-15 06:01:56.60971
188	Russia	Russian Ruble	2012-05-15 06:01:56.701333	2012-05-15 06:01:56.701333
189	Rwanda	Rwanda Franc	2012-05-15 06:01:56.792998	2012-05-15 06:01:56.792998
190	Samoa	Samoan Tala	2012-05-15 06:01:56.86778	2012-05-15 06:01:56.86778
191	Saudi Arabia	Saudi Riyal	2012-05-15 06:01:56.876176	2012-05-15 06:01:56.876176
192	Seychelles	Seychelles Rupee	2012-05-15 06:01:56.88461	2012-05-15 06:01:56.88461
193	Sierra Leone	Sierra Leone Leone	2012-05-15 06:01:56.892672	2012-05-15 06:01:56.892672
194	Singapore	Singapore Dollar	2012-05-15 06:01:56.901066	2012-05-15 06:01:56.901066
195	Slovakia	Slovak Koruna	2012-05-15 06:01:56.909344	2012-05-15 06:01:56.909344
196	Slovenia	Slovenian Tolar	2012-05-15 06:01:56.917681	2012-05-15 06:01:56.917681
197	Solomon Islands	Solomon Islands Dollar	2012-05-15 06:01:56.926018	2012-05-15 06:01:56.926018
198	Kyrgyzstan	Som	2012-05-15 06:01:56.934321	2012-05-15 06:01:56.934321
199	Somalia	Somali Shilling	2012-05-15 06:01:56.942683	2012-05-15 06:01:56.942683
200	South Africa	South African Rand	2012-05-15 06:01:56.950998	2012-05-15 06:01:56.950998
201	South Sudan	South Sudan Pound	2012-05-15 06:01:56.959299	2012-05-15 06:01:56.959299
202	Sri Lanka	Sri Lanka Rupee	2012-05-15 06:01:56.96767	2012-05-15 06:01:56.96767
203	Saint Helena	St. Helena Pound	2012-05-15 06:01:56.976258	2012-05-15 06:01:56.976258
204	Sudan	Sudanese Dinar	2012-05-15 06:01:56.984573	2012-05-15 06:01:56.984573
205	Suriname	Surinam Guilder	2012-05-15 06:01:56.992814	2012-05-15 06:01:56.992814
206	Swaziland	Swaziland Lilangeni	2012-05-15 06:01:57.001079	2012-05-15 06:01:57.001079
207	Sweden	Swedish Krona	2012-05-15 06:01:57.009357	2012-05-15 06:01:57.009357
208	Liechtenstein	Swiss Franc	2012-05-15 06:01:57.017662	2012-05-15 06:01:57.017662
209	Switzerland	Swiss Franc	2012-05-15 06:01:57.025989	2012-05-15 06:01:57.025989
210	Syria	Syrian Pound	2012-05-15 06:01:57.03436	2012-05-15 06:01:57.03436
211	Taiwan	Taiwan Dollar	2012-05-15 06:01:57.042647	2012-05-15 06:01:57.042647
212	Tajikistan	Tajik Ruble	2012-05-15 06:01:57.050975	2012-05-15 06:01:57.050975
213	Tanzania	Tanzanian Shilling	2012-05-15 06:01:57.059307	2012-05-15 06:01:57.059307
214	Thailand	Thai Baht	2012-05-15 06:01:57.067703	2012-05-15 06:01:57.067703
215	Tonga	Tongan Pa'anga	2012-05-15 06:01:57.07617	2012-05-15 06:01:57.07617
216	Trinidad and Tobago	Trinidad and Tobago Dollar	2012-05-15 06:01:57.084715	2012-05-15 06:01:57.084715
217	Tunisia	Tunisian Dollar	2012-05-15 06:01:57.0927	2012-05-15 06:01:57.0927
218	Turkey	Turkish Lira	2012-05-15 06:01:57.101053	2012-05-15 06:01:57.101053
219	USA	US Dollar	2012-05-15 06:01:57.109467	2012-05-15 06:01:57.109467
220	Turks and Caicos Islands	US Dollar	2012-05-15 06:01:57.117755	2012-05-15 06:01:57.117755
221	British Indian Ocean Territory	US Dollar	2012-05-15 06:01:57.218113	2012-05-15 06:01:57.218113
222	Puerto Rico	US Dollar	2012-05-15 06:01:57.318066	2012-05-15 06:01:57.318066
223	Virgin Islands (USA)	US Dollar	2012-05-15 06:01:57.449711	2012-05-15 06:01:57.449711
224	Virgin Islands (British)	US Dollar	2012-05-15 06:01:57.56814	2012-05-15 06:01:57.56814
225	Palau	US Dollar	2012-05-15 06:01:57.634707	2012-05-15 06:01:57.634707
226	Guam (USA)	US Dollar	2012-05-15 06:01:57.642721	2012-05-15 06:01:57.642721
227	Micronesia	US Dollar	2012-05-15 06:01:57.651082	2012-05-15 06:01:57.651082
228	USA Minor Outlying Islands	US Dollar	2012-05-15 06:01:57.659383	2012-05-15 06:01:57.659383
229	Marshall Islands	US Dollar	2012-05-15 06:01:57.667708	2012-05-15 06:01:57.667708
230	American Samoa	US Dollar	2012-05-15 06:01:57.676226	2012-05-15 06:01:57.676226
231	Northern Mariana Islands	US Dollar	2012-05-15 06:01:57.684413	2012-05-15 06:01:57.684413
232	Uganda	Uganda Shilling	2012-05-15 06:01:57.692802	2012-05-15 06:01:57.692802
233	Ukraine	Ukraine Hryvnia	2012-05-15 06:01:57.701119	2012-05-15 06:01:57.701119
234	Uruguay	Uruguayan Peso	2012-05-15 06:01:57.709423	2012-05-15 06:01:57.709423
235	Uzbekistan	Uzbekistan Sum	2012-05-15 06:01:57.717743	2012-05-15 06:01:57.717743
236	Vanuatu	Vanuatu Vatu	2012-05-15 06:01:57.726119	2012-05-15 06:01:57.726119
237	Venezuela	Venezuelan Bolivar	2012-05-15 06:01:57.734423	2012-05-15 06:01:57.734423
238	Vietnam	Vietnamese Dong	2012-05-15 06:01:57.74292	2012-05-15 06:01:57.74292
239	Yemen	Yemeni Rial	2012-05-15 06:01:57.75117	2012-05-15 06:01:57.75117
240	China	Yuan Renminbi	2012-05-15 06:01:57.759368	2012-05-15 06:01:57.759368
241	Zambia	Zambian Kwacha	2012-05-15 06:01:57.767715	2012-05-15 06:01:57.767715
242	Zimbabwe	Zimbabwe Dollar	2012-05-15 06:01:57.776264	2012-05-15 06:01:57.776264
\.


--
-- Data for Name: country_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY country_settings (id, country, time_zone, currency, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: employee_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee_details (id, employee_id, effective_date, salary_group_id, allotted_gross, created_at, updated_at, classification, branch_id, financial_institution_id, attendance_configuration_id, bank_account_number, effective_to, pan, pan_effective_date, international_worker) FROM stdin;
2	42	2012-04-01	1	\N	2012-04-17 06:42:27.751933	2012-04-17 06:43:50.525123	"SSE"=>""	1	1	\N		2012-04-30	\N	\N	\N
4	42	2012-06-01	3	\N	2012-04-17 06:47:08.297828	2012-04-17 06:47:08.297828	"SSE"=>"Developer"	1	1	2		\N	\N	\N	\N
3	42	2012-05-01	2	\N	2012-04-17 06:43:50.338126	2012-04-17 06:47:08.391669	"SSE"=>"Developer"	1	1	2		2012-05-31	\N	\N	\N
\.


--
-- Data for Name: employee_statutories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee_statutories (id, employee_id, pan, pan_effective_date, pf_number, pf_effective_date, esi_number, esi_effective_date, created_at, updated_at, zero_pt, zero_pension, vol_pf, vol_pf_percentage, vol_pf_amount) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees (id, empname, date_of_joining, date_of_leaving, created_at, updated_at, date_of_birth, marital_status, father_name, spouse_name, gender, present_res_no, present_res_name, present_street, present_locality, present_city, present_state_id, perm_res_no, perm_res_name, perm_street, perm_locality, perm_city, perm_state_id, perm_sameas_present, email, mobile, refno, restrct_pf, probation_period, probation_complete_date, confirmation_date, salary_start_date, retirement_date, handicapped, emergency_contact_number, official_mail_id, leaving_reason) FROM stdin;
42	D.S. Srinivas	2003-05-23	\N	2012-04-14 05:29:15.476524	2012-04-14 05:30:28.151974	1980-04-01	Married	\N	\N	Female	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	rajannav@v2soft.com		V2030501	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	D.S. Srinivas 1	2003-05-23	\N	2012-04-14 05:29:15.513875	2012-04-14 05:30:28.189754	1980-04-01	Married	\N	\N	Male	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	rajannav1@v2soft.com		V2030503	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: esi_calculated_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY esi_calculated_values (id, esi_gross, esi_amount, esi_employer_amount, employee_id, effective_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: esi_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY esi_details (id, branch_id, esi_group_id, esi_effective_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: esi_group_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY esi_group_rates (id, esi_group_id, employee_rate, employer_rate, cut_off, minimum_limit_dailywage, round_off, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: esi_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY esi_groups (id, esi_group_name, address, esi_no, esi_local_office, created_at, updated_at, user_id, password) FROM stdin;
1	Karnataka	Bangalore	123654789	Raja Ji Nagar	2012-04-18 11:52:27.761459	2012-04-18 11:52:27.761459	\N	\N
2	Karnataka1	Bangalore	123654789	Raja Ji Nagar	2012-04-18 11:52:37.647382	2012-04-18 11:52:37.647382	\N	\N
\.


--
-- Data for Name: financial_institutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY financial_institutions (id, name, address_line1, address_line2, address_line3, address_line4, pincode, branch_code, email, created_at, updated_at) FROM stdin;
1	CASH	address	address	address	address	560076	branch_code	email	2012-04-05 09:30:31.631641	2012-04-05 09:30:31.631641
\.


--
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY holidays (id, attendance_configuration_id, holiday_date, description, national_holiday, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hr_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_categories (id, category_name, created_at, updated_at) FROM stdin;
24	Personal	2012-05-08 09:37:11.119384	2012-05-08 09:37:11.119384
25	Passport	2012-05-08 09:37:11.438992	2012-05-08 09:37:11.438992
26	Family	2012-05-08 09:37:11.514617	2012-05-08 09:37:11.514617
27	Education	2012-05-08 09:37:11.631536	2012-05-08 09:37:11.631536
28	Training	2012-05-08 09:37:11.731629	2012-05-08 09:37:11.731629
29	Accident	2012-05-08 09:37:11.848655	2012-05-08 09:37:11.848655
30	Disciplinary Actions	2012-05-08 09:37:11.962902	2012-05-08 09:37:11.962902
31	Extracurricular Event	2012-05-08 09:37:12.073705	2012-05-08 09:37:12.073705
32	Extracurricular Award	2012-05-08 09:37:12.173616	2012-05-08 09:37:12.173616
33	General	2012-05-08 09:37:12.257163	2012-05-08 09:37:12.257163
\.


--
-- Data for Name: hr_category_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_category_details (id, hr_category_id, name, data_type, required, created_at, updated_at) FROM stdin;
116	24	Blood Group	String	f	2012-05-08 09:37:11.331261	2012-05-08 09:37:11.331261
117	24	Cast Category	String	f	2012-05-08 09:37:11.396885	2012-05-08 09:37:11.396885
118	24	Qualification	String	f	2012-05-08 09:37:11.404747	2012-05-08 09:37:11.404747
119	24	Nationality	String	f	2012-05-08 09:37:11.412952	2012-05-08 09:37:11.412952
120	24	Driving Lic No	String	f	2012-05-08 09:37:11.421351	2012-05-08 09:37:11.421351
121	24	Language Known	String	f	2012-05-08 09:37:11.429633	2012-05-08 09:37:11.429633
122	25	Number	Integer	f	2012-05-08 09:37:11.455044	2012-05-08 09:37:11.455044
123	25	Issued At	String	f	2012-05-08 09:37:11.471639	2012-05-08 09:37:11.471639
124	25	Issued date	Date	f	2012-05-08 09:37:11.488147	2012-05-08 09:37:11.488147
125	25	Expiry Date	String	f	2012-05-08 09:37:11.504896	2012-05-08 09:37:11.504896
126	26	Name Of Relative	String	t	2012-05-08 09:37:11.530056	2012-05-08 09:37:11.530056
127	26	Relation	String	f	2012-05-08 09:37:11.546617	2012-05-08 09:37:11.546617
128	26	Remarks	String	f	2012-05-08 09:37:11.563412	2012-05-08 09:37:11.563412
129	26	Date of Birth	Date	f	2012-05-08 09:37:11.579932	2012-05-08 09:37:11.579932
130	26	Dependent	String	f	2012-05-08 09:37:11.588425	2012-05-08 09:37:11.588425
131	26	Nominee	String	f	2012-05-08 09:37:11.604886	2012-05-08 09:37:11.604886
132	27	Qualification	String	t	2012-05-08 09:37:11.647255	2012-05-08 09:37:11.647255
133	27	University	String	t	2012-05-08 09:37:11.663703	2012-05-08 09:37:11.663703
134	27	Remarks	String	f	2012-05-08 09:37:11.680309	2012-05-08 09:37:11.680309
135	27	Percentage	Decimal	f	2012-05-08 09:37:11.697047	2012-05-08 09:37:11.697047
136	27	Year Passed	Integer	f	2012-05-08 09:37:11.713572	2012-05-08 09:37:11.713572
137	28	Training Name	String	t	2012-05-08 09:37:11.747078	2012-05-08 09:37:11.747078
138	28	Location	String	t	2012-05-08 09:37:11.763796	2012-05-08 09:37:11.763796
139	28	Comments	String	f	2012-05-08 09:37:11.780476	2012-05-08 09:37:11.780476
140	28	Remarks	String	f	2012-05-08 09:37:11.796917	2012-05-08 09:37:11.796917
141	28	From Date	Date	f	2012-05-08 09:37:11.813595	2012-05-08 09:37:11.813595
142	28	To Date	Date	f	2012-05-08 09:37:11.830228	2012-05-08 09:37:11.830228
143	29	Accident	String	t	2012-05-08 09:37:11.863912	2012-05-08 09:37:11.863912
144	29	Location	String	f	2012-05-08 09:37:11.880375	2012-05-08 09:37:11.880375
145	29	Compensation	Integer	f	2012-05-08 09:37:11.897	2012-05-08 09:37:11.897
146	29	Remarks	String	f	2012-05-08 09:37:11.913634	2012-05-08 09:37:11.913634
147	29	Date	Date	f	2012-05-08 09:37:11.930327	2012-05-08 09:37:11.930327
148	30	Memo	String	t	2012-05-08 09:37:11.988718	2012-05-08 09:37:11.988718
149	30	Issued By	String	f	2012-05-08 09:37:12.005362	2012-05-08 09:37:12.005362
150	30	Comments	String	f	2012-05-08 09:37:12.022301	2012-05-08 09:37:12.022301
151	30	Remarks	String	f	2012-05-08 09:37:12.038753	2012-05-08 09:37:12.038753
152	30	Issued Date	Date	f	2012-05-08 09:37:12.055581	2012-05-08 09:37:12.055581
153	31	Game/Activity	String	t	2012-05-08 09:37:12.088824	2012-05-08 09:37:12.088824
154	31	Event	String	t	2012-05-08 09:37:12.105551	2012-05-08 09:37:12.105551
155	31	Remarks	String	f	2012-05-08 09:37:12.122308	2012-05-08 09:37:12.122308
156	31	From Date	Date	f	2012-05-08 09:37:12.138818	2012-05-08 09:37:12.138818
157	31	To Date	Date	f	2012-05-08 09:37:12.155608	2012-05-08 09:37:12.155608
158	32	Game/Activity	String	t	2012-05-08 09:37:12.188929	2012-05-08 09:37:12.188929
159	32	Award	String	t	2012-05-08 09:37:12.205548	2012-05-08 09:37:12.205548
165	32	Remarks	\N	f	2012-05-23 09:35:07.871873	2012-05-23 09:35:07.871873
166	32	Date	\N	f	2012-05-23 09:35:13.993789	2012-05-23 09:35:13.993789
167	33	Description	\N	f	2012-05-23 09:35:30.447734	2012-05-23 09:35:30.447734
168	33	Details	\N	f	2012-05-23 09:35:38.473138	2012-05-23 09:35:38.473138
169	33	Date	\N	f	2012-05-23 09:35:46.370457	2012-05-23 09:35:46.370457
\.


--
-- Data for Name: hr_masters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_masters (id, hr_category_id, employee_id, created_at, updated_at, category_values) FROM stdin;
\.


--
-- Data for Name: leave_definitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY leave_definitions (id, leave_name, short_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leave_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY leave_details (id, employee_id, leave_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leave_opening_balances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY leave_opening_balances (id, leave_definition_id, employee_id, opening_balance, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: option_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY option_settings (id, country_id, time_zone, currency, recruitment, lv_atdn_mgmt, appraisal, training, help_desk, travel_cummute, pf_applicable, esi_applicable, pt_applicable, multi_state_pt, multi_pt, tds_applicable, multi_branch, multi_hr, allow_brnch_admin, approval_flow, audit_trail, remibursement, bonus_and_exgratia, gratuity, loans_adv, arrears, attdn_intgration, asset_tracker, created_at, updated_at, voluntary_pf, salary_calc) FROM stdin;
1	204	(GMT+05:30) Kolkata	Sudanese Dinar	f	t	t	f	f	f	t	t	f	f	f	f	f	f	f	f	t	f	f	f	f	t	f	f	2012-05-15 11:14:53.419675	2012-05-18 07:01:14.687353	t	Jan/2012
\.


--
-- Data for Name: paymonths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY paymonths (id, month_year, number_of_days, from_date, to_date, month_name, created_at, updated_at) FROM stdin;
2	24144	31	2011-12-01	2011-12-31	Dec/2011	2012-04-14 05:15:43.345643	2012-04-14 05:15:43.345643
3	24145	31	2012-01-01	2012-01-31	Jan/2012	2012-04-14 05:15:51.625318	2012-04-14 05:15:51.625318
\.


--
-- Data for Name: pf_calculated_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pf_calculated_values (id, pf_earning, pf_amount, epf_amount, eps_amount, vol_pf_amount, employee_id, effective_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pf_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pf_details (id, branch_id, pf_group_id, pf_effective_date, created_at, updated_at) FROM stdin;
23	1	1	2012-04-01	2012-04-25 09:57:49.581321	2012-04-25 09:57:49.581321
25	1	2	2012-04-29	2012-04-26 05:07:58.930477	2012-04-26 05:07:58.930477
\.


--
-- Data for Name: pf_group_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pf_group_rates (id, pf_group_id, paymonth_id, account_number_21, created_at, updated_at, pension_fund, epf, account_number_02, account_number_22, round_off, restrict_employer_share, restrict_employee_share_to_employer_share, employer_epf, cutoff, effective_date) FROM stdin;
\.


--
-- Data for Name: pf_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pf_groups (id, pf_group, pf_number, db_file_code, extension, address, created_at, updated_at, user_id, password) FROM stdin;
1	Karnataka	1234560	IFC0212	1	Bangalore	2012-04-05 10:14:04.499766	2012-04-05 10:14:04.499766	\N	\N
2	Tamil Nadu	TN123456	IFC0212	3	Chennai	2012-04-17 05:18:09.737429	2012-04-17 05:18:09.737429	\N	\N
\.


--
-- Data for Name: pt_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pt_details (id, branch_id, pt_group_id, pt_effective_date, created_at, updated_at) FROM stdin;
4	1	1	2012-04-01	2012-04-26 05:08:54.922139	2012-04-26 05:08:54.922139
\.


--
-- Data for Name: pt_group_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pt_group_rates (id, pt_group_id, paymonth_id, created_at, updated_at) FROM stdin;
2	1	3	2012-04-16 06:18:30.788098	2012-04-16 06:18:30.788098
\.


--
-- Data for Name: pt_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pt_groups (id, name, state_id, certificate_no, pto_circle_no, address, return_period, created_at, updated_at) FROM stdin;
1	Karnataka	13	KAR123456	125632	Bangalore	Yearly	2012-04-05 10:14:47.962473	2012-04-05 10:14:47.962473
\.


--
-- Data for Name: pt_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pt_rates (id, pt_group_id, paymonth_id, min_sal_range, max_sal_range, pt, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: salaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salaries (id, effective_date, salary_amount, employee_id, employee_detail_id, salary_head_id, created_at, updated_at, salary_group_detail_id, actual_salary_amount) FROM stdin;
\.


--
-- Data for Name: salary_allotments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salary_allotments (id, employee_id, employee_detail_id, effective_date, salary_head_id, salary_allotment, created_at, updated_at, salary_group_detail_id) FROM stdin;
6	42	2	2012-04-01	8	0.00	2012-04-17 06:42:27.92154	2012-04-17 06:42:27.92154	5
7	42	2	2012-04-01	7	0.00	2012-04-17 06:42:27.959976	2012-04-17 06:42:27.959976	4
8	42	2	2012-04-01	6	0.00	2012-04-17 06:42:27.975683	2012-04-17 06:42:27.975683	3
9	42	2	2012-04-01	5	0.00	2012-04-17 06:42:27.992358	2012-04-17 06:42:27.992358	2
10	42	2	2012-04-01	1	0.00	2012-04-17 06:42:28.00885	2012-04-17 06:42:28.00885	1
11	42	3	2012-05-01	5	0.00	2012-04-17 06:43:50.384103	2012-04-17 06:43:50.384103	8
12	42	3	2012-05-01	6	0.00	2012-04-17 06:43:50.398626	2012-04-17 06:43:50.398626	7
13	42	3	2012-05-01	1	0.00	2012-04-17 06:43:50.415529	2012-04-17 06:43:50.415529	6
14	42	4	2012-06-01	8	0.00	2012-04-17 06:47:08.319396	2012-04-17 06:47:08.319396	12
15	42	4	2012-06-01	6	0.00	2012-04-17 06:47:08.333389	2012-04-17 06:47:08.333389	11
16	42	4	2012-06-01	5	0.00	2012-04-17 06:47:08.350132	2012-04-17 06:47:08.350132	10
17	42	4	2012-06-01	1	0.00	2012-04-17 06:47:08.367377	2012-04-17 06:47:08.367377	9
\.


--
-- Data for Name: salary_group_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salary_group_details (id, calc_type, calculation, based_on, salary_group_id, salary_head_id, created_at, updated_at, pf_applicability, pf_percentage, print_name, print_order, esi_applicability, esi_percentage, pt_applicability, pt_percentage) FROM stdin;
1	Lumpsum		Pay Days	1	1	2012-04-12 05:38:21.523073	2012-04-12 05:38:21.523073	f	\N	BASIC	1	\N	\N	\N	\N
2	Lumpsum		Pay Days	1	5	2012-04-12 05:39:20.647073	2012-04-12 05:39:20.647073	f	\N	DA	2	\N	\N	\N	\N
3	Lumpsum		Present Days	1	6	2012-04-12 05:39:41.717742	2012-04-12 05:39:41.717742	f	\N	HRA	3	\N	\N	\N	\N
4	Lumpsum		Present Days	1	7	2012-04-12 05:39:58.822208	2012-04-12 05:39:58.822208	f	\N	Conveyance	4	\N	\N	\N	\N
5	Lumpsum		Pay Days	1	8	2012-04-12 05:40:25.436483	2012-04-12 05:40:25.436483	f	\N	Spl Allowance	5	\N	\N	\N	\N
6	Lumpsum		Present Days	2	1	2012-04-17 06:43:00.857737	2012-04-17 06:43:00.857737	f	\N	BASIC	1	\N	\N	\N	\N
7	Lumpsum		Pay Days	2	6	2012-04-17 06:43:15.684394	2012-04-17 06:43:15.684394	f	\N	HRA	2	\N	\N	\N	\N
8	Lumpsum		Present Days	2	5	2012-04-17 06:43:30.316095	2012-04-17 06:43:30.316095	f	\N	DA	3	\N	\N	\N	\N
9	Lumpsum		Present Days	3	1	2012-04-17 06:45:57.869991	2012-04-17 06:45:57.869991	f	\N	BASIC	1	\N	\N	\N	\N
10	Lumpsum		Present Days	3	5	2012-04-17 06:46:09.636932	2012-04-17 06:46:09.636932	f	\N	DA	2	\N	\N	\N	\N
11	Every Month		Present Days	3	6	2012-04-17 06:46:28.569576	2012-04-17 06:46:28.569576	f	\N	HRA	3	\N	\N	\N	\N
12	Lumpsum		Independent Days	3	8	2012-04-17 06:46:48.460643	2012-04-17 06:46:48.460643	f	\N	Spl Allowance	4	\N	\N	\N	\N
\.


--
-- Data for Name: salary_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salary_groups (id, salary_group_name, based_on_gross, created_at, updated_at) FROM stdin;
1	Salary Structure	f	2012-04-12 05:38:05.384395	2012-04-12 05:38:05.384395
2	Salary Structure 1	f	2012-04-17 06:42:45.666817	2012-04-17 06:42:45.666817
3	Developer	f	2012-04-17 06:45:44.677963	2012-04-17 06:45:44.677963
\.


--
-- Data for Name: salary_heads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salary_heads (id, head_name, short_name, salary_type, created_at, updated_at) FROM stdin;
1	Basic	BASIC	Earnings	2012-04-05 09:30:30.885468	2012-04-05 09:30:30.885468
2	PF	PF	Deductions	2012-04-05 09:30:30.907399	2012-04-05 09:30:30.907399
3	ESI	ESI	Deductions	2012-04-05 09:30:30.923242	2012-04-05 09:30:30.923242
4	PT	PT	Deductions	2012-04-05 09:30:30.939158	2012-04-05 09:30:30.939158
5	DA	DA	Earnings	2012-04-12 05:36:58.95645	2012-04-12 05:36:58.95645
6	HRA	HRA	Earnings	2012-04-12 05:37:11.951563	2012-04-12 05:37:11.951563
7	CONVEYANCE	Conv	Earnings	2012-04-12 05:37:25.346393	2012-04-12 05:37:25.346393
8	SPCL ALL	Spl All	Earnings	2012-04-12 05:37:39.293388	2012-04-12 05:37:39.293388
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20111207065049
20111207065119
20111207065147
20111207111434
20111208110925
20111208122225
20111208122226
20111208122227
20111208163349
20111209174150
20111214060343
20111214061206
20111220084909
20111223070223
20111231085709
20120104045249
20120109100545
20120110053508
20120123154548
20120201095008
20120201123138
20120201123338
20120202050611
20120203090143
20120203091729
20120203104107
20120206053003
20120206122036
20120206122037
20120206150058
20120207094010
20120208045836
20120208092014
20120209060116
20120209065012
20120215042312
20120224055527
20120224060650
20120224061125
20120224072313
20120225104413
20120228053057
20120228054046
20120314111529
20120316071213
20120316095937
20120321071150
20120321093048
20120326084703
20120405053004
20120405070047
20120405084536
20120412065526
20120416070856
20120418110812
20120418122034
20120420061511
20120420062250
20120420113807
20120424062442
20120418054612
20120425052425
20120509051656
20120509060535
20120509070924
20120509071308
20120509071354
20120510104718
20120511043401
20120508045530
20120510101909
20120511050401
20120515055921
20120515060358
20120515102422
20120515112725
20120516063945
20120511075913
20120511102939
20120512100053
20120515091355
20120517060202
20120517052859
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY states (id, state_name, created_at, updated_at) FROM stdin;
1	Andhra Pradesh	2012-04-05 09:30:30.98452	2012-04-05 09:30:30.98452
2	Arunachal Pradesh	2012-04-05 09:30:31.005862	2012-04-05 09:30:31.005862
3	Assam	2012-04-05 09:30:31.021492	2012-04-05 09:30:31.021492
4	Bihar	2012-04-05 09:30:31.037918	2012-04-05 09:30:31.037918
5	Chhattisgarh	2012-04-05 09:30:31.054752	2012-04-05 09:30:31.054752
6	Delhi	2012-04-05 09:30:31.071344	2012-04-05 09:30:31.071344
7	Goa	2012-04-05 09:30:31.088001	2012-04-05 09:30:31.088001
8	Gujarat	2012-04-05 09:30:31.104857	2012-04-05 09:30:31.104857
9	Haryana	2012-04-05 09:30:31.121822	2012-04-05 09:30:31.121822
10	Himachal Pradesh	2012-04-05 09:30:31.137991	2012-04-05 09:30:31.137991
11	Jammu and Kashmir	2012-04-05 09:30:31.154743	2012-04-05 09:30:31.154743
12	Jharkhand	2012-04-05 09:30:31.171517	2012-04-05 09:30:31.171517
13	Karnataka	2012-04-05 09:30:31.18825	2012-04-05 09:30:31.18825
14	Kerala	2012-04-05 09:30:31.204896	2012-04-05 09:30:31.204896
15	Madhya Pradesh	2012-04-05 09:30:31.221704	2012-04-05 09:30:31.221704
16	Maharastra	2012-04-05 09:30:31.237991	2012-04-05 09:30:31.237991
17	Manipur	2012-04-05 09:30:31.254858	2012-04-05 09:30:31.254858
18	Meghalaya	2012-04-05 09:30:31.271455	2012-04-05 09:30:31.271455
19	Mizoram	2012-04-05 09:30:31.288098	2012-04-05 09:30:31.288098
20	Nagaland	2012-04-05 09:30:31.30488	2012-04-05 09:30:31.30488
21	Orrisa	2012-04-05 09:30:31.321908	2012-04-05 09:30:31.321908
22	Panjab	2012-04-05 09:30:31.338158	2012-04-05 09:30:31.338158
23	Pondicherry	2012-04-05 09:30:31.354943	2012-04-05 09:30:31.354943
24	Rajasthan	2012-04-05 09:30:31.37144	2012-04-05 09:30:31.37144
25	Sikkim	2012-04-05 09:30:31.388093	2012-04-05 09:30:31.388093
26	Tamil Nadu	2012-04-05 09:30:31.404966	2012-04-05 09:30:31.404966
27	Tripura	2012-04-05 09:30:31.421953	2012-04-05 09:30:31.421953
28	Uttaranchal	2012-04-05 09:30:31.438097	2012-04-05 09:30:31.438097
29	Uttar Pradesh	2012-04-05 09:30:31.454943	2012-04-05 09:30:31.454943
\.


--
-- Data for Name: upload_file_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY upload_file_types (id, max_file_size, file_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, username, password, created_at, updated_at) FROM stdin;
1	admin	default	2012-04-05 09:30:30.508775	2012-04-05 09:30:30.508775
\.


--
-- Name: attendance_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attendance_configurations
    ADD CONSTRAINT attendance_configurations_pkey PRIMARY KEY (id);


--
-- Name: audits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: classification_headings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY classification_headings
    ADD CONSTRAINT classification_headings_pkey PRIMARY KEY (id);


--
-- Name: classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY classifications
    ADD CONSTRAINT classifications_pkey PRIMARY KEY (id);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: company_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY company_documents
    ADD CONSTRAINT company_documents_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: country_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY country_settings
    ADD CONSTRAINT country_settings_pkey PRIMARY KEY (id);


--
-- Name: employee_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT employee_details_pkey PRIMARY KEY (id);


--
-- Name: employee_statutories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee_statutories
    ADD CONSTRAINT employee_statutories_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: esi_calculated_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY esi_calculated_values
    ADD CONSTRAINT esi_calculated_values_pkey PRIMARY KEY (id);


--
-- Name: esi_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY esi_details
    ADD CONSTRAINT esi_details_pkey PRIMARY KEY (id);


--
-- Name: esi_group_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY esi_group_rates
    ADD CONSTRAINT esi_group_rates_pkey PRIMARY KEY (id);


--
-- Name: esi_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY esi_groups
    ADD CONSTRAINT esi_groups_pkey PRIMARY KEY (id);


--
-- Name: financial_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY financial_institutions
    ADD CONSTRAINT financial_institutions_pkey PRIMARY KEY (id);


--
-- Name: holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- Name: hr_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_categories
    ADD CONSTRAINT hr_categories_pkey PRIMARY KEY (id);


--
-- Name: hr_category_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_category_details
    ADD CONSTRAINT hr_category_details_pkey PRIMARY KEY (id);


--
-- Name: hr_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_masters
    ADD CONSTRAINT hr_masters_pkey PRIMARY KEY (id);


--
-- Name: leave_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY leave_definitions
    ADD CONSTRAINT leave_definitions_pkey PRIMARY KEY (id);


--
-- Name: leave_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY leave_details
    ADD CONSTRAINT leave_details_pkey PRIMARY KEY (id);


--
-- Name: leave_opening_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY leave_opening_balances
    ADD CONSTRAINT leave_opening_balances_pkey PRIMARY KEY (id);


--
-- Name: option_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY option_settings
    ADD CONSTRAINT option_settings_pkey PRIMARY KEY (id);


--
-- Name: paymonths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY paymonths
    ADD CONSTRAINT paymonths_pkey PRIMARY KEY (id);


--
-- Name: pf_calculated_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pf_calculated_values
    ADD CONSTRAINT pf_calculated_values_pkey PRIMARY KEY (id);


--
-- Name: pf_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pf_details
    ADD CONSTRAINT pf_details_pkey PRIMARY KEY (id);


--
-- Name: pf_group_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pf_group_rates
    ADD CONSTRAINT pf_group_rates_pkey PRIMARY KEY (id);


--
-- Name: pf_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pf_groups
    ADD CONSTRAINT pf_groups_pkey PRIMARY KEY (id);


--
-- Name: pt_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pt_details
    ADD CONSTRAINT pt_details_pkey PRIMARY KEY (id);


--
-- Name: pt_group_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pt_group_rates
    ADD CONSTRAINT pt_group_rates_pkey PRIMARY KEY (id);


--
-- Name: pt_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pt_groups
    ADD CONSTRAINT pt_groups_pkey PRIMARY KEY (id);


--
-- Name: pt_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pt_rates
    ADD CONSTRAINT pt_rates_pkey PRIMARY KEY (id);


--
-- Name: salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (id);


--
-- Name: salary_allotments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salary_allotments
    ADD CONSTRAINT salary_allotments_pkey PRIMARY KEY (id);


--
-- Name: salary_group_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salary_group_details
    ADD CONSTRAINT salary_group_details_pkey PRIMARY KEY (id);


--
-- Name: salary_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salary_groups
    ADD CONSTRAINT salary_groups_pkey PRIMARY KEY (id);


--
-- Name: salary_heads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salary_heads
    ADD CONSTRAINT salary_heads_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: upload_file_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY upload_file_types
    ADD CONSTRAINT upload_file_types_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX associated_index ON audits USING btree (associated_id, associated_type);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auditable_index ON audits USING btree (auditable_id, auditable_type);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_audits_on_created_at ON audits USING btree (created_at);


--
-- Name: index_branches_on_esi_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_branches_on_esi_group_id ON branches USING btree (esi_group_id);


--
-- Name: index_branches_on_pf_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_branches_on_pf_group_id ON branches USING btree (pf_group_id);


--
-- Name: index_branches_on_pt_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_branches_on_pt_group_id ON branches USING btree (pt_group_id);


--
-- Name: index_classifications_on_classification_heading_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_classifications_on_classification_heading_id ON classifications USING btree (classification_heading_id);


--
-- Name: index_employee_details_on_attendance_configuration_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_employee_details_on_attendance_configuration_id ON employee_details USING btree (attendance_configuration_id);


--
-- Name: index_employee_details_on_branch_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_employee_details_on_branch_id ON employee_details USING btree (branch_id);


--
-- Name: index_employee_details_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_employee_details_on_employee_id ON employee_details USING btree (employee_id);


--
-- Name: index_employee_details_on_financial_institution_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_employee_details_on_financial_institution_id ON employee_details USING btree (financial_institution_id);


--
-- Name: index_employee_details_on_salary_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_employee_details_on_salary_group_id ON employee_details USING btree (salary_group_id);


--
-- Name: index_employee_statutories_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_employee_statutories_on_employee_id ON employee_statutories USING btree (employee_id);


--
-- Name: index_employees_on_present_state_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_employees_on_present_state_id ON employees USING btree (present_state_id);


--
-- Name: index_esi_calculated_values_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_esi_calculated_values_on_employee_id ON esi_calculated_values USING btree (employee_id);


--
-- Name: index_esi_details_on_branch_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_esi_details_on_branch_id ON esi_details USING btree (branch_id);


--
-- Name: index_esi_details_on_esi_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_esi_details_on_esi_group_id ON esi_details USING btree (esi_group_id);


--
-- Name: index_esi_group_rates_on_esi_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_esi_group_rates_on_esi_group_id ON esi_group_rates USING btree (esi_group_id);


--
-- Name: index_holidays_on_attendance_configuration_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_holidays_on_attendance_configuration_id ON holidays USING btree (attendance_configuration_id);


--
-- Name: index_hr_category_details_on_hr_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_hr_category_details_on_hr_category_id ON hr_category_details USING btree (hr_category_id);


--
-- Name: index_hr_masters_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_hr_masters_on_employee_id ON hr_masters USING btree (employee_id);


--
-- Name: index_hr_masters_on_hr_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_hr_masters_on_hr_category_id ON hr_masters USING btree (hr_category_id);


--
-- Name: index_leave_details_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_leave_details_on_employee_id ON leave_details USING btree (employee_id);


--
-- Name: index_leave_opening_balances_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_leave_opening_balances_on_employee_id ON leave_opening_balances USING btree (employee_id);


--
-- Name: index_leave_opening_balances_on_leave_definition_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_leave_opening_balances_on_leave_definition_id ON leave_opening_balances USING btree (leave_definition_id);


--
-- Name: index_pf_calculated_values_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pf_calculated_values_on_employee_id ON pf_calculated_values USING btree (employee_id);


--
-- Name: index_pf_details_on_branch_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pf_details_on_branch_id ON pf_details USING btree (branch_id);


--
-- Name: index_pf_details_on_pf_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pf_details_on_pf_group_id ON pf_details USING btree (pf_group_id);


--
-- Name: index_pf_group_rates_on_paymonth_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pf_group_rates_on_paymonth_id ON pf_group_rates USING btree (paymonth_id);


--
-- Name: index_pf_group_rates_on_pf_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pf_group_rates_on_pf_group_id ON pf_group_rates USING btree (pf_group_id);


--
-- Name: index_pt_details_on_branch_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pt_details_on_branch_id ON pt_details USING btree (branch_id);


--
-- Name: index_pt_details_on_pt_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pt_details_on_pt_group_id ON pt_details USING btree (pt_group_id);


--
-- Name: index_pt_group_rates_on_paymonth_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pt_group_rates_on_paymonth_id ON pt_group_rates USING btree (paymonth_id);


--
-- Name: index_pt_group_rates_on_pt_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pt_group_rates_on_pt_group_id ON pt_group_rates USING btree (pt_group_id);


--
-- Name: index_pt_groups_on_state_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pt_groups_on_state_id ON pt_groups USING btree (state_id);


--
-- Name: index_pt_rates_on_paymonth_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pt_rates_on_paymonth_id ON pt_rates USING btree (paymonth_id);


--
-- Name: index_pt_rates_on_pt_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pt_rates_on_pt_group_id ON pt_rates USING btree (pt_group_id);


--
-- Name: index_salaries_on_employee_detail_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salaries_on_employee_detail_id ON salaries USING btree (employee_detail_id);


--
-- Name: index_salaries_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salaries_on_employee_id ON salaries USING btree (employee_id);


--
-- Name: index_salaries_on_salary_group_detail_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salaries_on_salary_group_detail_id ON salaries USING btree (salary_group_detail_id);


--
-- Name: index_salaries_on_salary_head_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salaries_on_salary_head_id ON salaries USING btree (salary_head_id);


--
-- Name: index_salary_allotments_on_employee_detail_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salary_allotments_on_employee_detail_id ON salary_allotments USING btree (employee_detail_id);


--
-- Name: index_salary_allotments_on_employee_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salary_allotments_on_employee_id ON salary_allotments USING btree (employee_id);


--
-- Name: index_salary_allotments_on_salary_group_detail_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salary_allotments_on_salary_group_detail_id ON salary_allotments USING btree (salary_group_detail_id);


--
-- Name: index_salary_allotments_on_salary_head_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salary_allotments_on_salary_head_id ON salary_allotments USING btree (salary_head_id);


--
-- Name: index_salary_group_details_on_salary_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salary_group_details_on_salary_group_id ON salary_group_details USING btree (salary_group_id);


--
-- Name: index_salary_group_details_on_salary_head_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_salary_group_details_on_salary_head_id ON salary_group_details USING btree (salary_head_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX user_index ON audits USING btree (user_id, user_type);


--
-- Name: branches_esi_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_esi_group_id_fk FOREIGN KEY (esi_group_id) REFERENCES esi_groups(id);


--
-- Name: branches_pf_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pf_group_id_fk FOREIGN KEY (pf_group_id) REFERENCES pf_groups(id);


--
-- Name: branches_pt_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pt_group_id_fk FOREIGN KEY (pt_group_id) REFERENCES pt_groups(id);


--
-- Name: employee_details_attendance_configuration_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT employee_details_attendance_configuration_id_fk FOREIGN KEY (attendance_configuration_id) REFERENCES attendance_configurations(id);


--
-- Name: employee_details_branch_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT employee_details_branch_id_fk FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: employee_details_financial_institution_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT employee_details_financial_institution_id_fk FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions(id);


--
-- Name: employee_statutories_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee_statutories
    ADD CONSTRAINT employee_statutories_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: esi_calculated_values_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY esi_calculated_values
    ADD CONSTRAINT esi_calculated_values_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: esi_group_rates_esi_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY esi_group_rates
    ADD CONSTRAINT esi_group_rates_esi_group_id_fk FOREIGN KEY (esi_group_id) REFERENCES esi_groups(id);


--
-- Name: holidays_attendance_configuration_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY holidays
    ADD CONSTRAINT holidays_attendance_configuration_id_fk FOREIGN KEY (attendance_configuration_id) REFERENCES attendance_configurations(id);


--
-- Name: hr_category_details_hr_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hr_category_details
    ADD CONSTRAINT hr_category_details_hr_category_id_fk FOREIGN KEY (hr_category_id) REFERENCES hr_categories(id);


--
-- Name: hr_masters_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hr_masters
    ADD CONSTRAINT hr_masters_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: hr_masters_hr_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hr_masters
    ADD CONSTRAINT hr_masters_hr_category_id_fk FOREIGN KEY (hr_category_id) REFERENCES hr_categories(id);


--
-- Name: leave_opening_balances_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leave_opening_balances
    ADD CONSTRAINT leave_opening_balances_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: leave_opening_balances_leave_definition_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leave_opening_balances
    ADD CONSTRAINT leave_opening_balances_leave_definition_id_fk FOREIGN KEY (leave_definition_id) REFERENCES leave_definitions(id);


--
-- Name: pf_calculated_values_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pf_calculated_values
    ADD CONSTRAINT pf_calculated_values_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: pf_details_branch_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pf_details
    ADD CONSTRAINT pf_details_branch_id_fk FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: pf_details_pf_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pf_details
    ADD CONSTRAINT pf_details_pf_group_id_fk FOREIGN KEY (pf_group_id) REFERENCES pf_groups(id);


--
-- Name: pf_group_rates_paymonth_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pf_group_rates
    ADD CONSTRAINT pf_group_rates_paymonth_id_fk FOREIGN KEY (paymonth_id) REFERENCES paymonths(id);


--
-- Name: pf_group_rates_pf_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pf_group_rates
    ADD CONSTRAINT pf_group_rates_pf_group_id_fk FOREIGN KEY (pf_group_id) REFERENCES pf_groups(id);


--
-- Name: pt_details_branch_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pt_details
    ADD CONSTRAINT pt_details_branch_id_fk FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: pt_details_pt_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pt_details
    ADD CONSTRAINT pt_details_pt_group_id_fk FOREIGN KEY (pt_group_id) REFERENCES pt_groups(id);


--
-- Name: pt_group_rates_paymonth_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pt_group_rates
    ADD CONSTRAINT pt_group_rates_paymonth_id_fk FOREIGN KEY (paymonth_id) REFERENCES paymonths(id);


--
-- Name: pt_group_rates_pt_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pt_group_rates
    ADD CONSTRAINT pt_group_rates_pt_group_id_fk FOREIGN KEY (pt_group_id) REFERENCES pt_groups(id);


--
-- Name: pt_rates_pt_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pt_rates
    ADD CONSTRAINT pt_rates_pt_group_id_fk FOREIGN KEY (pt_group_id) REFERENCES pt_groups(id);


--
-- Name: salaries_salary_group_detail_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salaries
    ADD CONSTRAINT salaries_salary_group_detail_id_fk FOREIGN KEY (salary_group_detail_id) REFERENCES salary_group_details(id);


--
-- Name: salary_allotments_salary_group_detail_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salary_allotments
    ADD CONSTRAINT salary_allotments_salary_group_detail_id_fk FOREIGN KEY (salary_group_detail_id) REFERENCES salary_group_details(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

