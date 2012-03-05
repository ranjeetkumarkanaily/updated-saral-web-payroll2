--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attendance_configurations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attendance_configurations (
    id integer NOT NULL,
    attendance character varying(255),
    short_name character varying(255),
    salary_calendar_days character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: attendance_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE attendance_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attendance_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE attendance_configurations_id_seq OWNED BY attendance_configurations.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE branches (
    id integer NOT NULL,
    branch_name character varying(255),
    responsible_person character varying(255),
    address character varying(255),
    pf_group_id integer,
    esi_group_id integer,
    pt_group_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    esi_applicable boolean
);


--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE branches_id_seq OWNED BY branches.id;


--
-- Name: classification_headings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE classification_headings (
    id integer NOT NULL,
    classification_heading_name character varying(255),
    display_order integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: classification_headings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE classification_headings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classification_headings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE classification_headings_id_seq OWNED BY classification_headings.id;


--
-- Name: classifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE classifications (
    id integer NOT NULL,
    classification_heading_id integer,
    classification_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE classifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE classifications_id_seq OWNED BY classifications.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pt boolean,
    tds boolean,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: default_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE default_values (
    id integer NOT NULL,
    default_type character varying(255),
    value character varying(255),
    value_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: default_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE default_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: default_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE default_values_id_seq OWNED BY default_values.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    department character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE departments_id_seq OWNED BY departments.id;


--
-- Name: designations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE designations (
    id integer NOT NULL,
    designation character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE designations_id_seq OWNED BY designations.id;


--
-- Name: employee_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employee_details (
    id integer NOT NULL,
    employee_id integer,
    effective_date date,
    salary_group_id integer,
    allotted_gross numeric(8,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    classification hstore,
    branch_id integer,
    financial_institution_id integer,
    attendance_configuration_id integer,
    bank_account_number character varying(255),
    effective_to date
);


--
-- Name: employee_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE employee_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE employee_details_id_seq OWNED BY employee_details.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    empname character varying(255),
    date_of_joining date,
    date_of_leaving date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
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
    designation_id integer,
    department_id integer,
    grade_id integer,
    branch_id integer,
    financial_institution_id integer,
    bank_account_number character varying(255)
);


--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: esi_group_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE esi_group_rates (
    id integer NOT NULL,
    esi_group_id integer,
    employee_rate double precision,
    employer_rate double precision,
    cut_off double precision,
    minimum_limit_dailywage double precision,
    round_off character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: esi_group_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE esi_group_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: esi_group_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE esi_group_rates_id_seq OWNED BY esi_group_rates.id;


--
-- Name: esi_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE esi_groups (
    id integer NOT NULL,
    esi_group_name character varying(255),
    address character varying(255),
    esi_no character varying(255),
    esi_local_office character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: esi_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE esi_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: esi_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE esi_groups_id_seq OWNED BY esi_groups.id;


--
-- Name: financial_institutions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: financial_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE financial_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: financial_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE financial_institutions_id_seq OWNED BY financial_institutions.id;


--
-- Name: grades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grades (
    id integer NOT NULL,
    grade character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grades_id_seq OWNED BY grades.id;


--
-- Name: holidays; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE holidays (
    id integer NOT NULL,
    attendance_configuration_id integer,
    holiday_date date,
    description character varying(255),
    national_holiday boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE holidays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE holidays_id_seq OWNED BY holidays.id;


--
-- Name: leave_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE leave_details (
    id integer NOT NULL,
    employee_id integer,
    leave_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: leave_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE leave_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leave_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE leave_details_id_seq OWNED BY leave_details.id;


--
-- Name: lops; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lops (
    id integer NOT NULL,
    employee_id integer,
    month_year character varying(255),
    lop double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: lops_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lops_id_seq OWNED BY lops.id;


--
-- Name: paymonths; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE paymonths (
    id integer NOT NULL,
    month_year integer,
    number_of_days integer,
    from_date date,
    to_date date,
    month_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: paymonths_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE paymonths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: paymonths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE paymonths_id_seq OWNED BY paymonths.id;


--
-- Name: pf_esi_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pf_esi_rates (
    id integer NOT NULL,
    paymonth_id integer,
    pf_rate numeric(8,2),
    pf_cutoff numeric(8,2),
    esi_employee_rate numeric(8,2),
    esi_employer_rate numeric(8,2),
    esi_cutoff numeric(8,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pf_esi_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pf_esi_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pf_esi_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pf_esi_rates_id_seq OWNED BY pf_esi_rates.id;


--
-- Name: pf_group_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pf_group_rates (
    id integer NOT NULL,
    pf_group_id integer,
    paymonth_id integer,
    account_number_21 double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pension_fund double precision,
    epf double precision,
    account_number_02 double precision,
    account_number_22 double precision,
    round_off character varying(255),
    restrict_employer_share boolean,
    restrict_employee_share_to_employer_share boolean,
    employer_epf double precision,
    cutoff double precision
);


--
-- Name: pf_group_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pf_group_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pf_group_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pf_group_rates_id_seq OWNED BY pf_group_rates.id;


--
-- Name: pf_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pf_groups (
    id integer NOT NULL,
    pf_group character varying(255),
    pf_number character varying(255),
    db_file_code character varying(255),
    extension integer,
    address character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pf_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pf_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pf_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pf_groups_id_seq OWNED BY pf_groups.id;


--
-- Name: pt_group_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pt_group_rates (
    id integer NOT NULL,
    pt_group_id integer,
    paymonth_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pt_group_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_group_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_group_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_group_rates_id_seq OWNED BY pt_group_rates.id;


--
-- Name: pt_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pt_groups (
    id integer NOT NULL,
    name character varying(255),
    state_id integer,
    certificate_no character varying(255),
    pto_circle_no character varying(255),
    address character varying(255),
    return_period character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pt_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_groups_id_seq OWNED BY pt_groups.id;


--
-- Name: pt_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pt_rates (
    id integer NOT NULL,
    pt_group_id integer,
    paymonth_id integer,
    min_sal_range numeric,
    max_sal_range numeric,
    pt numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pt_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_rates_id_seq OWNED BY pt_rates.id;


--
-- Name: salaries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE salaries (
    id integer NOT NULL,
    effective_date date,
    salary_amount numeric(8,2),
    employee_id integer,
    employee_detail_id integer,
    salary_head_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: salaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE salaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE salaries_id_seq OWNED BY salaries.id;


--
-- Name: salary_allotments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE salary_allotments (
    id integer NOT NULL,
    employee_id integer,
    employee_detail_id integer,
    effective_date date,
    salary_head_id integer,
    salary_allotment numeric(8,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    salary_group_detail_id integer
);


--
-- Name: salary_allotments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE salary_allotments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salary_allotments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE salary_allotments_id_seq OWNED BY salary_allotments.id;


--
-- Name: salary_group_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE salary_group_details (
    id integer NOT NULL,
    calc_type character varying(255),
    calculation character varying(255),
    based_on character varying(255),
    salary_group_id integer,
    salary_head_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: salary_group_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE salary_group_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salary_group_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE salary_group_details_id_seq OWNED BY salary_group_details.id;


--
-- Name: salary_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE salary_groups (
    id integer NOT NULL,
    salary_group_name character varying(255),
    based_on_gross boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: salary_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE salary_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salary_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE salary_groups_id_seq OWNED BY salary_groups.id;


--
-- Name: salary_heads; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE salary_heads (
    id integer NOT NULL,
    head_name character varying(255),
    short_name character varying(255),
    salary_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: salary_heads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE salary_heads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salary_heads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE salary_heads_id_seq OWNED BY salary_heads.id;


--
-- Name: salary_totals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE salary_totals (
    id integer NOT NULL,
    employee_id integer,
    month_year_id integer,
    alloted_gross numeric(8,2),
    earned numeric(8,2),
    deducted numeric(8,2),
    net_salary numeric(8,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: salary_totals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE salary_totals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salary_totals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE salary_totals_id_seq OWNED BY salary_totals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    state_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE attendance_configurations ALTER COLUMN id SET DEFAULT nextval('attendance_configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE branches ALTER COLUMN id SET DEFAULT nextval('branches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE classification_headings ALTER COLUMN id SET DEFAULT nextval('classification_headings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE classifications ALTER COLUMN id SET DEFAULT nextval('classifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE default_values ALTER COLUMN id SET DEFAULT nextval('default_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE departments ALTER COLUMN id SET DEFAULT nextval('departments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE designations ALTER COLUMN id SET DEFAULT nextval('designations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE employee_details ALTER COLUMN id SET DEFAULT nextval('employee_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE esi_group_rates ALTER COLUMN id SET DEFAULT nextval('esi_group_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE esi_groups ALTER COLUMN id SET DEFAULT nextval('esi_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE financial_institutions ALTER COLUMN id SET DEFAULT nextval('financial_institutions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE grades ALTER COLUMN id SET DEFAULT nextval('grades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE holidays ALTER COLUMN id SET DEFAULT nextval('holidays_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE leave_details ALTER COLUMN id SET DEFAULT nextval('leave_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE lops ALTER COLUMN id SET DEFAULT nextval('lops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE paymonths ALTER COLUMN id SET DEFAULT nextval('paymonths_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pf_esi_rates ALTER COLUMN id SET DEFAULT nextval('pf_esi_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pf_group_rates ALTER COLUMN id SET DEFAULT nextval('pf_group_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pf_groups ALTER COLUMN id SET DEFAULT nextval('pf_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pt_group_rates ALTER COLUMN id SET DEFAULT nextval('pt_group_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pt_groups ALTER COLUMN id SET DEFAULT nextval('pt_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pt_rates ALTER COLUMN id SET DEFAULT nextval('pt_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE salaries ALTER COLUMN id SET DEFAULT nextval('salaries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE salary_allotments ALTER COLUMN id SET DEFAULT nextval('salary_allotments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE salary_group_details ALTER COLUMN id SET DEFAULT nextval('salary_group_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE salary_groups ALTER COLUMN id SET DEFAULT nextval('salary_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE salary_heads ALTER COLUMN id SET DEFAULT nextval('salary_heads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE salary_totals ALTER COLUMN id SET DEFAULT nextval('salary_totals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: attendance_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attendance_configurations
    ADD CONSTRAINT attendance_configurations_pkey PRIMARY KEY (id);


--
-- Name: branches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: classification_headings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY classification_headings
    ADD CONSTRAINT classification_headings_pkey PRIMARY KEY (id);


--
-- Name: classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY classifications
    ADD CONSTRAINT classifications_pkey PRIMARY KEY (id);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: default_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY default_values
    ADD CONSTRAINT default_values_pkey PRIMARY KEY (id);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: designations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- Name: employee_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT employee_details_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: esi_group_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY esi_group_rates
    ADD CONSTRAINT esi_group_rates_pkey PRIMARY KEY (id);


--
-- Name: esi_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY esi_groups
    ADD CONSTRAINT esi_groups_pkey PRIMARY KEY (id);


--
-- Name: financial_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY financial_institutions
    ADD CONSTRAINT financial_institutions_pkey PRIMARY KEY (id);


--
-- Name: grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- Name: leave_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY leave_details
    ADD CONSTRAINT leave_details_pkey PRIMARY KEY (id);


--
-- Name: lops_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lops
    ADD CONSTRAINT lops_pkey PRIMARY KEY (id);


--
-- Name: paymonths_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paymonths
    ADD CONSTRAINT paymonths_pkey PRIMARY KEY (id);


--
-- Name: pf_esi_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pf_esi_rates
    ADD CONSTRAINT pf_esi_rates_pkey PRIMARY KEY (id);


--
-- Name: pf_group_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pf_group_rates
    ADD CONSTRAINT pf_group_rates_pkey PRIMARY KEY (id);


--
-- Name: pf_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pf_groups
    ADD CONSTRAINT pf_groups_pkey PRIMARY KEY (id);


--
-- Name: pt_group_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pt_group_rates
    ADD CONSTRAINT pt_group_rates_pkey PRIMARY KEY (id);


--
-- Name: pt_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pt_groups
    ADD CONSTRAINT pt_groups_pkey PRIMARY KEY (id);


--
-- Name: pt_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pt_rates
    ADD CONSTRAINT pt_rates_pkey PRIMARY KEY (id);


--
-- Name: salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (id);


--
-- Name: salary_allotments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY salary_allotments
    ADD CONSTRAINT salary_allotments_pkey PRIMARY KEY (id);


--
-- Name: salary_group_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY salary_group_details
    ADD CONSTRAINT salary_group_details_pkey PRIMARY KEY (id);


--
-- Name: salary_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY salary_groups
    ADD CONSTRAINT salary_groups_pkey PRIMARY KEY (id);


--
-- Name: salary_heads_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY salary_heads
    ADD CONSTRAINT salary_heads_pkey PRIMARY KEY (id);


--
-- Name: salary_totals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY salary_totals
    ADD CONSTRAINT salary_totals_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_branches_on_esi_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_branches_on_esi_group_id ON branches USING btree (esi_group_id);


--
-- Name: index_branches_on_pf_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_branches_on_pf_group_id ON branches USING btree (pf_group_id);


--
-- Name: index_branches_on_pt_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_branches_on_pt_group_id ON branches USING btree (pt_group_id);


--
-- Name: index_leave_details_on_employee_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_leave_details_on_employee_id ON leave_details USING btree (employee_id);


--
-- Name: index_paymonths_on_month_year; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_paymonths_on_month_year ON paymonths USING btree (month_year);


--
-- Name: index_pt_group_rates_on_paymonth_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pt_group_rates_on_paymonth_id ON pt_group_rates USING btree (paymonth_id);


--
-- Name: index_pt_group_rates_on_pt_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pt_group_rates_on_pt_group_id ON pt_group_rates USING btree (pt_group_id);


--
-- Name: index_pt_groups_on_state_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pt_groups_on_state_id ON pt_groups USING btree (state_id);


--
-- Name: index_pt_rates_on_paymonth_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pt_rates_on_paymonth_id ON pt_rates USING btree (paymonth_id);


--
-- Name: index_salaries_on_employee_detail_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_salaries_on_employee_detail_id ON salaries USING btree (employee_detail_id);


--
-- Name: index_salaries_on_employee_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_salaries_on_employee_id ON salaries USING btree (employee_id);


--
-- Name: index_salaries_on_salary_head_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_salaries_on_salary_head_id ON salaries USING btree (salary_head_id);


--
-- Name: index_salary_group_details_on_salary_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_salary_group_details_on_salary_group_id ON salary_group_details USING btree (salary_group_id);


--
-- Name: index_salary_group_details_on_salary_head_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_salary_group_details_on_salary_head_id ON salary_group_details USING btree (salary_head_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: branches_esi_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_esi_group_id_fk FOREIGN KEY (esi_group_id) REFERENCES esi_groups(id);


--
-- Name: branches_pf_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pf_group_id_fk FOREIGN KEY (pf_group_id) REFERENCES pf_groups(id);


--
-- Name: branches_pt_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pt_group_id_fk FOREIGN KEY (pt_group_id) REFERENCES pt_groups(id);


--
-- Name: employees_branch_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_branch_id_fk FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: employees_department_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_department_id_fk FOREIGN KEY (department_id) REFERENCES departments(id);


--
-- Name: employees_designation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_designation_id_fk FOREIGN KEY (designation_id) REFERENCES designations(id);


--
-- Name: employees_financial_institution_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_financial_institution_id_fk FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions(id);


--
-- Name: employees_grade_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_grade_id_fk FOREIGN KEY (grade_id) REFERENCES grades(id);


--
-- Name: esi_group_rates_esi_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY esi_group_rates
    ADD CONSTRAINT esi_group_rates_esi_group_id_fk FOREIGN KEY (esi_group_id) REFERENCES esi_groups(id);


--
-- Name: holidays_attendance_configuration_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY holidays
    ADD CONSTRAINT holidays_attendance_configuration_id_fk FOREIGN KEY (attendance_configuration_id) REFERENCES attendance_configurations(id);


--
-- Name: pf_group_rates_paymonth_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pf_group_rates
    ADD CONSTRAINT pf_group_rates_paymonth_id_fk FOREIGN KEY (paymonth_id) REFERENCES paymonths(id);


--
-- Name: pf_group_rates_pf_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pf_group_rates
    ADD CONSTRAINT pf_group_rates_pf_group_id_fk FOREIGN KEY (pf_group_id) REFERENCES pf_groups(id);


--
-- Name: pt_group_rates_paymonth_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_group_rates
    ADD CONSTRAINT pt_group_rates_paymonth_id_fk FOREIGN KEY (paymonth_id) REFERENCES paymonths(id);


--
-- Name: pt_group_rates_pt_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_group_rates
    ADD CONSTRAINT pt_group_rates_pt_group_id_fk FOREIGN KEY (pt_group_id) REFERENCES pt_groups(id);


--
-- Name: pt_rates_pt_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_rates
    ADD CONSTRAINT pt_rates_pt_group_id_fk FOREIGN KEY (pt_group_id) REFERENCES pt_groups(id);


--
-- Name: salary_allotments_salary_group_detail_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY salary_allotments
    ADD CONSTRAINT salary_allotments_salary_group_detail_id_fk FOREIGN KEY (salary_group_detail_id) REFERENCES salary_group_details(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20111207065049');

INSERT INTO schema_migrations (version) VALUES ('20111207065119');

INSERT INTO schema_migrations (version) VALUES ('20111207065147');

INSERT INTO schema_migrations (version) VALUES ('20111207111434');

INSERT INTO schema_migrations (version) VALUES ('20111208052456');

INSERT INTO schema_migrations (version) VALUES ('20111208110925');

INSERT INTO schema_migrations (version) VALUES ('20111208122225');

INSERT INTO schema_migrations (version) VALUES ('20111208122226');

INSERT INTO schema_migrations (version) VALUES ('20111208122227');

INSERT INTO schema_migrations (version) VALUES ('20111208163349');

INSERT INTO schema_migrations (version) VALUES ('20111209174150');

INSERT INTO schema_migrations (version) VALUES ('20111214060343');

INSERT INTO schema_migrations (version) VALUES ('20111214061206');

INSERT INTO schema_migrations (version) VALUES ('20111215121207');

INSERT INTO schema_migrations (version) VALUES ('20111220084909');

INSERT INTO schema_migrations (version) VALUES ('20111223070223');

INSERT INTO schema_migrations (version) VALUES ('20111230115747');

INSERT INTO schema_migrations (version) VALUES ('20111231085709');

INSERT INTO schema_migrations (version) VALUES ('20120104045249');

INSERT INTO schema_migrations (version) VALUES ('20120105111756');

INSERT INTO schema_migrations (version) VALUES ('20120106055841');

INSERT INTO schema_migrations (version) VALUES ('20120106120556');

INSERT INTO schema_migrations (version) VALUES ('20120106120557');

INSERT INTO schema_migrations (version) VALUES ('20120106120558');

INSERT INTO schema_migrations (version) VALUES ('20120106123525');

INSERT INTO schema_migrations (version) VALUES ('20120106124054');

INSERT INTO schema_migrations (version) VALUES ('20120109100545');

INSERT INTO schema_migrations (version) VALUES ('20120110053508');

INSERT INTO schema_migrations (version) VALUES ('20120123154548');

INSERT INTO schema_migrations (version) VALUES ('20120201095008');

INSERT INTO schema_migrations (version) VALUES ('20120201123138');

INSERT INTO schema_migrations (version) VALUES ('20120201123338');

INSERT INTO schema_migrations (version) VALUES ('20120202050611');

INSERT INTO schema_migrations (version) VALUES ('20120203090143');

INSERT INTO schema_migrations (version) VALUES ('20120203091729');

INSERT INTO schema_migrations (version) VALUES ('20120203104107');

INSERT INTO schema_migrations (version) VALUES ('20120206053003');

INSERT INTO schema_migrations (version) VALUES ('20120206122036');

INSERT INTO schema_migrations (version) VALUES ('20120206122037');

INSERT INTO schema_migrations (version) VALUES ('20120206150058');

INSERT INTO schema_migrations (version) VALUES ('20120207094010');

INSERT INTO schema_migrations (version) VALUES ('20120208092014');

INSERT INTO schema_migrations (version) VALUES ('20120209060116');

INSERT INTO schema_migrations (version) VALUES ('20120209065012');

INSERT INTO schema_migrations (version) VALUES ('20120208045836');

INSERT INTO schema_migrations (version) VALUES ('20120223113136');

INSERT INTO schema_migrations (version) VALUES ('20120224071031');

INSERT INTO schema_migrations (version) VALUES ('20120224072313');

INSERT INTO schema_migrations (version) VALUES ('20120228053057');

INSERT INTO schema_migrations (version) VALUES ('20120215042312');

INSERT INTO schema_migrations (version) VALUES ('20120223121525');