--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: about_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_us (
    id bigint NOT NULL,
    title character varying,
    content text,
    image_url character varying,
    published_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.about_us OWNER TO postgres;

--
-- Name: about_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.about_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_us_id_seq OWNER TO postgres;

--
-- Name: about_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.about_us_id_seq OWNED BY public.about_us.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banners (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title character varying,
    text_color character varying,
    banner_type character varying
);


ALTER TABLE public.banners OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banners_id_seq OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


--
-- Name: blog_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_categories (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.blog_categories OWNER TO postgres;

--
-- Name: blog_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_categories_id_seq OWNER TO postgres;

--
-- Name: blog_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_categories_id_seq OWNED BY public.blog_categories.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    description text,
    image character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    blog_category_id bigint
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer,
    purchased boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_items_id_seq OWNER TO postgres;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    user_id bigint,
    purchased boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_id_seq OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    image character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: contact_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    phone character varying,
    subject character varying,
    address text,
    form_message text,
    status character varying DEFAULT 'new'::character varying,
    response text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contact_us OWNER TO postgres;

--
-- Name: contact_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_id_seq OWNER TO postgres;

--
-- Name: contact_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_id_seq OWNED BY public.contact_us.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons (
    id bigint NOT NULL,
    code character varying,
    discount_percentage numeric(5,2),
    max_discount_amount numeric(10,2),
    active boolean DEFAULT true,
    expiry_date date,
    no_of_uses integer,
    description text,
    applicability character varying,
    minimum_purchase_amount numeric(10,2),
    usage_restrictions text,
    user_limit integer,
    unique_per_user boolean,
    stackable boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title character varying
);


ALTER TABLE public.coupons OWNER TO postgres;

--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupons_id_seq OWNER TO postgres;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: faq_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faq_categories (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.faq_categories OWNER TO postgres;

--
-- Name: faq_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faq_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_categories_id_seq OWNER TO postgres;

--
-- Name: faq_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faq_categories_id_seq OWNED BY public.faq_categories.id;


--
-- Name: faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faqs (
    id bigint NOT NULL,
    question character varying,
    answer text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    faq_category_id bigint
);


ALTER TABLE public.faqs OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faqs_id_seq OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id bigint NOT NULL,
    image_url character varying,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: invoice_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_items (
    id bigint NOT NULL,
    name character varying,
    price numeric,
    quantity integer,
    invoice_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.invoice_items OWNER TO postgres;

--
-- Name: invoice_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoice_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_items_id_seq OWNER TO postgres;

--
-- Name: invoice_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoice_items_id_seq OWNED BY public.invoice_items.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id bigint NOT NULL,
    invoice_number character varying,
    user_id bigint NOT NULL,
    order_id bigint NOT NULL,
    date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    order_id bigint NOT NULL,
    quantity integer,
    unit_price double precision,
    total_price double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint,
    total_amount numeric(10,2),
    status character varying,
    payment_method character varying,
    paid_at timestamp(6) without time zone,
    shipped_at timestamp(6) without time zone,
    notes text,
    gift_wrap boolean DEFAULT false,
    tracking_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    sub_total numeric,
    discount_amount numeric,
    shipping_fee numeric,
    grand_total numeric,
    delivery_method numeric,
    razorpay_order_id character varying,
    delivery_date timestamp(6) without time zone,
    address_line_1 character varying,
    address_line_2 character varying,
    city character varying,
    state character varying,
    postal_code character varying,
    country character varying
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: our_stories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.our_stories (
    id bigint NOT NULL,
    title character varying,
    description text,
    image character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.our_stories OWNER TO postgres;

--
-- Name: our_stories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.our_stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.our_stories_id_seq OWNER TO postgres;

--
-- Name: our_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.our_stories_id_seq OWNED BY public.our_stories.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    order_id integer,
    payment_status character varying,
    payment_amount numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    razorpay_payment_id character varying,
    subscription_id bigint
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans (
    id bigint NOT NULL,
    name character varying,
    price numeric,
    billing_interval character varying,
    features text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: privacy_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privacy_policies (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.privacy_policies OWNER TO postgres;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privacy_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacy_policies_id_seq OWNER TO postgres;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privacy_policies_id_seq OWNED BY public.privacy_policies.id;


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id bigint NOT NULL,
    url character varying,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_images_id_seq OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- Name: product_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_properties (
    id bigint NOT NULL,
    name character varying,
    value character varying,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_properties OWNER TO postgres;

--
-- Name: product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_properties_id_seq OWNER TO postgres;

--
-- Name: product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_properties_id_seq OWNED BY public.product_properties.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    description text,
    available_on timestamp(6) without time zone,
    discontinue_on timestamp(6) without time zone,
    master_price numeric,
    cost_price numeric,
    subcategory_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    net_wt character varying,
    unit character varying,
    available_zip_codes character varying[] DEFAULT '{}'::character varying[]
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
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
-- Name: referrals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referrals (
    id bigint NOT NULL,
    referrer_id bigint NOT NULL,
    referred_user_id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.referrals OWNER TO postgres;

--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.referrals_id_seq OWNER TO postgres;

--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.referrals_id_seq OWNED BY public.referrals.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    user_id bigint,
    product_id bigint,
    content text,
    rating integer,
    approved boolean DEFAULT false,
    reviewed_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    token character varying,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
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
-- Name: shipping_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_addresses (
    id bigint NOT NULL,
    user_id bigint,
    first_name character varying,
    address_line_1 character varying,
    address_line_2 character varying,
    city character varying,
    state character varying,
    postal_code character varying,
    country character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    country_code character varying,
    phone_number character varying,
    mail character varying,
    title character varying,
    last_name character varying,
    "default" boolean
);


ALTER TABLE public.shipping_addresses OWNER TO postgres;

--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_addresses_id_seq OWNER TO postgres;

--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_addresses_id_seq OWNED BY public.shipping_addresses.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    name character varying,
    address_line_1 character varying,
    address_line_2 character varying,
    city character varying,
    state character varying,
    postal_code character varying,
    country character varying,
    phone_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: subcategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategories (
    id bigint NOT NULL,
    name character varying,
    image character varying,
    description text,
    category_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subcategories OWNER TO postgres;

--
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcategories_id_seq OWNER TO postgres;

--
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategories_id_seq OWNED BY public.subcategories.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    plan_id bigint NOT NULL,
    status character varying,
    expires_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: temp_user_coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_user_coupons (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    coupon_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.temp_user_coupons OWNER TO postgres;

--
-- Name: temp_user_coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_user_coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_user_coupons_id_seq OWNER TO postgres;

--
-- Name: temp_user_coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_user_coupons_id_seq OWNED BY public.temp_user_coupons.id;


--
-- Name: term_of_uses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.term_of_uses (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.term_of_uses OWNER TO postgres;

--
-- Name: term_of_uses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.term_of_uses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.term_of_uses_id_seq OWNER TO postgres;

--
-- Name: term_of_uses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.term_of_uses_id_seq OWNED BY public.term_of_uses.id;


--
-- Name: terms_of_sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_of_sales (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.terms_of_sales OWNER TO postgres;

--
-- Name: terms_of_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terms_of_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terms_of_sales_id_seq OWNER TO postgres;

--
-- Name: terms_of_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terms_of_sales_id_seq OWNED BY public.terms_of_sales.id;


--
-- Name: textures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.textures (
    id bigint NOT NULL,
    name character varying,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.textures OWNER TO postgres;

--
-- Name: textures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.textures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.textures_id_seq OWNER TO postgres;

--
-- Name: textures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.textures_id_seq OWNED BY public.textures.id;


--
-- Name: user_coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_coupons (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    coupon_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_coupons OWNER TO postgres;

--
-- Name: user_coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_coupons_id_seq OWNER TO postgres;

--
-- Name: user_coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_coupons_id_seq OWNED BY public.user_coupons.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying,
    email character varying,
    phone_number character varying,
    country_code character varying,
    profile_pic character varying,
    otp character varying,
    active boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    dob timestamp(6) without time zone,
    address text,
    state character varying,
    country character varying,
    gender character varying,
    doa timestamp(6) without time zone,
    last_name character varying,
    title character varying,
    pin_code integer,
    district character varying,
    acceptance boolean,
    referral_key character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variants (
    id bigint NOT NULL,
    sku character varying,
    price numeric,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    net_wt character varying,
    unit character varying,
    quantity integer,
    discount_price double precision
);


ALTER TABLE public.variants OWNER TO postgres;

--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variants_id_seq OWNER TO postgres;

--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variants_id_seq OWNED BY public.variants.id;


--
-- Name: vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vouchers (
    id bigint NOT NULL,
    title character varying,
    description text,
    expiry_date date,
    code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vouchers OWNER TO postgres;

--
-- Name: vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vouchers_id_seq OWNER TO postgres;

--
-- Name: vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vouchers_id_seq OWNED BY public.vouchers.id;


--
-- Name: about_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_us ALTER COLUMN id SET DEFAULT nextval('public.about_us_id_seq'::regclass);


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- Name: blog_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_categories ALTER COLUMN id SET DEFAULT nextval('public.blog_categories_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: faq_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq_categories ALTER COLUMN id SET DEFAULT nextval('public.faq_categories_id_seq'::regclass);


--
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: invoice_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_items ALTER COLUMN id SET DEFAULT nextval('public.invoice_items_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: our_stories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.our_stories ALTER COLUMN id SET DEFAULT nextval('public.our_stories_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: privacy_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies ALTER COLUMN id SET DEFAULT nextval('public.privacy_policies_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- Name: product_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties ALTER COLUMN id SET DEFAULT nextval('public.product_properties_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shipping_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_addresses ALTER COLUMN id SET DEFAULT nextval('public.shipping_addresses_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: subcategories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN id SET DEFAULT nextval('public.subcategories_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: temp_user_coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_coupons ALTER COLUMN id SET DEFAULT nextval('public.temp_user_coupons_id_seq'::regclass);


--
-- Name: term_of_uses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.term_of_uses ALTER COLUMN id SET DEFAULT nextval('public.term_of_uses_id_seq'::regclass);


--
-- Name: terms_of_sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_of_sales ALTER COLUMN id SET DEFAULT nextval('public.terms_of_sales_id_seq'::regclass);


--
-- Name: textures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.textures ALTER COLUMN id SET DEFAULT nextval('public.textures_id_seq'::regclass);


--
-- Name: user_coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coupons ALTER COLUMN id SET DEFAULT nextval('public.user_coupons_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variants ALTER COLUMN id SET DEFAULT nextval('public.variants_id_seq'::regclass);


--
-- Name: vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers ALTER COLUMN id SET DEFAULT nextval('public.vouchers_id_seq'::regclass);


--
-- Data for Name: about_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_us (id, title, content, image_url, published_at, created_at, updated_at) FROM stdin;
3	Return Eligibility	<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam efficitur massa vitae commodo auctor Pellentesque ornare ex in est scelerisque consectetur Duis ultricies ex ut vehicula luctus. Cras a turpis in enim tempor tempor at tempus arcu. Vestibulum vitae eros sit amet leo semper auctor a et risus. Vestibulum blandit metus porttitor nibh sagittis ultricies Ut cursus justo id ultrices egestas. Sed in dolor eget ex sollicitudin gravida vitae at urna. Vivamus ac nulla vestibulum, lobortis est eu, scelerisque felis. Sed gravida metus sit amet magna mattis, id aliquet felis volutpat. Sed pretium sem at metus dictum, quis vehicula dolor ultricies. Morbi non dolor imperdiet, volutpat metus eu, porttitor ipsum. Integer molestie elit ac augue sollicitudin ullamcorper. Nullam et erat in libero laoreet efficitur.</p>		2024-03-14 00:00:00	2024-03-14 05:33:22.361027	2024-03-21 07:39:50.959263
1	Returns	<p><strong>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply random text.</strong> It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. <strong><em><u>The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</u></em></strong></p>		2024-03-14 00:00:00	2024-03-14 05:32:06.090696	2024-03-21 07:40:27.711898
4	How to initiate a return	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>		2024-03-14 00:00:00	2024-03-14 05:33:51.860091	2024-03-21 07:39:44.0176
2	How to initiate a return	<p><strong>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</strong></p>		2024-03-14 00:00:00	2024-03-14 05:32:38.250855	2024-03-21 07:40:01.394853
5	About Us	<p><strong>Welcome to Grind &amp; Pound!</strong></p><p><br></p><p>At <span style="background-color: rgb(255, 255, 255);">Grind &amp; Pound</span>, we're passionate about providing high-quality flour products to our customers. As a family-owned business, we understand the importance of wholesome ingredients in creating delicious meals, and we're dedicated to sourcing the finest flour for all your baking needs.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Our Mission</strong></p><p><br></p><p>Our mission is simple: to bring joy to your kitchen by offering a wide selection of premium flour products that inspire creativity and elevate your baking experience. We strive to be your trusted partner in the kitchen, providing consistent quality and exceptional service with every purchase.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Quality Assurance</strong></p><p><br></p><p>We take pride in the quality of our flour, carefully selecting suppliers who share our commitment to excellence. Our products undergo rigorous testing to ensure they meet our strict standards for freshness, purity, and flavor. From traditional all-purpose flour to specialty blends, we have everything you need to achieve outstanding results in your baking endeavors.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Community Engagement</strong></p><p><br></p><p>At <span style="background-color: rgb(255, 255, 255);">Grind &amp; Pound,</span> we believe in giving back to the community. We actively support local farmers and producers, promoting sustainability and ethical practices in agriculture. By choosing our products, you're not only investing in superior flour but also contributing to the well-being of our farming communities.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Customer Satisfaction</strong></p><p><br></p><p>Your satisfaction is our top priority. We're here to support you every step of the way, from selecting the perfect flour for your recipe to providing helpful tips and resources for successful baking. Our dedicated customer service team is always ready to assist you with any questions or concerns you may have.</p><p><br></p><p>Thank you for choosing <strong style="background-color: rgb(255, 255, 255);"><u>Grind &amp; Pound</u></strong> for all your flour needs. We look forward to serving you and becoming your trusted partner in the kitchen!</p><p><br></p><p>Feel free to personalize this content to reflect the unique qualities and values of your flour-selling e-commerce business. Highlight what sets you apart from competitors and why customers should choose your products.</p>		2024-03-20 00:00:00	2024-03-20 10:33:42.784778	2024-03-22 04:52:59.091379
\.


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	attachment	Product	4	1	2024-02-12 04:56:02.676754
2	attachment	Product	3	2	2024-02-12 04:56:35.087374
3	attachment	Product	2	3	2024-02-12 04:56:55.7819
4	attachment	Product	1	4	2024-02-12 04:57:18.696745
84	attachment	User	109	84	2024-03-13 11:07:54.249811
85	attachment	User	110	85	2024-03-13 11:09:12.682076
86	attachment	User	119	86	2024-03-14 11:26:58.746733
87	attachment	User	139	87	2024-03-26 04:37:03.058116
90	attachment	User	115	90	2024-03-27 04:14:38.01865
93	attachment	User	127	93	2024-03-27 05:32:47.611134
101	attachment	User	140	101	2024-03-27 11:16:42.692622
103	attachment	User	142	103	2024-03-28 14:12:18.529628
48	attachment	Banner	5	48	2024-02-22 10:50:20.890828
49	attachment	Banner	6	49	2024-02-22 11:05:51.689769
50	attachment	Banner	7	50	2024-02-22 11:06:05.479174
51	attachment	Banner	8	51	2024-02-22 11:06:19.515723
58	attachment	ProductImage	1	58	2024-02-28 12:52:04.30494
59	attachment	ProductImage	2	59	2024-02-28 12:52:04.313254
60	attachment	ProductImage	5	60	2024-02-28 12:52:04.319436
61	attachment	ProductImage	6	61	2024-02-28 12:52:04.325615
62	attachment	ProductImage	7	62	2024-02-28 12:53:28.768841
63	attachment	ProductImage	10	63	2024-02-28 12:53:28.775106
64	attachment	ProductImage	8	64	2024-02-28 12:54:05.005247
65	attachment	ProductImage	11	65	2024-02-28 12:54:05.013515
66	attachment	ProductImage	9	66	2024-02-28 12:54:41.435507
67	attachment	ProductImage	12	67	2024-02-28 12:54:41.442053
68	attachment	Banner	9	68	2024-03-05 12:13:53.079177
69	attachment	Banner	10	69	2024-03-05 12:14:25.381721
70	attachment	Banner	11	70	2024-03-05 12:15:03.15029
71	attachment	Banner	12	71	2024-03-05 12:15:19.095293
72	attachment	Banner	13	72	2024-03-05 12:16:58.947956
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	ygfn4jwfb4b3geb9zml2so1tvgqo	download.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	11841	I6w3Z7C1oF4R1GJ86kWtHA==	2024-02-12 04:56:02.675386
2	0thbpfg2zbyrzn2ncrm4o9162eed	b71b29cf-2865-491e-9f86-a449486e48d4.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	29815	E+JDFMx32YZyZHn3adcGtw==	2024-02-12 04:56:35.086318
3	stzhprzysybtnhgq0lo3highit94	0264bfa8-057d-4813-8093-23b28d8c2d3b.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	5598	SCwLTUc7IK0M6WZ+SAzeDg==	2024-02-12 04:56:55.780905
4	bw5k5isy3rwwrmaduvof511jmnq5	b71b29cf-2865-491e-9f86-a449486e48d4.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	29815	E+JDFMx32YZyZHn3adcGtw==	2024-02-12 04:57:18.695827
65	529n1jrumceies3tn72b5gjrpt36	Group 383@2x.png	image/png	{"identified":true,"analyzed":true}	cloudinary	158354	K9hnwrs7POIT1XBnHPjEQA==	2024-02-28 12:54:05.012544
72	bm9rki7lfwozyxvvu89gsl792js5	Rectangle 374.png	image/png	{"identified":true,"width":1180,"height":293,"analyzed":true}	cloudinary	289388	Be57HTkWQhQk/yycEIsdNg==	2024-03-05 12:16:58.946957
101	z6hbc2gifhiy09dr6qhu73qxy3sr	attachment_file	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	94358	ADjm659P9aX0T8YRuprDeg==	2024-03-27 11:16:42.691355
84	bjxgk9uivnp9n0ovgc0azzhjdcpu	attachment_file	image/png	{"identified":true,"width":540,"height":293,"analyzed":true}	cloudinary	230092	WTLpX2Sa8+ge1S+gyhyXnA==	2024-03-13 11:07:54.248397
85	a8sfsrjzr5349jnha0j0nwbvqrn0	attachment_file	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	94358	ADjm659P9aX0T8YRuprDeg==	2024-03-13 11:09:12.680746
86	4g4pj24zgiaes49dvbu9qkd9xgbs	attachment_file	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	94358	ADjm659P9aX0T8YRuprDeg==	2024-03-14 11:26:58.74548
87	tq389pf7h8h46jo2mncmvfqijzmm	attachment_file	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	94358	ADjm659P9aX0T8YRuprDeg==	2024-03-26 04:37:03.049222
90	prckklph129nmwyl3vplynzwfr72	attachment_file	image/png	{"identified":true,"width":2692,"height":1156,"analyzed":true}	cloudinary	1509007	2n14sSNlByFUXsTP/4C5pA==	2024-03-27 04:14:38.017371
93	bv4watuy423va97q72de2xowzma3	attachment_file	image/jpeg	{"identified":true,"width":4256,"height":2832,"analyzed":true}	cloudinary	2232369	n0W03SZOzFjZJ7xVTHV2xw==	2024-03-27 05:32:47.609884
48	qdcp9uzp9uvrhzlvbh5tess00ak1	Banner-4.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	298443	HgVuCqXP4Pvfvdr8n5n/Fw==	2024-02-22 10:50:20.889887
49	yibtqrbzxxc9ddfblnoow5sjqr9y	Banner-3.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	232692	6xgRrgHP9j+Rc93EoVQYmg==	2024-02-22 11:05:51.688532
103	19yhzbjwus34raxg8x04x6gw1wox	attachment_file	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	94358	ADjm659P9aX0T8YRuprDeg==	2024-03-28 14:12:18.52835
66	azvzs5uchp4aa8s7p3g8hbp8qd7g	Group 382@2x.png	image/png	{"identified":true,"analyzed":true}	cloudinary	102832	heBKftG/nUIw9Cb+R2S7SQ==	2024-02-28 12:54:41.434392
67	o20pdl69ret0go82kn80grchpxr6	Group 382@2x.png	image/png	{"identified":true,"analyzed":true}	cloudinary	102832	heBKftG/nUIw9Cb+R2S7SQ==	2024-02-28 12:54:41.441122
58	g3qmfo20u69o20kr5n1fl5vbgjhu	Group 365.png	image/png	{"identified":true,"analyzed":true}	cloudinary	31414	uSH8sLUFzLXaqlK4Vr1jnA==	2024-02-28 12:52:04.30153
50	b4335j8sjifai4c37j9jpk74i2am	Banner-2.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	346510	0+d4DCzX68VWmkRPHxSkZw==	2024-02-22 11:06:05.478201
51	rr0re2eq7kw64pt677a1vf9yqo4b	Banner-1.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	483872	NKbCI6vROKLjWLsiN0Lxug==	2024-02-22 11:06:19.514698
68	t62ku0tqoj5iwx6ybdncbo6ov98d	Group 283.png	image/png	{"identified":true,"width":540,"height":293,"analyzed":true}	cloudinary	218254	N5jeiF4vbg+h1BtaGsA3OQ==	2024-03-05 12:13:53.077451
59	yegxzdb5c3vt7e1fy7uacxa1z6v3	Group 365@2x.png	image/png	{"identified":true,"analyzed":true}	cloudinary	111630	RQb1ExSufND/vRDhTJweDw==	2024-02-28 12:52:04.312276
60	rgw88k7j7lfypl4n3u82vacby5ju	Group 366.png	image/png	{"identified":true,"analyzed":true}	cloudinary	27795	P9SCdq5hR9Tj/t+lctjDnw==	2024-02-28 12:52:04.318518
61	asz11ps4feah2gk40fq9fzdyo012	Group 366@2x.png	image/png	{"identified":true,"analyzed":true}	cloudinary	98167	eJWgk2gUhiOOI5S6TUyqKQ==	2024-02-28 12:52:04.324684
62	zxz1qyr58d12l2nylyeg0oos7pwq	Group 384.png	image/png	{"identified":true,"analyzed":true}	cloudinary	45702	lAT2YMpn3gjTx7A67KonuQ==	2024-02-28 12:53:28.767791
63	1qd1dywcv09hw0u9moq5nbteulo6	Group 384.png	image/png	{"identified":true,"analyzed":true}	cloudinary	45702	lAT2YMpn3gjTx7A67KonuQ==	2024-02-28 12:53:28.774187
64	p2o0y54q1hrxho6u6f6gfjrelh0v	Group 383.png	image/png	{"identified":true,"analyzed":true}	cloudinary	47781	Hb0vp6cjjfPpnQexXof1wA==	2024-02-28 12:54:05.004074
69	udf3t9530muxuigef9lfgsu4hv4n	Group 284.png	image/png	{"identified":true,"width":540,"height":293,"analyzed":true}	cloudinary	230092	WTLpX2Sa8+ge1S+gyhyXnA==	2024-03-05 12:14:25.380534
70	m3opfm5yow4yatka7hjf6omray79	Group 284.png	image/png	{"identified":true,"width":540,"height":293,"analyzed":true}	cloudinary	230092	WTLpX2Sa8+ge1S+gyhyXnA==	2024-03-05 12:15:03.149334
71	637pr9qmjfnjnp2sa1o4u7f724rw	Group 283.png	image/png	{"identified":true,"width":540,"height":293,"analyzed":true}	cloudinary	218254	N5jeiF4vbg+h1BtaGsA3OQ==	2024-03-05 12:15:19.09427
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, email, password_digest, created_at, updated_at) FROM stdin;
1	admin@example.com	test123	2024-03-21 07:19:04.88228	2024-03-21 07:19:04.88228
2	admin@example.com	test123	2024-03-21 10:56:08.678592	2024-03-21 10:56:08.678592
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2024-02-06 09:54:09.178514	2024-02-06 09:54:09.178514
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banners (id, created_at, updated_at, title, text_color, banner_type) FROM stdin;
8	2024-02-22 11:06:19.509825	2024-03-05 11:53:05.06706	Harvested with Care, Ground with Passion	#d34a4a	banner
7	2024-02-22 11:06:05.473746	2024-03-05 11:53:13.462976	Harvested Ground Passion	#24d662	banner
6	2024-02-22 11:05:51.68243	2024-03-05 11:53:21.115311	Elevate Morning With 100%, Unpolished Daliya	#000000	banner
9	2024-03-05 12:13:53.067099	2024-03-05 12:13:53.080253	Create your own Coffee Club subscription and curate your plan	#000000	advertise
10	2024-03-05 12:14:25.37592	2024-03-05 12:14:25.382579	Create your own Coffee Club subscription and curate your plan	#000000	advertise
11	2024-03-05 12:15:03.144656	2024-03-05 12:15:03.151137	Create your own Coffee Club subscription and curate your plan	#000000	advertise
12	2024-03-05 12:15:19.089225	2024-03-05 12:15:19.09642	Create your own Coffee Club subscription and curate your plan	#000000	advertise
13	2024-03-05 12:16:58.941862	2024-03-05 12:16:58.948946	Create your own Coffee Club subscription and curate your plan, picking exactly what you want and when to receive it. No stress, just great coffee.	#000000	promotion
5	2024-02-22 10:50:20.885478	2024-03-24 09:06:50.19768	Elevate Morning With 100%, Unpolished Daliya	#faf5f5	banner
\.


--
-- Data for Name: blog_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_categories (id, title, created_at, updated_at) FROM stdin;
1	Wheat Flour	2024-03-21 10:06:09.603868	2024-03-21 10:06:09.603868
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blogs (id, title, description, image, created_at, updated_at, blog_category_id) FROM stdin;
1	The Art of Baking with Wheat Flour: From Classics to Creative Delights	Dive into the heart of the kitchen and embrace the age-old tradition of baking with the golden essence of wheat flour. Uncover the wholesome magic behind crafting rustic loaves of artisanal bread, embark on a quest to master the delicate dance of pie crusts, and infuse your mornings with the aroma of freshly flipped pancakes. Our journey goes beyond the basics, exploring the science and artistry that transforms humble wheat flour into culinary masterpieces.\r\n\r\nWhether you're a seasoned baker or a kitchen adventurer, our blog is a treasure trove of inspiration. From soft and chewy cookies to decadent cakes adorned with silky frosting, we're here to guide you through the sweet symphony of flavors that only wheat flour can offer. Discover the tales of time-tested recipes, learn the tricks of the trade, and unlock the secrets to achieving that perfect rise in your dough.\r\n\r\nJoin us on a flour-dusted exploration where tradition meets innovation, and where every knead, roll, and bake brings a sense of satisfaction and joy. Elevate your baking repertoire, share in the joy of creating, and savor the delicious results that only the art of baking with wheat flour can deliver. Let's turn your kitchen into a haven of creativity and deliciousness!	image/upload/v1709294188/xmyyyqrswamgjyem3ijc.png	2024-03-01 11:53:32.272925	2024-03-01 11:56:28.102153	\N
2	Wheat Flour Wonders: Baking Bliss Unleashed	Embark on a culinary adventure with our blog, where wheat flour takes center stage in the enchanting world of baking. From the comforting embrace of warm, homemade bread to the delicate artistry of pastry creation, we invite you to explore the vast possibilities that wheat flour brings to your kitchen.\r\n\r\nUnleash your inner baker as we share not just recipes, but stories woven into the fabric of each floury creation. Whether you're a novice seeking the perfect cookie recipe or an experienced artisan aiming to elevate your skills, our blog is a haven of inspiration. Dive into the alchemy of baking science, uncover the nuances of various wheat flour varieties, and witness the transformative power that turns simple ingredients into extraordinary delights.\r\n\r\nIndulge in the joy of kneading soft, supple doughs, witness the rise of decadent cakes, and savor the aroma of freshly baked wonders. Join us as we celebrate the humble wheat grain, unravel its secrets, and embrace the delicious symphony it orchestrates in our kitchens. Let's journey together into a realm where every sift, fold, and bake brings us closer to the sheer bliss of wheat flour creations. Get ready to awaken your senses and infuse your home with the aroma of pure baking delight!	image/upload/v1709294241/i5umzfkqcp8lxsnjchcn.png	2024-03-01 11:57:21.347597	2024-03-01 11:57:21.347597	\N
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_items (id, cart_id, product_id, quantity, purchased, created_at, updated_at) FROM stdin;
201	45	4	1	\N	2024-03-26 06:11:09.837968	2024-03-26 06:11:09.837968
202	45	3	1	\N	2024-03-26 07:33:26.501098	2024-03-26 07:33:26.501098
98	23	4	1	\N	2024-03-13 15:38:40.110184	2024-03-13 15:38:40.110184
99	24	3	1	\N	2024-03-13 16:08:45.839704	2024-03-13 16:08:45.839704
119	28	4	2	\N	2024-03-14 06:50:56.963721	2024-03-15 14:50:18.333069
136	28	3	2	\N	2024-03-15 13:09:10.426153	2024-03-15 14:50:20.998013
170	38	4	1	\N	2024-03-21 05:21:43.320476	2024-03-21 05:21:43.320476
171	38	3	1	\N	2024-03-21 05:21:45.186763	2024-03-21 05:21:45.186763
118	27	4	1	\N	2024-03-14 06:45:28.763023	2024-03-14 06:45:28.763023
257	52	4	5	\N	2024-03-27 12:09:36.339396	2024-03-27 12:09:49.129116
256	52	2	4	\N	2024-03-27 12:09:32.806651	2024-03-27 12:09:50.969338
302	53	4	1	\N	2024-03-28 16:25:03.367891	2024-03-28 16:25:03.367891
156	35	2	1	\N	2024-03-19 10:21:10.847158	2024-03-19 11:45:50.549561
159	35	3	1	\N	2024-03-19 11:46:15.6315	2024-03-19 11:46:15.6315
303	53	3	1	\N	2024-03-28 16:28:48.709015	2024-03-28 16:28:48.709015
304	53	2	1	\N	2024-03-28 16:28:50.631868	2024-03-28 16:28:50.631868
307	53	1	1	\N	2024-03-28 16:29:16.268508	2024-03-28 16:29:16.268508
255	52	3	13	\N	2024-03-27 12:09:29.240809	2024-03-27 12:09:54.759274
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id, purchased, created_at, updated_at) FROM stdin;
23	112	f	2024-03-13 15:38:40.104566	2024-03-13 15:38:40.104566
24	113	f	2024-03-13 16:08:45.83489	2024-03-13 16:08:45.83489
25	114	f	2024-03-13 16:12:36.250529	2024-03-13 16:12:36.250529
27	116	f	2024-03-14 06:45:28.758088	2024-03-14 06:45:28.758088
28	117	f	2024-03-14 06:50:56.958678	2024-03-14 06:50:56.958678
31	119	f	2024-03-14 11:27:47.616561	2024-03-14 11:27:47.616561
35	125	f	2024-03-19 10:21:10.842171	2024-03-19 10:21:10.842171
38	128	f	2024-03-21 05:21:43.315999	2024-03-21 05:21:43.315999
45	139	f	2024-03-26 05:02:48.609234	2024-03-26 05:02:48.609234
46	118	f	2024-03-26 07:43:44.898066	2024-03-26 07:43:44.898066
52	140	f	2024-03-27 12:09:29.231991	2024-03-27 12:09:29.231991
53	110	f	2024-03-28 02:35:21.83498	2024-03-28 02:35:21.83498
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, image, description, created_at, updated_at) FROM stdin;
2	Powdered Spices\t		Powdered Spices\t	2024-02-15 11:24:23.710996	2024-02-15 11:24:23.710996
1	Wheat flour		Sattu or Chatua is made by dry-roasting cashew, almond, millet, barley and chickpea and grinding to a fine flour.	2024-02-08 10:18:18.511484	2024-03-01 09:17:37.345847
\.


--
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us (id, name, email, phone, subject, address, form_message, status, response, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons (id, code, discount_percentage, max_discount_amount, active, expiry_date, no_of_uses, description, applicability, minimum_purchase_amount, usage_restrictions, user_limit, unique_per_user, stackable, created_at, updated_at, title) FROM stdin;
2	BAKEWITHJOY10	10.00	50.00	t	2025-11-13	96	<p><strong>Embrace the joy of baking with 10% off on our premium flour selection. Elevate your baking experience with code BAKEWITHJOY10 during checkout.</strong></p>		10.00		50	f	f	2024-03-12 11:24:13.543533	2024-03-27 05:30:43.173815	BAKEWITHJOY10
1	BakeMaster15	15.00	100.00	t	2024-03-31	95	<p>Enjoy a 15% discount on premium flours with our BakeMaster15 coupon. Elevate your baking experience with high-quality flours that guarantee delicious results. Perfect for creating delectable bread, pastries, and more. Use code at checkout.</p>		500.00		50	f	f	2024-03-01 07:45:13.373298	2024-03-26 12:23:41.681586	BakeMaster15
\.


--
-- Data for Name: faq_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faq_categories (id, title, created_at, updated_at) FROM stdin;
1	Returns	2024-03-13 07:11:21.618111	2024-03-13 07:11:21.618111
2	payment methods	2024-03-13 07:11:36.364306	2024-03-13 07:11:36.364306
3	Delivery	2024-03-13 07:13:59.899677	2024-03-13 07:13:59.899677
4	Exchanges & Returns	2024-03-13 07:14:42.927807	2024-03-13 07:14:42.927807
5	Registration	2024-03-13 07:15:02.127609	2024-03-13 07:15:02.127609
6	Contacts	2024-03-13 07:15:17.612623	2024-03-13 07:15:17.612623
7	Wheat flour	2024-03-20 11:10:18.550818	2024-03-20 11:10:18.550818
8	Powdered Spices	2024-03-20 11:12:54.547219	2024-03-20 11:12:54.547219
9	Payment Methods	2024-03-21 07:19:04.896965	2024-03-21 07:19:04.896965
10	Wheat Flour	2024-03-21 07:19:04.903219	2024-03-21 07:19:04.903219
11	Powdered Spices\t	2024-03-21 10:56:08.712024	2024-03-21 10:56:08.712024
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faqs (id, question, answer, created_at, updated_at, faq_category_id) FROM stdin;
5	How can I track my order, and what is your shipping policy?	 Once your order is processed, you will receive a confirmation email with a tracking number. You can use this number to monitor the status and estimated delivery time of your shipment. Refer to our shipping policy for details on delivery times, shipping fees, and any relevant promotions or discounts.\r\n	2024-03-01 11:59:42.658614	2024-03-18 05:03:08.778533	1
4	 Do you offer bulk or wholesale purchasing options for businesses or large-scale baking operations?	Yes, we provide bulk and wholesale purchasing options to meet the needs of bakeries, restaurants, and businesses. Contact our customer support or check our wholesale section for information on pricing, minimum order quantities, and delivery options tailored to your requirements.	2024-03-01 11:59:24.900033	2024-03-18 06:29:12.677042	2
3	How is the freshness of your wheat flour maintained during shipping?	We prioritize the freshness of our products. Our wheat flour is carefully packaged in airtight, sealed bags to preserve its quality during transit. Additionally, our packaging is designed to protect against external elements, ensuring that the flour you receive maintains its optimal freshness for your baking needs.	2024-03-01 11:59:06.558942	2024-03-18 06:29:24.331924	3
2	Are your wheat flours suitable for specific dietary requirements, such as gluten-free or organic preferences?	 While traditional wheat flours contain gluten, we also provide gluten-free alternatives such as almond or coconut flour. Additionally, some of our products are sourced from organic farms, ensuring a premium quality and environmentally friendly choice. Check product labels or descriptions for detailed information.	2024-03-01 11:58:45.146	2024-03-18 06:29:35.021785	4
1	What types of wheat flour do you offer, and how do they differ?	 We offer a variety of wheat flour options, including all-purpose, whole wheat, bread flour, and specialty blends. Each type has distinct characteristics, such as protein content and milling process, catering to specific baking needs. Explore our product descriptions to find the perfect flour for your culinary creations.	2024-03-01 11:58:23.914263	2024-03-18 06:29:44.546496	6
6	What is wheat flour?	<p>&nbsp;Wheat flour is a powder made from grinding wheat grains. It is commonly used for baking bread, pastries, and other baked goods.</p>	2024-03-20 11:12:02.595482	2024-03-20 11:12:02.595482	7
7	What are the different types of wheat flour available?	<p>There are several types of wheat flour, including all-purpose flour, whole wheat flour, bread flour, cake flour, and pastry flour. Each type has different protein content and is suitable for various baking purposes.</p>	2024-03-20 11:12:35.237926	2024-03-20 11:12:35.237926	7
8	What are powdered spices?	<p>Powdered spices are ground forms of various herbs, seeds, roots, or dried fruits used to flavor and enhance the taste of food.</p>	2024-03-20 11:13:28.547518	2024-03-20 11:13:28.547518	8
9	What types of powdered spices are commonly available?	<p>There is a wide variety of powdered spices available, including but not limited to:</p><ul><li>Chili powder</li><li>Turmeric powder</li><li>Cumin powder</li><li>Coriander powder</li><li>Paprika</li><li>Ginger powder</li><li>Garlic powder</li><li>Onion powder</li><li>Curry powder</li></ul><p><br></p>	2024-03-20 11:13:55.21835	2024-03-20 11:13:55.21835	8
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, image_url, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: invoice_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_items (id, name, price, quantity, invoice_id, created_at, updated_at) FROM stdin;
8	Chapati Flour	240.0	6	7	2024-03-21 07:49:44.592206	2024-03-21 07:49:44.592206
9	whole wheat Flour	500.0	1	7	2024-03-21 07:49:44.59608	2024-03-21 07:49:44.59608
10	Allison Seed & Grain	80.0	1	8	2024-03-21 12:04:28.260061	2024-03-21 12:04:28.260061
11	whole wheat Flour	1000.0	2	9	2024-03-21 12:09:07.634493	2024-03-21 12:09:07.634493
12	Allison Seed & Grain	240.0	3	9	2024-03-21 12:09:07.638481	2024-03-21 12:09:07.638481
13	Chapati Flour	40.0	1	9	2024-03-21 12:09:07.642127	2024-03-21 12:09:07.642127
14	Chapati Flour	40.0	1	10	2024-03-21 13:16:05.417855	2024-03-21 13:16:05.417855
15	Popcorn Flour	20.0	1	10	2024-03-21 13:16:05.421745	2024-03-21 13:16:05.421745
16	whole wheat Flour	500.0	1	11	2024-03-21 19:20:28.949207	2024-03-21 19:20:28.949207
17	Allison Seed & Grain	80.0	1	12	2024-03-22 04:39:07.732003	2024-03-22 04:39:07.732003
18	Popcorn Flour	20.0	1	12	2024-03-22 04:39:07.736009	2024-03-22 04:39:07.736009
19	Chapati Flour	280.0	7	13	2024-03-22 13:28:27.434689	2024-03-22 13:28:27.434689
20	Whole wheat Flour	500.0	1	14	2024-03-26 08:55:44.239363	2024-03-26 08:55:44.239363
21	Chapati Flour	80.0	2	15	2024-03-26 13:18:09.5088	2024-03-26 13:18:09.5088
22	Allison Seed & Grain	80.0	1	16	2024-03-26 13:21:31.706161	2024-03-26 13:21:31.706161
23	Chapati Flour	120.0	3	16	2024-03-26 13:21:31.710086	2024-03-26 13:21:31.710086
24	Whole wheat Flour	1000.0	2	16	2024-03-26 13:21:31.713874	2024-03-26 13:21:31.713874
25	Popcorn Flour	40.0	2	16	2024-03-26 13:21:31.717514	2024-03-26 13:21:31.717514
26	Whole wheat Flour	1000.0	2	17	2024-03-27 07:49:58.597936	2024-03-27 07:49:58.597936
27	Popcorn Flour	60.0	3	17	2024-03-27 07:49:58.601854	2024-03-27 07:49:58.601854
28	Chapati Flour	120.0	3	18	2024-03-27 09:26:21.377225	2024-03-27 09:26:21.377225
29	Whole wheat Flour	500.0	1	19	2024-03-27 09:26:27.047115	2024-03-27 09:26:27.047115
30	Chapati Flour	80.0	2	19	2024-03-27 09:26:27.051283	2024-03-27 09:26:27.051283
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, invoice_number, user_id, order_id, date, created_at, updated_at) FROM stdin;
7	INV20240321-080D08A6	110	147	2024-03-21	2024-03-21 07:49:44.587011	2024-03-21 07:49:44.587011
8	INV20240321-7BD6A147	110	148	2024-03-21	2024-03-21 12:04:28.254457	2024-03-21 12:04:28.254457
9	INV20240321-2C6326DF	110	150	2024-03-21	2024-03-21 12:09:07.628947	2024-03-21 12:09:07.628947
10	INV20240321-E015AEB1	110	151	2024-03-21	2024-03-21 13:16:05.412505	2024-03-21 13:16:05.412505
11	INV20240321-A556B54D	115	153	2024-03-21	2024-03-21 19:20:28.94371	2024-03-21 19:20:28.94371
12	INV20240322-88DEAD42	109	154	2024-03-22	2024-03-22 04:39:07.726936	2024-03-22 04:39:07.726936
13	INV20240322-294CD91C	138	155	2024-03-22	2024-03-22 13:28:27.42174	2024-03-22 13:28:27.42174
14	INV20240326-64F3C7AC	115	159	2024-03-26	2024-03-26 08:55:44.234436	2024-03-26 08:55:44.234436
15	INV20240326-8BC32735	140	160	2024-03-26	2024-03-26 13:18:09.503895	2024-03-26 13:18:09.503895
16	INV20240326-2FBF9EE4	140	161	2024-03-26	2024-03-26 13:21:31.700772	2024-03-26 13:21:31.700772
17	INV20240327-2A2420EF	110	164	2024-03-27	2024-03-27 07:49:58.592722	2024-03-27 07:49:58.592722
18	INV20240327-90C82F0B	140	169	2024-03-27	2024-03-27 09:26:21.371982	2024-03-27 09:26:21.371982
19	INV20240327-7FBD02D1	110	171	2024-03-27	2024-03-27 09:26:27.041414	2024-03-27 09:26:27.041414
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, product_id, order_id, quantity, unit_price, total_price, created_at, updated_at) FROM stdin;
117	2	148	1	80	80	2024-03-21 12:03:55.665796	2024-03-21 12:03:55.665796
118	4	149	1	40	40	2024-03-21 12:06:48.211919	2024-03-21 12:06:48.211919
119	3	150	2	500	1000	2024-03-21 12:08:38.606999	2024-03-21 12:08:38.606999
120	2	150	3	80	240	2024-03-21 12:08:38.610752	2024-03-21 12:08:38.610752
121	4	150	1	40	40	2024-03-21 12:08:38.614655	2024-03-21 12:08:38.614655
122	4	151	1	40	40	2024-03-21 13:15:33.79936	2024-03-21 13:15:33.79936
123	1	151	1	20	20	2024-03-21 13:15:33.80308	2024-03-21 13:15:33.80308
124	4	152	1	40	40	2024-03-21 14:04:18.65508	2024-03-21 14:04:18.65508
125	3	153	1	500	500	2024-03-21 19:19:57.610781	2024-03-21 19:19:57.610781
126	2	154	1	80	80	2024-03-22 04:38:41.271842	2024-03-22 04:38:41.271842
127	1	154	1	20	20	2024-03-22 04:38:41.275498	2024-03-22 04:38:41.275498
128	4	155	7	40	280	2024-03-22 13:27:56.15191	2024-03-22 13:27:56.15191
129	3	156	1	500	500	2024-03-22 14:00:40.962269	2024-03-22 14:00:40.962269
130	3	157	1	500	500	2024-03-22 14:21:43.55097	2024-03-22 14:21:43.55097
131	3	158	1	500	500	2024-03-22 15:25:52.492331	2024-03-22 15:25:52.492331
132	3	159	1	500	500	2024-03-26 08:55:17.245093	2024-03-26 08:55:17.245093
133	4	160	2	40	80	2024-03-26 13:17:41.797785	2024-03-26 13:17:41.797785
134	2	161	1	80	80	2024-03-26 13:21:00.396126	2024-03-26 13:21:00.396126
135	4	161	3	40	120	2024-03-26 13:21:00.399583	2024-03-26 13:21:00.399583
136	3	161	2	500	1000	2024-03-26 13:21:00.402497	2024-03-26 13:21:00.402497
137	1	161	2	20	40	2024-03-26 13:21:00.405581	2024-03-26 13:21:00.405581
138	4	162	2	40	80	2024-03-27 05:33:08.980903	2024-03-27 05:33:08.980903
139	4	163	2	40	80	2024-03-27 05:33:25.599645	2024-03-27 05:33:25.599645
140	3	164	2	500	1000	2024-03-27 07:49:16.300594	2024-03-27 07:49:16.300594
141	1	164	3	20	60	2024-03-27 07:49:16.304139	2024-03-27 07:49:16.304139
142	3	165	1	500	500	2024-03-27 09:07:30.762336	2024-03-27 09:07:30.762336
143	4	165	2	40	80	2024-03-27 09:07:30.765863	2024-03-27 09:07:30.765863
144	3	166	1	500	500	2024-03-27 09:08:03.475059	2024-03-27 09:08:03.475059
145	4	166	2	40	80	2024-03-27 09:08:03.478079	2024-03-27 09:08:03.478079
146	3	167	1	500	500	2024-03-27 09:08:24.270988	2024-03-27 09:08:24.270988
147	4	167	2	40	80	2024-03-27 09:08:24.274384	2024-03-27 09:08:24.274384
148	3	168	1	500	500	2024-03-27 09:11:57.446233	2024-03-27 09:11:57.446233
149	4	168	2	40	80	2024-03-27 09:11:57.449317	2024-03-27 09:11:57.449317
150	4	169	3	40	120	2024-03-27 09:22:04.65521	2024-03-27 09:22:04.65521
151	3	170	1	500	500	2024-03-27 09:22:57.094332	2024-03-27 09:22:57.094332
152	4	170	2	40	80	2024-03-27 09:22:57.09779	2024-03-27 09:22:57.09779
153	3	171	1	500	500	2024-03-27 09:26:04.695471	2024-03-27 09:26:04.695471
115	4	147	6	40	240	2024-03-21 07:49:17.744685	2024-03-21 07:49:17.744685
116	3	147	1	500	500	2024-03-21 07:49:17.748133	2024-03-21 07:49:17.748133
154	4	171	2	40	80	2024-03-27 09:26:04.69891	2024-03-27 09:26:04.69891
155	4	172	1	40	40	2024-03-28 07:13:43.824987	2024-03-28 07:13:43.824987
156	3	172	1	500	500	2024-03-28 07:13:43.82898	2024-03-28 07:13:43.82898
157	2	172	1	80	80	2024-03-28 07:13:43.832162	2024-03-28 07:13:43.832162
158	4	173	3	40	120	2024-03-28 11:57:25.257122	2024-03-28 11:57:25.257122
159	3	173	1	500	500	2024-03-28 11:57:25.260849	2024-03-28 11:57:25.260849
160	2	173	1	80	80	2024-03-28 11:57:25.264337	2024-03-28 11:57:25.264337
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, total_amount, status, payment_method, paid_at, shipped_at, notes, gift_wrap, tracking_number, created_at, updated_at, sub_total, discount_amount, shipping_fee, grand_total, delivery_method, razorpay_order_id, delivery_date, address_line_1, address_line_2, city, state, postal_code, country) FROM stdin;
153	115	500.00	Placed	UPI	2024-03-21 19:19:59.613336	\N	Flour order with 1 item	f	\N	2024-03-21 19:19:57.606213	2024-03-21 19:20:28.93797	500.0	0.0	0.0	500.0	\N	order_Np7OrOTPwZpzA4	2024-03-22 00:00:00	dhfdlkfld	\N	23242	sad	224182	dfdfd
154	109	100.00	Placed	UPI	2024-03-22 04:38:43.281956	\N	Flour order with 2 item	f	\N	2024-03-22 04:38:41.267283	2024-03-22 04:39:07.70068	100.0	0.0	0.0	100.0	\N	order_NpGv409nU3TBET	2024-03-22 00:00:00	123 Main St	Apt 456	Cityville	CA	12345	USA
161	140	1240.00	Placed	UPI	2024-03-26 13:21:02.027945	\N	Flour order with 4 item	f	\N	2024-03-26 13:21:00.391604	2024-03-26 13:21:31.695089	1240.0	0.0	0.0	1240.0	\N	order_NqzxHURnKUCZvC	2024-03-27 00:00:00	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
155	138	90.00	Placed	UPI	2024-03-22 13:28:15.17121	\N	Flour order with 2 item	f	\N	2024-03-22 13:27:56.139816	2024-03-22 13:28:27.405624	100.0	0.0	0.0	140.0	\N	order_NpPwQQe0gxPLrI	2024-03-23 00:00:00	Bhagat Singh Chowk	Bombay Building Road	Dhampur	U.P	246747	Inida 
156	\N	500.00	intital	UPI	2024-03-22 14:00:43.142213	\N	Flour order with 1 item	f	\N	2024-03-22 14:00:40.956235	2024-03-22 14:00:43.142797	500.0	0.0	0.0	500.0	\N	order_NpQUijMHFpL7dw	\N	kirti nagar	\N	Gurgaon	Haryana	122001	India
157	\N	500.00	intital	UPI	2024-03-22 14:21:45.295384	\N	Flour order with 1 item	f	\N	2024-03-22 14:21:43.546275	2024-03-22 14:21:45.296008	500.0	0.0	0.0	500.0	\N	order_NpQqwKVyuhbLoV	\N	kirti nagar	\N	Gurgaon	Haryana	122001	India
158	\N	500.00	intital	UPI	2024-03-22 15:25:54.37257	\N	Flour order with 1 item	f	\N	2024-03-22 15:25:52.487826	2024-03-22 15:25:54.373164	500.0	0.0	0.0	500.0	\N	order_NpRwhs2YMCOVDW	\N	kirti nagar	\N	Gurgaon	Haryana	122001	India
147	110	740.00	Delivered	UPI	2024-03-21 07:49:19.375044	\N	Flour order with 2 item	f	\N	2024-03-21 07:49:17.740159	2024-03-21 07:52:49.318775	740.0	0.0	0.0	740.0	\N	order_NovdHVuxGv5gRN	2024-03-21 00:00:00	kirti nagar	\N	Gurgaon	Haryana	122001	India
162	\N	80.00	intital	UPI	2024-03-27 05:33:11.295156	\N	Flour order with 1 item	f	\N	2024-03-27 05:33:08.976218	2024-03-27 05:33:11.295751	80.0	0.0	0.0	80.0	\N	order_NrGWCVe4wLWszX	\N	kirti nagar	\N	Gurgaon	Haryana	122001	India
159	115	425.00	Delivered	UPI	2024-03-26 08:55:19.030366	\N	Flour order with 1 item	f	\N	2024-03-26 08:55:17.240532	2024-03-26 08:58:10.173903	500.0	75.0	0.0	425.0	\N	order_NqvQazmI6jE7sQ	2024-03-26 00:00:00	Bhagat Singh Chowk	Bombay Building Road	Dhampur	U.P	246747	India
163	\N	80.00	intital	UPI	2024-03-27 05:33:27.151578	\N	Flour order with 1 item	f	\N	2024-03-27 05:33:25.595337	2024-03-27 05:33:27.152163	80.0	0.0	0.0	80.0	\N	order_NrGWTsL7M6OF66	\N	kirti nagar	\N	Gurgaon	Haryana	122001	India
160	140	80.00	Placed	UPI	2024-03-26 13:17:43.672628	\N	Flour order with 1 item	f	\N	2024-03-26 13:17:41.79317	2024-03-26 13:18:09.498124	80.0	0.0	0.0	80.0	\N	order_NqztmyYd18o9Ve	2024-03-27 00:00:00	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
148	110	80.00	Placed	UPI	2024-03-21 12:03:57.639848	\N	Flour order with 1 item	f	\N	2024-03-21 12:03:55.66036	2024-03-21 12:04:28.248271	80.0	0.0	0.0	80.0	\N	order_NozyGOUNm8L1vk	2024-03-22 00:00:00	kirti nagar	\N	Gurgaon	Haryana	122001	India
170	\N	580.00	intital	UPI	2024-03-27 09:22:58.673342	\N	Flour order with 2 item	f	\N	2024-03-27 09:22:57.089322	2024-03-27 09:22:58.673961	580.0	0.0	0.0	580.0	\N	order_NrKQw38MfSBvvb	\N	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
164	110	1060.00	Placed	UPI	2024-03-27 07:49:18.315538	\N	Flour order with 2 item	f	\N	2024-03-27 07:49:16.295916	2024-03-27 07:49:58.570384	1060.0	0.0	0.0	1060.0	\N	order_NrIpz90Q3A64Mv	2024-03-27 00:00:00	kirti nagar	\N	Gurgaon	Haryana	122001	India
165	\N	580.00	intital	UPI	2024-03-27 09:07:32.72812	\N	Flour order with 2 item	f	\N	2024-03-27 09:07:30.75794	2024-03-27 09:07:32.728705	580.0	0.0	0.0	580.0	\N	order_NrKAdL3QutrxEB	\N	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
149	\N	40.00	intital	UPI	2024-03-21 12:06:49.823596	\N	Flour order with 1 item	f	\N	2024-03-21 12:06:48.207397	2024-03-21 12:06:49.824206	40.0	0.0	0.0	40.0	\N	order_Np01INMiHINR2V	\N	kirti nagar	\N	Gurgaon	Haryana	122001	India
166	\N	580.00	intital	UPI	2024-03-27 09:08:05.061536	\N	Flour order with 2 item	f	\N	2024-03-27 09:08:03.470611	2024-03-27 09:08:05.062122	580.0	0.0	0.0	580.0	\N	order_NrKBCdrUwGdGfs	\N	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
167	\N	580.00	intital	UPI	2024-03-27 09:08:25.747894	\N	Flour order with 2 item	f	\N	2024-03-27 09:08:24.266689	2024-03-27 09:08:25.748506	580.0	0.0	0.0	580.0	\N	order_NrKBZGbMxQG1dX	\N	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
150	110	1280.00	Placed	UPI	2024-03-21 12:08:40.543719	\N	Flour order with 3 item	f	\N	2024-03-21 12:08:38.602289	2024-03-21 12:09:07.623051	1280.0	0.0	0.0	1280.0	\N	order_Np03FFclAUUggf	2024-03-22 00:00:00	kirti nagar	\N	Gurgaon	Haryana	122001	India
168	\N	580.00	intital	UPI	2024-03-27 09:11:59.009061	\N	Flour order with 2 item	f	\N	2024-03-27 09:11:57.44199	2024-03-27 09:11:59.009648	580.0	0.0	0.0	580.0	\N	order_NrKFK1RBXMcNYv	\N	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
151	110	60.00	Placed	UPI	2024-03-21 13:15:35.42419	\N	Flour order with 2 item	f	\N	2024-03-21 13:15:33.794442	2024-03-21 13:16:05.407068	60.0	0.0	0.0	60.0	\N	order_Np1Bvf3AcIoHoz	2024-03-22 00:00:00	Bhagat Singh Chowk	Bombay Building Road	Dhampur	U.P	246747	Inida 
152	\N	34.00	intital	UPI	2024-03-21 14:04:20.546468	\N	Flour order with 1 item	f	\N	2024-03-21 14:04:18.65071	2024-03-21 14:04:20.547122	40.0	6.0	0.0	34.0	\N	order_Np21QXD7WNP3fi	\N	Kirti Nagar, Sector 15 Part 2	\N	Gurgaon	Haryana	122001	India
169	140	120.00	Placed	UPI	2024-03-27 09:22:06.561786	\N	Flour order with 1 item	f	\N	2024-03-27 09:22:04.650409	2024-03-27 09:26:21.366401	120.0	0.0	0.0	120.0	\N	order_NrKQ1DRaPguUg0	2024-03-27 00:00:00	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
171	110	580.00	Placed	UPI	2024-03-27 09:26:06.272783	\N	Flour order with 2 item	f	\N	2024-03-27 09:26:04.690416	2024-03-27 09:26:27.035625	580.0	0.0	0.0	580.0	\N	order_NrKUEqr9vjPP9A	2024-03-27 00:00:00	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India
172	\N	\N	intital	UPI	\N	\N	Flour order with 3 item	f	\N	2024-03-28 07:13:43.820161	2024-03-28 07:13:43.820161	620.0	\N	0.0	\N	\N	\N	\N	Bhagat Singh Chowk	Bombay Building Road	Dhampur	U.P	246747	India
173	\N	\N	intital	UPI	\N	\N	Flour order with 3 item	f	\N	2024-03-28 11:57:25.252403	2024-03-28 11:57:25.252403	700.0	\N	0.0	\N	\N	\N	\N	Bhagat Singh Chowk	Bombay Building Road	Dhampur	U.P	246747	India
\.


--
-- Data for Name: our_stories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.our_stories (id, title, description, image, created_at, updated_at) FROM stdin;
1	WheatCraft: A Flourishing Tale of Quality and Passion	Embark on a captivating journey with WheatCraft, where the story of wheat unfolds in every grain. Rooted in a shared passion for baking, our tale begins with a vision to bring the pure essence of wheat to kitchens worldwide. We are not just a brand; we are a celebration of the art and science behind crafting the perfect flour, ensuring that each bag carries the legacy of quality and dedication.\r\n\r\nOur commitment to sustainability is deeply ingrained in our farming practices. From carefully selecting the finest wheat varieties to employing eco-friendly cultivation methods, we cultivate a harvest that not only enriches the land but also nourishes the community. With WheatCraft, you can trust that every loaf of bread or pastry you create is a sustainable choice that supports ethical farming and a healthier planet.\r\n\r\nQuality is the cornerstone of WheatCraft. Our state-of-the-art facilities and rigorous quality control measures ensure that each grain meets the highest standards. We believe in letting the natural goodness of wheat shine through, and that's why our products are free from additives and preservatives. With WheatCraft, you experience the true essence of wheat in every recipe, enhancing the flavors and textures of your culinary creations.\r\n\r\nAt WheatCraft, we are more than just a supplier; we are a community that celebrates the joy of baking. Join a network of passionate bakers, chefs, and home cooks eager to share tips, recipes, and stories. Our blog and forums provide a space for you to connect, learn, and grow as a baker. Together, let's nurture a community where the love for wheat flour and the art of baking thrive.\r\n\r\nStep into the world of WheatCraft and elevate your culinary journey. Explore our diverse range of wheat flour products, discover new recipes, and immerse yourself in the flourishing tale of wheat. Each creation begins with the pure essence of our carefully crafted flour. Welcome to WheatCraft, where passion, quality, and the love of baking converge in every delightful bite.	image/upload/v1709294519/tcrfpzbcg1tvgrg4pnnj.png	2024-03-01 12:01:59.072417	2024-03-01 12:01:59.072417
2	Harvested Whispers: A Flour Symphony from Field to Fork	Join us on a poetic expedition with Harvested Whispers, a journey that transforms the humble wheat grain into a symphony of flavors, textures, and stories. From the rustling fields where wheat dances with the wind to the warmth of your kitchen, our narrative unfolds in every bag of flour we offer. Harvested Whispers is not just a flour brand; it's an ode to the rich tapestry of agriculture, craftsmanship, and the joy of creating in the heart of your home.\r\n\r\nOur story begins in the vast fields where wheat whispers tales of growth and abundance. Sown with care, our wheat is nurtured under the gentle gaze of the sun and the watchful eyes of skilled farmers. We embrace sustainable farming practices that not only yield exceptional quality but also contribute to the serenity of the land. Every harvest is a testament to the tranquility found in the rhythm of nature.\r\n\r\nAt Harvested Whispers, we are artisans of flour. Our milling process is a labor of love, carefully transforming grains into fine, versatile flours. We take pride in preserving the nutritional integrity of wheat while ensuring that each bag tells a story of meticulous craftsmanship. With us, every bake is an expression of passion, as we believe that the journey of crafting flour is as important as the end result.\r\n\r\nStep into the world of culinary artistry with Harvested Whispers as your guide. Our flour collection is a symphony of choices – from robust bread flours to delicate pastry blends, each offering a unique note to enhance your creations. Elevate your cooking and baking experiences as you discover the harmonious marriage of taste and texture that only the finest wheat flour can bring to your kitchen.\r\n\r\nHarvested Whispers is more than a brand; it's a community where flour enthusiasts gather to share, learn, and flourish together. Our forums, recipes, and engaging content provide a space for bakers, chefs, and home cooks to connect, exchange ideas, and celebrate the magic of wheat. Join us in nurturing a community where the love for baking grows as abundantly as the wheat in our fields.\r\n\r\nCome, savor the symphony that is Harvested Whispers. Explore our curated selection of wheat flours, discover new culinary compositions, and become part of a narrative that celebrates the beauty found in the simple grain. Welcome to a world where each bag of flour carries the whispers of the harvest, inviting you to create, share, and savor the exquisite melodies of homemade goodness.	image/upload/v1709294599/lbedewle3kcl5invul7w.png	2024-03-01 12:03:19.579869	2024-03-01 12:03:19.579869
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, user_id, order_id, payment_status, payment_amount, created_at, updated_at, razorpay_payment_id, subscription_id) FROM stdin;
140	110	147	success	740.0	2024-03-21 07:49:19.380618	2024-03-21 07:49:43.638047	pay_NovdWDiRdiWrj1	\N
141	110	148	success	80.0	2024-03-21 12:03:57.64652	2024-03-21 12:04:27.18951	pay_NozyaL3j2kruxX	\N
142	110	149	pending	40.0	2024-03-21 12:06:49.829487	2024-03-21 12:06:49.829487	\N	\N
143	110	150	success	1280.0	2024-03-21 12:08:40.549149	2024-03-21 12:09:06.52212	pay_Np03WBzMxs7yv8	\N
144	110	151	success	60.0	2024-03-21 13:15:35.430273	2024-03-21 13:16:04.3069	pay_Np1CFSg2rmIgsz	\N
145	110	152	success	34.0	2024-03-21 14:04:20.55202	2024-03-21 14:05:30.931032	pay_Np22TSsXKQm9Ck	\N
146	115	153	success	500.0	2024-03-21 19:19:59.618958	2024-03-21 19:20:27.787714	pay_Np7PAJWoMaNXl1	\N
147	109	154	success	100.0	2024-03-22 04:38:43.287718	2024-03-22 04:39:06.558568	pay_NpGvHNi4Hq8w4d	\N
148	138	\N	success	4000.0	2024-03-22 13:27:29.380172	2024-03-22 13:27:29.380172	pay_No5eFiY8K88d6y	2
149	138	155	success	90.0	2024-03-22 13:28:15.175888	2024-03-22 13:28:26.170162	pay_No5eFiY8K88d6y	\N
150	110	156	pending	500.0	2024-03-22 14:00:43.146965	2024-03-22 14:00:43.146965	\N	\N
151	110	157	pending	500.0	2024-03-22 14:21:45.300461	2024-03-22 14:21:45.300461	\N	\N
152	110	158	pending	500.0	2024-03-22 15:25:54.377149	2024-03-22 15:25:54.377149	\N	\N
153	115	159	success	425.0	2024-03-26 08:55:19.035187	2024-03-26 08:55:42.796867	pay_NqvQphMdT84mig	\N
154	140	160	success	80.0	2024-03-26 13:17:43.677271	2024-03-26 13:18:07.430078	pay_Nqzu1M0Mbm5jqi	\N
155	140	161	success	1240.0	2024-03-26 13:21:02.03257	2024-03-26 13:21:29.961899	pay_NqzxZzTH3I2VW2	\N
156	110	162	pending	80.0	2024-03-27 05:33:11.300001	2024-03-27 05:33:11.300001	\N	\N
157	110	163	pending	80.0	2024-03-27 05:33:27.156407	2024-03-27 05:33:27.156407	\N	\N
158	110	164	success	1060.0	2024-03-27 07:49:18.320375	2024-03-27 07:49:57.299146	pay_NrIqU4bV70o5sS	\N
159	110	165	pending	580.0	2024-03-27 09:07:32.732732	2024-03-27 09:07:32.732732	\N	\N
160	110	166	pending	580.0	2024-03-27 09:08:05.066301	2024-03-27 09:08:05.066301	\N	\N
161	110	167	pending	580.0	2024-03-27 09:08:25.752508	2024-03-27 09:08:25.752508	\N	\N
162	110	168	pending	580.0	2024-03-27 09:11:59.013732	2024-03-27 09:11:59.013732	\N	\N
164	110	170	pending	580.0	2024-03-27 09:22:58.678096	2024-03-27 09:22:58.678096	\N	\N
163	140	169	success	120.0	2024-03-27 09:22:06.566371	2024-03-27 09:26:19.892451	pay_NrKUGIVFepgx54	\N
165	110	171	success	580.0	2024-03-27 09:26:06.277641	2024-03-27 09:26:25.948023	pay_NrKUOr4J6bZMgB	\N
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans (id, name, price, billing_interval, features, created_at, updated_at) FROM stdin;
3	Yearly 	900.0	yearly	<p>Opt for our yearly subscription plan to enjoy uninterrupted access to [Product/Service] for an entire year. With a single payment, you save costs compared to monthly plans, receive continuous updates, and benefit from priority customer support. Secure your subscription today for a seamless experience throughout the year.</p>	2024-02-23 06:13:19.100659	2024-03-22 15:15:38.582754
1	Monthly	300.0	monthly	<p>A monthly subscription is a contract between a customer and a business where the customer pays a recurring fee for products or services. Customers can choose how often and how long they want to receive each offer, and most subscriptions allow them to renew or cancel at any time.</p>	2024-02-23 06:11:39.136092	2024-03-22 15:16:07.80292
2	Quarterly 	500.0	monthly	<p>A quarterly subscription typically refers to a billing and delivery model where customers pay for a product or service every three months. Here are some common features and aspects associated with quarterly subscriptions:</p>	2024-02-23 06:12:34.508779	2024-03-24 09:12:36.514699
\.


--
-- Data for Name: privacy_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privacy_policies (id, title, content, created_at, updated_at) FROM stdin;
1	Privacy policy	<p><strong>Grind&amp;Pound</strong> Private Limited (“Company” "We", "Us", or "Our") is a private limited company with its registered office at 862, Tower 8, Embassy Pristine, Bellandur Bangalore, Karnataka, India, 560102, operating the website www.floryo.com (hereinafter referred to as the "Platform"). We are committed to protecting Your privacy and the information that You share while using the Platform. We value the trust You place in Us. That’s why We maintain the highest security standards for securing the transactions and Your information.</p><p><br></p><p>This privacy policy (“Privacy Policy”) specifies the manner in which personal data and other information is collected, received, stored, processed, disclosed, transferred, dealt with, or otherwise handled by the Company. This Privacy Policy does not apply to information that You provide to, or that is collected by, any third party through the Platform, and any Third-Party Sites (defined below) that You access or use in connection with the Services offered on the Platform.</p><p><br></p><p><span style="color: rgb(230, 0, 0);">By using our service (by visiting our website/Registering on our website, buying our products and services), You (“You”, “Your”, “Yourself” as applicable) accept and agree to be bound by the terms and conditions of this Privacy Policy and consent to the Company collecting, storing, processing, transferring, and sharing information including Your Personal Information in accordance with this Privacy Policy. This Privacy Policy is incorporated into and subject to our Terms of Service (“Terms”) and shall be read harmoniously and in conjunction with them. All capitalized terms used herein however not defined under this Privacy Policy shall have the meaning ascribed to them under the Terms.</span></p><p><br></p><p>This Privacy Policy (i) will be considered to be an electronic record under the Indian data privacy laws including the Information Technology Act, 2000 read with rules and regulations made thereunder; and (ii) will not require any physical, electronic, or digital signature by the Company.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Collection of Information</strong></p><p><br></p><p>You may provide or the Company may collect certain personal information while You register on the Platform and/or use the Services. This includes: (a) Your name, electronic mail address, password, IP address, billing address, shipping address and other relevant details; (b) Your content, received, uploaded or posted using the Platform, including messages, images, videos and feedback; (c) any information provide by You while availing customer support, and (d) information You choose to upload, sync or import from the device on which the Platform is being used (collectively “Personal Information”). All information disclosed by You on the Platform shall be deemed to be shared willingly by You and without any coercion. No liability pertaining to the authenticity, genuineness, misrepresentation, fraud, negligence, etc. of the information disclosed by You shall lie on the Company.</p><p><br></p><p>The Company may collect non-personal information relating to Your activities while accessing the Service or other information from and about the devices through which the Platform is used including SDK/API/JS code version, browser, internet service provider, operating system, browser type, cookie information, timestamp, application identifier, application version, application distribution channel, independent device identifier, Android ad master identifier, network card (MAC) address, and international mobile device identification code (IMEI), the equipment model, the terminal manufacturer, the terminal device operating system version, the session start/stop time, location, language, the time zone and the network state (WiFi and so on).</p><p><br></p><p>In addition to the profile information, You may also tell us Your exact location if You choose to enable Your computer or mobile device to send us location information. The Company may use and store information about Your location to provide features of the Service to You and to improve and customize the Service and provide location-based Services to You. You can withdraw Your consent at any time by disabling the location-tracking functions on Your mobile. However, this may affect Your enjoyment of certain functionalities on the Platform. In addition to the above, We identify and use Your IP address to also help diagnose problems with Our server, resolve such problems and administer the Platform. Your IP address is also used to help identify You and to gather broad demographic information.</p><p><br></p><p><span style="color: rgb(178, 178, 0);">Our servers automatically record information ("Log Data") created by Your use of the Service through the Platform. Log Data may include information such as Your IP address, operating system, the referring web page, pages visited, location, Your mobile carrier, device and application IDs, search terms and the manner of Your interaction with links across the Platform, including email notifications, by clicking redirecting links or through other means. The Company receives Log Data when You interact with the Service. The Company uses Log Data to provide Service, to measure, customize, and improve the Service, and to aid a better user experience. We may also collect data using web beacons, tags, or pixels.</span></p><p><br></p><p>When payment information is being transmitted on or through the Platform, it will be protected by encryption technology. In case You make any payment on the Platform in relation to the Service, You understand and acknowledge that the Company only facilitates the processing of such payment by third-party payment gateway and all financial information including bank account details is collected by such third-party payment gateway and not by the Company. You expressly consent to the sharing of Your information with third party service providers, including payment gateways, to process payments and manage your payment-related information. Hence, the Company cannot guarantee that transmissions of Your payment-related information or Personal Information will always be secure or that unauthorized third parties will never be able to defeat the security measures taken by the Company or the Company’s third-party service providers. The Company will not be liable for any acts or omissions on the part of the payment gateway. You should view the terms of service and the privacy policy of such third-party payment gateway prior to disclosing any sensitive personal information to such third-party</p>	2024-03-20 10:47:52.30674	2024-03-20 10:47:52.30674
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, url, product_id, created_at, updated_at) FROM stdin;
1	\N	3	2024-02-15 11:31:08.152925	2024-02-28 12:52:04.307715
2	\N	3	2024-02-15 11:31:08.161221	2024-02-28 12:52:04.314067
5	\N	3	2024-02-16 05:55:38.779863	2024-02-28 12:52:04.32024
6	\N	3	2024-02-16 06:41:36.095693	2024-02-28 12:52:04.326408
7	\N	4	2024-02-16 06:42:00.444517	2024-02-28 12:53:28.769752
10	\N	4	2024-02-22 11:14:10.222485	2024-02-28 12:53:28.775913
8	\N	2	2024-02-16 06:42:17.069475	2024-02-28 12:54:05.006094
11	\N	2	2024-02-28 12:54:05.006839	2024-02-28 12:54:05.014312
9	\N	1	2024-02-22 11:12:06.692546	2024-02-28 12:54:41.436409
12	\N	1	2024-02-28 12:54:41.437133	2024-02-28 12:54:41.442843
\.


--
-- Data for Name: product_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_properties (id, name, value, product_id, created_at, updated_at) FROM stdin;
1	color 	Green	3	2024-02-15 11:31:08.175319	2024-02-15 11:31:08.175319
2	Type of Packing	Bottle	3	2024-02-15 11:31:08.176404	2024-02-15 11:31:08.176404
3	Piece in one	carton	3	2024-02-15 11:31:08.177373	2024-02-15 11:31:08.177373
4	Color	green	4	2024-03-01 06:16:37.719031	2024-03-01 06:16:37.719031
5	Type Of Packing	packet	4	2024-03-01 06:16:37.72349	2024-03-01 06:16:37.72349
6	Piece In One	single	4	2024-03-01 06:16:37.72477	2024-03-01 06:16:37.72477
7	Color	grey	2	2024-03-01 06:23:02.624693	2024-03-01 06:23:02.624693
8	Packing	packet	2	2024-03-01 06:23:02.625689	2024-03-01 06:23:02.625689
9	per piece	1	2	2024-03-01 06:23:02.626557	2024-03-01 06:23:02.626557
10	color	pink	1	2024-03-01 06:24:46.575333	2024-03-01 06:24:46.575333
11	Type of pack	Bag	1	2024-03-01 06:24:46.576223	2024-03-01 06:24:46.576223
12	per bag	1	1	2024-03-01 06:24:46.577121	2024-03-01 06:24:46.577121
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, available_on, discontinue_on, master_price, cost_price, subcategory_id, created_at, updated_at, net_wt, unit, available_zip_codes) FROM stdin;
1	Popcorn Flour	<p>Sattu is a type of flour made from roasted chana dal, a type of pulse. It is a popular ingredient in North Indian cuisine</p>	2024-02-08 00:13:00	2025-01-06 03:00:00	20.0	30.0	1	2024-02-08 10:22:07.65346	2024-03-13 11:40:15.617924	250	g	{246747,246621,12345}
2	Allison Seed & Grain	<p>Perfectly blended with 100% pure &amp; natural whole grains flours. Contains high quality Wheat, Chana Sattu, Oats, Ragi, Jowar, Bajra &amp; Barley.</p>	2024-02-10 00:04:00	2025-02-07 00:00:00	80.0	100.0	2	2024-02-08 10:23:46.656379	2024-03-13 11:43:09.556933	500	g	{246747,246621,12345}
4	Chapati Flour	<p>100% whole-grain Customized Multigrain Atta! Make your own multigrain perfectly blended with the goodness of high quality wheat, Chana Sattu &amp; choice of millets (Ragi, Bajra, Jowar &amp; Barley).</p>	2024-02-08 01:00:00	2025-02-11 00:00:00	40.0	50.0	2	2024-02-08 10:26:18.247828	2024-03-20 06:53:26.833704	500	g	{"246747,246621,12345,76543"}
3	Whole wheat Flour	<p>Floryo 7 Grain Multigrain Atta (with Chana Sattu) Floryo 7 Grain Multigrain Atta (with Chana Sattu)</p>	2024-03-10 09:10:00	2025-06-25 13:14:00	500.0	600.0	3	2024-02-08 10:24:48.24453	2024-03-24 09:10:10.974444	1	kg	{"246747,246621,12345"}
\.


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referrals (id, referrer_id, referred_user_id, email, created_at, updated_at) FROM stdin;
1	109	109	\N	2024-03-22 13:26:16.329983	2024-03-22 13:26:16.329983
2	138	109	\N	2024-03-22 13:26:56.178171	2024-03-22 13:26:56.178171
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, product_id, content, rating, approved, reviewed_at, created_at, updated_at) FROM stdin;
17	110	3	Best Product Ever	5	f	\N	2024-03-21 12:19:57.609119	2024-03-21 12:19:57.609119
18	115	1	gkg	5	f	\N	2024-03-28 18:00:10.336817	2024-03-28 18:00:10.336817
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20240202040807
20240202042324
20240202042341
20240202043434
20240202043539
20240202043540
20240202065157
20240202103537
20240202105859
20240205110755
20240205110826
20240205110856
20240205110942
20240205111018
20240205111104
20240205111138
20240205112253
20240212040414
20240212044347
20240212070904
20240212071008
20240213120539
20240214082856
20240214082935
20240215083206
20240215083327
20240215091342
20240215093841
20240220092637
20240220103659
20240220105016
20240223054650
20240301071148
20240301094133
20240301102751
20240301105329
20240301112241
20240301113210
20240304073306
20240304074227
20240304075625
20240304075800
20240304130552
20240305105535
20240307133510
20240307133721
20240308045155
20240308051610
20240308060404
20240308123415
20240308125922
20240312111445
20240314055201
20240314061100
20240318043830
20240318043856
20240318110254
20240320095912
20240320100846
20240320101819
20240321053513
20240304045942
20240322121456
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, token, user_id, created_at, updated_at) FROM stdin;
457	35598447d8ae1bf10f37b00ed25cdf78450a7f4cda9cf76fa3e9858ed011c89ff810f546f2079c7d0deed94eac2a7ab1	109	2024-03-13 11:07:43.395574	2024-03-13 11:07:43.395574
458	8c177234274c4ec0385631d44334a24f0d5269f9a04d6bdb0bbb746c05f102b09e745ddc14a196d0462c0301a353f086	109	2024-03-13 11:07:55.07501	2024-03-13 11:07:55.07501
459	969d012ae977528d7153612b4829a944902b4539735ac99d003a98a002c52642805b3b44c61352efd0b73535e90d8ab6	110	2024-03-13 11:08:45.891005	2024-03-13 11:08:45.891005
461	854293e0fecc87da81bae3672881436c3a61ddc1df13ba342f03e15bf4dbd629891b4f486556f964530a06f0f74f8722	110	2024-03-13 11:22:09.656621	2024-03-13 11:22:09.656621
462	38015abc99152d09d35d8adbb77716d58a9af5f322d1ac6825a3733ae612acf6bb354af85dd1ac25508a9bfe475fbc6c	110	2024-03-13 11:22:13.457737	2024-03-13 11:22:13.457737
463	fd7bbd1fba1d7aae3ad5c1e8946348de25907c7056a19e65920fc6f67abf2f528847af5c64b2035a094666cc0c61ad5c	110	2024-03-13 11:39:05.887563	2024-03-13 11:39:05.887563
464	6ef82a5a0a680e4edf2f08def23273851238947991313c23ea80dc473bd0c9bd6e06108bb972e139abe639abd4d51fbf	110	2024-03-13 11:39:12.004113	2024-03-13 11:39:12.004113
465	567cc7afd0e74ae143509521004f50eba074c57eb8e87c0a7900675519da1c2e10b8081ed2e70cbbdf1f5ed9707adf37	110	2024-03-13 12:28:14.307055	2024-03-13 12:28:14.307055
466	d65efcaa8d7b3e5e075d7b48d655383f850b16a41b632f86bb824e4e707e491f3315b4c636677d104100b78881a1d13a	111	2024-03-13 12:31:34.030391	2024-03-13 12:31:34.030391
467	213cf08abb63b443f5adc0e66df765118f24be42542b81de9d0708cc916197cda08adbcdb8fd142610ba7ad3121eaffc	109	2024-03-13 12:31:43.61969	2024-03-13 12:31:43.61969
468	eaa64ba67e8db78076528b847d3a333e65dc45483b56c417d59475d7c4cd759803e52ab4042882089477f499d4bfd5a6	109	2024-03-13 14:00:23.405995	2024-03-13 14:00:23.405995
469	c2ee1dd5abcf27b1226b0c8b4531ed540a1ea5595b0990ba2645db085b87afc12e24bcce026ff26bc05b3d0b684e527a	110	2024-03-13 14:01:36.0616	2024-03-13 14:01:36.0616
470	3ec42a1be84099d5a624cd743515458dde9b808fc34e4ac003994c8f302a181ef095281de72efc33506ecb8fe7a9a955	109	2024-03-13 14:08:25.421647	2024-03-13 14:08:25.421647
471	3f55cc625f37f1d30da7831a3126c46ba7e0a82d2b4689bdfc4c6e04b8c9f889718130dc65f48cb30d36f08ba1ff63a4	110	2024-03-13 14:52:45.580993	2024-03-13 14:52:45.580993
472	dfe0386b1cd0a340baaf39efed8e212dee35410991ca560d0ae0815d422c27dcf0e29d7e1e0f4769065d0126392c7f5f	112	2024-03-13 15:37:44.467999	2024-03-13 15:37:44.467999
473	c18efa9cd4ea6d53b08b4132db351f01cf1c2f4bd13c7b5aa49eb0285de5ce4da3be60990e94de78558d234151914c0d	112	2024-03-13 15:38:20.788949	2024-03-13 15:38:20.788949
474	fb47a7f68674ec0ef0aeee864a9e341cc346b1edaa701eaf2d078ba78559fd524f2ff7987dc4f6858b1ab2449c2ef784	113	2024-03-13 16:07:59.971457	2024-03-13 16:07:59.971457
475	3d7f088baf15676eb9a659a3f235928119dff1d70229bd788d5c011636e538aa2f828711fdc1dd08eacbf2869fdbbbdc	113	2024-03-13 16:08:27.325173	2024-03-13 16:08:27.325173
476	3a25161840c9a53646450f35a2c0855fa8311dbd6c4340e926a8e9b929db67e9fed4708baf6bb23bb512c29d02e480bc	114	2024-03-13 16:12:15.596571	2024-03-13 16:12:15.596571
477	beff4f1750140c600ff9e7b1b393205aded59b0ae96896a2dbd0d51016c5f36e37a80ce11f114cd8900f0b1d7f488ed9	114	2024-03-13 16:12:31.350178	2024-03-13 16:12:31.350178
478	67be8aae167c7e6be5ff60b5232f3c222c74786646b87aaf21d342b7f538738eede782113f7a83e367c078d374de3f48	115	2024-03-14 03:34:03.51054	2024-03-14 03:34:03.51054
479	14ff02d9472dab7f8a0bb82d8957307c34e474c0d8d569f0beee9176df9edc12df0bb84044d22125173b29b46c2bad29	115	2024-03-14 03:34:43.521144	2024-03-14 03:34:43.521144
480	d73a67c571879de3a743f2360a641b17fc54ffc0768370241d459962192b98eb749426c01852d9f0c530028c5f3f1ed8	110	2024-03-14 04:39:54.339738	2024-03-14 04:39:54.339738
481	75c1316e35be86db427a8b800e2c606e37f50cbc713670621100ecc9d25222a1dfbd48d34c1fe70c58627e283dc3c742	110	2024-03-14 04:39:54.645829	2024-03-14 04:39:54.645829
482	2544da6194580edcf978584252fd67c40a4ad7942084c3b8d5e26c5a321d0ec807bff3bfffdc71832df189ae18372d2e	110	2024-03-14 04:39:55.333196	2024-03-14 04:39:55.333196
483	efb9fa1fe8d9a2223bef18988c1ddda0a73e59dc0a2c305a7434c29b5d87465ba859096de98b2047e34c08ddb39aedcc	110	2024-03-14 04:40:05.228765	2024-03-14 04:40:05.228765
484	6755af442a43d64edc7df1453a2cca7c90d1fb1e24ae87c102078a32a0902bb6aff620173d3b225f23bce9e54120766f	109	2024-03-14 04:43:54.473542	2024-03-14 04:43:54.473542
485	1534fee422ee5eba2b9c8ed80e9c275dc540772724877eb86b6ad23362a185bded1160498bf56590b92b7559e5487ed0	110	2024-03-14 04:44:16.286062	2024-03-14 04:44:16.286062
486	b60c843b25b133ffd4c7072a6fdb5124b4ffbef035f5d189c589d71a8acfa7837b60cf4ca23cbd60699df0616bc6ce87	110	2024-03-14 04:44:21.582497	2024-03-14 04:44:21.582497
487	b61940e4d3c3e7f1c97e2e4cf0ce35f4ecaee2026e8a6981c6e914c8b97c4aa35ea2f1a18b8d0281ccb0bcebb3d33821	110	2024-03-14 04:45:16.638888	2024-03-14 04:45:16.638888
488	7fa5893fbd7e2ff16b6df0d59eedcf7242d647c59b68cf063957e58293509d54abfdc11de31f25ec1dccbe06ba903ee0	110	2024-03-14 04:45:21.584426	2024-03-14 04:45:21.584426
489	bb72828d7e7799dc2c175fa798c1a39e81aa9d5bab53d786368f63608680be363ce016f7b849ce0d0fc35876fa8f9686	110	2024-03-14 04:45:26.351786	2024-03-14 04:45:26.351786
490	8bfc016f9b43031169da3165fddaba6569778ccf67cff893b606bf0adc511e7ac6e14887b2b464147c19f82d77f65bc3	115	2024-03-14 05:11:20.411996	2024-03-14 05:11:20.411996
491	c7a5a935e647a2fdf993280b66d76673c84b99c0622a91bf96e936918c6aefe1ddb5141a5a72b46b7c7bf71d017179f4	115	2024-03-14 05:11:24.007496	2024-03-14 05:11:24.007496
492	4c53148c33bd7a823fb12ad8180c5804c357d469df7d80ca15bee9124590dfc24b7f424e5449e6c553e452c25df17920	115	2024-03-14 05:11:55.963487	2024-03-14 05:11:55.963487
493	c5f12e132cdac6e68deb8d9e5764d51486da13a194c6779173b7e862fc13827399996cd23bbf68b7ae115e9dc0539527	115	2024-03-14 05:12:02.629419	2024-03-14 05:12:02.629419
494	9ef109421dc15c035c489981035e2f72f53f56dcd9da3ea3c0eaf9620c13f5d6d1c987895c13d477a7a6cde086b265d0	110	2024-03-14 05:47:24.704159	2024-03-14 05:47:24.704159
495	dce28c404c426a8b2d4e825e7873c9be74df7ff91d47dddcbd44e9097af8567e3bf4682d8b93b9dcb3e86dde5e894515	110	2024-03-14 06:10:06.138728	2024-03-14 06:10:06.138728
496	0b18030c15b917b004c302063cfbdd59bbb6c7bfd05c875f5e7dd4bd5b6be276912d25a7f1c128d1ae6c221e4ac94875	110	2024-03-14 06:11:19.764563	2024-03-14 06:11:19.764563
497	a34bcbb7284bdd92af628acfa40a89374887066e08bf139da933a90a12683d882aee3c358969ea01a07ca7df57c733a1	110	2024-03-14 06:11:25.665882	2024-03-14 06:11:25.665882
498	8cec09b41fdaaa31ea91a2255db281d82b74605cb9945032f314e9372af3e70d8b5db380eb10b222708472b5fc46c04d	116	2024-03-14 06:37:15.190639	2024-03-14 06:37:15.190639
499	0245bd6469c6a331a3e5209fa9ab56bf676aced32f024f05404771b55d69a04becf19ebd8d0f04c82ae89735680a8958	116	2024-03-14 06:37:32.362791	2024-03-14 06:37:32.362791
500	ccbe0632890d25b71051fef4e6f3ebdf4da5323a4595506438073612613b1176352814d663d7c8f6c5c6ff6e7414b6d0	112	2024-03-14 06:46:45.54032	2024-03-14 06:46:45.54032
501	184e95c0c31b7af4e9c777a816a3dbb63a32b2f489cebae393d200c0fa5007393f2ca0ff6465996575041abcca27a42d	110	2024-03-14 06:46:53.130705	2024-03-14 06:46:53.130705
502	d84ea067ed4d5ca3cdd0930111740aa4b970feca80b5d8732ebca4c26f7612d2ce15c03bf5933261d42b6632957e89f0	110	2024-03-14 06:48:37.736589	2024-03-14 06:48:37.736589
503	ebcaec0ec6400de15d1e3b437ab202d3d4ba44da7a62f4e012eee95862a56508b04184e5320d727e9e1b9856382b9989	110	2024-03-14 06:48:40.970514	2024-03-14 06:48:40.970514
504	aa130f18f6e9939c3d1a55d86decb37ed639f056ffdaa0dc0423195ba14e1392fc95d25bc115e4b4daca58a7385d4e91	117	2024-03-14 06:49:59.145497	2024-03-14 06:49:59.145497
505	e00a86f44470bb3bff427bf138f516b0666cb42d990fd1fe31824b37b7aac9b5dc9ee85f962ff6c6b3772f2a02951c81	117	2024-03-14 06:50:29.358375	2024-03-14 06:50:29.358375
506	88c298b468a342e052e9b1e32ca8bb2554c8ebe3f5780a3bfdee482eb825755a53215ceba943b39744fa3ca3dcee585d	109	2024-03-14 07:23:47.957715	2024-03-14 07:23:47.957715
507	6c1fabe78bd63e4475f27cf37f1384b2ba21163e862a20ad88459b513c3a15ccc89c9664004ffd45757accd986fe62f5	118	2024-03-14 10:16:10.940349	2024-03-14 10:16:10.940349
508	6843d4ca62dc0dd0b3ccb7580a69daa3359cba75507ca51c33dc3fee10b19cb3a83d6dcc845090401fd3ceb5b5e9bbc9	115	2024-03-14 11:22:46.641255	2024-03-14 11:22:46.641255
509	778adbd880256f725a368b10b30535948851af83e02030a71e13e8416d22e2be7b0488740d71ebdd9e6f42e86ba9f9e0	115	2024-03-14 11:22:51.876306	2024-03-14 11:22:51.876306
510	65cb3a00beff495e093e6e0cdee8a4c0fb495b66e4597dfa6db7f2b31df65aaa8218834827aec1cc04f0a60d65d5b212	110	2024-03-14 11:25:55.597538	2024-03-14 11:25:55.597538
511	a4087220bb2691a0d4292ac84a999e7546922feb48ae35e070c27ca5e691998caa337a00f9498d49a975d7cf0e86323c	110	2024-03-14 11:26:00.570512	2024-03-14 11:26:00.570512
512	afea2deeb07d525a08ed4c38690d72a921b3127d8497bb6bbb5f30570fd9d06ce6709dafc622796346161e3be7a13be3	119	2024-03-14 11:26:31.950563	2024-03-14 11:26:31.950563
513	f7d50658b3a11e9f42136431c2ff1d65d50380d45b9bf4a3452d3a1e25a1964d6a517097268caaf8094ec49d2aec1510	119	2024-03-14 11:26:59.943607	2024-03-14 11:26:59.943607
514	dfc92de74f40a23f06fe98623c372bc583cfa694fa3969184585a5be5ff43d042ed645c3338a0d7675a6d226495ff8b2	115	2024-03-14 11:40:26.120675	2024-03-14 11:40:26.120675
515	91ebc6f00bf95e61d2301dbac44793249ef9c6b411ba78b70943a711d9f8349d8e72cc64a8acfbcc1c17e3b77e08133a	115	2024-03-14 11:40:28.51374	2024-03-14 11:40:28.51374
516	1a912cc9632bbd6c7fad07b518d950b6827aa58c70b8478968aa74c5e78d7b86040ef2bc6cb876c3704288b1cb66b15c	110	2024-03-14 14:39:03.807037	2024-03-14 14:39:03.807037
517	d6f3446b34c46d305188ae51e17fd5f4641dd5e8c6b028d72555a9548d6dd632c1881ea650db8f0215ce59bdddbf056e	110	2024-03-14 15:52:28.07773	2024-03-14 15:52:28.07773
518	bc41372530ab40a43a98f9ab08d7bfa090af844261a790ab0c549aa6ef2c1b6b68f8a7747f2db4730c46409505cb3b0c	114	2024-03-14 15:52:41.245356	2024-03-14 15:52:41.245356
519	e6b7eba5e91e554237e12af30baaf730a4adb4aca3dbfa0f0602bd3969b6e5bfc5760098ea4954f8dc29558b9e37af82	110	2024-03-14 15:57:48.113744	2024-03-14 15:57:48.113744
520	45f6282676b605646be2f955b0cb3eb8a6533ba04b55371d63f81b3d6bccfffddcd8f51d5951086160ecea2fcb6fd63f	110	2024-03-14 15:58:20.608007	2024-03-14 15:58:20.608007
521	0a5569c6c680d014ced51000c8a56ef552b20284fe70eb16ed488608f9338deec891ed14716b0346b29ab9197ce2b271	110	2024-03-14 15:58:25.710499	2024-03-14 15:58:25.710499
522	77ce003342ac288b1a01cca8ac8afb11ed262bc674232cf307a543565e1885bb0809dd74f957fffa4606f2cd3610e159	120	2024-03-15 04:47:34.428536	2024-03-15 04:47:34.428536
523	2a8f467b8a1b14b1fdbf7ddde591bea85f52fec057d33f493d1a8e3f329348d69752e83591bd68145063b6874c3b6f51	115	2024-03-15 04:58:46.273903	2024-03-15 04:58:46.273903
524	3793b1602d57e7a9decdac9dbbf0393d2e9028ca9cc18033c4a3f552218e1d419230786e48ce45d4dff64df5e0849666	115	2024-03-15 04:58:46.573758	2024-03-15 04:58:46.573758
525	92cd55f0d5ed01a8dfd9ec9861fe3be081e2976bfd6e64c76fdaa8a8d2ad37d4c67eed416feb2da563d99962489964cc	115	2024-03-15 04:58:48.879037	2024-03-15 04:58:48.879037
526	994f56cd25c4706c1df2a99d119e13dd219b74ceb6f4f2f772a1cb35a43b9c1904bf51d45ebed0b703be92e430487974	109	2024-03-15 06:11:05.137116	2024-03-15 06:11:05.137116
527	8a57f890c16cd492f18e071c1e4cfc6cde3af9444af97ef6a215dc6113bfcfd74a5e9183719f30973c00ac8871127952	121	2024-03-15 09:59:23.480596	2024-03-15 09:59:23.480596
528	e0ae9ec6a7008021df21ecd106cc5180d4a2adde12dcf2d3dc59f0b74321c87c086bac20b2e0606ed975c21ce2b380b4	121	2024-03-15 09:59:45.964219	2024-03-15 09:59:45.964219
529	518b3293c58c7d273ba62165ec4b7dcdec41d4ca89ca0e72568b35ab9ee7b0916f9c419c8db61a2d83440b8aace76ce9	122	2024-03-15 10:03:28.612461	2024-03-15 10:03:28.612461
530	027d1b1cea0fc7cb7f4753cad98f096347a855d982c391cf1ccccce0254bb8bf1efc8a24c5bcca4d00a0bdf166ded089	109	2024-03-18 07:17:45.371984	2024-03-18 07:17:45.371984
531	381f74d15d1749ef643deb612face458f7f64131aeece155deef297bc8d558e8b067659b095dfdfffa9ffa8021d1c0a3	121	2024-03-18 07:23:38.281029	2024-03-18 07:23:38.281029
532	c931030543efa0074372b75080a4ddb992f6a70c7a379278e34052675e061939e92f1a0bafcb84312daed169c9d214c3	121	2024-03-18 07:28:08.516813	2024-03-18 07:28:08.516813
533	7258b6cc68eb4bdcd2955de10b08eb1495cd589e5aa187bfb1ec842459fb3c515afbbacc7396063fa05d27456ec25e3a	121	2024-03-18 07:28:12.412886	2024-03-18 07:28:12.412886
534	c714516d1af99577ff0b5fc3fe40a95c827e8498796fba08059b0898ee74a832cad5d03b5e5d663b3c5e11f59d1fed4f	118	2024-03-18 09:53:11.703021	2024-03-18 09:53:11.703021
535	f2c7f395adc3e51ce0e2cc6f551cf4afac0ce5199e736ed9ad248d5e2aa5568f4c3312a0413436031964adddf4718385	118	2024-03-18 11:27:04.273543	2024-03-18 11:27:04.273543
536	66c4983e331fdc8bcce5ce6938b352a21dd76be466f099e56ed2a1330f0c74ae75055919ba382d8d3262e1b16cb5de6a	118	2024-03-18 11:35:22.855631	2024-03-18 11:35:22.855631
537	15cc731328659868509330b2f6b9f483068467be49f9527529894b985cc652d14988a64f3683609b3d5763f514bad470	118	2024-03-18 11:35:26.24347	2024-03-18 11:35:26.24347
538	ab4b9123da3e9d94a2466af006717130757037fd5c4d44df63b483abd3b9c874948ce99d2d7fb7f9e0a608343d5269f1	118	2024-03-19 04:44:45.318237	2024-03-19 04:44:45.318237
539	426af8e7316638910f02b8ea6157cac5fdade7d85a931566716c07598c7d1752646fa940cc538a88f5c4bf0f07fb39ca	118	2024-03-19 04:44:51.507554	2024-03-19 04:44:51.507554
540	876c5659554b642898629cfc0752abe76bb414e3124346c2cdfb7caaa1452f832f4fdabb1ff18b246359ee8405c77f32	110	2024-03-19 05:02:20.952387	2024-03-19 05:02:20.952387
541	bc99540a65bede5f3fd490b7cba733448b6b186dc09c1edc57f62a4791d7cb6e28907f71caca3e1b38aac524f2f59deb	110	2024-03-19 05:05:24.301207	2024-03-19 05:05:24.301207
542	65ab72174cbf502ac1304d5df4f67d116a8ce78b91220cd9a7efff5b3c8650ce004ea2cc550ac076204a29c53c0766ac	110	2024-03-19 05:10:06.004588	2024-03-19 05:10:06.004588
543	e32b81a90bb11a7a750f3c5e436e6dc3f6281a9db72c5ac4a00247e26d4fd47bdf62013e18b6ab326eb463fc99c98f5c	110	2024-03-19 05:10:10.090666	2024-03-19 05:10:10.090666
544	9c5b8a53937f5b14454ba1796e1356a5cc82530e431f863e6142f5f4483b67d5f02bf240c4c4bead4a1c71f78efa5660	123	2024-03-19 08:58:24.311349	2024-03-19 08:58:24.311349
545	c43acb61ca4284da4cddc79aa9633975c8dce4dff0a66fc1db388126dd7fe2c01e7927bd80a34a60a31f6c6775806cab	124	2024-03-19 10:16:10.776692	2024-03-19 10:16:10.776692
546	c8952bcbdc42f966c4900ad63a302999aafbae6292a514d5c3bfece1452c905d3122d5c0fb6d14674b5d52496d2a8603	125	2024-03-19 10:18:32.861831	2024-03-19 10:18:32.861831
547	a4a45be3ab2a3f2a1e78b81fd0293cad8d69377f66ffc928d4e26aba620dc1104b36cedd4fb8b914ba6b5bf73e7f49fc	125	2024-03-19 10:20:24.305589	2024-03-19 10:20:24.305589
548	54cfef120db5185d040eb0be5dad53c5ddc22c9793eeabf11d86e87c6dab1d7a0fa727c686e7e9f523f358a7aabf3aca	125	2024-03-19 11:45:18.656287	2024-03-19 11:45:18.656287
549	b58e3a1cb1a8c8c5eb7ca62c39a90f0d72f086dbda5b7f79d5584576727a1d95d21d0258b2721e6c0b671813726f77af	125	2024-03-19 11:45:23.065114	2024-03-19 11:45:23.065114
550	8b132c2ebc2c41f8a426d5957f51cf2267a3dcd7c07525cbb3b6e4a5001fda15454742c341926aa4b27e4e7296428d9b	110	2024-03-19 13:43:49.095999	2024-03-19 13:43:49.095999
551	c80b43b0f1df95807e7250698a2cbf51355e177ab78e6ad7fc70ae1c8184dadb8c1ad0cbf19dc9ee854c061f500b075c	110	2024-03-19 13:49:53.82326	2024-03-19 13:49:53.82326
552	de2609c9b8f78c96fdaf4b572e23f064d8647461f011c1629d011060dbe771aa8fb27c4d4733ff153b3bfd88108e1513	118	2024-03-19 13:59:23.906854	2024-03-19 13:59:23.906854
553	8633a93cff0b9ec5a83939a26fe8dd25b2854ef87d4a06aca55c803ce27c1aa83d3ddd06b5c50cdd520d0cc7f3a2d873	110	2024-03-20 08:05:02.854542	2024-03-20 08:05:02.854542
554	0784b6e611568ae618c0b23b582fa5885d3ce84991751497242a4081006b0b5982495a504803da980d6624a2f4c9cbbf	110	2024-03-20 08:05:06.619512	2024-03-20 08:05:06.619512
555	f1db7aeb21f8fa14236de40bcef6d821ed601bbdcba3cdcfd93a685501172bd80963c42051838c725f898b4f25620c7d	110	2024-03-20 08:05:07.106057	2024-03-20 08:05:07.106057
556	4f0ef991e4142de9caeed980a738c76d6494145f00382a9e4c3a80d3493408abcd5bcb8f99969a624e23a0c8d5c63a02	115	2024-03-20 11:16:21.430577	2024-03-20 11:16:21.430577
557	5ab03a2daca2ce8f2c91f43062c8118cc08f628a79d91b60ea4ae3b455d8c824a7ee1851bd698c5bded261210271e8df	115	2024-03-20 11:16:31.495061	2024-03-20 11:16:31.495061
558	a6852d95058d3358199fd4d2270e26dcd2f43df4cc4337f9e4db61d0ef967cbf70b99bc01026c221849e7e0a39d971b5	110	2024-03-21 04:01:36.86823	2024-03-21 04:01:36.86823
559	e63e165bcc28e16bf071516d204a430cf755e01adad34455541f901cc72192392f61d76a032c8e653a0a300a3df7cc26	110	2024-03-21 04:01:42.384181	2024-03-21 04:01:42.384181
560	6960c1e48f32ecdf0b290486fd47a89fd3a0fb2e6d482e1c89727c62a9fc2e19fcbe82024271a8af3d813da5edf231bf	110	2024-03-21 04:39:30.826785	2024-03-21 04:39:30.826785
561	f9bb265bcd90d5884e588d54e90636da90eb4e39c89f93098d33437a661cf52769968898f782c85ca5729b1cf1a55330	126	2024-03-21 04:49:29.359528	2024-03-21 04:49:29.359528
562	0241fe1a637ecedbbf1838142bbd54b334e697438e8d995c4138931856de941651bb793527b114946e31d519bcd73acc	110	2024-03-21 04:52:50.169221	2024-03-21 04:52:50.169221
563	9a13491ef5dd0a527d1c651ae3ba5960244b7bf5c11a65c7f71d28e7d323e85033cdddc5cf9e106be30f72cb3161c6ec	110	2024-03-21 04:52:53.559727	2024-03-21 04:52:53.559727
564	92197950f45349beb255870029905adf7e5cc1d8b46632e21ccee2bb0a0214544bb2d1a1a8d568e3afde4bad929d0849	115	2024-03-21 04:53:59.919593	2024-03-21 04:53:59.919593
565	e07bc747300964e91ddb86efa82a0fb14af2133a934403a4686784a43fb558236f9d3f406f87224516ec93e672d2393b	115	2024-03-21 04:54:05.491926	2024-03-21 04:54:05.491926
566	7dcec8d76975ce104a5b460ccae96d3f9deb70c11b3dda976a054779cef5f86227858b8d2b1e7ded3a29de07ae957e60	109	2024-03-21 05:14:39.960522	2024-03-21 05:14:39.960522
567	315841d0a6590bbfc395fa798d6c404cc5af0e81437961e08627f95ff3e0ccd705451a3c65fb12aad1959593270a952e	109	2024-03-21 05:16:12.879159	2024-03-21 05:16:12.879159
568	50a1520027e103f0fb5ea1b3a46a8b6e04640c111ddb43b19aa03c0bd53b35064fbdd8ad64ff2ecb7920d489878515f5	109	2024-03-21 05:16:17.911461	2024-03-21 05:16:17.911461
569	2daef24c068710dfc42c49a6e80fdc4843c8cc81826d6a34d72a4689c7122f2128e747cdcfd3152e713b895b512efafd	127	2024-03-21 05:18:23.769001	2024-03-21 05:18:23.769001
570	25b153250bb23c9421a96f7f43bcc8b947afe0333a28418f5ff31c84959abec5e26a259e12da4527e15c394444091aed	128	2024-03-21 05:20:11.826794	2024-03-21 05:20:11.826794
571	e5642ad44994605d71d3f0aeed83ea0a9d5956ca2804b049c0a96eb37c01e04dadbfd09246836e6be587dbc171c2db06	128	2024-03-21 05:21:27.441407	2024-03-21 05:21:27.441407
572	7c35bde4277b46a444ab0b6a7842ad6d6d03dbe9638bf3b50af77836f9eb5db7e673ebb03a8e332b9a3c64a8e2f2900d	110	2024-03-21 06:29:41.329007	2024-03-21 06:29:41.329007
573	4f376a7aab483355ead04b716f1e386e2ac3a9d431f35629db1c3c044e6c8cf518358c1da214d3150da6680e7514d18d	129	2024-03-21 06:41:53.760824	2024-03-21 06:41:53.760824
574	d4238480398b0264b5b9f5693548b5021ec56ce80675a140632460d312ad9b7e2a6e84fc994e29652c9af249c15197e4	130	2024-03-21 06:42:22.962558	2024-03-21 06:42:22.962558
575	6bcc8d0eac2629d6d115adb638417979b6dc4637b9de69b1b0350f6f417d88e31478eccdcf2fd04aee11a7c8b038cd95	131	2024-03-21 06:42:50.743348	2024-03-21 06:42:50.743348
576	e026386cd4f1248843cfd139e68664654efe021c390019fe06b123bb00cbb0f0ead5645f29d7703ce13a4449dae2c694	132	2024-03-21 06:44:59.762499	2024-03-21 06:44:59.762499
577	811bfb02acc2df6a9e0525dcff6da984ed5aa726ebbd9ebfa554a16d52f2835137d1fac0c590af7ac88d9895af366224	110	2024-03-21 06:46:23.581482	2024-03-21 06:46:23.581482
578	a864fdd09aa246cceb53754725df22de8771c33c42aea8aaceb75557397d3f41c690ed338089be1d042bb6df35ebff08	110	2024-03-21 06:48:51.141112	2024-03-21 06:48:51.141112
579	2d82c1d7d19951bc745ae4658b1d0e3801c334fcb3bb25d3a425b64a34ef8294967d6660fd5d347e4eb92ab29dcac762	110	2024-03-21 06:57:50.58828	2024-03-21 06:57:50.58828
580	351d95780db1e981eb7f25d6c581bc745b1128c6e07dbe1524cf712a32077e3082df533a660762027be6883860873787	110	2024-03-21 07:09:27.700043	2024-03-21 07:09:27.700043
581	91d7aab82f31bd1b898d4d305e4d33c26ba49613949076c125cc1e94cadc5dd6daee3ad843031181cbd38f5438216a42	110	2024-03-21 07:09:42.044778	2024-03-21 07:09:42.044778
582	1dfdbc08414b728d12fcb37f8312b1e1581128112918a40dadb4f4fcb46a959fd53ef287bbd03e1ceb335ca698fc5f7c	110	2024-03-21 07:09:55.288034	2024-03-21 07:09:55.288034
583	ecc3c4f97000c30b370ab042f019926fc7f39e20d1eb8a84f9ccc153ec3832d2c18d0e36fb12243c47e4e441fe904e8d	110	2024-03-21 07:10:49.63338	2024-03-21 07:10:49.63338
584	a71e62645452cfc4b857a909e7cfbd1eb900b63996f913f3ec33776689bc44a45d19a8edc5d3f4bbe3267b358c387824	109	2024-03-21 09:02:27.08671	2024-03-21 09:02:27.08671
585	4492e202410840b14d52c9a22a9a99a58f0bd4b9d11e96df26957933bb66d2f83e2e67f8401a5d6b8fba931d8e44fa0d	110	2024-03-21 09:02:34.663709	2024-03-21 09:02:34.663709
586	0c2d6449d45f0f4ed8b22f91263a56cd3debb93acc2c034033769ba7d91ec3d4e284d586d8797d6a66216b0012cd9755	109	2024-03-21 09:30:33.698092	2024-03-21 09:30:33.698092
587	3d7f5b65503ea701f7453e3044416e4784d93185991d9817f0e5d01ef898b3fda469d2d6877aca816bd896fa2c754d1c	109	2024-03-21 10:52:59.275018	2024-03-21 10:52:59.275018
588	36d9b898af0cbe794dec29655e77384428de9c73fc832f5990340ce3409e9170cd17fd53acd4ffc95afab0daff21f918	110	2024-03-21 10:53:07.384321	2024-03-21 10:53:07.384321
589	56b24444d99c9da2326c6dec8c7ea7bffdd7eaa76e1c3614f8e2c6b1b6df8a3e6ccbff7ed36483bf230bbee70f307f89	133	2024-03-21 13:51:09.988827	2024-03-21 13:51:09.988827
590	a717cfb942350c7ea188f89a8799899c9ef49e734a40fe028b2eb28196f53c0899f4af6c8d4b463e3969f1df55f52e40	134	2024-03-21 13:59:59.511215	2024-03-21 13:59:59.511215
591	8a7941572c99d35e0e3f3490aa72f95fc745efae1410b591d581fa02d49a1faf058ed193c77126b1023f5be53606422e	135	2024-03-21 14:01:29.985012	2024-03-21 14:01:29.985012
592	9fea8e36984ce204e210d7d3bbb98285d99e1d4790e160f961b2a53d56dce6c68dfe983a3ade9866465603a870996fe5	110	2024-03-21 14:02:38.558034	2024-03-21 14:02:38.558034
593	f1f114a4e82560aa4d9d5144d6f687faabbd691a248ef36b07dce279bcb11b9de0ff53fdbe33634398bb0ae4b848ec3e	110	2024-03-21 14:02:42.608702	2024-03-21 14:02:42.608702
594	6c0294132ec6baa99bb2aaf65516d9a6f971286c036430ae10c0b17f2536157a9e709e014bcaaef3b27a736548014e39	127	2024-03-21 14:10:47.22059	2024-03-21 14:10:47.22059
595	fbc744e5cc863f7fc2afc8fa1d7d39bc1d4d11b937602610fd147dac355bb9300e720c57cc365d15c3f8cacb8f016651	110	2024-03-21 14:12:34.497581	2024-03-21 14:12:34.497581
596	d1706bacf8982421259aeb81e2ab84e0e946de5a4017c5636aa9d6c12264d0416d8713ab06d7a7c5eec8a09039dd353d	110	2024-03-21 14:12:36.922013	2024-03-21 14:12:36.922013
597	815feeefdf6c91ee67ed00d14b9ac6697cc5d193d41fd98c59fe5b495711b2399fb6c8fba9cb9a778525bc6b748bd82a	110	2024-03-21 14:16:22.832431	2024-03-21 14:16:22.832431
598	a73d84919f6224873bd0c8dc09ff7a2f4c105b1f566859f7f58a330979c78a926657a49e6d4f0250593089132880aa7f	110	2024-03-21 14:17:14.911058	2024-03-21 14:17:14.911058
599	c7e4c8a9707efc585b5f8a89d2008e90fd319e0159a62452b019c1a20d1b6ec48f1d12e1093ae4ccd26e2189368e6d2e	110	2024-03-21 14:19:45.045221	2024-03-21 14:19:45.045221
600	90df1d6598d18ba058aadf4cdeb34d415bd54792120fda0de8d41443cba1fe36de1e9768e25de5d75f8aff05ecdda055	110	2024-03-21 14:22:36.94398	2024-03-21 14:22:36.94398
601	ba891843ceca81d8314ad9f04436d3139b24d035533314667f2b3a38c97907b556038bbeaf5ebc19115d5db80ba56144	110	2024-03-21 14:25:00.020211	2024-03-21 14:25:00.020211
602	cf19116af40931e8ccb36530f2b7522c65fe634956ad8a6691e284d88798a892e729e2f5bf3b5d3dc13384f80ff17caf	110	2024-03-21 14:30:59.999492	2024-03-21 14:30:59.999492
603	32ebd9d6d0359849757dc9de3353f566654b742384c2c509d08e4c2463e82bfaca1fcf02f6c1ff3022e86d62c9b8d5d2	110	2024-03-21 14:31:12.11049	2024-03-21 14:31:12.11049
604	5b951c4dc316ed8e9f480477140eac551a7d98a655a889e9bb8b11c2e640cbe206411bdd65530b85ed96575a672537e1	127	2024-03-22 03:59:25.033577	2024-03-22 03:59:25.033577
605	5359411b0215eb73013ef3a5c43e5c4edf5229935d4e7e43abeb975ca0274ec75b89c589014b6cbe0d55966cde3c70de	110	2024-03-22 04:01:13.681928	2024-03-22 04:01:13.681928
606	47af6f8ae422ce74fd71039e8dfe39bd83f9ddafb311ea022aaff5972a15a96d696d89886d5ad8faf304a7a0067dfd6a	110	2024-03-22 04:01:16.473096	2024-03-22 04:01:16.473096
607	5cd38274604776e03cbe08238ee33b78ed69e2f2d7864a8fc7a631635d4f92b1ed2d70bf68c40d726924d52c35c80c56	118	2024-03-22 05:15:40.561137	2024-03-22 05:15:40.561137
608	ecc1b27b3ee1afb3ba715b9b165d019c06de1ed4d06f9756de918a6a3a54a8bd1492743468c33b965cb7c79bc984df3a	136	2024-03-22 05:44:57.472184	2024-03-22 05:44:57.472184
609	de0249b64fd9f4dfe7c08ed023d0d602bcaf840cfe8e020fe6ad19955d6ee4148ee8b152df9042e80589b56ec36c4c22	110	2024-03-22 10:50:02.678073	2024-03-22 10:50:02.678073
610	0283ca4178f4ddef20d68e785849ad2ca387f2341e0bc9b8fe9a61df1eb6d432feff9cf3b5aba6ffadac791da1b148d3	110	2024-03-22 10:50:07.353548	2024-03-22 10:50:07.353548
611	e7a59fe5bb305a8b20b780c6e1bb28ff9d00ed2ea195c4fc5d27e406636a9ddaa0d1aab11f0c4abfac4005ec4ea835af	109	2024-03-22 12:35:49.183404	2024-03-22 12:35:49.183404
613	b59e6a520b9b25852cb3b509aa0ef762f4953910a959451833634ac2dd95ec365f8ffa1af55bb93aa606e93a523e560c	109	2024-03-22 13:20:31.913512	2024-03-22 13:20:31.913512
614	50476397107aac640bbf459aba0d9b4c73176bca54404973af5c10acce27574ef5597f08fab6579e0621a59e3ba8200c	138	2024-03-22 13:26:56.176044	2024-03-22 13:26:56.176044
615	f8c0a29896d9b9286ba6ec69d85d1e8614f3d9c87a3ea2243c293f2362dc8dd9b5bf01b0b5ea530b87486f661fc32060	138	2024-03-22 13:27:08.057851	2024-03-22 13:27:08.057851
616	eed3f961af10043909d64ec0d1ceb75037e3e35dc73556a7c045b3f14518fb9b2e12a2bac7b31c6d1bf27c64ff7df137	110	2024-03-26 03:43:30.246682	2024-03-26 03:43:30.246682
617	1f3f4ca1c1278fb9cef1d100b43e1055febdf607d247049cc81a920d0d44bcbdbd231aa2bf71b3d620c17b6caa8540db	110	2024-03-26 03:43:33.698076	2024-03-26 03:43:33.698076
618	63ce5d20fa025f40c7eec7f1290c3e8b874a0516bd1eb40852b2bd34cbc0d0a6e6aed4a07983027219c6ec72ff832342	110	2024-03-26 04:31:39.67658	2024-03-26 04:31:39.67658
619	f8bb845b4924f3a1c718fb24aa5dd7ae5a9f661029ebff7a32f196a69f13a0d1aefdfe0775cde07f5f348ca59f8e75ae	139	2024-03-26 04:36:25.351543	2024-03-26 04:36:25.351543
620	5b07e55736b01ad4aa09a1624274a56bb06c09d7456f8749dc216f7cd7d8903ae5110b0f4a59c862bb9b5379a8dfa7dd	139	2024-03-26 04:37:03.90308	2024-03-26 04:37:03.90308
621	4d0d48bfddceec6ed2c85f20d3989ec2c94f60d49fa08a48d65376ca94b86fa216274b3856199f4da7ce91fbed7a4e74	118	2024-03-26 07:07:05.511314	2024-03-26 07:07:05.511314
622	725d85368b888c605555f407cd4e47ffd078302545dfaf554d064b50ccb2f41a794042db5fa3c155794daf2db47de8d9	118	2024-03-26 07:34:40.304549	2024-03-26 07:34:40.304549
623	2751a02646752ef54993596a952f2761329a0adff8ad244e4b7c4302406187088e30145ee82955a374da0be399f3679e	118	2024-03-26 07:37:14.276543	2024-03-26 07:37:14.276543
624	8d22be71ae8b785fa244bb9bb44b854ea0d9fe0a693e0bfd1013f8b1142ee5058c6998a9eefcc0dcc858b6d31ecc9748	110	2024-03-26 07:37:40.744812	2024-03-26 07:37:40.744812
625	683523de0ae700fa837ae85fb55374e04418f58cbf2c83115289567e138c25bf423af022dc37356d7c8141a2aae3cc74	110	2024-03-26 07:37:43.64082	2024-03-26 07:37:43.64082
626	8e26592d2dc0143faeb98210ea5a9448a56783fa6c6dce4b30556a552cbcd7704fd4d1f21a05acd5c96e5de854e875ce	110	2024-03-26 07:40:33.514664	2024-03-26 07:40:33.514664
627	45349625eb47a306a453520b5d06f61f3fab7181fa7461d5a386383f40146dedda2e9c3304e1f71221f811e3896e37a0	110	2024-03-26 07:40:37.503324	2024-03-26 07:40:37.503324
628	e0d8350dbbb69b0500fc25013b31457e0e584a4625363fa11a5759546b4e0935e9b02bb9f78333c04bca19234f67bcf9	118	2024-03-26 07:42:23.407382	2024-03-26 07:42:23.407382
629	97f70d217b5278e0c1c50a6ce49833afaf92c6719009cdcfc669f0576493ccce7fb65270d880c6bee7a87cf80cbb5d11	118	2024-03-26 07:43:02.864661	2024-03-26 07:43:02.864661
630	18483ce9f75ee0cfbb2ca804d15bbdd783cc5072148fc45c6dface341f6d2d3b3ca9bb52c35ca8096690fa69b23051d1	118	2024-03-26 07:43:37.583591	2024-03-26 07:43:37.583591
631	a585ce97c3bd318c120a1a2486cddceb939e62bae07a6bafe8a25e06aaa9782b486cdbb5facc9f8e8c9f611d18452632	115	2024-03-26 08:53:50.118377	2024-03-26 08:53:50.118377
632	d862360a4c3234711d5662d8f8d73b18fd960bf8434e2f803ce4965443708272f5d1d805cb57b352ad2eeb5f8d6efd08	115	2024-03-26 08:53:52.678932	2024-03-26 08:53:52.678932
633	0fe152993a4dc011bfec29421f928bb33fcf2d09f07514ee05ac8ef694c90f525eabd0a5eb6a2762d284c6fed6135a9d	118	2024-03-26 12:07:21.866385	2024-03-26 12:07:21.866385
634	b41ebc2ce0e6d30b37afe17df8a10092d9cf1bef800905156e0c899ac1bc1c213ffe04b8784b6414cb8c312e6408ea9d	140	2024-03-26 12:40:10.362538	2024-03-26 12:40:10.362538
635	321ff7614e08a8c21d7f3226d15c413d5212d4f184c327a3dfb50c9a994875edde9389269d19594e98949ebc1526681a	140	2024-03-26 12:40:41.113929	2024-03-26 12:40:41.113929
636	27097226170bff30d2fb6c710c862ebb0fa78d042bfc942f00ec464d914e11ffbf3dd72edfc3417fdabd39c82c7f54a4	118	2024-03-26 14:36:31.758607	2024-03-26 14:36:31.758607
637	2115b76835ee26b9aa00fe9277899853ff285d01d8adf60cc208cb4a5bd5c659e4249f3c25944836b139c88476b3d927	118	2024-03-26 14:36:36.547069	2024-03-26 14:36:36.547069
638	82b503ae2e33df129792fc0c9dbae75d1a1b8043b70bc3bac3ce78208262d28b821d4b8126d93c7765e1162f11c3934d	127	2024-03-27 05:31:31.910293	2024-03-27 05:31:31.910293
639	07a6cf4717f0a056a9253bb768b5074cf622cf59cf649d6794c40db96c85f154f1a2aedb642b6bd552f8574599f80580	110	2024-03-27 05:32:39.86553	2024-03-27 05:32:39.86553
640	33a137182ff209b302123de0adcd64493de176c37d803b3152c223eeba9acc5db9c3afd7a0af0c5a3d47860cebd71f46	110	2024-03-27 05:32:41.524805	2024-03-27 05:32:41.524805
641	e37c8e311f06d26f2ed89c8c920c57afbe5906190c52c15dc833707d29fea29f135e077ed95028f82ce7fdfd10bda246	110	2024-03-27 05:32:45.395879	2024-03-27 05:32:45.395879
642	453169aa7aabc6731bbdad7d1971ff0b39ef6123b924967396b376a9f3ed382bb15797cf355696b481dc6ccaec2a52d4	127	2024-03-27 07:42:59.767059	2024-03-27 07:42:59.767059
643	5e1b61ec48178e5267c039035a83f2d150847c4e29cc3c88071fc762165ea69f99f4efcfae473bfafabab6599a9b7ff3	141	2024-03-27 07:44:54.427478	2024-03-27 07:44:54.427478
644	6ff5eb0223a6070131709ab31e6eed73db211794803e0ae4cf6db9c4b4d989de4252e7e659f7a682ad7b8cbc9ad3dc0f	110	2024-03-27 07:47:14.042819	2024-03-27 07:47:14.042819
645	3237e367f179c1120d835e14cc4d852bf63216585a13f1fd9674f19910142f7ab2b0e7e7af81ec89e7d9473def3651c5	110	2024-03-27 07:47:16.316728	2024-03-27 07:47:16.316728
646	08e16765dfa672b70ff9a99432314ab43e844042e406d64ac165af0a7d04610fe5849c38ca18e57eef182984b14de718	110	2024-03-27 07:47:16.679913	2024-03-27 07:47:16.679913
647	35ea1934db8a3be359a865afed594e0286e8f57cd5914196005957599441baa0ff4ff45fb861e56fb6627c60bfcd3fd5	127	2024-03-27 09:04:02.165686	2024-03-27 09:04:02.165686
648	31465382b28e062b35d5c2507056a005bcfe86df5d6c289de186c4bef4ff7809af57754a399763cdecf18a16fb184393	110	2024-03-27 09:06:19.847332	2024-03-27 09:06:19.847332
649	eabad223e95d1ad26072e62f5b3430e26e69d59771777e3d2ad5953c68eb93c22e267b874cc8415f6d1499b9e823a93a	110	2024-03-27 09:06:24.34764	2024-03-27 09:06:24.34764
650	0403535b012cdd4d46667e380800265e060e513e5d6152f408fe714dca1cf0807c85d16c909b69f92581df000b24d398	110	2024-03-28 01:47:09.246521	2024-03-28 01:47:09.246521
651	31f1f880225a1a3030bf1606310a138923cd6f9804466691068022db259e085623d1569d4193fd00463841807ff65eb7	110	2024-03-28 01:47:12.953602	2024-03-28 01:47:12.953602
652	15f163024ccab6e1a0da9b7d9e38b57da3fb09b3798fb73caec2d4bb979a2bb8d5b365dfc96b5d33a2d0ed2eca5e1837	127	2024-03-28 07:26:31.845639	2024-03-28 07:26:31.845639
653	aaff8583ecd7c8e1eef51f8e0b5ca260b06232df069e1cbde2eeb40194c431cba30ba6912e7d8a9be6abb8cf077d6f55	110	2024-03-28 07:31:18.89044	2024-03-28 07:31:18.89044
654	226b28a0983f02e039f79c4f95342d6dddd81ce4460c6614f94b1c256c6b2b5a0d93aa0f49da1dfe01de1961b9cdf4dd	110	2024-03-28 07:31:21.640628	2024-03-28 07:31:21.640628
655	e31287715a4c5f3da622c061a69ea02678f900a723c936bef994435a85c7df1e058921c37fbc4949c54eccad0aa87909	127	2024-03-28 08:44:32.451769	2024-03-28 08:44:32.451769
656	8f6f9e9d88a2ca9ab8fd24f0dad41936168433cea5c04658ec9271fd8a50afc0fb34ca70e2b459e2dfd9356f39416e0a	110	2024-03-28 08:45:01.882639	2024-03-28 08:45:01.882639
657	e78943125f3e4144017af6229fbc38c2d0eb1ecbc768767828380f27f03b931206422998124ebd1146d55e7c100e9b6f	110	2024-03-28 08:45:04.407478	2024-03-28 08:45:04.407478
658	ca7e0e70ea9dd659713c8e3cfffae29dbc7a3e92c775a57f0e93c80b12c8341e153fb5b5e4705ede5fa6d2469254d95c	110	2024-03-28 12:06:18.887067	2024-03-28 12:06:18.887067
659	a11566e876bcd138be23bd73fb822ddfeb83ee7959b92811baa1d43634694f04a5aab1d0fa85e4a0def9a4d833c4712a	110	2024-03-28 12:06:22.29215	2024-03-28 12:06:22.29215
660	ca3fb38526f7926986d8212c75d458966460c8c82fa00ab8e2ddc3b2c13653b51cc2f840025903169cc01289bad3a598	142	2024-03-28 12:19:33.068892	2024-03-28 12:19:33.068892
661	297281ec3a31fe1d319441bf14a2e42ba6677b4580f919204335815e6966169bbb22958da92f3ee94478a1d7e0c6c82b	142	2024-03-28 14:12:19.071804	2024-03-28 14:12:19.071804
662	65319d75a713244335c191d46d1765def8bae8da47e594dfe13df81488a4d4e34e77eb42cce0400e46c60900f161ad2d	110	2024-03-28 15:58:12.559566	2024-03-28 15:58:12.559566
663	97decf82cc657cecbb320057634c51bf8b6cf56343925cdeab1d116ee877414694014d6977bc8da51a00065545cb6f43	110	2024-03-28 15:58:16.443074	2024-03-28 15:58:16.443074
664	4758a0cc274673b057309c93aebe8949b0ea53db708a506e4aaa62ee3a5bfbcb26819d7a8055098cb00aea2e37f5a157	127	2024-03-28 16:13:47.707802	2024-03-28 16:13:47.707802
665	c68ac52f0c3ec41189db286d351a13f95e81500b8302cb889acb35fa8a25aa373e32ec4f1d6a5002ac800e7ee0f81c13	127	2024-03-28 16:14:05.364296	2024-03-28 16:14:05.364296
666	ffa7c8d28f487eaeb69690021cf3a564e74bd9fbde4d6afe19a4fcdc032cc96370a5824e127ee569f13aa20e54dc9a6f	110	2024-03-28 16:18:23.521872	2024-03-28 16:18:23.521872
667	9d525ef2dbb12a9ce1110af99bc18d43cd10f78f36e7911163a3400f3685e6dd282b49132a4d5795bdf0a0594f99c7c6	110	2024-03-28 16:18:27.296413	2024-03-28 16:18:27.296413
\.


--
-- Data for Name: shipping_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_addresses (id, user_id, first_name, address_line_1, address_line_2, city, state, postal_code, country, created_at, updated_at, country_code, phone_number, mail, title, last_name, "default") FROM stdin;
45	125	Aakash	gfffgfgfgfg	\N	null	\N	454545	\N	2024-03-19 10:22:48.729658	2024-03-19 10:22:48.729658	+91	1234569999	tester123@pixoatic.com	Mr.	XY	\N
32	109	John	123 Main St	Apt 456	Cityville	CA	12345	USA	2024-03-14 04:44:25.817709	2024-03-14 04:44:25.817709	+91	9557545452	abhishek.k2@gmail.com	Mr.	Doe	t
34	117	Rajendra	\N	\N	\N	Haryana	\N	India	2024-03-14 10:43:42.681942	2024-03-14 10:43:42.681942	\N	4534534534	\N	Mr.		\N
35	117	Rajendra	Kirti Nagar sector 15 	\N	Gurgaon	Haryana	122001	India	2024-03-14 11:01:46.887633	2024-03-14 11:01:46.887633	+91	4534534534	rajendra@gmail.com	Mr.		\N
36	117	Rajendra	Kirti Nagar sector 15 	\N	Gurgaon	Haryana	122001	India	2024-03-14 11:02:43.717177	2024-03-14 11:02:43.717177	+91	4534534534	rajendra@gmail.com	Mr.		\N
37	117	Rajendra	sector 14, gurgao	\N	sdfsdfs	Haryana	121212	India	2024-03-14 11:08:32.871033	2024-03-14 11:08:32.871033	+91	4534534534	ghsadgsh@jshjd.sd	Mr.		f
38	117	Rajendra	sector 14, gurgao	\N	sdfsdfs	Haryana	121212	India	2024-03-14 11:09:30.361273	2024-03-14 11:09:30.361273	+91	4534534534	ghsadgsh@jshjd.sd	Mr.		f
39	117	Rajendra	sdfsdf,dsfds ,fsdf	\N	fsdfdsfdsf	dfdsfds	122222	dfdsfds	2024-03-14 11:18:04.785118	2024-03-14 11:18:04.785118	+91	4534534534	sdsds@dfsd.dsf	Mr.	Kumar	t
42	114	Rajendra	Kirti Nagar, Sector 15	\N	Gurugram	Haryana	122001	India	2024-03-14 15:21:06.064927	2024-03-14 15:21:06.064927	+91	8824687840	rajendra.k@pixoatic.com	Mr.	Kumar	f
43	115	a	dhfdlkfld	\N	23242	sad	224182	dfdfd	2024-03-14 17:34:44.739612	2024-03-14 17:34:44.739612	+91	8146972215	a@gmail.com	Mr.	a	f
44	121	Ashish	vill pure jigna mishra post lakhauri thanseenpur sohawal	\N	delhi	defhkrlf	224182	India	2024-03-18 05:00:42.108666	2024-03-18 05:00:42.108666	+91	8146972215	a@gmail.com	Mr.	mishra	f
46	110	Rajendra	kirti nagar	\N	Gurgaon	Haryana	122001	India	2024-03-21 07:47:41.173054	2024-03-21 07:47:41.173054	+91	4534534534	rajendera@gmail.com	Mr.	Kumar	f
47	110	Prashant	gurgaon, haryana	\N	Gurgaon	Haryana	122001	India	2024-03-26 12:39:31.611144	2024-03-26 12:39:31.611144	+91	4534534534	prashant@gmail.com	Mr.	Sharma	t
49	110	Bhavesh	test	\N	dd	Gujarat	123	India	2024-03-28 08:31:00.236297	2024-03-28 08:31:00.236297	+91	8140743714	bhavehs12@gmail.com	Mr.	QA	f
50	110	Bhavesh	test	\N	dd	Gujarat	123	India	2024-03-28 08:31:55.112737	2024-03-28 08:31:55.112737	+91	8140743714	bhavehs12@gmail.com	Mr.	Panchal	f
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, name, address_line_1, address_line_2, city, state, postal_code, country, phone_number, created_at, updated_at) FROM stdin;
1	Flour Store	Bhagat Singh Chowk	Bombay Building Road	Dhampur	U.P	246747	India	+91 9557545452	2024-03-14 07:23:07.72571	2024-03-24 09:08:52.707418
\.


--
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategories (id, name, image, description, category_id, created_at, updated_at) FROM stdin;
2	100% Wheat flour		Powdered spices include black pepper powder, celery seed powder, cinnamon powder, clove powder, fenugreek seed powder, garlic flakes, garlic powder, ginger powder, and turmeric powder.	1	2024-02-08 10:20:32.911966	2024-02-15 11:24:56.552882
1	Multigrain Flours		Sattu Health Benefits: Is sattu high in protein? | What is ...\r\nIt is rich in protein, fibre, calcium, iron, manganese and magnesium. Great for digestion: Sattu has high amounts of insoluble fibre which is great for the intestines. It cleanses the colon, detoxifies it of greasy food, constipation and acidity.	1	2024-02-08 10:19:33.187325	2024-02-15 11:25:17.072917
3	Millet Flours		Millet Flours includes certified and organic millets that are freshly packed & delivered through online- Order now!	2	2024-02-15 11:25:53.339447	2024-02-15 11:25:53.339447
4	Single Grain Flours		EatShudh has a variety of single-grain products such as Chana besan, Wheat MP Sharbati, and Jowar Flour, Sattu	2	2024-02-15 11:26:28.592599	2024-02-15 11:26:28.592599
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, user_id, plan_id, status, expires_at, created_at, updated_at) FROM stdin;
1	109	1	active	\N	2024-03-14 07:30:18.257935	2024-03-14 07:30:18.257935
2	138	1	active	2024-04-22 13:27:29.374183	2024-03-22 13:27:29.374183	2024-03-22 13:27:29.374183
\.


--
-- Data for Name: temp_user_coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_user_coupons (id, user_id, coupon_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: term_of_uses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.term_of_uses (id, title, content, created_at, updated_at) FROM stdin;
1	Terms of Uses	<p>These Terms of Use ("Terms") govern your use of Grind &amp; Pound ("the Website") operated by <span style="background-color: rgb(255, 255, 255);">Grind &amp; Pound </span>("us", "we", or "our").</p><p><br></p><p>Please read these Terms carefully before using the Website.</p><p><br></p><p>By accessing or using the Website, you agree to be bound by these Terms. If you disagree with any part of the Terms, then you may not access the Website.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Intellectual Property</strong></p><p><br></p><p>The Website and its original content, features, and functionality are owned by [Your Company Name] and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Use License</strong></p><p><br></p><p>Permission is granted to temporarily download one copy of the materials (information or software) on the Website for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license, you may not:</p><p><br></p><p>1. modify or copy the materials;</p><p>2. use the materials for any commercial purpose or for any public display (commercial or non-commercial);</p><p>3. attempt to decompile or reverse engineer any software contained on the Website;</p><p>4. remove any copyright or other proprietary notations from the materials; or</p><p>5. transfer the materials to another person or "mirror" the materials on any other server.</p><p><br></p><p>This license shall automatically terminate if you violate any of these restrictions and may be terminated by [Your Company Name] at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Disclaimer</strong></p><p><br></p><p>The materials on the Website are provided on an "as is" basis. [Your Company Name] makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Further, [Your Company Name] does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its Website or otherwise relating to such materials or on any sites linked to this Website.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Limitations</strong></p><p><br></p><p>In no event shall [Your Company Name] or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on the Website, even if [Your Company Name] or a [Your Company Name] authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Modifications</strong></p><p><br></p><p>[Your Company Name] may revise these Terms of Use for the Website at any time without notice. By using the Website, you are agreeing to be bound by the then-current version of these Terms of Use.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Governing Law</strong></p><p><br></p><p>These Terms of Use are governed by and construed in accordance with the laws of [Your Country], and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.</p><p><br></p><p><strong style="background-color: rgb(255, 255, 255);">Contact Us</strong></p><p><br></p><p>If you have any questions about these Terms, please contact us at [Your Contact Information].</p>	2024-03-20 10:52:46.725805	2024-03-20 10:52:46.725805
\.


--
-- Data for Name: terms_of_sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terms_of_sales (id, title, content, created_at, updated_at) FROM stdin;
1	Terms Of Sale	<p>This website is operated by Grind &amp; Pound Private Limited with the brand name “FLORYO”. Throughout the site, the terms “we”, “us” and “our” refer to Pitchfork. Pitchfork offers this website, including all information, tools, and Services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies, and notices stated here.</p><p>By visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.</p><p><br></p><p>Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any Services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.</p><p>Any new features or tools that are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.</p><p>Our store is hosted on Shopify Inc. They provide us with an online e-commerce platform that allows us to sell our products and Services to you.</p><p><br></p><p><strong>SECTION 1 - ONLINE STORE TERMS</strong></p><p>By agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.</p><p>You may not use our products for any illegal or unauthorized purpose nor may you, in the use of the Service, violate any laws in your jurisdiction (including but not limited to copyright laws).You must not transmit any worms or viruses or any code of a destructive nature.</p><p>A breach or violation of any of the Terms will result in an immediate termination of your Services.</p><p><br></p><p><strong>SECTION 2 - GENERAL CONDITIONS</strong></p><p>We reserve the right to refuse Service to anyone for any reason at any time.</p><p>You understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks.</p><p>You agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Service, use of the Service, or access to the Service or any contact on the website through which the Service is provided, without express written permission by us.</p><p>The headings used in this agreement are included for convenience only and will not limit or otherwise affect these Terms.</p><p><strong>SECTION 3 - ACCURACY, COMPLETENESS AND TIMELINESS OF INFORMATION</strong></p><p>We are not responsible if the information made available on this site is not accurate, complete or current. The material on this site is provided for general information only and should not be relied upon or used as the sole basis for making decisions without consulting primary, more accurate, more complete or more timely sources of information. Any reliance on the material on this site is at your own risk.</p><p>This site may contain certain historical information. Historical information, necessarily, is not current and is provided for your reference only. We reserve the right to modify the contents of this site at any time, but we have no obligation to update any information on our site. You agree that it is your responsibility to monitor changes to our site.</p><p><br></p><p><strong>SECTION 4 - MODIFICATIONS TO THE SERVICE AND PRICES</strong></p><p>Prices for our products are subject to change without notice. We reserve the right at any time to modify or discontinue any product or Service (or any part or content thereof) without notice at any time. We shall not be liable to you or to any third party for any modification, price change, suspension or discontinuance of the product and/or Service.</p><p><strong>SECTION 5 - PRODUCTS OR SERVICES (if applicable)</strong></p><p>Certain products or Services may be available exclusively online through the website.</p><p>We have made every effort to display as accurately as possible the colors and images of our products that appear at the store. We cannot guarantee that your computer monitor's display of any color will be accurate.</p><p>We reserve the right but are not obligated, to limit the sales of our products or Services to any person, geographic region, or jurisdiction. We may exercise this right on a case-by-case basis. We reserve the right to limit the quantities of any products or Services that we offer. All descriptions of products or product pricing are subject to change at any time without notice, at the sole discretion of us. We reserve the right to discontinue any product at any time. Any offer for any product or Service made on this site is void where prohibited.</p><p>We do not warrant that the quality of any products, Services, information, or other material purchased or obtained by you will meet your expectations, or that any errors in the Service will be corrected.</p><p><strong>SECTION 6 - ACCURACY OF BILLING AND ACCOUNT INFORMATION</strong></p><p>We reserve the right to refuse any order you place with us. We may, in our sole discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, and/or orders that use the same billing and/or shipping address. In the event that we make a change to or cancel an order, we may attempt to notify you by contacting the e-mail and/or billing address/phone number provided at the time the order was made. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers or distributors.</p><p>You agree to provide current, complete and accurate purchase and account information for all purchases made at our store. You agree to promptly update your account and other information, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed.</p><p><br></p><p>For more details, please review our Refund Policy:</p><p><a href="https://floryo.com/policies/refund-policy" rel="noopener noreferrer" target="_blank" style="color: var(--link-color);">https://floryo.com/policies/refund-policy</a></p><p><br></p><p><strong>SECTION 7 - OPTIONAL TOOLS</strong></p><p>We may provide you with access to third-party tools over which we neither monitor nor have any control nor input.</p><p>You acknowledge and agree that we provide access to such tools ”as is” and “as available” without any warranties, representations or conditions of any kind and without any endorsement. We shall have no liability whatsoever arising from or relating to your use of optional third-party tools.</p><p>Any use by you of the optional tools offered through the site is entirely at your own risk and discretion and you should ensure that you are familiar with and approve of the terms on which tools are provided by the relevant third-party provider(s).</p><p>We may also, in the future, offer new Services and/or features through the website (including the release of new tools and resources). Such new features and/or Services shall also be subject to these Terms of Service.</p><p><strong>SECTION 8 - THIRD-PARTY LINKS</strong></p><p>Certain content, products, and Services available via our Service may include materials from third parties.</p><p>Third-party links on this site may direct you to third-party websites that are not affiliated with us. We are not responsible for examining or evaluating the content or accuracy and we do not warrant and will not have any liability or responsibility for any third-party materials or websites, or for any other materials, products, or Services of third parties.</p><p>We are not liable for any harm or damages related to the purchase or use of goods, Services, resources, content, or any other transactions made in connection with any third-party websites. Please review carefully the third-party's policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third party.</p><p><strong>SECTION 9 - USER COMMENTS, FEEDBACK AND OTHER SUBMISSIONS</strong></p><p>If, at our request, you send certain specific submissions (for example contest entries) or without a request from us, you send creative ideas, suggestions, proposals, plans, or other materials, whether online, by email, by postal mail, or otherwise (collectively, 'comments'), you agree that we may, at any time, without restriction, edit, copy, publish, distribute, translate and otherwise use in any medium any comments that you forward to us. We are and shall be under no obligation (1) to maintain any comments in confidence; (2) to pay compensation for any comments; or (3) to respond to any comments.</p><p>We may, but have no obligation to, monitor, edit or remove content that we determine in our sole discretion to be unlawful, offensive, threatening, libelous, defamatory, pornographic, obscene or otherwise objectionable or violates any party’s intellectual property or these Terms of Service.</p><p>You agree that your comments will not violate any right of any third-party, including copyright, trademark, privacy, personality or other personal or proprietary right. You further agree that your comments will not contain libelous or otherwise unlawful, abusive or obscene material, or contain any computer virus or other malware that could in any way affect the operation of the Service or any related website. You may not use a false e-mail address, pretend to be someone other than yourself, or otherwise mislead us or third-parties as to the origin of any comments. You are solely responsible for any comments you make and their accuracy. We take no responsibility and assume no liability for any comments posted by you or any third-party.</p><p><strong>SECTION 10 - PERSONAL INFORMATION</strong></p><p>Your submission of personal information through the store is governed by our Privacy Policy, which can be viewed here: [LINK TO PRIVACY POLICY]</p><p><strong>SECTION 11 - ERRORS, INACCURACIES AND OMISSIONS</strong></p><p>Occasionally there may be information on our site or in the Service that contains typographical errors, inaccuracies, or omissions that may relate to product descriptions, pricing, promotions, offers, product shipping charges, transit times, and availability. We reserve the right to correct any errors, inaccuracies, or omissions, and to change or update information or cancel orders if any information in the Service or on any related website is inaccurate at any time without prior notice (including after you have submitted your order).</p><p>We undertake no obligation to update, amend, or clarify information in the Service or on any related website, including without limitation, pricing information, except as required by law. No specified update or refresh date applied in the Service or on any related website should be taken to indicate that all information in the Service or on any related website has been modified or updated.</p><p><strong>SECTION 12 - PROHIBITED USES</strong></p><p>In addition to other prohibitions as set forth in the Terms of Service, you are prohibited from using the site or its content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Service or of any related website, other websites, or the Internet; (h) to collect or track the personal information of others; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for any obscene or immoral purpose; or (k) to interfere with or circumvent the security features of the Service or any related website, other websites, or the Internet. We reserve the right to terminate your use of the Service or any related website for violating any of the prohibited uses.</p><p><br></p><p><strong>SECTION 13 - DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY</strong></p><p>We do not guarantee, represent or warrant that your use of our Service will be uninterrupted, timely, secure or error-free. We do not warrant that the results that may be obtained from the use of the Service will be accurate or reliable. You agree that from time to time we may remove the Service for indefinite periods of time or cancel the Service at any time, without notice to you. You expressly agree that your use of, or inability to use, the Service is at your sole risk. The Service and all products and Services delivered to you through the Service are (except as expressly stated by us) provided 'as is' and 'as available' for your use, without any representation, warranties or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement.</p><p>In no case shall Pitchfork, our directors, officers, employees, affiliates, agents, contractors, interns, suppliers, Service providers or licensors be liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the Service or any products procured using the Service, or for any other claim related in any way to your use of the Service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the Service or any content (or product) posted, transmitted, or otherwise made available via the Service, even if advised of their possibility. Because some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law.</p><p><br></p><p><strong>SECTION 14 – INDEMNIFICATION</strong></p><p>You agree to indemnify, defend and hold harmless Pitchfork and our parent, subsidiaries, affiliates, partners, officers, directors, agents, contractors, licensors, Service providers, subcontractors, suppliers, interns and employees, harmless from any claim or demand, including reasonable attorneys’ fees, made by any third-party due to or arising out of your breach of these Terms of Service or the documents they incorporate by reference, or your violation of any law or the rights of a third-party.</p><p><br></p><p><strong>SECTION 15 – SEVERABILITY</strong></p><p>In the event that any provision of these Terms of Service is determined to be unlawful, void or unenforceable, such provision shall nonetheless be enforceable to the fullest extent permitted by applicable law, and the unenforceable portion shall be deemed to be severed from these Terms of Service, such determination shall not affect the validity and enforceability of any other remaining provisions.</p><p><br></p><p><strong>SECTION 16 – TERMINATION</strong></p><p>The obligations and liabilities of the parties incurred prior to the termination date shall survive the termination of this agreement for all purposes.</p><p>These Terms of Service are effective unless and until terminated by either you or us. You may terminate these Terms of Service at any time by notifying us that you no longer wish to use our Services, or when you cease using our site.</p><p>If in our sole judgment you fail, or we suspect that you have failed, to comply with any term or provision of these Terms of Service, we also may terminate this agreement at any time without notice and you will remain liable for all amounts due up to and including the date of termination; and/or accordingly may deny you access to our Services (or any part thereof).</p><p><br></p><p><strong>SECTION 17 - ENTIRE AGREEMENT</strong></p><p>The failure of us to exercise or enforce any right or provision of these Terms of Service shall not constitute a waiver of such right or provision. These Terms of Service and any policies or operating rules posted by us on this site or in respect to the Service constitutes the entire agreement and understanding between you and us and governs your use of the Service, superseding any prior or contemporaneous agreements, communications and proposals, whether oral or written, between you and us (including, but not limited to, any prior versions of the Terms of Service). Any ambiguities in the interpretation of these Terms of Service shall not be construed against the drafting party.</p><p><strong>SECTION 18 - GOVERNING LAW</strong></p><p>These Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of India.</p><p><br></p><p><strong>SECTION 19 - CHANGES TO TERMS OF SERVICE</strong></p><p>You can review the most current version of the Terms of Service at any time on this page.</p><p>We reserve the right, at our sole discretion, to update, change, or replace any part of these Terms of Service by posting updates and changes to our website. It is your responsibility to check our website periodically for changes. Your continued use of or access to our website or the Service following the posting of any changes to these Terms of Service constitutes acceptance of those changes.</p><p><strong>SECTION 20 - CONTACT INFORMATION</strong></p><p>Questions about the Terms of Service should be sent to us at&nbsp;<a href="mailto:floryo.com@pitchforkfoods.com" rel="noopener noreferrer" target="_blank" style="color: var(--link-color);">floryo.com@pitchforkfoods.com</a></p><p>Our contact information is posted below:</p><p>PITCHFORK FOODS PRIVATE LIMITED</p><p>1st Floor, NR Towers, Workshalaa,</p><p>17th cross, Sector 4, HSR Layout,&nbsp;</p><p>Bengaluru,</p><p>Karnataka-560102</p><p>Phone Number:&nbsp;+91 9164889900</p><p>Email ID:&nbsp;<a href="mailto:floryo.care@pitchforkfoods.com" rel="noopener noreferrer" target="_blank" style="color: unset;">floryo.care@pitchforkfoods.com</a></p><p class="ql-align-center"><br></p><p><br></p>	2024-03-20 10:50:47.695382	2024-03-20 10:50:47.695382
\.


--
-- Data for Name: textures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.textures (id, name, product_id, created_at, updated_at) FROM stdin;
1	Fine	4	2024-03-01 09:16:39.127208	2024-03-01 09:16:39.127208
2	Coarse	4	2024-03-01 09:16:39.128939	2024-03-01 09:16:39.128939
3	Fine	3	2024-03-01 09:18:50.611608	2024-03-01 09:18:50.611608
4	elastic texture	3	2024-03-01 09:18:50.612926	2024-03-01 09:18:50.612926
5	Fine	2	2024-03-01 09:19:20.838522	2024-03-01 09:19:20.838522
6	elastic texture	2	2024-03-01 09:19:20.839494	2024-03-01 09:19:20.839494
7	Coarse	2	2024-03-01 09:19:20.84034	2024-03-01 09:19:20.84034
8	Fine	1	2024-03-01 09:19:43.551957	2024-03-01 09:19:43.551957
9	Coarse	1	2024-03-01 09:19:43.552964	2024-03-01 09:19:43.552964
10	elastic texture	1	2024-03-01 09:19:43.553792	2024-03-01 09:19:43.553792
\.


--
-- Data for Name: user_coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_coupons (id, user_id, coupon_id, created_at, updated_at) FROM stdin;
6	109	1	2024-03-13 14:11:49.555111	2024-03-13 14:11:49.555111
7	110	2	2024-03-13 14:17:23.212319	2024-03-13 14:17:23.212319
8	110	1	2024-03-13 14:22:47.090549	2024-03-13 14:22:47.090549
9	112	1	2024-03-13 15:39:04.893032	2024-03-13 15:39:04.893032
10	112	2	2024-03-13 15:56:04.231958	2024-03-13 15:56:04.231958
11	113	1	2024-03-13 16:09:14.106913	2024-03-13 16:09:14.106913
12	113	2	2024-03-13 16:11:19.655251	2024-03-13 16:11:19.655251
13	114	1	2024-03-13 16:12:55.25765	2024-03-13 16:12:55.25765
14	114	2	2024-03-13 16:17:56.656396	2024-03-13 16:17:56.656396
15	115	1	2024-03-14 11:43:03.55155	2024-03-14 11:43:03.55155
16	115	2	2024-03-21 04:36:33.216082	2024-03-21 04:36:33.216082
17	109	2	2024-03-21 05:15:36.137607	2024-03-21 05:15:36.137607
18	109	2	2024-03-21 05:16:40.714452	2024-03-21 05:16:40.714452
19	109	2	2024-03-21 05:20:18.540464	2024-03-21 05:20:18.540464
20	109	2	2024-03-21 05:29:08.005105	2024-03-21 05:29:08.005105
21	109	2	2024-03-22 04:39:07.714449	2024-03-22 04:39:07.714449
22	109	2	2024-03-22 04:39:07.718556	2024-03-22 04:39:07.718556
23	115	1	2024-03-26 08:55:44.213795	2024-03-26 08:55:44.213795
24	115	1	2024-03-26 08:55:44.217545	2024-03-26 08:55:44.217545
25	115	1	2024-03-26 08:55:44.221007	2024-03-26 08:55:44.221007
26	115	1	2024-03-26 08:55:44.224552	2024-03-26 08:55:44.224552
27	110	1	2024-03-27 07:49:58.576104	2024-03-27 07:49:58.576104
28	110	2	2024-03-27 07:49:58.580237	2024-03-27 07:49:58.580237
29	110	2	2024-03-27 07:49:58.583955	2024-03-27 07:49:58.583955
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, email, phone_number, country_code, profile_pic, otp, active, created_at, updated_at, dob, address, state, country, gender, doa, last_name, title, pin_code, district, acceptance, referral_key) FROM stdin;
129	\N	\N	3423423432	+91	\N	3404	\N	2024-03-21 06:41:53.758587	2024-03-21 06:41:53.758587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	\N	\N	2342342342	+91	\N	3552	\N	2024-03-21 06:42:22.96035	2024-03-21 06:42:22.96035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	\N	\N	2133214124	+91	\N	3620	\N	2024-03-21 06:42:50.74129	2024-03-21 06:42:50.74129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	\N	\N	3243242342	+91	\N	2204	\N	2024-03-21 06:44:59.760415	2024-03-21 06:44:59.760415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	\N	\N	9926252289	+91	\N	\N	t	2024-03-15 04:47:34.426273	2024-03-15 04:47:49.531955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	\N	\N	6567672542	+91	\N	\N	t	2024-03-27 07:44:54.425298	2024-03-27 07:44:57.403478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	\N	\N	9557545479	+91	\N	4307	\N	2024-03-13 12:31:34.02767	2024-03-13 12:31:34.02767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	Gsddfgdgs	sdfgfdg@fgfd.gd	3454636464	+91	\N	\N	t	2024-03-26 04:36:25.349274	2024-03-26 04:37:03.898301	\N	\N	\N	\N	\N	\N	Sdgfsdg	Mr.	\N	\N	t	\N
112	Himanshu	rj@yopmail.com	9876543210	+91	\N	\N	t	2024-03-13 15:37:44.465753	2024-03-13 15:38:20.786115	\N	\N	\N	\N	\N	\N	Kumar	Mr.	\N	\N	t	\N
122	\N	\N	9926252222	+91	\N	\N	t	2024-03-15 10:03:28.610471	2024-03-15 10:03:33.648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	Prashant	prashant@gmais.com	7667346532	+91	\N	\N	t	2024-03-13 16:07:59.969338	2024-03-13 16:08:27.322199	\N	\N	\N	\N	\N	\N	Sharma	Mr.	\N	\N	t	\N
114	Ertrwt	erterw@gret.ret	4363645645	+91	\N	\N	t	2024-03-13 16:12:15.594506	2024-03-13 16:12:31.347298	\N	\N	\N	\N	\N	\N	Ewrt	Mr.	\N	\N	t	\N
121	As	a@gmail.com	8146972343	+91	\N	\N	t	2024-03-15 09:59:23.478286	2024-03-18 07:28:12.409765	\N	\N	\N	\N	\N	\N	S	Mr.	\N	\N	t	\N
133	\N	\N	8140743713	+91	\N	\N	t	2024-03-21 13:51:09.986188	2024-03-21 13:51:14.719426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	\N	\N	8140843723	+91	\N	\N	t	2024-03-21 13:59:59.508854	2024-03-21 14:00:05.939362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	\N	\N	8139456767	+91	\N	\N	t	2024-03-21 14:01:29.982663	2024-03-21 14:01:34.487492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	\N	\N	9916027281	+91	\N	7742	\N	2024-03-19 08:58:24.305202	2024-03-19 08:58:24.305202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
124	\N	\N	1234556778	+91	\N	\N	t	2024-03-19 10:16:10.774336	2024-03-19 10:16:14.794314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	121	tester123@pixoatic.com	1234567890	+91	\N	\N	t	2024-03-19 10:18:32.85983	2024-03-19 11:45:23.061991	\N	\N	\N	\N	\N	\N	21212	Mr.	\N	\N	t	\N
116	Gfdhfg	ghfdgh@fdgf.gd	6543217890	+91	\N	\N	t	2024-03-14 06:37:15.188371	2024-03-14 06:37:32.359625	\N	\N	\N	\N	\N	\N	Hdfgh	Mr.	\N	\N	t	\N
142	Rajendra	tester@pixofatic.com	7676764537	+91	\N	\N	t	2024-03-28 12:19:33.066549	2024-03-28 14:12:19.068954	\N	\N	\N	\N	\N	\N	Kumar	Mr.	\N	\N	t	\N
117	Erwrwe	werwewerwe@fdsfds.ff	5465476536	+91	\N	\N	t	2024-03-14 06:49:59.143468	2024-03-14 06:50:29.355332	\N	\N	\N	\N	\N	\N	Ewr	Mr.	\N	\N	t	\N
127	Bhavesh	bhavehs1332@gmail.com	8140743714	+91	\N	\N	t	2024-03-21 05:18:23.766761	2024-03-28 16:14:05.361345	\N	\N	\N	\N	\N	\N	Qa	Mr.	\N	\N	t	\N
110	Rajendra patel	rajendra.k@pixoatic.com	8824687840	+91	\N	\N	t	2024-03-13 11:08:45.888843	2024-03-28 16:18:27.293635	\N	\N	null	null	\N	\N	Kumar	Mr.	0	null	t	\N
119	Rajendra	tester@pixoatic.com	7433345354	+91	\N	\N	t	2024-03-14 11:26:31.94841	2024-03-14 11:26:59.542857	\N	\N	\N	\N	\N	\N	Kumar	Mr.	\N	\N	t	\N
126	\N	\N	2423423543	+91	\N	8607	\N	2024-03-21 04:49:29.357121	2024-03-21 04:49:29.357121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	\N	\N	5456567657	+91	\N	9744	\N	2024-03-22 05:44:57.470013	2024-03-22 05:44:57.470013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	Rajendra	qwrqr@wdwe.we	5235432564	+91	\N	\N	t	2024-03-26 12:40:10.360413	2024-03-27 11:16:42.693645	\N	\N	null	null	\N	\N	Kumar	Mr.	0	null	t	\N
118	Sonali	sonali.c@pixoatic.com	9926251229	+91	\N	\N	t	2024-03-14 10:16:10.938049	2024-03-26 14:36:36.543913	\N	\N	\N	\N	\N	\N	Chouhan	Mrs.	\N	\N	t	\N
128	Bhavesh	bhavehs12@gmail.com	1231231231	+91	\N	\N	t	2024-03-21 05:20:11.824694	2024-03-21 05:21:27.438312	\N	\N	\N	\N	\N	\N	Qa	Mr.	\N	\N	t	\N
115	Ashish	ashish.mishra@pixoatic.com	8146972215	+91	\N	\N	t	2024-03-14 03:34:03.508395	2024-03-27 04:14:38.019667	\N	\N	\N	\N	\N	\N	Mishra	Mr.	\N	\N	t	\N
109	Gaurav	abhishek.k@pixoatic.com	9557545452	+91	\N	\N	t	2024-03-13 11:07:43.393279	2024-03-22 13:26:16.334234	\N	\N	\N	\N	\N	\N	Rana	Thakur	\N	\N	t	GRIND6692
138	Gaurav	abhishekkumar264595@gmail.com	9557545453	+91	\N	3580	\N	2024-03-22 13:26:56.173265	2024-03-22 13:27:08.054757	\N	\N	\N	\N	\N	\N	Rana	Thakur	\N	\N	t	\N
\.


--
-- Data for Name: variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variants (id, sku, price, product_id, created_at, updated_at, net_wt, unit, quantity, discount_price) FROM stdin;
3	Chapati Flour 01	100.0	4	2024-03-01 06:15:07.521883	2024-03-01 09:50:41.393343	1	kg	1	150
11	Chapati Flour -500	40.0	4	2024-03-01 09:37:24.580265	2024-03-01 09:50:41.394676	500	g	1	50
10	Floryo-1	500.0	3	2024-03-01 09:35:06.221141	2024-03-01 09:51:33.750716	1	kg	1	600
6	Seed & Grain 01	160.0	2	2024-03-01 06:23:02.622733	2024-03-01 09:51:55.976664	1	kg	1	200
8	Popcorn -beta	40.0	1	2024-03-01 06:24:46.573159	2024-03-01 09:52:20.07645	500	g	1	60
9	Popcorn -1	80.0	1	2024-03-01 06:24:46.574282	2024-03-01 09:52:20.077493	1	kg	1	100
12	Popcorn -250g	20.0	1	2024-03-13 11:40:15.620979	2024-03-13 11:40:15.620979	250	g	0	30
7	Seed & Grain 05	80.0	2	2024-03-01 06:23:02.623758	2024-03-13 11:43:09.558505	500	g	1	100
1	Floryo-01	250.0	3	2024-02-15 11:31:08.173164	2024-03-13 11:44:17.904533	500	g	12	300
2	Floryo-02	180.0	3	2024-02-15 11:31:08.174358	2024-03-13 11:44:17.905439	250	g	10	200
\.


--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vouchers (id, title, description, expiry_date, code, created_at, updated_at) FROM stdin;
1	Flourish & Flavor Vouchers: Elevate Your Baking Experience	Savor the goodness of Flourish & Flavor with our exclusive vouchers! Enter code FLAVORFUL20 at checkout and enjoy a delightful 20% discount on your next purchase of our premium wheat flours. From artisanal bread to delicate pastries, our carefully crafted flours are your secret ingredient for baking success. Embrace the art of flour and elevate your creations with Flourish & Flavor. Unlock the door to a world of exquisite tastes and textures – because every bake deserves to be extraordinary.	2024-03-10	FLAVORFUL20	2024-03-01 12:05:01.077739	2024-03-01 12:05:01.077739
2	PureJoy Harvest Vouchers: Cultivate Your Culinary Bliss	PureJoy Harvest Vouchers: Cultivate Your Culinary Bliss	2024-05-10	PUREJOY15	2024-03-01 12:06:20.375852	2024-03-01 12:06:20.375852
\.


--
-- Name: about_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.about_us_id_seq', 6, true);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 103, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 103, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banners_id_seq', 13, true);


--
-- Name: blog_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_categories_id_seq', 1, true);


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blogs_id_seq', 2, true);


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 307, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 53, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 1, false);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_id_seq', 2, true);


--
-- Name: faq_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_categories_id_seq', 11, true);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 9, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 1, false);


--
-- Name: invoice_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_items_id_seq', 30, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 19, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 160, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 173, true);


--
-- Name: our_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.our_stories_id_seq', 2, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 165, true);


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plans_id_seq', 3, true);


--
-- Name: privacy_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privacy_policies_id_seq', 1, true);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 12, true);


--
-- Name: product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_properties_id_seq', 14, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 4, true);


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.referrals_id_seq', 2, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 18, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 667, true);


--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_addresses_id_seq', 50, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 1, true);


--
-- Name: subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategories_id_seq', 5, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 2, true);


--
-- Name: temp_user_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_user_coupons_id_seq', 20, true);


--
-- Name: term_of_uses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.term_of_uses_id_seq', 1, true);


--
-- Name: terms_of_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_of_sales_id_seq', 1, true);


--
-- Name: textures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.textures_id_seq', 10, true);


--
-- Name: user_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_coupons_id_seq', 29, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 142, true);


--
-- Name: variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variants_id_seq', 12, true);


--
-- Name: vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vouchers_id_seq', 2, true);


--
-- Name: about_us about_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_us
    ADD CONSTRAINT about_us_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: blog_categories blog_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_categories
    ADD CONSTRAINT blog_categories_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: contact_us contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: faq_categories faq_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq_categories
    ADD CONSTRAINT faq_categories_pkey PRIMARY KEY (id);


--
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: invoice_items invoice_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: our_stories our_stories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.our_stories
    ADD CONSTRAINT our_stories_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies privacy_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: product_properties product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: shipping_addresses shipping_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_addresses
    ADD CONSTRAINT shipping_addresses_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: temp_user_coupons temp_user_coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_coupons
    ADD CONSTRAINT temp_user_coupons_pkey PRIMARY KEY (id);


--
-- Name: term_of_uses term_of_uses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.term_of_uses
    ADD CONSTRAINT term_of_uses_pkey PRIMARY KEY (id);


--
-- Name: terms_of_sales terms_of_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_of_sales
    ADD CONSTRAINT terms_of_sales_pkey PRIMARY KEY (id);


--
-- Name: textures textures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.textures
    ADD CONSTRAINT textures_pkey PRIMARY KEY (id);


--
-- Name: user_coupons user_coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coupons
    ADD CONSTRAINT user_coupons_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variants variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_author ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_resource ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_blogs_on_blog_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_blogs_on_blog_category_id ON public.blogs USING btree (blog_category_id);


--
-- Name: index_cart_items_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_cart_items_on_cart_id ON public.cart_items USING btree (cart_id);


--
-- Name: index_cart_items_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_cart_items_on_product_id ON public.cart_items USING btree (product_id);


--
-- Name: index_carts_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_carts_on_user_id ON public.carts USING btree (user_id);


--
-- Name: index_faqs_on_faq_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_faqs_on_faq_category_id ON public.faqs USING btree (faq_category_id);


--
-- Name: index_images_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_images_on_product_id ON public.images USING btree (product_id);


--
-- Name: index_invoice_items_on_invoice_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_invoice_items_on_invoice_id ON public.invoice_items USING btree (invoice_id);


--
-- Name: index_invoices_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_invoices_on_order_id ON public.invoices USING btree (order_id);


--
-- Name: index_invoices_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_invoices_on_user_id ON public.invoices USING btree (user_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_items_on_order_id ON public.order_items USING btree (order_id);


--
-- Name: index_order_items_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_items_on_product_id ON public.order_items USING btree (product_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_payments_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_order_id ON public.payments USING btree (order_id);


--
-- Name: index_payments_on_subscription_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_subscription_id ON public.payments USING btree (subscription_id);


--
-- Name: index_payments_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_user_id ON public.payments USING btree (user_id);


--
-- Name: index_product_images_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_images_on_product_id ON public.product_images USING btree (product_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_properties_on_product_id ON public.product_properties USING btree (product_id);


--
-- Name: index_products_on_subcategory_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_subcategory_id ON public.products USING btree (subcategory_id);


--
-- Name: index_referrals_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_referrals_on_email ON public.referrals USING btree (email);


--
-- Name: index_referrals_on_referred_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_referrals_on_referred_user_id ON public.referrals USING btree (referred_user_id);


--
-- Name: index_referrals_on_referrer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_referrals_on_referrer_id ON public.referrals USING btree (referrer_id);


--
-- Name: index_reviews_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_product_id ON public.reviews USING btree (product_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_sessions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sessions_on_user_id ON public.sessions USING btree (user_id);


--
-- Name: index_shipping_addresses_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_shipping_addresses_on_user_id ON public.shipping_addresses USING btree (user_id);


--
-- Name: index_subcategories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subcategories_on_category_id ON public.subcategories USING btree (category_id);


--
-- Name: index_subscriptions_on_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscriptions_on_plan_id ON public.subscriptions USING btree (plan_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscriptions_on_user_id ON public.subscriptions USING btree (user_id);


--
-- Name: index_temp_user_coupons_on_coupon_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_temp_user_coupons_on_coupon_id ON public.temp_user_coupons USING btree (coupon_id);


--
-- Name: index_temp_user_coupons_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_temp_user_coupons_on_user_id ON public.temp_user_coupons USING btree (user_id);


--
-- Name: index_textures_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_textures_on_product_id ON public.textures USING btree (product_id);


--
-- Name: index_user_coupons_on_coupon_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_coupons_on_coupon_id ON public.user_coupons USING btree (coupon_id);


--
-- Name: index_user_coupons_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_coupons_on_user_id ON public.user_coupons USING btree (user_id);


--
-- Name: index_variants_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_variants_on_product_id ON public.variants USING btree (product_id);


--
-- Name: payments fk_rails_081dc04a02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_081dc04a02 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_coupons fk_rails_0c751848ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coupons
    ADD CONSTRAINT fk_rails_0c751848ac FOREIGN KEY (coupon_id) REFERENCES public.coupons(id);


--
-- Name: blogs fk_rails_1476ff306b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT fk_rails_1476ff306b FOREIGN KEY (blog_category_id) REFERENCES public.blog_categories(id);


--
-- Name: products fk_rails_150008c07d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_150008c07d FOREIGN KEY (subcategory_id) REFERENCES public.subcategories(id);


--
-- Name: variants fk_rails_19f8efee69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT fk_rails_19f8efee69 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_images fk_rails_1c991d3be6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT fk_rails_1c991d3be6 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: invoice_items fk_rails_25bf3d2c5e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT fk_rails_25bf3d2c5e FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: referrals fk_rails_2eb0614166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_2eb0614166 FOREIGN KEY (referrer_id) REFERENCES public.users(id);


--
-- Name: subcategories fk_rails_3937626525; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT fk_rails_3937626525 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: invoices fk_rails_3d1522a0d8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT fk_rails_3d1522a0d8 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: faqs fk_rails_474d4b16ab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT fk_rails_474d4b16ab FOREIGN KEY (faq_category_id) REFERENCES public.faq_categories(id);


--
-- Name: invoices fk_rails_4fa42a6dca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT fk_rails_4fa42a6dca FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: subscriptions fk_rails_63d3df128b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_rails_63d3df128b FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: cart_items fk_rails_681a180e84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_rails_681a180e84 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: payments fk_rails_6af949464b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_6af949464b FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: cart_items fk_rails_6cdb1f0139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_rails_6cdb1f0139 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sessions fk_rails_758836b4f0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_758836b4f0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: subscriptions fk_rails_933bdff476; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_rails_933bdff476 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: product_properties fk_rails_97d15debea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties
    ADD CONSTRAINT fk_rails_97d15debea FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: shipping_addresses fk_rails_bbbd7e8713; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_addresses
    ADD CONSTRAINT fk_rails_bbbd7e8713 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: images fk_rails_bd36e75ae4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT fk_rails_bd36e75ae4 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: reviews fk_rails_bedd9094d4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_bedd9094d4 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: referrals fk_rails_c65f8d2b8d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_c65f8d2b8d FOREIGN KEY (referred_user_id) REFERENCES public.users(id);


--
-- Name: textures fk_rails_ddc1872b73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.textures
    ADD CONSTRAINT fk_rails_ddc1872b73 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: user_coupons fk_rails_df99f23fd6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coupons
    ADD CONSTRAINT fk_rails_df99f23fd6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: temp_user_coupons fk_rails_e20a7d0c1e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_coupons
    ADD CONSTRAINT fk_rails_e20a7d0c1e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: carts fk_rails_ea59a35211; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_ea59a35211 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: temp_user_coupons fk_rails_ef8c6d80ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_coupons
    ADD CONSTRAINT fk_rails_ef8c6d80ce FOREIGN KEY (coupon_id) REFERENCES public.coupons(id);


--
-- Name: order_items fk_rails_f1a29ddd47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_f1a29ddd47 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payments fk_rails_fd6be2115b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_fd6be2115b FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id);


--
-- PostgreSQL database dump complete
--

