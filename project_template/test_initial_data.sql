--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: celery_taskmeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE celery_taskmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE celery_taskmeta_id_seq OWNED BY celery_taskmeta.id;


--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(255) NOT NULL,
    result text NOT NULL,
    date_done timestamp with time zone NOT NULL,
    hidden boolean NOT NULL
);


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE celery_tasksetmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE celery_tasksetmeta_id_seq OWNED BY celery_tasksetmeta.id;


--
-- Name: contentitem_glamkit_sponsors_beginsponsorblockitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_glamkit_sponsors_beginsponsorblockitem (
    contentitem_ptr_id integer NOT NULL,
    text text NOT NULL
);


--
-- Name: contentitem_glamkit_sponsors_endsponsorblockitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_glamkit_sponsors_endsponsorblockitem (
    contentitem_ptr_id integer NOT NULL,
    text text NOT NULL
);


--
-- Name: contentitem_glamkit_sponsors_sponsorpromoitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_glamkit_sponsors_sponsorpromoitem (
    contentitem_ptr_id integer NOT NULL,
    title character varying(120) NOT NULL,
    width integer NOT NULL,
    quality integer NOT NULL,
    sponsor_id integer NOT NULL
);


--
-- Name: contentitem_icekit_events_links_eventlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_events_links_eventlink (
    contentitem_ptr_id integer NOT NULL,
    style character varying(255) NOT NULL,
    type_override character varying(255) NOT NULL,
    title_override character varying(255) NOT NULL,
    oneliner_override character varying(255) NOT NULL,
    url_override character varying(255) NOT NULL,
    image_override character varying(100) NOT NULL,
    item_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_child_pages_childpageitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_child_pages_childpageitem (
    contentitem_ptr_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_contact_person_contactpersonitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_contact_person_contactpersonitem (
    contentitem_ptr_id integer NOT NULL,
    contact_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_content_listing_contentlistingitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_content_listing_contentlistingitem (
    contentitem_ptr_id integer NOT NULL,
    content_type_id integer NOT NULL,
    "limit" integer,
    no_items_message character varying(255)
);


--
-- Name: contentitem_icekit_plugins_faq_faqitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_faq_faqitem (
    contentitem_ptr_id integer NOT NULL,
    question text NOT NULL,
    answer text NOT NULL,
    load_open boolean NOT NULL
);


--
-- Name: contentitem_icekit_plugins_file_fileitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_file_fileitem (
    contentitem_ptr_id integer NOT NULL,
    file_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_horizontal_rule_horizontalruleitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_horizontal_rule_horizontalruleitem (
    contentitem_ptr_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_image_imageitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_image_imageitem (
    contentitem_ptr_id integer NOT NULL,
    image_id integer NOT NULL,
    caption_override text NOT NULL,
    show_caption boolean NOT NULL,
    show_title boolean NOT NULL,
    title_override character varying(512) NOT NULL
);


--
-- Name: contentitem_icekit_plugins_instagram_embed_instagramembeditem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_instagram_embed_instagramembeditem (
    contentitem_ptr_id integer NOT NULL,
    url character varying(200) NOT NULL,
    provider_url character varying(512) NOT NULL,
    media_id character varying(255) NOT NULL,
    author_name character varying(255) NOT NULL,
    height integer,
    width integer,
    thumbnail_url character varying(255) NOT NULL,
    thumbnail_width integer,
    thumbnail_height integer,
    provider_name character varying(255) NOT NULL,
    title character varying(512) NOT NULL,
    html text NOT NULL,
    version character varying(20) NOT NULL,
    author_url character varying(255) NOT NULL,
    author_id integer,
    type character varying(50) NOT NULL,
    CONSTRAINT contentitem_instagram_embed_instagramemb_thumbnail_height_check CHECK ((thumbnail_height >= 0)),
    CONSTRAINT contentitem_instagram_embed_instagramembe_thumbnail_width_check CHECK ((thumbnail_width >= 0)),
    CONSTRAINT contentitem_instagram_embed_instagramembeditem_author_id_check CHECK ((author_id >= 0)),
    CONSTRAINT contentitem_instagram_embed_instagramembeditem_height_check CHECK ((height >= 0)),
    CONSTRAINT contentitem_instagram_embed_instagramembeditem_width_check CHECK ((width >= 0))
);


--
-- Name: contentitem_icekit_plugins_map_mapitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_map_mapitem (
    contentitem_ptr_id integer NOT NULL,
    share_url character varying(500) NOT NULL
);


--
-- Name: contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem (
    contentitem_ptr_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_page_anchor_pageanchoritem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_page_anchor_pageanchoritem (
    contentitem_ptr_id integer NOT NULL,
    anchor_name character varying(60) NOT NULL
);


--
-- Name: contentitem_icekit_plugins_quote_quoteitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_quote_quoteitem (
    contentitem_ptr_id integer NOT NULL,
    quote text NOT NULL,
    attribution character varying(255) NOT NULL,
    organisation character varying(255) NOT NULL,
    url character varying(200) NOT NULL
);


--
-- Name: contentitem_icekit_plugins_reusable_form_formitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_reusable_form_formitem (
    contentitem_ptr_id integer NOT NULL,
    form_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_slideshow_slideshowitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_slideshow_slideshowitem (
    contentitem_ptr_id integer NOT NULL,
    slide_show_id integer NOT NULL
);


--
-- Name: contentitem_icekit_plugins_twitter_embed_twitterembeditem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_icekit_plugins_twitter_embed_twitterembeditem (
    contentitem_ptr_id integer NOT NULL,
    twitter_url character varying(200) NOT NULL,
    url character varying(512) NOT NULL,
    provider_url character varying(512) NOT NULL,
    cache_age character varying(255) NOT NULL,
    author_name character varying(255) NOT NULL,
    height integer,
    width integer,
    provider_name character varying(255) NOT NULL,
    version character varying(20) NOT NULL,
    author_url character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    html text NOT NULL,
    CONSTRAINT contentitem_twitter_embed_twitterembeditem_height_check CHECK ((height >= 0)),
    CONSTRAINT contentitem_twitter_embed_twitterembeditem_width_check CHECK ((width >= 0))
);


--
-- Name: contentitem_iframe_iframeitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_iframe_iframeitem (
    contentitem_ptr_id integer NOT NULL,
    src character varying(200) NOT NULL,
    width character varying(10) NOT NULL,
    height character varying(10) NOT NULL
);


--
-- Name: contentitem_ik_event_listing_eventcontentlistingitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_ik_event_listing_eventcontentlistingitem (
    contentitem_ptr_id integer NOT NULL,
    "limit" integer,
    content_type_id integer NOT NULL,
    from_date timestamp with time zone,
    from_days_ago integer,
    to_date timestamp with time zone,
    to_days_ahead integer,
    no_items_message character varying(255)
);


--
-- Name: contentitem_ik_events_todays_occurrences_todaysoccurrences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_ik_events_todays_occurrences_todaysoccurrences (
    contentitem_ptr_id integer NOT NULL,
    include_finished boolean NOT NULL,
    fall_back_to_next_day boolean NOT NULL,
    title character varying(255) NOT NULL
);


--
-- Name: contentitem_ik_links_articlelink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_ik_links_articlelink (
    contentitem_ptr_id integer NOT NULL,
    style character varying(255) NOT NULL,
    type_override character varying(255) NOT NULL,
    title_override character varying(255) NOT NULL,
    image_override character varying(100) NOT NULL,
    item_id integer NOT NULL,
    url_override character varying(255) NOT NULL,
    oneliner_override character varying(255) NOT NULL
);


--
-- Name: contentitem_ik_links_authorlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_ik_links_authorlink (
    contentitem_ptr_id integer NOT NULL,
    style character varying(255) NOT NULL,
    type_override character varying(255) NOT NULL,
    title_override character varying(255) NOT NULL,
    image_override character varying(100) NOT NULL,
    item_id integer NOT NULL,
    url_override character varying(255) NOT NULL,
    oneliner_override character varying(255) NOT NULL
);


--
-- Name: contentitem_ik_links_pagelink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_ik_links_pagelink (
    contentitem_ptr_id integer NOT NULL,
    style character varying(255) NOT NULL,
    type_override character varying(255) NOT NULL,
    title_override character varying(255) NOT NULL,
    image_override character varying(100) NOT NULL,
    item_id integer NOT NULL,
    url_override character varying(255) NOT NULL,
    oneliner_override character varying(255) NOT NULL
);


--
-- Name: contentitem_image_gallery_imagegalleryshowitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_image_gallery_imagegalleryshowitem (
    contentitem_ptr_id integer NOT NULL,
    slide_show_id integer NOT NULL
);


--
-- Name: contentitem_oembed_with_caption_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_oembed_with_caption_item (
    contentitem_ptr_id integer NOT NULL,
    embed_url character varying(200) NOT NULL,
    embed_max_width integer,
    embed_max_height integer,
    type character varying(20),
    url character varying(200),
    title character varying(512),
    description text,
    author_name character varying(255),
    author_url character varying(200),
    provider_name character varying(255),
    provider_url character varying(200),
    thumbnail_url character varying(200),
    thumbnail_height integer,
    thumbnail_width integer,
    height integer,
    width integer,
    html text,
    caption text NOT NULL,
    is_16by9 boolean NOT NULL,
    CONSTRAINT contentitem_oembed_with_caption_oembedwi_embed_max_height_check CHECK ((embed_max_height >= 0)),
    CONSTRAINT contentitem_oembed_with_caption_oembedwit_embed_max_width_check CHECK ((embed_max_width >= 0))
);


--
-- Name: contentitem_oembeditem_oembeditem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_oembeditem_oembeditem (
    contentitem_ptr_id integer NOT NULL,
    embed_url character varying(200) NOT NULL,
    embed_max_width integer,
    embed_max_height integer,
    type character varying(20),
    url character varying(200),
    title character varying(512),
    description text,
    author_name character varying(255),
    author_url character varying(200),
    provider_name character varying(255),
    provider_url character varying(200),
    thumbnail_url character varying(200),
    thumbnail_height integer,
    thumbnail_width integer,
    height integer,
    width integer,
    html text,
    CONSTRAINT contentitem_oembeditem_oembeditem_embed_max_height_check CHECK ((embed_max_height >= 0)),
    CONSTRAINT contentitem_oembeditem_oembeditem_embed_max_width_check CHECK ((embed_max_width >= 0))
);


--
-- Name: contentitem_rawhtml_rawhtmlitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_rawhtml_rawhtmlitem (
    contentitem_ptr_id integer NOT NULL,
    html text NOT NULL
);


--
-- Name: contentitem_sharedcontent_sharedcontentitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_sharedcontent_sharedcontentitem (
    contentitem_ptr_id integer NOT NULL,
    shared_content_id integer NOT NULL
);


--
-- Name: contentitem_text_textitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contentitem_text_textitem (
    contentitem_ptr_id integer NOT NULL,
    text text NOT NULL,
    style character varying(255) NOT NULL
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_redirect_id_seq OWNED BY django_redirect.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: djcelery_crontabschedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djcelery_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE djcelery_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE djcelery_crontabschedule_id_seq OWNED BY djcelery_crontabschedule.id;


--
-- Name: djcelery_intervalschedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djcelery_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE djcelery_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE djcelery_intervalschedule_id_seq OWNED BY djcelery_intervalschedule.id;


--
-- Name: djcelery_periodictask; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djcelery_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    CONSTRAINT djcelery_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE djcelery_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE djcelery_periodictask_id_seq OWNED BY djcelery_periodictask.id;


--
-- Name: djcelery_periodictasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djcelery_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


--
-- Name: djcelery_taskstate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djcelery_taskstate (
    id integer NOT NULL,
    state character varying(64) NOT NULL,
    task_id character varying(36) NOT NULL,
    name character varying(200),
    tstamp timestamp with time zone NOT NULL,
    args text,
    kwargs text,
    eta timestamp with time zone,
    expires timestamp with time zone,
    result text,
    traceback text,
    runtime double precision,
    retries integer NOT NULL,
    hidden boolean NOT NULL,
    worker_id integer
);


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE djcelery_taskstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE djcelery_taskstate_id_seq OWNED BY djcelery_taskstate.id;


--
-- Name: djcelery_workerstate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djcelery_workerstate (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    last_heartbeat timestamp with time zone
);


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE djcelery_workerstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE djcelery_workerstate_id_seq OWNED BY djcelery_workerstate.id;


--
-- Name: djkombu_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djkombu_message (
    id integer NOT NULL,
    visible boolean NOT NULL,
    sent_at timestamp with time zone,
    payload text NOT NULL,
    queue_id integer NOT NULL
);


--
-- Name: djkombu_message_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE djkombu_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djkombu_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE djkombu_message_id_seq OWNED BY djkombu_message.id;


--
-- Name: djkombu_queue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE djkombu_queue (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE djkombu_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE djkombu_queue_id_seq OWNED BY djkombu_queue.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: icekit_plugins_file_file_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_plugins_file_file_categories (
    id integer NOT NULL,
    file_id integer NOT NULL,
    mediacategory_id integer NOT NULL
);


--
-- Name: file_file_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE file_file_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: file_file_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE file_file_categories_id_seq OWNED BY icekit_plugins_file_file_categories.id;


--
-- Name: icekit_plugins_file_file; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_plugins_file_file (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    title character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    admin_notes text NOT NULL
);


--
-- Name: file_file_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE file_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: file_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE file_file_id_seq OWNED BY icekit_plugins_file_file.id;


--
-- Name: fluent_contents_contentitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fluent_contents_contentitem (
    id integer NOT NULL,
    parent_id integer,
    language_code character varying(15) NOT NULL,
    sort_order integer NOT NULL,
    parent_type_id integer NOT NULL,
    placeholder_id integer,
    polymorphic_ctype_id integer
);


--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fluent_contents_contentitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fluent_contents_contentitem_id_seq OWNED BY fluent_contents_contentitem.id;


--
-- Name: fluent_contents_placeholder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fluent_contents_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    role character varying(1) NOT NULL,
    parent_id integer,
    title character varying(255) NOT NULL,
    parent_type_id integer
);


--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fluent_contents_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fluent_contents_placeholder_id_seq OWNED BY fluent_contents_placeholder.id;


--
-- Name: fluent_pages_htmlpage_translation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fluent_pages_htmlpage_translation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    meta_keywords character varying(255),
    meta_description character varying(255),
    meta_title character varying(255),
    master_id integer
);


--
-- Name: fluent_pages_htmlpage_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fluent_pages_htmlpage_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fluent_pages_htmlpage_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fluent_pages_htmlpage_translation_id_seq OWNED BY fluent_pages_htmlpage_translation.id;


--
-- Name: fluent_pages_pagelayout; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fluent_pages_pagelayout (
    id integer NOT NULL,
    key character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    template_path character varying(100) NOT NULL
);


--
-- Name: fluent_pages_pagelayout_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fluent_pages_pagelayout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fluent_pages_pagelayout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fluent_pages_pagelayout_id_seq OWNED BY fluent_pages_pagelayout.id;


--
-- Name: fluent_pages_urlnode; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fluent_pages_urlnode (
    id integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    status character varying(1) NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    in_sitemaps boolean NOT NULL,
    key character varying(50),
    creation_date timestamp with time zone NOT NULL,
    modification_date timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    parent_id integer,
    parent_site_id integer NOT NULL,
    polymorphic_ctype_id integer,
    CONSTRAINT fluent_pages_urlnode_level_check CHECK ((level >= 0)),
    CONSTRAINT fluent_pages_urlnode_lft_check CHECK ((lft >= 0)),
    CONSTRAINT fluent_pages_urlnode_rght_check CHECK ((rght >= 0)),
    CONSTRAINT fluent_pages_urlnode_tree_id_check CHECK ((tree_id >= 0))
);


--
-- Name: fluent_pages_urlnode_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fluent_pages_urlnode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fluent_pages_urlnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fluent_pages_urlnode_id_seq OWNED BY fluent_pages_urlnode.id;


--
-- Name: fluent_pages_urlnode_translation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fluent_pages_urlnode_translation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(100) NOT NULL,
    override_url character varying(255) NOT NULL,
    _cached_url character varying(255),
    master_id integer
);


--
-- Name: fluent_pages_urlnode_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fluent_pages_urlnode_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fluent_pages_urlnode_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fluent_pages_urlnode_translation_id_seq OWNED BY fluent_pages_urlnode_translation.id;


--
-- Name: forms_field; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE forms_field (
    id integer NOT NULL,
    label character varying(200) NOT NULL,
    slug character varying(100) NOT NULL,
    field_type integer NOT NULL,
    required boolean NOT NULL,
    visible boolean NOT NULL,
    choices character varying(1000) NOT NULL,
    "default" character varying(2000) NOT NULL,
    placeholder_text character varying(100),
    help_text character varying(100) NOT NULL,
    "order" integer,
    form_id integer NOT NULL
);


--
-- Name: forms_field_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forms_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forms_field_id_seq OWNED BY forms_field.id;


--
-- Name: forms_fieldentry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE forms_fieldentry (
    id integer NOT NULL,
    field_id integer NOT NULL,
    value character varying(2000),
    entry_id integer NOT NULL
);


--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forms_fieldentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forms_fieldentry_id_seq OWNED BY forms_fieldentry.id;


--
-- Name: forms_form; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE forms_form (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    slug character varying(100) NOT NULL,
    intro text NOT NULL,
    button_text character varying(50) NOT NULL,
    response text NOT NULL,
    redirect_url character varying(200),
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    login_required boolean NOT NULL,
    send_email boolean NOT NULL,
    email_from character varying(254) NOT NULL,
    email_copies character varying(200) NOT NULL,
    email_subject character varying(200) NOT NULL,
    email_message text NOT NULL
);


--
-- Name: forms_form_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forms_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forms_form_id_seq OWNED BY forms_form.id;


--
-- Name: forms_form_sites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE forms_form_sites (
    id integer NOT NULL,
    form_id integer NOT NULL,
    site_id integer NOT NULL
);


--
-- Name: forms_form_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forms_form_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_form_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forms_form_sites_id_seq OWNED BY forms_form_sites.id;


--
-- Name: forms_formentry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE forms_formentry (
    id integer NOT NULL,
    entry_time timestamp with time zone NOT NULL,
    form_id integer NOT NULL
);


--
-- Name: forms_formentry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forms_formentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_formentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forms_formentry_id_seq OWNED BY forms_formentry.id;


--
-- Name: glamkit_collections_country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE glamkit_collections_country (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    iso_country character varying(2) NOT NULL,
    continent character varying(31)
);


--
-- Name: glamkit_collections_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE glamkit_collections_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glamkit_collections_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE glamkit_collections_country_id_seq OWNED BY glamkit_collections_country.id;


--
-- Name: glamkit_collections_geographiclocation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE glamkit_collections_geographiclocation (
    id integer NOT NULL,
    state_province character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    neighborhood character varying(255) NOT NULL,
    colloquial_historical character varying(255) NOT NULL,
    country_id integer
);


--
-- Name: glamkit_collections_geographiclocation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE glamkit_collections_geographiclocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glamkit_collections_geographiclocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE glamkit_collections_geographiclocation_id_seq OWNED BY glamkit_collections_geographiclocation.id;


--
-- Name: glamkit_sponsors_sponsor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE glamkit_sponsors_sponsor (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    logo_id integer NOT NULL
);


--
-- Name: glamkit_sponsors_sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE glamkit_sponsors_sponsor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glamkit_sponsors_sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE glamkit_sponsors_sponsor_id_seq OWNED BY glamkit_sponsors_sponsor.id;


--
-- Name: icekit_article_article; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_article_article (
    id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    layout_id integer,
    parent_id integer NOT NULL,
    publishing_linked_id integer,
    boosted_search_terms text NOT NULL,
    list_image character varying(100) NOT NULL,
    hero_image_id integer,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_article_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_article_article_id_seq OWNED BY icekit_article_article.id;


--
-- Name: icekit_articlecategorypage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_articlecategorypage (
    urlnode_ptr_id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    layout_id integer,
    publishing_linked_id integer,
    boosted_search_terms text NOT NULL,
    hero_image_id integer,
    list_image character varying(100) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_authorlisting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_authorlisting (
    urlnode_ptr_id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    layout_id integer,
    publishing_linked_id integer,
    boosted_search_terms text NOT NULL,
    hero_image_id integer,
    list_image character varying(100) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_authors_author; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_authors_author (
    id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    given_names character varying(255) NOT NULL,
    family_name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    oneliner character varying(255) NOT NULL,
    hero_image_id integer,
    publishing_linked_id integer,
    boosted_search_terms text NOT NULL,
    list_image character varying(100) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_authors_author_id_seq OWNED BY icekit_authors_author.id;


--
-- Name: icekit_event_types_simple_simpleevent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_event_types_simple_simpleevent (
    eventbase_ptr_id integer NOT NULL,
    layout_id integer
);


--
-- Name: icekit_events_eventbase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_events_eventbase (
    id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    show_in_calendar boolean NOT NULL,
    human_dates character varying(255) NOT NULL,
    special_instructions text NOT NULL,
    cta_text character varying(255) NOT NULL,
    cta_url character varying(300),
    derived_from_id integer,
    polymorphic_ctype_id integer,
    publishing_linked_id integer,
    part_of_id integer,
    price_line character varying(255) NOT NULL,
    primary_type_id integer,
    external_ref character varying(255),
    has_tickets_available boolean NOT NULL,
    is_drop_in boolean NOT NULL,
    human_times character varying(255) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_events_eventbase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_events_eventbase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_events_eventbase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_events_eventbase_id_seq OWNED BY icekit_events_eventbase.id;


--
-- Name: icekit_events_eventbase_secondary_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_events_eventbase_secondary_types (
    id integer NOT NULL,
    eventbase_id integer NOT NULL,
    eventtype_id integer NOT NULL
);


--
-- Name: icekit_events_eventbase_secondary_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_events_eventbase_secondary_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_events_eventbase_secondary_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_events_eventbase_secondary_types_id_seq OWNED BY icekit_events_eventbase_secondary_types.id;


--
-- Name: icekit_events_eventrepeatsgenerator; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_events_eventrepeatsgenerator (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    recurrence_rule text,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    is_all_day boolean NOT NULL,
    repeat_end timestamp with time zone,
    event_id integer NOT NULL
);


--
-- Name: icekit_events_eventrepeatsgenerator_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_events_eventrepeatsgenerator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_events_eventrepeatsgenerator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_events_eventrepeatsgenerator_id_seq OWNED BY icekit_events_eventrepeatsgenerator.id;


--
-- Name: icekit_events_eventtype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_events_eventtype (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    is_public boolean NOT NULL,
    title_plural character varying(255) NOT NULL,
    color character varying(7) NOT NULL
);


--
-- Name: icekit_events_eventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_events_eventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_events_eventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_events_eventtype_id_seq OWNED BY icekit_events_eventtype.id;


--
-- Name: icekit_events_occurrence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_events_occurrence (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    is_all_day boolean NOT NULL,
    is_protected_from_regeneration boolean NOT NULL,
    is_cancelled boolean NOT NULL,
    is_hidden boolean NOT NULL,
    cancel_reason character varying(255),
    original_start timestamp with time zone,
    original_end timestamp with time zone,
    event_id integer NOT NULL,
    generator_id integer,
    external_ref character varying(255),
    status character varying(255)
);


--
-- Name: icekit_events_occurrence_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_events_occurrence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_events_occurrence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_events_occurrence_id_seq OWNED BY icekit_events_occurrence.id;


--
-- Name: icekit_events_recurrencerule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_events_recurrencerule (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    recurrence_rule text NOT NULL
);


--
-- Name: icekit_events_recurrencerule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_events_recurrencerule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_events_recurrencerule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_events_recurrencerule_id_seq OWNED BY icekit_events_recurrencerule.id;


--
-- Name: icekit_layout; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_layout (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(255) NOT NULL,
    template_name character varying(255) NOT NULL
);


--
-- Name: icekit_layout_content_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_layout_content_types (
    id integer NOT NULL,
    layout_id integer NOT NULL,
    contenttype_id integer NOT NULL
);


--
-- Name: icekit_layout_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_layout_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_layout_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_layout_content_types_id_seq OWNED BY icekit_layout_content_types.id;


--
-- Name: icekit_layout_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_layout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_layout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_layout_id_seq OWNED BY icekit_layout.id;


--
-- Name: icekit_layoutpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_layoutpage (
    urlnode_ptr_id integer NOT NULL,
    layout_id integer,
    publishing_is_draft boolean NOT NULL,
    publishing_linked_id integer,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    boosted_search_terms text NOT NULL,
    hero_image_id integer,
    list_image character varying(100) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_mediacategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_mediacategory (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: icekit_mediacategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_mediacategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_mediacategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_mediacategory_id_seq OWNED BY icekit_mediacategory.id;


--
-- Name: icekit_plugins_contact_person_contactperson; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_plugins_contact_person_contactperson (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


--
-- Name: icekit_plugins_contact_person_contactperson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_plugins_contact_person_contactperson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_plugins_contact_person_contactperson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_plugins_contact_person_contactperson_id_seq OWNED BY icekit_plugins_contact_person_contactperson.id;


--
-- Name: icekit_plugins_image_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_plugins_image_image (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    alt_text character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    caption text NOT NULL,
    is_ok_for_web boolean NOT NULL,
    notes text NOT NULL,
    credit character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    height integer NOT NULL,
    license text NOT NULL,
    maximum_dimension_pixels integer,
    source character varying(255) NOT NULL,
    width integer NOT NULL,
    is_cropping_allowed boolean NOT NULL,
    external_ref character varying(255) NOT NULL,
    CONSTRAINT icekit_plugins_i_maximum_dimension_pixels_61b32086fa074a6_check CHECK ((maximum_dimension_pixels >= 0)),
    CONSTRAINT icekit_plugins_image_image_height_check CHECK ((height >= 0)),
    CONSTRAINT icekit_plugins_image_image_width_check CHECK ((width >= 0))
);


--
-- Name: icekit_plugins_image_image_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_plugins_image_image_categories (
    id integer NOT NULL,
    image_id integer NOT NULL,
    mediacategory_id integer NOT NULL
);


--
-- Name: icekit_plugins_image_imagerepurposeconfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_plugins_image_imagerepurposeconfig (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    width integer,
    height integer,
    format character varying(4) NOT NULL,
    style character varying(16) NOT NULL,
    is_cropping_allowed boolean NOT NULL,
    CONSTRAINT icekit_plugins_image_imagerepurposeconfig_height_check CHECK ((height >= 0)),
    CONSTRAINT icekit_plugins_image_imagerepurposeconfig_width_check CHECK ((width >= 0))
);


--
-- Name: icekit_plugins_image_imagerepurposeconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_plugins_image_imagerepurposeconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_plugins_image_imagerepurposeconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_plugins_image_imagerepurposeconfig_id_seq OWNED BY icekit_plugins_image_imagerepurposeconfig.id;


--
-- Name: icekit_plugins_slideshow_slideshow; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_plugins_slideshow_slideshow (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    show_title boolean NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_linked_id integer,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_press_releases_pressrelease; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_press_releases_pressrelease (
    id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    print_version character varying(100),
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone,
    released timestamp with time zone,
    category_id integer,
    layout_id integer,
    publishing_linked_id integer,
    boosted_search_terms text NOT NULL,
    list_image character varying(100) NOT NULL
);


--
-- Name: icekit_press_releases_pressrelease_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_press_releases_pressrelease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_press_releases_pressrelease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_press_releases_pressrelease_id_seq OWNED BY icekit_press_releases_pressrelease.id;


--
-- Name: icekit_press_releases_pressreleasecategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_press_releases_pressreleasecategory (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: icekit_press_releases_pressreleasecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icekit_press_releases_pressreleasecategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icekit_press_releases_pressreleasecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icekit_press_releases_pressreleasecategory_id_seq OWNED BY icekit_press_releases_pressreleasecategory.id;


--
-- Name: icekit_searchpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_searchpage (
    urlnode_ptr_id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_linked_id integer,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    boosted_search_terms text NOT NULL,
    list_image character varying(100) NOT NULL,
    default_search_type character varying(255) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: icekit_workflow_workflowstate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icekit_workflow_workflowstate (
    id integer NOT NULL,
    object_id integer NOT NULL,
    status character varying(254) NOT NULL,
    assigned_to_id integer,
    content_type_id integer NOT NULL,
    datetime_modified timestamp with time zone NOT NULL,
    CONSTRAINT workflow_workflowstate_object_id_check CHECK ((object_id >= 0))
);


--
-- Name: ik_event_listing_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ik_event_listing_types (
    id integer NOT NULL,
    eventcontentlistingitem_id integer NOT NULL,
    eventtype_id integer NOT NULL
);


--
-- Name: ik_event_listing_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ik_event_listing_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ik_event_listing_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ik_event_listing_types_id_seq OWNED BY ik_event_listing_types.id;


--
-- Name: ik_todays_occurrences_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ik_todays_occurrences_types (
    id integer NOT NULL,
    todaysoccurrences_id integer NOT NULL,
    eventtype_id integer NOT NULL
);


--
-- Name: ik_todays_occurrences_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ik_todays_occurrences_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ik_todays_occurrences_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ik_todays_occurrences_types_id_seq OWNED BY ik_todays_occurrences_types.id;


--
-- Name: image_image_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE image_image_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: image_image_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE image_image_categories_id_seq OWNED BY icekit_plugins_image_image_categories.id;


--
-- Name: image_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE image_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: image_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE image_image_id_seq OWNED BY icekit_plugins_image_image.id;


--
-- Name: model_settings_boolean; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_boolean (
    setting_ptr_id integer NOT NULL,
    value boolean NOT NULL
);


--
-- Name: model_settings_date; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_date (
    setting_ptr_id integer NOT NULL,
    value date NOT NULL
);


--
-- Name: model_settings_datetime; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_datetime (
    setting_ptr_id integer NOT NULL,
    value timestamp with time zone NOT NULL
);


--
-- Name: model_settings_decimal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_decimal (
    setting_ptr_id integer NOT NULL,
    value numeric(20,10) NOT NULL
);


--
-- Name: model_settings_file; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_file (
    setting_ptr_id integer NOT NULL,
    value character varying(100) NOT NULL
);


--
-- Name: model_settings_float; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_float (
    setting_ptr_id integer NOT NULL,
    value double precision NOT NULL
);


--
-- Name: model_settings_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_image (
    setting_ptr_id integer NOT NULL,
    value character varying(100) NOT NULL
);


--
-- Name: model_settings_integer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_integer (
    setting_ptr_id integer NOT NULL,
    value integer NOT NULL
);


--
-- Name: model_settings_setting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_setting (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    polymorphic_ctype_id integer
);


--
-- Name: model_settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE model_settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: model_settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE model_settings_setting_id_seq OWNED BY model_settings_setting.id;


--
-- Name: model_settings_text; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_text (
    setting_ptr_id integer NOT NULL,
    value character varying(255) NOT NULL
);


--
-- Name: model_settings_time; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_settings_time (
    setting_ptr_id integer NOT NULL,
    value time without time zone NOT NULL
);


--
-- Name: notifications_followerinformation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications_followerinformation (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    polymorphic_ctype_id integer,
    CONSTRAINT notifications_followerinformation_object_id_check CHECK ((object_id >= 0))
);


--
-- Name: notifications_followerinformation_followers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications_followerinformation_followers (
    id integer NOT NULL,
    followerinformation_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: notifications_followerinformation_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_followerinformation_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_followerinformation_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_followerinformation_followers_id_seq OWNED BY notifications_followerinformation_followers.id;


--
-- Name: notifications_followerinformation_group_followers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications_followerinformation_group_followers (
    id integer NOT NULL,
    followerinformation_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: notifications_followerinformation_group_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_followerinformation_group_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_followerinformation_group_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_followerinformation_group_followers_id_seq OWNED BY notifications_followerinformation_group_followers.id;


--
-- Name: notifications_followerinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_followerinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_followerinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_followerinformation_id_seq OWNED BY notifications_followerinformation.id;


--
-- Name: notifications_hasreadmessage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications_hasreadmessage (
    id integer NOT NULL,
    is_read boolean NOT NULL,
    "time" timestamp with time zone,
    is_removed boolean NOT NULL,
    notification_setting character varying(20) NOT NULL,
    email_sent boolean NOT NULL,
    message_id integer NOT NULL,
    person_id integer NOT NULL
);


--
-- Name: notifications_hasreadmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_hasreadmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_hasreadmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_hasreadmessage_id_seq OWNED BY notifications_hasreadmessage.id;


--
-- Name: notifications_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications_notification (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(120) NOT NULL,
    notification text NOT NULL,
    is_removed boolean NOT NULL,
    user_id integer
);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_notification_id_seq OWNED BY notifications_notification.id;


--
-- Name: notifications_notificationsetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications_notificationsetting (
    id integer NOT NULL,
    notification_type character varying(20) NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: notifications_notificationsetting_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_notificationsetting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_notificationsetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_notificationsetting_id_seq OWNED BY notifications_notificationsetting.id;


--
-- Name: pagetype_eventlistingfordate_eventlistingpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pagetype_eventlistingfordate_eventlistingpage (
    urlnode_ptr_id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    layout_id integer,
    publishing_linked_id integer,
    boosted_search_terms text NOT NULL,
    hero_image_id integer,
    list_image character varying(100) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pagetype_icekit_press_releases_pressreleaselisting (
    urlnode_ptr_id integer NOT NULL,
    publishing_is_draft boolean NOT NULL,
    publishing_modified_at timestamp with time zone NOT NULL,
    publishing_published_at timestamp with time zone,
    layout_id integer,
    publishing_linked_id integer,
    boosted_search_terms text NOT NULL,
    hero_image_id integer,
    list_image character varying(100) NOT NULL,
    admin_notes text NOT NULL,
    brief text NOT NULL
);


--
-- Name: pagetype_redirectnode_redirectnode; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pagetype_redirectnode_redirectnode (
    urlnode_ptr_id integer NOT NULL
);


--
-- Name: polymorphic_auth_email_emailuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE polymorphic_auth_email_emailuser (
    user_ptr_id integer NOT NULL,
    email character varying(254) NOT NULL
);


--
-- Name: polymorphic_auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE polymorphic_auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    polymorphic_ctype_id integer
);


--
-- Name: polymorphic_auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE polymorphic_auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: polymorphic_auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE polymorphic_auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polymorphic_auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE polymorphic_auth_user_groups_id_seq OWNED BY polymorphic_auth_user_groups.id;


--
-- Name: polymorphic_auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE polymorphic_auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polymorphic_auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE polymorphic_auth_user_id_seq OWNED BY polymorphic_auth_user.id;


--
-- Name: polymorphic_auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE polymorphic_auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: polymorphic_auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE polymorphic_auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polymorphic_auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE polymorphic_auth_user_user_permissions_id_seq OWNED BY polymorphic_auth_user_user_permissions.id;


--
-- Name: post_office_attachment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE post_office_attachment (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: post_office_attachment_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE post_office_attachment_emails (
    id integer NOT NULL,
    attachment_id integer NOT NULL,
    email_id integer NOT NULL
);


--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_office_attachment_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_office_attachment_emails_id_seq OWNED BY post_office_attachment_emails.id;


--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_office_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_office_attachment_id_seq OWNED BY post_office_attachment.id;


--
-- Name: post_office_email; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE post_office_email (
    id integer NOT NULL,
    from_email character varying(254) NOT NULL,
    "to" text NOT NULL,
    cc text NOT NULL,
    bcc text NOT NULL,
    subject character varying(989) NOT NULL,
    message text NOT NULL,
    html_message text NOT NULL,
    status smallint,
    priority smallint,
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    scheduled_time timestamp with time zone,
    headers text,
    context text,
    template_id integer,
    backend_alias character varying(64) NOT NULL,
    CONSTRAINT post_office_email_priority_check CHECK ((priority >= 0)),
    CONSTRAINT post_office_email_status_check CHECK ((status >= 0))
);


--
-- Name: post_office_email_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_office_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_office_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_office_email_id_seq OWNED BY post_office_email.id;


--
-- Name: post_office_emailtemplate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE post_office_emailtemplate (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    subject character varying(255) NOT NULL,
    content text NOT NULL,
    html_content text NOT NULL,
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    default_template_id integer,
    language character varying(12) NOT NULL
);


--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_office_emailtemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_office_emailtemplate_id_seq OWNED BY post_office_emailtemplate.id;


--
-- Name: post_office_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE post_office_log (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    status smallint NOT NULL,
    exception_type character varying(255) NOT NULL,
    message text NOT NULL,
    email_id integer NOT NULL,
    CONSTRAINT post_office_log_status_check CHECK ((status >= 0))
);


--
-- Name: post_office_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_office_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_office_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_office_log_id_seq OWNED BY post_office_log.id;


--
-- Name: redirectnode_redirectnode_translation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE redirectnode_redirectnode_translation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    new_url character varying(255) NOT NULL,
    redirect_type integer NOT NULL,
    master_id integer
);


--
-- Name: redirectnode_redirectnode_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE redirectnode_redirectnode_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redirectnode_redirectnode_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE redirectnode_redirectnode_translation_id_seq OWNED BY redirectnode_redirectnode_translation.id;


--
-- Name: response_pages_responsepage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE response_pages_responsepage (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    type character varying(5) NOT NULL,
    is_active boolean NOT NULL
);


--
-- Name: response_pages_responsepage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE response_pages_responsepage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: response_pages_responsepage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE response_pages_responsepage_id_seq OWNED BY response_pages_responsepage.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(191) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment text NOT NULL,
    user_id integer
);


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    content_type_id integer NOT NULL,
    revision_id integer NOT NULL
);


--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: sharedcontent_sharedcontent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sharedcontent_sharedcontent (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    is_cross_site boolean NOT NULL,
    parent_site_id integer NOT NULL
);


--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sharedcontent_sharedcontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sharedcontent_sharedcontent_id_seq OWNED BY sharedcontent_sharedcontent.id;


--
-- Name: sharedcontent_sharedcontent_translation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sharedcontent_sharedcontent_translation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    title character varying(200) NOT NULL,
    master_id integer
);


--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sharedcontent_sharedcontent_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sharedcontent_sharedcontent_translation_id_seq OWNED BY sharedcontent_sharedcontent_translation.id;


--
-- Name: slideshow_slideshow_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE slideshow_slideshow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slideshow_slideshow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE slideshow_slideshow_id_seq OWNED BY icekit_plugins_slideshow_slideshow.id;


--
-- Name: workflow_workflowstate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workflow_workflowstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflow_workflowstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE workflow_workflowstate_id_seq OWNED BY icekit_workflow_workflowstate.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: celery_taskmeta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY celery_taskmeta ALTER COLUMN id SET DEFAULT nextval('celery_taskmeta_id_seq'::regclass);


--
-- Name: celery_tasksetmeta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY celery_tasksetmeta ALTER COLUMN id SET DEFAULT nextval('celery_tasksetmeta_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: django_redirect id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_redirect ALTER COLUMN id SET DEFAULT nextval('django_redirect_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: djcelery_crontabschedule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_crontabschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_crontabschedule_id_seq'::regclass);


--
-- Name: djcelery_intervalschedule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_intervalschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_intervalschedule_id_seq'::regclass);


--
-- Name: djcelery_periodictask id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_periodictask ALTER COLUMN id SET DEFAULT nextval('djcelery_periodictask_id_seq'::regclass);


--
-- Name: djcelery_taskstate id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_taskstate ALTER COLUMN id SET DEFAULT nextval('djcelery_taskstate_id_seq'::regclass);


--
-- Name: djcelery_workerstate id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_workerstate ALTER COLUMN id SET DEFAULT nextval('djcelery_workerstate_id_seq'::regclass);


--
-- Name: djkombu_message id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY djkombu_message ALTER COLUMN id SET DEFAULT nextval('djkombu_message_id_seq'::regclass);


--
-- Name: djkombu_queue id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY djkombu_queue ALTER COLUMN id SET DEFAULT nextval('djkombu_queue_id_seq'::regclass);


--
-- Name: easy_thumbnails_source id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnaildimensions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: fluent_contents_contentitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_contentitem ALTER COLUMN id SET DEFAULT nextval('fluent_contents_contentitem_id_seq'::regclass);


--
-- Name: fluent_contents_placeholder id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_placeholder ALTER COLUMN id SET DEFAULT nextval('fluent_contents_placeholder_id_seq'::regclass);


--
-- Name: fluent_pages_htmlpage_translation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_htmlpage_translation ALTER COLUMN id SET DEFAULT nextval('fluent_pages_htmlpage_translation_id_seq'::regclass);


--
-- Name: fluent_pages_pagelayout id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_pagelayout ALTER COLUMN id SET DEFAULT nextval('fluent_pages_pagelayout_id_seq'::regclass);


--
-- Name: fluent_pages_urlnode id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode ALTER COLUMN id SET DEFAULT nextval('fluent_pages_urlnode_id_seq'::regclass);


--
-- Name: fluent_pages_urlnode_translation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode_translation ALTER COLUMN id SET DEFAULT nextval('fluent_pages_urlnode_translation_id_seq'::regclass);


--
-- Name: forms_field id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_field ALTER COLUMN id SET DEFAULT nextval('forms_field_id_seq'::regclass);


--
-- Name: forms_fieldentry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_fieldentry ALTER COLUMN id SET DEFAULT nextval('forms_fieldentry_id_seq'::regclass);


--
-- Name: forms_form id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form ALTER COLUMN id SET DEFAULT nextval('forms_form_id_seq'::regclass);


--
-- Name: forms_form_sites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form_sites ALTER COLUMN id SET DEFAULT nextval('forms_form_sites_id_seq'::regclass);


--
-- Name: forms_formentry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_formentry ALTER COLUMN id SET DEFAULT nextval('forms_formentry_id_seq'::regclass);


--
-- Name: glamkit_collections_country id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_collections_country ALTER COLUMN id SET DEFAULT nextval('glamkit_collections_country_id_seq'::regclass);


--
-- Name: glamkit_collections_geographiclocation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_collections_geographiclocation ALTER COLUMN id SET DEFAULT nextval('glamkit_collections_geographiclocation_id_seq'::regclass);


--
-- Name: glamkit_sponsors_sponsor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_sponsors_sponsor ALTER COLUMN id SET DEFAULT nextval('glamkit_sponsors_sponsor_id_seq'::regclass);


--
-- Name: icekit_article_article id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article ALTER COLUMN id SET DEFAULT nextval('icekit_article_article_id_seq'::regclass);


--
-- Name: icekit_authors_author id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authors_author ALTER COLUMN id SET DEFAULT nextval('icekit_authors_author_id_seq'::regclass);


--
-- Name: icekit_events_eventbase id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase ALTER COLUMN id SET DEFAULT nextval('icekit_events_eventbase_id_seq'::regclass);


--
-- Name: icekit_events_eventbase_secondary_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase_secondary_types ALTER COLUMN id SET DEFAULT nextval('icekit_events_eventbase_secondary_types_id_seq'::regclass);


--
-- Name: icekit_events_eventrepeatsgenerator id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventrepeatsgenerator ALTER COLUMN id SET DEFAULT nextval('icekit_events_eventrepeatsgenerator_id_seq'::regclass);


--
-- Name: icekit_events_eventtype id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventtype ALTER COLUMN id SET DEFAULT nextval('icekit_events_eventtype_id_seq'::regclass);


--
-- Name: icekit_events_occurrence id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_occurrence ALTER COLUMN id SET DEFAULT nextval('icekit_events_occurrence_id_seq'::regclass);


--
-- Name: icekit_events_recurrencerule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_recurrencerule ALTER COLUMN id SET DEFAULT nextval('icekit_events_recurrencerule_id_seq'::regclass);


--
-- Name: icekit_layout id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout ALTER COLUMN id SET DEFAULT nextval('icekit_layout_id_seq'::regclass);


--
-- Name: icekit_layout_content_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout_content_types ALTER COLUMN id SET DEFAULT nextval('icekit_layout_content_types_id_seq'::regclass);


--
-- Name: icekit_mediacategory id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_mediacategory ALTER COLUMN id SET DEFAULT nextval('icekit_mediacategory_id_seq'::regclass);


--
-- Name: icekit_plugins_contact_person_contactperson id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_contact_person_contactperson ALTER COLUMN id SET DEFAULT nextval('icekit_plugins_contact_person_contactperson_id_seq'::regclass);


--
-- Name: icekit_plugins_file_file id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_file_file ALTER COLUMN id SET DEFAULT nextval('file_file_id_seq'::regclass);


--
-- Name: icekit_plugins_file_file_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_file_file_categories ALTER COLUMN id SET DEFAULT nextval('file_file_categories_id_seq'::regclass);


--
-- Name: icekit_plugins_image_image id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_image ALTER COLUMN id SET DEFAULT nextval('image_image_id_seq'::regclass);


--
-- Name: icekit_plugins_image_image_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_image_categories ALTER COLUMN id SET DEFAULT nextval('image_image_categories_id_seq'::regclass);


--
-- Name: icekit_plugins_image_imagerepurposeconfig id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_imagerepurposeconfig ALTER COLUMN id SET DEFAULT nextval('icekit_plugins_image_imagerepurposeconfig_id_seq'::regclass);


--
-- Name: icekit_plugins_slideshow_slideshow id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_slideshow_slideshow ALTER COLUMN id SET DEFAULT nextval('slideshow_slideshow_id_seq'::regclass);


--
-- Name: icekit_press_releases_pressrelease id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressrelease ALTER COLUMN id SET DEFAULT nextval('icekit_press_releases_pressrelease_id_seq'::regclass);


--
-- Name: icekit_press_releases_pressreleasecategory id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressreleasecategory ALTER COLUMN id SET DEFAULT nextval('icekit_press_releases_pressreleasecategory_id_seq'::regclass);


--
-- Name: icekit_workflow_workflowstate id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_workflow_workflowstate ALTER COLUMN id SET DEFAULT nextval('workflow_workflowstate_id_seq'::regclass);


--
-- Name: ik_event_listing_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_event_listing_types ALTER COLUMN id SET DEFAULT nextval('ik_event_listing_types_id_seq'::regclass);


--
-- Name: ik_todays_occurrences_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_todays_occurrences_types ALTER COLUMN id SET DEFAULT nextval('ik_todays_occurrences_types_id_seq'::regclass);


--
-- Name: model_settings_setting id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_setting ALTER COLUMN id SET DEFAULT nextval('model_settings_setting_id_seq'::regclass);


--
-- Name: notifications_followerinformation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation ALTER COLUMN id SET DEFAULT nextval('notifications_followerinformation_id_seq'::regclass);


--
-- Name: notifications_followerinformation_followers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_followers ALTER COLUMN id SET DEFAULT nextval('notifications_followerinformation_followers_id_seq'::regclass);


--
-- Name: notifications_followerinformation_group_followers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_group_followers ALTER COLUMN id SET DEFAULT nextval('notifications_followerinformation_group_followers_id_seq'::regclass);


--
-- Name: notifications_hasreadmessage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_hasreadmessage ALTER COLUMN id SET DEFAULT nextval('notifications_hasreadmessage_id_seq'::regclass);


--
-- Name: notifications_notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_notification ALTER COLUMN id SET DEFAULT nextval('notifications_notification_id_seq'::regclass);


--
-- Name: notifications_notificationsetting id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_notificationsetting ALTER COLUMN id SET DEFAULT nextval('notifications_notificationsetting_id_seq'::regclass);


--
-- Name: polymorphic_auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user ALTER COLUMN id SET DEFAULT nextval('polymorphic_auth_user_id_seq'::regclass);


--
-- Name: polymorphic_auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_groups ALTER COLUMN id SET DEFAULT nextval('polymorphic_auth_user_groups_id_seq'::regclass);


--
-- Name: polymorphic_auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('polymorphic_auth_user_user_permissions_id_seq'::regclass);


--
-- Name: post_office_attachment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_attachment ALTER COLUMN id SET DEFAULT nextval('post_office_attachment_id_seq'::regclass);


--
-- Name: post_office_attachment_emails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_attachment_emails ALTER COLUMN id SET DEFAULT nextval('post_office_attachment_emails_id_seq'::regclass);


--
-- Name: post_office_email id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_email ALTER COLUMN id SET DEFAULT nextval('post_office_email_id_seq'::regclass);


--
-- Name: post_office_emailtemplate id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_emailtemplate ALTER COLUMN id SET DEFAULT nextval('post_office_emailtemplate_id_seq'::regclass);


--
-- Name: post_office_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_log ALTER COLUMN id SET DEFAULT nextval('post_office_log_id_seq'::regclass);


--
-- Name: redirectnode_redirectnode_translation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY redirectnode_redirectnode_translation ALTER COLUMN id SET DEFAULT nextval('redirectnode_redirectnode_translation_id_seq'::regclass);


--
-- Name: response_pages_responsepage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY response_pages_responsepage ALTER COLUMN id SET DEFAULT nextval('response_pages_responsepage_id_seq'::regclass);


--
-- Name: reversion_revision id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: reversion_version id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: sharedcontent_sharedcontent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent ALTER COLUMN id SET DEFAULT nextval('sharedcontent_sharedcontent_id_seq'::regclass);


--
-- Name: sharedcontent_sharedcontent_translation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation ALTER COLUMN id SET DEFAULT nextval('sharedcontent_sharedcontent_translation_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add layout	1	add_layout
2	Can change layout	1	change_layout
3	Can delete layout	1	delete_layout
4	Can add Asset category	2	add_mediacategory
5	Can change Asset category	2	change_mediacategory
6	Can delete Asset category	2	delete_mediacategory
7	Can add user	4	add_user
8	Can change user	4	change_user
9	Can delete user	4	delete_user
10	Can add Form entry	5	add_formentry
11	Can change Form entry	5	change_formentry
12	Can delete Form entry	5	delete_formentry
13	Can add Form field entry	6	add_fieldentry
14	Can change Form field entry	6	change_fieldentry
15	Can delete Form field entry	6	delete_fieldentry
16	Can add Form	7	add_form
17	Can change Form	7	change_form
18	Can delete Form	7	delete_form
19	Can add Field	8	add_field
20	Can change Field	8	change_field
21	Can delete Field	8	delete_field
22	Can add revision	9	add_revision
23	Can change revision	9	change_revision
24	Can delete revision	9	delete_revision
25	Can add version	10	add_version
26	Can change version	10	change_version
27	Can delete version	10	delete_version
28	Can add log entry	11	add_logentry
29	Can change log entry	11	change_logentry
30	Can delete log entry	11	delete_logentry
31	Can add permission	12	add_permission
32	Can change permission	12	change_permission
33	Can delete permission	12	delete_permission
34	Can add group	13	add_group
35	Can change group	13	change_group
36	Can delete group	13	delete_group
37	Can add content type	14	add_contenttype
38	Can change content type	14	change_contenttype
39	Can delete content type	14	delete_contenttype
40	Can add session	15	add_session
41	Can change session	15	change_session
42	Can delete session	15	delete_session
43	Can add redirect	16	add_redirect
44	Can change redirect	16	change_redirect
45	Can delete redirect	16	delete_redirect
46	Can add site	17	add_site
47	Can change site	17	change_site
48	Can delete site	17	delete_site
49	Can add task state	18	add_taskmeta
50	Can change task state	18	change_taskmeta
51	Can delete task state	18	delete_taskmeta
52	Can add saved group result	19	add_tasksetmeta
53	Can change saved group result	19	change_tasksetmeta
54	Can delete saved group result	19	delete_tasksetmeta
55	Can add interval	20	add_intervalschedule
56	Can change interval	20	change_intervalschedule
57	Can delete interval	20	delete_intervalschedule
58	Can add crontab	21	add_crontabschedule
59	Can change crontab	21	change_crontabschedule
60	Can delete crontab	21	delete_crontabschedule
61	Can add periodic tasks	22	add_periodictasks
62	Can change periodic tasks	22	change_periodictasks
63	Can delete periodic tasks	22	delete_periodictasks
64	Can add periodic task	23	add_periodictask
65	Can change periodic task	23	change_periodictask
66	Can delete periodic task	23	delete_periodictask
67	Can add worker	24	add_workerstate
68	Can change worker	24	change_workerstate
69	Can delete worker	24	delete_workerstate
70	Can add task	25	add_taskstate
71	Can change task	25	change_taskstate
72	Can delete task	25	delete_taskstate
73	Can add queue	26	add_queue
74	Can change queue	26	change_queue
75	Can delete queue	26	delete_queue
76	Can add message	27	add_message
77	Can change message	27	change_message
78	Can delete message	27	delete_message
79	Can add source	28	add_source
80	Can change source	28	change_source
81	Can delete source	28	delete_source
82	Can add thumbnail	29	add_thumbnail
83	Can change thumbnail	29	change_thumbnail
84	Can delete thumbnail	29	delete_thumbnail
85	Can add thumbnail dimensions	30	add_thumbnaildimensions
86	Can change thumbnail dimensions	30	change_thumbnaildimensions
87	Can delete thumbnail dimensions	30	delete_thumbnaildimensions
88	Can add Placeholder	31	add_placeholder
89	Can change Placeholder	31	change_placeholder
90	Can delete Placeholder	31	delete_placeholder
91	Can add Contentitem link	32	add_contentitem
92	Can change Contentitem link	32	change_contentitem
93	Can delete Contentitem link	32	delete_contentitem
94	Can add URL Node	33	add_urlnode
95	Can change URL Node	33	change_urlnode
96	Can delete URL Node	33	delete_urlnode
97	Can change Shared fields	33	change_shared_fields_urlnode
98	Can change Override URL field	33	change_override_url_urlnode
99	Can add URL Node translation	34	add_urlnode_translation
100	Can change URL Node translation	34	change_urlnode_translation
101	Can delete URL Node translation	34	delete_urlnode_translation
102	Can add Page	33	add_page
103	Can change Page	33	change_page
104	Can delete Page	33	delete_page
105	Can add html page	33	add_htmlpage
106	Can change html page	33	change_htmlpage
107	Can delete html page	33	delete_htmlpage
108	Can add Layout	36	add_pagelayout
109	Can change Layout	36	change_pagelayout
110	Can delete Layout	36	delete_pagelayout
111	Can add Redirect	40	add_redirectnode
112	Can change Redirect	40	change_redirectnode
113	Can delete Redirect	40	delete_redirectnode
114	Can add Iframe	41	add_iframeitem
115	Can change Iframe	41	change_iframeitem
116	Can delete Iframe	41	delete_iframeitem
117	Can add Online media	42	add_oembeditem
118	Can change Online media	42	change_oembeditem
119	Can delete Online media	42	delete_oembeditem
120	Can add HTML code	43	add_rawhtmlitem
121	Can change HTML code	43	change_rawhtmlitem
122	Can delete HTML code	43	delete_rawhtmlitem
123	Can add Shared content	45	add_sharedcontent
124	Can change Shared content	45	change_sharedcontent
125	Can delete Shared content	45	delete_sharedcontent
126	Can add Shared content	46	add_sharedcontentitem
127	Can change Shared content	46	change_sharedcontentitem
128	Can delete Shared content	46	delete_sharedcontentitem
129	Can add workflow state	47	add_workflowstate
130	Can change workflow state	47	change_workflowstate
131	Can delete workflow state	47	delete_workflowstate
132	Can add response page	48	add_responsepage
133	Can change response page	48	change_responsepage
134	Can delete response page	48	delete_responsepage
135	Can add notification setting	49	add_notificationsetting
136	Can change notification setting	49	change_notificationsetting
137	Can delete notification setting	49	delete_notificationsetting
138	Can add has read message	50	add_hasreadmessage
139	Can change has read message	50	change_hasreadmessage
140	Can delete has read message	50	delete_hasreadmessage
141	Can add notification	51	add_notification
142	Can change notification	51	change_notification
143	Can delete notification	51	delete_notification
144	Can add follower information	52	add_followerinformation
145	Can change follower information	52	change_followerinformation
146	Can delete follower information	52	delete_followerinformation
147	Can Publish Article	53	can_publish
148	Can Republish Article	53	can_republish
149	Can Publish ArticleCategoryPage	54	can_publish
150	Can Republish ArticleCategoryPage	54	can_republish
151	Can add article	53	add_article
152	Can change article	53	change_article
153	Can delete article	53	delete_article
154	Can add article category page	54	add_articlecategorypage
155	Can change article category page	54	change_articlecategorypage
156	Can delete article category page	54	delete_articlecategorypage
157	Can Publish AuthorListing	55	can_publish
158	Can Republish AuthorListing	55	can_republish
159	Can Publish Author	56	can_publish
160	Can Republish Author	56	can_republish
161	Can add author listing	55	add_authorlisting
162	Can change author listing	55	change_authorlisting
163	Can delete author listing	55	delete_authorlisting
164	Can add author	56	add_author
165	Can change author	56	change_author
166	Can delete author	56	delete_author
167	Can Publish LayoutPage	57	can_publish
168	Can Republish LayoutPage	57	can_republish
169	Can add Page	57	add_layoutpage
170	Can change Page	57	change_layoutpage
171	Can delete Page	57	delete_layoutpage
172	Can Publish SearchPage	58	can_publish
173	Can Republish SearchPage	58	can_republish
174	Can add search page	58	add_searchpage
175	Can change search page	58	change_searchpage
176	Can delete search page	58	delete_searchpage
177	Can add Child Pages	59	add_childpageitem
178	Can change Child Pages	59	change_childpageitem
179	Can delete Child Pages	59	delete_childpageitem
180	Can add contact person	60	add_contactperson
181	Can change contact person	60	change_contactperson
182	Can delete contact person	60	delete_contactperson
183	Can add Contact Person	61	add_contactpersonitem
184	Can change Contact Person	61	change_contactpersonitem
185	Can delete Contact Person	61	delete_contactpersonitem
186	Can add Content Listing	62	add_contentlistingitem
187	Can change Content Listing	62	change_contentlistingitem
188	Can delete Content Listing	62	delete_contentlistingitem
189	Can add FAQ	63	add_faqitem
190	Can change FAQ	63	change_faqitem
191	Can delete FAQ	63	delete_faqitem
192	Can add file	64	add_file
193	Can change file	64	change_file
194	Can delete file	64	delete_file
195	Can add File	65	add_fileitem
196	Can change File	65	change_fileitem
197	Can delete File	65	delete_fileitem
198	Can add Horizontal Rule	66	add_horizontalruleitem
199	Can change Horizontal Rule	66	change_horizontalruleitem
200	Can delete Horizontal Rule	66	delete_horizontalruleitem
201	Can add image	67	add_image
202	Can change image	67	change_image
203	Can delete image	67	delete_image
204	Can add Image	68	add_imageitem
205	Can change Image	68	change_imageitem
206	Can delete Image	68	delete_imageitem
207	Can add Image derivative	69	add_imagerepurposeconfig
208	Can change Image derivative	69	change_imagerepurposeconfig
209	Can delete Image derivative	69	delete_imagerepurposeconfig
210	Can add Instagram Embed	70	add_instagramembeditem
211	Can change Instagram Embed	70	change_instagramembeditem
212	Can delete Instagram Embed	70	delete_instagramembeditem
213	Can add Page link	71	add_pagelink
214	Can change Page link	71	change_pagelink
215	Can delete Page link	71	delete_pagelink
216	Can add Article link	72	add_articlelink
217	Can change Article link	72	change_articlelink
218	Can delete Article link	72	delete_articlelink
219	Can add Author link	73	add_authorlink
220	Can change Author link	73	change_authorlink
221	Can delete Author link	73	delete_authorlink
222	Can add Google Map	74	add_mapitem
223	Can change Google Map	74	change_mapitem
224	Can delete Google Map	74	delete_mapitem
225	Can add Embedded media	75	add_oembedwithcaptionitem
226	Can change Embedded media	75	change_oembedwithcaptionitem
227	Can delete Embedded media	75	delete_oembedwithcaptionitem
228	Can add Page Anchor	76	add_pageanchoritem
229	Can change Page Anchor	76	change_pageanchoritem
230	Can delete Page Anchor	76	delete_pageanchoritem
231	Can add Page Anchor List	77	add_pageanchorlistitem
232	Can change Page Anchor List	77	change_pageanchorlistitem
233	Can delete Page Anchor List	77	delete_pageanchorlistitem
234	Can add Pull quote	78	add_quoteitem
235	Can change Pull quote	78	change_quoteitem
236	Can delete Pull quote	78	delete_quoteitem
237	Can add Form	79	add_formitem
238	Can change Form	79	change_formitem
239	Can delete Form	79	delete_formitem
240	Can Publish SlideShow	80	can_publish
241	Can Republish SlideShow	80	can_republish
242	Can add Image gallery	80	add_slideshow
243	Can change Image gallery	80	change_slideshow
244	Can delete Image gallery	80	delete_slideshow
245	Can add Slide show	81	add_slideshowitem
246	Can change Slide show	81	change_slideshowitem
247	Can delete Slide show	81	delete_slideshowitem
248	Can add Image Gallery	82	add_imagegalleryshowitem
249	Can change Image Gallery	82	change_imagegalleryshowitem
250	Can delete Image Gallery	82	delete_imagegalleryshowitem
251	Can add Twitter Embed	83	add_twitterembeditem
252	Can change Twitter Embed	83	change_twitterembeditem
253	Can delete Twitter Embed	83	delete_twitterembeditem
254	Can add Text	84	add_textitem
255	Can change Text	84	change_textitem
256	Can delete Text	84	delete_textitem
257	Can add setting	85	add_setting
258	Can change setting	85	change_setting
259	Can delete setting	85	delete_setting
260	Can add boolean	86	add_boolean
261	Can change boolean	86	change_boolean
262	Can delete boolean	86	delete_boolean
263	Can add date	87	add_date
264	Can change date	87	change_date
265	Can delete date	87	delete_date
266	Can add date time	88	add_datetime
267	Can change date time	88	change_datetime
268	Can delete date time	88	delete_datetime
269	Can add decimal	89	add_decimal
270	Can change decimal	89	change_decimal
271	Can delete decimal	89	delete_decimal
272	Can add file	90	add_file
273	Can change file	90	change_file
274	Can delete file	90	delete_file
275	Can add float	91	add_float
276	Can change float	91	change_float
277	Can delete float	91	delete_float
278	Can add image	92	add_image
279	Can change image	92	change_image
280	Can delete image	92	delete_image
281	Can add integer	93	add_integer
282	Can change integer	93	change_integer
283	Can delete integer	93	delete_integer
284	Can add text	94	add_text
285	Can change text	94	change_text
286	Can delete text	94	delete_text
287	Can add time	95	add_time
288	Can change time	95	change_time
289	Can delete time	95	delete_time
290	Can add user with email login	3	add_emailuser
291	Can change user with email login	3	change_emailuser
292	Can delete user with email login	3	delete_emailuser
293	Can add Email	96	add_email
294	Can change Email	96	change_email
295	Can delete Email	96	delete_email
296	Can add Log	97	add_log
297	Can change Log	97	change_log
298	Can delete Log	97	delete_log
299	Can add Email Template	98	add_emailtemplate
300	Can change Email Template	98	change_emailtemplate
301	Can delete Email Template	98	delete_emailtemplate
302	Can add Attachment	99	add_attachment
303	Can change Attachment	99	change_attachment
304	Can delete Attachment	99	delete_attachment
305	Can add sponsor	100	add_sponsor
306	Can change sponsor	100	change_sponsor
307	Can delete sponsor	100	delete_sponsor
308	Can add Begin Sponsor Block	101	add_beginsponsorblockitem
309	Can change Begin Sponsor Block	101	change_beginsponsorblockitem
310	Can delete Begin Sponsor Block	101	delete_beginsponsorblockitem
311	Can add End sponsor block	102	add_endsponsorblockitem
312	Can change End sponsor block	102	change_endsponsorblockitem
313	Can delete End sponsor block	102	delete_endsponsorblockitem
314	Can add Sponsor promo	103	add_sponsorpromoitem
315	Can change Sponsor promo	103	change_sponsorpromoitem
316	Can delete Sponsor promo	103	delete_sponsorpromoitem
317	Can Publish PressReleaseListing	104	can_publish
318	Can Republish PressReleaseListing	104	can_republish
319	Can Publish PressRelease	105	can_publish
320	Can Republish PressRelease	105	can_republish
321	Can add Press release listing	104	add_pressreleaselisting
322	Can change Press release listing	104	change_pressreleaselisting
323	Can delete Press release listing	104	delete_pressreleaselisting
324	Can add press release category	106	add_pressreleasecategory
325	Can change press release category	106	change_pressreleasecategory
326	Can delete press release category	106	delete_pressreleasecategory
327	Can add press release	105	add_pressrelease
328	Can change press release	105	change_pressrelease
329	Can delete press release	105	delete_pressrelease
330	Can add Token	107	add_token
331	Can change Token	107	change_token
332	Can delete Token	107	delete_token
333	Can Publish EventBase	108	can_publish
334	Can Republish EventBase	108	can_republish
335	Can add recurrence rule	109	add_recurrencerule
336	Can change recurrence rule	109	change_recurrencerule
337	Can delete recurrence rule	109	delete_recurrencerule
338	Can add Event category	110	add_eventtype
339	Can change Event category	110	change_eventtype
340	Can delete Event category	110	delete_eventtype
341	Can add Event	108	add_eventbase
342	Can change Event	108	change_eventbase
343	Can delete Event	108	delete_eventbase
344	Can add event repeats generator	111	add_eventrepeatsgenerator
345	Can change event repeats generator	111	change_eventrepeatsgenerator
346	Can delete event repeats generator	111	delete_eventrepeatsgenerator
347	Can add occurrence	112	add_occurrence
348	Can change occurrence	112	change_occurrence
349	Can delete occurrence	112	delete_occurrence
350	Can Publish SimpleEvent	113	can_publish
351	Can Republish SimpleEvent	113	can_republish
352	Can add Simple event	113	add_simpleevent
353	Can change Simple event	113	change_simpleevent
354	Can delete Simple event	113	delete_simpleevent
355	Can add Event Content Listing	114	add_eventcontentlistingitem
356	Can change Event Content Listing	114	change_eventcontentlistingitem
357	Can delete Event Content Listing	114	delete_eventcontentlistingitem
358	Can add Event link	115	add_eventlink
359	Can change Event link	115	change_eventlink
360	Can delete Event link	115	delete_eventlink
361	Can add Today's events	116	add_todaysoccurrences
362	Can change Today's events	116	change_todaysoccurrences
363	Can delete Today's events	116	delete_todaysoccurrences
364	Can Publish EventListingPage	117	can_publish
365	Can Republish EventListingPage	117	can_republish
366	Can add Event listing for date	117	add_eventlistingpage
367	Can change Event listing for date	117	change_eventlistingpage
368	Can delete Event listing for date	117	delete_eventlistingpage
369	Can add country	118	add_country
370	Can change country	118	change_country
371	Can delete country	118	delete_country
372	Can add geographic location	119	add_geographiclocation
373	Can change geographic location	119	change_geographiclocation
374	Can delete geographic location	119	delete_geographiclocation
375	Can Use IIIF Image API	4	can_use_iiif_image_api
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 375, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: celery_taskmeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY celery_taskmeta (id, task_id, status, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('celery_taskmeta_id_seq', 1, false);


--
-- Data for Name: celery_tasksetmeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY celery_tasksetmeta (id, taskset_id, result, date_done, hidden) FROM stdin;
\.


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('celery_tasksetmeta_id_seq', 1, false);


--
-- Data for Name: contentitem_glamkit_sponsors_beginsponsorblockitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_glamkit_sponsors_beginsponsorblockitem (contentitem_ptr_id, text) FROM stdin;
\.


--
-- Data for Name: contentitem_glamkit_sponsors_endsponsorblockitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_glamkit_sponsors_endsponsorblockitem (contentitem_ptr_id, text) FROM stdin;
\.


--
-- Data for Name: contentitem_glamkit_sponsors_sponsorpromoitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_glamkit_sponsors_sponsorpromoitem (contentitem_ptr_id, title, width, quality, sponsor_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_events_links_eventlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_events_links_eventlink (contentitem_ptr_id, style, type_override, title_override, oneliner_override, url_override, image_override, item_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_child_pages_childpageitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_child_pages_childpageitem (contentitem_ptr_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_contact_person_contactpersonitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_contact_person_contactpersonitem (contentitem_ptr_id, contact_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_content_listing_contentlistingitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_content_listing_contentlistingitem (contentitem_ptr_id, content_type_id, "limit", no_items_message) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_faq_faqitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_faq_faqitem (contentitem_ptr_id, question, answer, load_open) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_file_fileitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_file_fileitem (contentitem_ptr_id, file_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_horizontal_rule_horizontalruleitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_horizontal_rule_horizontalruleitem (contentitem_ptr_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_image_imageitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_image_imageitem (contentitem_ptr_id, image_id, caption_override, show_caption, show_title, title_override) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_instagram_embed_instagramembeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_instagram_embed_instagramembeditem (contentitem_ptr_id, url, provider_url, media_id, author_name, height, width, thumbnail_url, thumbnail_width, thumbnail_height, provider_name, title, html, version, author_url, author_id, type) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_map_mapitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_map_mapitem (contentitem_ptr_id, share_url) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem (contentitem_ptr_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_page_anchor_pageanchoritem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_page_anchor_pageanchoritem (contentitem_ptr_id, anchor_name) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_quote_quoteitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_quote_quoteitem (contentitem_ptr_id, quote, attribution, organisation, url) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_reusable_form_formitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_reusable_form_formitem (contentitem_ptr_id, form_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_slideshow_slideshowitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_slideshow_slideshowitem (contentitem_ptr_id, slide_show_id) FROM stdin;
\.


--
-- Data for Name: contentitem_icekit_plugins_twitter_embed_twitterembeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_icekit_plugins_twitter_embed_twitterembeditem (contentitem_ptr_id, twitter_url, url, provider_url, cache_age, author_name, height, width, provider_name, version, author_url, type, html) FROM stdin;
\.


--
-- Data for Name: contentitem_iframe_iframeitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_iframe_iframeitem (contentitem_ptr_id, src, width, height) FROM stdin;
\.


--
-- Data for Name: contentitem_ik_event_listing_eventcontentlistingitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_ik_event_listing_eventcontentlistingitem (contentitem_ptr_id, "limit", content_type_id, from_date, from_days_ago, to_date, to_days_ahead, no_items_message) FROM stdin;
\.


--
-- Data for Name: contentitem_ik_events_todays_occurrences_todaysoccurrences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_ik_events_todays_occurrences_todaysoccurrences (contentitem_ptr_id, include_finished, fall_back_to_next_day, title) FROM stdin;
\.


--
-- Data for Name: contentitem_ik_links_articlelink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_ik_links_articlelink (contentitem_ptr_id, style, type_override, title_override, image_override, item_id, url_override, oneliner_override) FROM stdin;
\.


--
-- Data for Name: contentitem_ik_links_authorlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_ik_links_authorlink (contentitem_ptr_id, style, type_override, title_override, image_override, item_id, url_override, oneliner_override) FROM stdin;
\.


--
-- Data for Name: contentitem_ik_links_pagelink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_ik_links_pagelink (contentitem_ptr_id, style, type_override, title_override, image_override, item_id, url_override, oneliner_override) FROM stdin;
\.


--
-- Data for Name: contentitem_image_gallery_imagegalleryshowitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_image_gallery_imagegalleryshowitem (contentitem_ptr_id, slide_show_id) FROM stdin;
\.


--
-- Data for Name: contentitem_oembed_with_caption_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_oembed_with_caption_item (contentitem_ptr_id, embed_url, embed_max_width, embed_max_height, type, url, title, description, author_name, author_url, provider_name, provider_url, thumbnail_url, thumbnail_height, thumbnail_width, height, width, html, caption, is_16by9) FROM stdin;
\.


--
-- Data for Name: contentitem_oembeditem_oembeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_oembeditem_oembeditem (contentitem_ptr_id, embed_url, embed_max_width, embed_max_height, type, url, title, description, author_name, author_url, provider_name, provider_url, thumbnail_url, thumbnail_height, thumbnail_width, height, width, html) FROM stdin;
\.


--
-- Data for Name: contentitem_rawhtml_rawhtmlitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_rawhtml_rawhtmlitem (contentitem_ptr_id, html) FROM stdin;
\.


--
-- Data for Name: contentitem_sharedcontent_sharedcontentitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_sharedcontent_sharedcontentitem (contentitem_ptr_id, shared_content_id) FROM stdin;
\.


--
-- Data for Name: contentitem_text_textitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contentitem_text_textitem (contentitem_ptr_id, text, style) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	icekit	layout
2	icekit	mediacategory
3	polymorphic_auth_email	emailuser
4	polymorphic_auth	user
5	forms	formentry
6	forms	fieldentry
7	forms	form
8	forms	field
9	reversion	revision
10	reversion	version
11	admin	logentry
12	auth	permission
13	auth	group
14	contenttypes	contenttype
15	sessions	session
16	redirects	redirect
17	sites	site
18	djcelery	taskmeta
19	djcelery	tasksetmeta
20	djcelery	intervalschedule
21	djcelery	crontabschedule
22	djcelery	periodictasks
23	djcelery	periodictask
24	djcelery	workerstate
25	djcelery	taskstate
26	kombu_transport_django	queue
27	kombu_transport_django	message
28	easy_thumbnails	source
29	easy_thumbnails	thumbnail
30	easy_thumbnails	thumbnaildimensions
31	fluent_contents	placeholder
32	fluent_contents	contentitem
33	fluent_pages	urlnode
34	fluent_pages	urlnode_translation
35	fluent_pages	htmlpagetranslation
36	fluent_pages	pagelayout
37	fluent_pages	htmlpage
38	fluent_pages	page
39	redirectnode	redirectnodetranslation
40	redirectnode	redirectnode
41	iframe	iframeitem
42	oembeditem	oembeditem
43	rawhtml	rawhtmlitem
44	sharedcontent	sharedcontenttranslation
45	sharedcontent	sharedcontent
46	sharedcontent	sharedcontentitem
47	icekit_workflow	workflowstate
48	response_pages	responsepage
49	notifications	notificationsetting
50	notifications	hasreadmessage
51	notifications	notification
52	notifications	followerinformation
53	icekit_article	article
54	icekit_article	articlecategorypage
55	icekit_authors	authorlisting
56	icekit_authors	author
57	layout_page	layoutpage
58	search_page	searchpage
59	icekit_plugins_child_pages	childpageitem
60	icekit_plugins_contact_person	contactperson
61	icekit_plugins_contact_person	contactpersonitem
62	icekit_plugins_content_listing	contentlistingitem
63	icekit_plugins_faq	faqitem
64	icekit_plugins_file	file
65	icekit_plugins_file	fileitem
66	icekit_plugins_horizontal_rule	horizontalruleitem
67	icekit_plugins_image	image
68	icekit_plugins_image	imageitem
69	icekit_plugins_image	imagerepurposeconfig
70	icekit_plugins_instagram_embed	instagramembeditem
71	ik_links	pagelink
72	ik_links	articlelink
73	ik_links	authorlink
74	icekit_plugins_map	mapitem
75	icekit_plugins_oembed_with_caption	oembedwithcaptionitem
76	icekit_plugins_page_anchor	pageanchoritem
77	icekit_plugins_page_anchor_list	pageanchorlistitem
78	icekit_plugins_quote	quoteitem
79	icekit_plugins_reusable_form	formitem
80	icekit_plugins_slideshow	slideshow
81	icekit_plugins_slideshow	slideshowitem
82	image_gallery	imagegalleryshowitem
83	icekit_plugins_twitter_embed	twitterembeditem
84	text	textitem
85	model_settings	setting
86	model_settings	boolean
87	model_settings	date
88	model_settings	datetime
89	model_settings	decimal
90	model_settings	file
91	model_settings	float
92	model_settings	image
93	model_settings	integer
94	model_settings	text
95	model_settings	time
96	post_office	email
97	post_office	log
98	post_office	emailtemplate
99	post_office	attachment
100	glamkit_sponsors	sponsor
101	glamkit_sponsors	beginsponsorblockitem
102	glamkit_sponsors	endsponsorblockitem
103	glamkit_sponsors	sponsorpromoitem
104	icekit_press_releases	pressreleaselisting
105	icekit_press_releases	pressrelease
106	icekit_press_releases	pressreleasecategory
107	authtoken	token
108	icekit_events	eventbase
109	icekit_events	recurrencerule
110	icekit_events	eventtype
111	icekit_events	eventrepeatsgenerator
112	icekit_events	occurrence
113	icekit_event_types_simple	simpleevent
114	ik_event_listing	eventcontentlistingitem
115	icekit_events_links	eventlink
116	ik_events_todays_occurrences	todaysoccurrences
117	eventlistingfordate	eventlistingpage
118	glamkit_collections	country
119	glamkit_collections	geographiclocation
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 119, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-05-30 14:09:39.976446+10
2	auth	0001_initial	2017-05-30 14:09:40.324984+10
3	polymorphic_auth	0001_initial	2017-05-30 14:09:40.594348+10
4	admin	0001_initial	2017-05-30 14:09:40.777311+10
5	contenttypes	0002_remove_content_type_name	2017-05-30 14:09:41.234279+10
6	auth	0002_alter_permission_name_max_length	2017-05-30 14:09:41.434633+10
7	auth	0003_alter_user_email_max_length	2017-05-30 14:09:41.55849+10
8	auth	0004_alter_user_username_opts	2017-05-30 14:09:41.669288+10
9	auth	0005_alter_user_last_login_null	2017-05-30 14:09:41.807069+10
10	auth	0006_require_contenttypes_0002	2017-05-30 14:09:41.823036+10
11	authtoken	0001_initial	2017-05-30 14:09:42.033304+10
12	authtoken	0002_auto_20160226_1747	2017-05-30 14:09:42.690779+10
13	djcelery	0001_initial	2017-05-30 14:09:43.297965+10
14	easy_thumbnails	0001_initial	2017-05-30 14:09:43.452937+10
15	easy_thumbnails	0002_thumbnaildimensions	2017-05-30 14:09:43.515702+10
16	icekit	0001_initial	2017-05-30 14:09:43.588376+10
17	fluent_contents	0001_initial	2017-05-30 14:09:44.663135+10
18	icekit_plugins_image	0001_initial	2017-05-30 14:09:45.100237+10
19	icekit_plugins_image	0002_auto_20150527_0022	2017-05-30 14:09:45.321974+10
20	icekit_plugins_image	0003_auto_20150623_0115	2017-05-30 14:09:45.667469+10
21	icekit_plugins_image	0004_auto_20151001_2023	2017-05-30 14:09:46.197371+10
22	icekit_plugins_image	0005_imageitem_caption_override	2017-05-30 14:09:46.462103+10
23	icekit_plugins_image	0006_auto_20160309_0453	2017-05-30 14:09:47.465346+10
24	icekit_plugins_image	0007_auto_20160920_1626	2017-05-30 14:09:48.685422+10
25	icekit_plugins_image	0008_auto_20160920_2114	2017-05-30 14:09:49.137917+10
26	icekit_plugins_image	0009_auto_20161026_2044	2017-05-30 14:09:49.394908+10
27	icekit	0002_layout	2017-05-30 14:09:49.540122+10
28	icekit	0003_layout_content_types	2017-05-30 14:09:49.830902+10
29	icekit	0004_auto_20150611_2044	2017-05-30 14:09:50.166369+10
30	icekit	0005_remove_layout_key	2017-05-30 14:09:50.454618+10
31	icekit	0006_auto_20150911_0744	2017-05-30 14:09:50.723253+10
32	sites	0001_initial	2017-05-30 14:09:50.825432+10
33	fluent_pages	0001_initial	2017-05-30 14:09:53.214726+10
34	eventlistingfordate	0001_initial	2017-05-30 14:09:53.498582+10
35	eventlistingfordate	0002_auto_20161018_1113	2017-05-30 14:09:53.945547+10
36	eventlistingfordate	0003_auto_20161019_1906	2017-05-30 14:09:54.171457+10
37	eventlistingfordate	0004_auto_20161115_1118	2017-05-30 14:09:55.435093+10
38	eventlistingfordate	0005_auto_20161130_1109	2017-05-30 14:09:55.846608+10
39	eventlistingfordate	0006_auto_20170519_1345	2017-05-30 14:09:56.824838+10
40	forms	0001_initial	2017-05-30 14:09:58.896517+10
41	forms	0002_auto_20160418_0120	2017-05-30 14:09:59.257162+10
42	glamkit_collections	0001_initial	2017-05-30 14:09:59.609126+10
43	glamkit_collections	0002_auto_20170412_1520	2017-05-30 14:10:01.018656+10
44	glamkit_collections	0003_auto_20170412_1742	2017-05-30 14:10:01.381816+10
45	glamkit_sponsors	0001_initial	2017-05-30 14:10:01.921776+10
46	glamkit_sponsors	0002_beginsponsorblockitem_endsponsorblockitem_sponsorpromoitem	2017-05-30 14:10:03.649785+10
47	icekit	0007_auto_20170310_1220	2017-05-30 14:10:04.456654+10
48	icekit_article	0001_initial	2017-05-30 14:10:14.590397+10
49	icekit_article	0002_auto_20161019_1906	2017-05-30 14:10:15.035891+10
50	icekit_article	0003_auto_20161110_1125	2017-05-30 14:10:16.8711+10
51	icekit_article	0004_article_hero_image	2017-05-30 14:10:17.643959+10
52	icekit_article	0005_add_hero	2017-05-30 14:10:20.09792+10
53	icekit_article	0006_auto_20161117_1800	2017-05-30 14:10:21.451292+10
54	icekit_article	0007_auto_20161130_1109	2017-05-30 14:10:23.424834+10
55	icekit_article	0008_auto_20170518_1629	2017-05-30 14:10:26.662858+10
56	icekit_plugins_image	0010_auto_20170307_1458	2017-05-30 14:10:35.276388+10
57	icekit_plugins_image	0011_auto_20170310_1853	2017-05-30 14:10:36.920249+10
58	icekit_plugins_image	0012_imagerepurposeconfig_is_cropping_allowed	2017-05-30 14:10:37.054585+10
59	icekit_plugins_image	0013_image_is_cropping_allowed	2017-05-30 14:10:37.745382+10
60	icekit_plugins_image	0014_image_external_ref	2017-05-30 14:10:38.327902+10
61	icekit_plugins_image	0015_auto_20170310_2004	2017-05-30 14:10:40.179689+10
62	icekit_plugins_image	0016_auto_20170314_1306	2017-05-30 14:10:40.378613+10
63	icekit_plugins_image	0017_auto_20170314_1352	2017-05-30 14:10:40.466211+10
64	icekit_plugins_image	0018_auto_20170314_1401	2017-05-30 14:10:40.474784+10
65	icekit_plugins_image	0016_auto_20170316_2021	2017-05-30 14:10:40.489574+10
66	icekit_plugins_image	0019_merge	2017-05-30 14:10:40.498153+10
67	icekit_plugins_image	0020_auto_20170317_1655	2017-05-30 14:10:40.5859+10
68	icekit_authors	0001_initial	2017-05-30 14:10:42.280113+10
69	icekit_authors	0002_auto_20161011_1522	2017-05-30 14:10:43.923091+10
70	icekit_authors	0003_auto_20161115_1118	2017-05-30 14:10:45.965344+10
71	icekit_authors	0004_auto_20161117_1201	2017-05-30 14:10:47.444869+10
72	icekit_authors	0005_auto_20161117_1824	2017-05-30 14:10:48.222916+10
73	icekit_authors	0006_auto_20161117_1825	2017-05-30 14:10:48.881106+10
74	icekit_authors	0007_auto_20161125_1720	2017-05-30 14:10:50.46593+10
75	icekit_authors	0008_auto_20161128_1049	2017-05-30 14:10:52.427533+10
76	icekit_authors	0009_auto_20170317_1655	2017-05-30 14:10:54.760558+10
77	icekit_authors	0010_auto_20170317_1656	2017-05-30 14:10:55.758181+10
78	icekit_authors	0011_auto_20170518_1629	2017-05-30 14:10:59.501787+10
79	icekit_events	0001_initial	2017-05-30 14:11:02.795101+10
80	icekit_event_types_simple	0001_initial	2017-05-30 14:11:03.584323+10
81	icekit_event_types_simple	0002_simpleevent_layout	2017-05-30 14:11:04.544081+10
82	icekit_event_types_simple	0003_auto_20161125_1701	2017-05-30 14:11:05.431217+10
83	icekit_events	0002_recurrence_rules	2017-05-30 14:11:05.818563+10
84	icekit_events	0003_auto_20161021_1658	2017-05-30 14:11:06.768925+10
85	icekit_events	0004_eventbase_part_of	2017-05-30 14:11:07.991716+10
86	icekit_events	0005_auto_20161024_1742	2017-05-30 14:11:09.61602+10
87	icekit_events	0006_auto_20161107_1747	2017-05-30 14:11:11.39006+10
88	icekit_events	0007_type_fixtures	2017-05-30 14:11:11.459931+10
89	icekit_events	0008_occurrence_external_ref	2017-05-30 14:11:12.108687+10
90	icekit_events	0009_auto_20161125_1538	2017-05-30 14:11:14.275895+10
91	icekit_events	0010_eventbase_is_drop_in	2017-05-30 14:11:15.167216+10
92	icekit_events	0011_auto_20161128_1049	2017-05-30 14:11:18.120523+10
93	icekit_events	0012_occurrence_status	2017-05-30 14:11:19.026865+10
94	icekit_events	0012_eventtype_title_plural	2017-05-30 14:11:20.092552+10
95	icekit_events	0013_merge	2017-05-30 14:11:20.09975+10
96	icekit_events	0014_eventbase_human_times	2017-05-30 14:11:20.855757+10
97	icekit_events	0015_auto_20161208_0029	2017-05-30 14:11:21.920939+10
98	icekit_events	0016_auto_20161208_0030	2017-05-30 14:11:30.208734+10
99	icekit_events	0017_eventtype_color	2017-05-30 14:11:31.252529+10
100	icekit_events	0018_auto_20170307_1458	2017-05-30 14:11:31.914997+10
101	icekit_events	0019_auto_20170310_1220	2017-05-30 14:11:34.501088+10
102	icekit_events	0020_auto_20170317_1341	2017-05-30 14:11:35.432534+10
103	icekit_events	0018_auto_20170314_1401	2017-05-30 14:11:36.359344+10
104	icekit_events	0021_merge	2017-05-30 14:11:36.373349+10
105	icekit_events	0022_auto_20170320_1807	2017-05-30 14:11:37.725313+10
106	icekit_events	0023_auto_20170320_1820	2017-05-30 14:11:39.177261+10
107	icekit_events	0024_auto_20170320_1824	2017-05-30 14:11:39.998664+10
108	icekit_events	0025_auto_20170519_1327	2017-05-30 14:11:41.065549+10
109	icekit_events_links	0001_initial	2017-05-30 14:11:41.790018+10
110	icekit_events_links	0002_auto_20170314_1401	2017-05-30 14:11:42.411229+10
111	icekit_events_links	0003_auto_20170511_1909	2017-05-30 14:11:43.059464+10
112	icekit_plugins_child_pages	0001_initial	2017-05-30 14:11:43.875406+10
113	icekit_plugins_child_pages	0002_auto_20160821_2140	2017-05-30 14:11:44.696967+10
114	icekit_plugins_child_pages	0003_auto_20161123_1827	2017-05-30 14:11:45.371164+10
115	icekit_plugins_contact_person	0001_initial	2017-05-30 14:11:46.420542+10
116	icekit_plugins_contact_person	0002_auto_20161110_1531	2017-05-30 14:11:47.375574+10
117	icekit_plugins_content_listing	0001_initial	2017-05-30 14:11:48.32186+10
118	icekit_plugins_content_listing	0002_contentlistingitem_limit	2017-05-30 14:11:49.050906+10
119	icekit_plugins_content_listing	0003_contentlistingitem_no_items_message	2017-05-30 14:11:49.727506+10
120	icekit_plugins_faq	0001_initial	2017-05-30 14:11:50.413528+10
121	icekit_plugins_faq	0002_auto_20151013_1330	2017-05-30 14:11:51.715156+10
122	icekit_plugins_faq	0003_auto_20160821_2140	2017-05-30 14:11:52.405845+10
123	icekit_plugins_file	0001_initial	2017-05-30 14:11:54.147169+10
124	icekit_plugins_file	0002_auto_20160821_2140	2017-05-30 14:11:57.155848+10
125	icekit_plugins_horizontal_rule	0001_initial	2017-05-30 14:11:57.898398+10
126	icekit_plugins_horizontal_rule	0002_auto_20160821_2140	2017-05-30 14:11:58.664593+10
127	icekit_plugins_image	0011_auto_20170310_1220	2017-05-30 14:12:00.385917+10
128	icekit_plugins_image	0021_merge	2017-05-30 14:12:02.021676+10
129	icekit_plugins_instagram_embed	0001_initial	2017-05-30 14:12:03.395934+10
130	icekit_plugins_instagram_embed	0002_auto_20150723_1939	2017-05-30 14:12:04.167234+10
131	icekit_plugins_instagram_embed	0003_auto_20150724_0213	2017-05-30 14:12:07.79743+10
132	icekit_plugins_instagram_embed	0004_auto_20160821_2140	2017-05-30 14:12:08.492935+10
133	icekit_plugins_map	0001_initial	2017-05-30 14:12:09.201776+10
134	icekit_plugins_map	0002_auto_20160821_2140	2017-05-30 14:12:10.402002+10
135	icekit_plugins_oembed_with_caption	0001_initial	2017-05-30 14:12:11.265915+10
136	icekit_plugins_oembed_with_caption	0002_auto_20160821_2140	2017-05-30 14:12:12.046134+10
137	icekit_plugins_oembed_with_caption	0003_oembedwithcaptionitem_is_16by9	2017-05-30 14:12:12.954421+10
138	icekit_plugins_oembed_with_caption	0004_auto_20160919_2008	2017-05-30 14:12:13.872154+10
139	icekit_plugins_oembed_with_caption	0005_auto_20161027_1711	2017-05-30 14:12:14.611166+10
140	icekit_plugins_oembed_with_caption	0006_auto_20161027_2330	2017-05-30 14:12:16.666787+10
141	icekit_plugins_oembed_with_caption	0007_auto_20161110_1513	2017-05-30 14:12:17.473673+10
142	icekit_plugins_page_anchor	0001_initial	2017-05-30 14:12:17.882236+10
143	icekit_plugins_page_anchor	0002_auto_20160821_2140	2017-05-30 14:12:18.190167+10
144	icekit_plugins_page_anchor	0003_auto_20161125_1538	2017-05-30 14:12:18.490207+10
145	icekit_plugins_page_anchor	0004_auto_20161130_0741	2017-05-30 14:12:20.847367+10
146	icekit_plugins_page_anchor_list	0001_initial	2017-05-30 14:12:21.095072+10
147	icekit_plugins_page_anchor_list	0002_auto_20160821_2140	2017-05-30 14:12:21.342977+10
148	icekit_plugins_quote	0001_initial	2017-05-30 14:12:21.574251+10
149	icekit_plugins_quote	0002_auto_20160821_2140	2017-05-30 14:12:21.847945+10
150	icekit_plugins_quote	0003_auto_20160912_2218	2017-05-30 14:12:22.632883+10
151	icekit_plugins_quote	0004_auto_20161027_1717	2017-05-30 14:12:23.440579+10
152	icekit_plugins_reusable_form	0001_initial	2017-05-30 14:12:23.72903+10
153	icekit_plugins_reusable_form	0002_auto_20160821_2140	2017-05-30 14:12:24.037505+10
154	icekit_plugins_slideshow	0001_initial	2017-05-30 14:12:24.344027+10
155	icekit_plugins_slideshow	0002_auto_20150623_0115	2017-05-30 14:12:24.644207+10
156	icekit_plugins_slideshow	0003_auto_20160404_0118	2017-05-30 14:12:25.982676+10
157	icekit_plugins_slideshow	0004_auto_20160821_2140	2017-05-30 14:12:26.880831+10
158	icekit_plugins_slideshow	0005_auto_20160927_2305	2017-05-30 14:12:27.550322+10
159	icekit_plugins_slideshow	0006_auto_20170518_1629	2017-05-30 14:12:28.120741+10
160	icekit_plugins_twitter_embed	0001_initial	2017-05-30 14:12:28.403564+10
161	icekit_plugins_twitter_embed	0002_auto_20150724_0213	2017-05-30 14:12:29.001868+10
162	icekit_plugins_twitter_embed	0003_auto_20160821_2140	2017-05-30 14:12:29.334981+10
163	icekit_press_releases	0001_initial	2017-05-30 14:12:30.947792+10
164	icekit_press_releases	0002_auto_20160810_1832	2017-05-30 14:12:32.227812+10
165	icekit_press_releases	0003_auto_20160810_1856	2017-05-30 14:12:33.457176+10
166	icekit_press_releases	0004_auto_20160926_2341	2017-05-30 14:12:34.114768+10
167	icekit_press_releases	0005_auto_20161110_1531	2017-05-30 14:12:35.340293+10
168	icekit_press_releases	0006_auto_20161115_1118	2017-05-30 14:12:36.731275+10
169	icekit_press_releases	0007_auto_20161117_1201	2017-05-30 14:12:37.623903+10
170	icekit_press_releases	0008_auto_20161128_1049	2017-05-30 14:12:37.981797+10
171	icekit_press_releases	0009_auto_20170519_1308	2017-05-30 14:12:40.32668+10
172	icekit_workflow	0001_initial	2017-05-30 14:12:40.800338+10
173	icekit_workflow	0002_auto_20161128_1105	2017-05-30 14:12:41.180656+10
174	icekit_workflow	0003_auto_20161130_0741	2017-05-30 14:12:41.533849+10
175	icekit_workflow	0004_auto_20170130_1146	2017-05-30 14:12:41.991384+10
176	icekit_workflow	0005_auto_20170208_1146	2017-05-30 14:12:42.333149+10
177	icekit_workflow	0006_auto_20170308_2044	2017-05-30 14:12:43.143277+10
178	iframe	0001_initial	2017-05-30 14:12:43.499184+10
179	ik_event_listing	0001_initial	2017-05-30 14:12:43.842735+10
180	ik_event_listing	0002_auto_20170222_1136	2017-05-30 14:12:45.665172+10
181	ik_event_listing	0003_eventcontentlistingitem_no_items_message	2017-05-30 14:12:45.988568+10
182	ik_events_todays_occurrences	0001_initial	2017-05-30 14:12:46.536968+10
183	ik_events_todays_occurrences	0002_auto_20161207_1928	2017-05-30 14:12:47.780152+10
184	ik_links	0001_initial	2017-05-30 14:12:50.461694+10
185	ik_links	0002_auto_20161117_1221	2017-05-30 14:12:52.736497+10
186	ik_links	0003_auto_20161117_1810	2017-05-30 14:12:54.14286+10
187	ik_links	0004_auto_20170314_1401	2017-05-30 14:12:55.383095+10
188	ik_links	0005_auto_20170511_1909	2017-05-30 14:12:56.586942+10
189	image_gallery	0001_initial	2017-05-30 14:12:57.033635+10
190	image_gallery	0002_auto_20160927_2305	2017-05-30 14:12:57.495121+10
191	kombu_transport_django	0001_initial	2017-05-30 14:12:57.617493+10
192	layout_page	0001_initial	2017-05-30 14:12:58.037285+10
193	layout_page	0002_auto_20160419_2209	2017-05-30 14:12:59.917223+10
194	layout_page	0003_auto_20160810_1856	2017-05-30 14:13:02.004955+10
195	layout_page	0004_auto_20161110_1737	2017-05-30 14:13:03.389389+10
196	layout_page	0005_auto_20161125_1709	2017-05-30 14:13:04.096507+10
197	layout_page	0006_auto_20161130_1109	2017-05-30 14:13:04.660078+10
198	layout_page	0007_auto_20170509_1148	2017-05-30 14:13:05.166127+10
199	layout_page	0008_auto_20170518_1629	2017-05-30 14:13:06.245362+10
200	model_settings	0001_initial	2017-05-30 14:13:07.624703+10
201	model_settings	0002_auto_20150810_1620	2017-05-30 14:13:08.091606+10
202	notifications	0001_initial	2017-05-30 14:13:11.157489+10
203	notifications	0002_auto_20150901_2126	2017-05-30 14:13:12.24718+10
204	oembeditem	0001_initial	2017-05-30 14:13:12.937105+10
205	polymorphic_auth	0002_auto_20160725_2124	2017-05-30 14:13:14.204492+10
206	polymorphic_auth_email	0001_initial	2017-05-30 14:13:14.64295+10
207	post_office	0001_initial	2017-05-30 14:13:14.998069+10
208	post_office	0002_add_i18n_and_backend_alias	2017-05-30 14:13:16.020359+10
209	post_office	0003_longer_subject	2017-05-30 14:13:16.153009+10
210	post_office	0004_auto_20160607_0901	2017-05-30 14:13:19.446423+10
211	rawhtml	0001_initial	2017-05-30 14:13:19.900596+10
212	redirectnode	0001_initial	2017-05-30 14:13:21.50324+10
213	redirects	0001_initial	2017-05-30 14:13:22.028211+10
214	response_pages	0001_initial	2017-05-30 14:13:22.074572+10
215	reversion	0001_initial	2017-05-30 14:13:23.337796+10
216	reversion	0002_auto_20141216_1509	2017-05-30 14:13:23.931304+10
217	search_page	0001_initial	2017-05-30 14:13:24.615107+10
218	search_page	0002_auto_20160420_0029	2017-05-30 14:13:26.824518+10
219	search_page	0003_auto_20160810_1856	2017-05-30 14:13:27.390054+10
220	search_page	0004_auto_20161122_2121	2017-05-30 14:13:28.401529+10
221	search_page	0005_auto_20161125_1720	2017-05-30 14:13:29.631737+10
222	search_page	0006_searchpage_default_search_type	2017-05-30 14:13:30.152614+10
223	search_page	0007_auto_20170518_1629	2017-05-30 14:13:31.199301+10
224	sessions	0001_initial	2017-05-30 14:13:31.250962+10
225	sharedcontent	0001_initial	2017-05-30 14:13:34.554106+10
226	text	0001_initial	2017-05-30 14:13:35.546232+10
227	text	0002_textitem_style	2017-05-30 14:13:36.121795+10
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 227, true);


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_redirect (id, site_id, old_path, new_path) FROM stdin;
\.


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_redirect_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_site (id, domain, name) FROM stdin;
1	project-template.lvh.me:8000	project_template
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: djcelery_crontabschedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djcelery_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
\.


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('djcelery_crontabschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_intervalschedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djcelery_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('djcelery_intervalschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictask; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djcelery_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id) FROM stdin;
\.


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('djcelery_periodictask_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djcelery_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: djcelery_taskstate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djcelery_taskstate (id, state, task_id, name, tstamp, args, kwargs, eta, expires, result, traceback, runtime, retries, hidden, worker_id) FROM stdin;
\.


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('djcelery_taskstate_id_seq', 1, false);


--
-- Data for Name: djcelery_workerstate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djcelery_workerstate (id, hostname, last_heartbeat) FROM stdin;
\.


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('djcelery_workerstate_id_seq', 1, false);


--
-- Data for Name: djkombu_message; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djkombu_message (id, visible, sent_at, payload, queue_id) FROM stdin;
\.


--
-- Name: djkombu_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('djkombu_message_id_seq', 1, false);


--
-- Data for Name: djkombu_queue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY djkombu_queue (id, name) FROM stdin;
\.


--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('djkombu_queue_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: -
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: -
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Name: file_file_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('file_file_categories_id_seq', 1, false);


--
-- Name: file_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('file_file_id_seq', 1, false);


--
-- Data for Name: fluent_contents_contentitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fluent_contents_contentitem (id, parent_id, language_code, sort_order, parent_type_id, placeholder_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fluent_contents_contentitem_id_seq', 1, false);


--
-- Data for Name: fluent_contents_placeholder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fluent_contents_placeholder (id, slot, role, parent_id, title, parent_type_id) FROM stdin;
\.


--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fluent_contents_placeholder_id_seq', 1, false);


--
-- Data for Name: fluent_pages_htmlpage_translation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fluent_pages_htmlpage_translation (id, language_code, meta_keywords, meta_description, meta_title, master_id) FROM stdin;
\.


--
-- Name: fluent_pages_htmlpage_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fluent_pages_htmlpage_translation_id_seq', 1, false);


--
-- Data for Name: fluent_pages_pagelayout; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fluent_pages_pagelayout (id, key, title, template_path) FROM stdin;
\.


--
-- Name: fluent_pages_pagelayout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fluent_pages_pagelayout_id_seq', 1, false);


--
-- Data for Name: fluent_pages_urlnode; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fluent_pages_urlnode (id, lft, rght, tree_id, level, status, publication_date, publication_end_date, in_navigation, in_sitemaps, key, creation_date, modification_date, author_id, parent_id, parent_site_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Name: fluent_pages_urlnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fluent_pages_urlnode_id_seq', 1, false);


--
-- Data for Name: fluent_pages_urlnode_translation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fluent_pages_urlnode_translation (id, language_code, title, slug, override_url, _cached_url, master_id) FROM stdin;
\.


--
-- Name: fluent_pages_urlnode_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fluent_pages_urlnode_translation_id_seq', 1, false);


--
-- Data for Name: forms_field; Type: TABLE DATA; Schema: public; Owner: -
--

COPY forms_field (id, label, slug, field_type, required, visible, choices, "default", placeholder_text, help_text, "order", form_id) FROM stdin;
\.


--
-- Name: forms_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('forms_field_id_seq', 1, false);


--
-- Data for Name: forms_fieldentry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY forms_fieldentry (id, field_id, value, entry_id) FROM stdin;
\.


--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('forms_fieldentry_id_seq', 1, false);


--
-- Data for Name: forms_form; Type: TABLE DATA; Schema: public; Owner: -
--

COPY forms_form (id, title, slug, intro, button_text, response, redirect_url, status, publish_date, expiry_date, login_required, send_email, email_from, email_copies, email_subject, email_message) FROM stdin;
\.


--
-- Name: forms_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('forms_form_id_seq', 1, false);


--
-- Data for Name: forms_form_sites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY forms_form_sites (id, form_id, site_id) FROM stdin;
\.


--
-- Name: forms_form_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('forms_form_sites_id_seq', 1, false);


--
-- Data for Name: forms_formentry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY forms_formentry (id, entry_time, form_id) FROM stdin;
\.


--
-- Name: forms_formentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('forms_formentry_id_seq', 1, false);


--
-- Data for Name: glamkit_collections_country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY glamkit_collections_country (id, title, slug, iso_country, continent) FROM stdin;
1	Afghanistan	afghanistan	AF	AS
2	Åland Islands	aland-islands	AX	EU
3	Albania	albania	AL	EU
4	Algeria	algeria	DZ	AF
5	American Samoa	american-samoa	AS	OC
6	Andorra	andorra	AD	EU
7	Angola	angola	AO	AF
8	Anguilla	anguilla	AI	NA
9	Antarctica	antarctica	AQ	AN
10	Antigua and Barbuda	antigua-and-barbuda	AG	NA
11	Argentina	argentina	AR	SA
12	Armenia	armenia	AM	AS
13	Aruba	aruba	AW	NA
14	Australia	australia	AU	OC
15	Austria	austria	AT	EU
16	Azerbaijan	azerbaijan	AZ	AS
17	Bahamas	bahamas	BS	NA
18	Bahrain	bahrain	BH	AS
19	Bangladesh	bangladesh	BD	AS
20	Barbados	barbados	BB	NA
21	Belarus	belarus	BY	EU
22	Belgium	belgium	BE	EU
23	Belize	belize	BZ	NA
24	Benin	benin	BJ	AF
25	Bermuda	bermuda	BM	NA
26	Bhutan	bhutan	BT	AS
27	Bolivia	bolivia	BO	SA
28	Bonaire, Sint Eustatius and Saba	bonaire-sint-eustatius-and-saba	BQ	\N
29	Bosnia and Herzegovina	bosnia-and-herzegovina	BA	EU
30	Botswana	botswana	BW	AF
31	Bouvet Island	bouvet-island	BV	AN
32	Brazil	brazil	BR	SA
33	British Indian Ocean Territory	british-indian-ocean-territory	IO	AS
34	Brunei	brunei	BN	AS
35	Bulgaria	bulgaria	BG	EU
36	Burkina Faso	burkina-faso	BF	AF
37	Burundi	burundi	BI	AF
38	Cabo Verde	cabo-verde	CV	AF
39	Cambodia	cambodia	KH	AS
40	Cameroon	cameroon	CM	AF
41	Canada	canada	CA	NA
42	Cayman Islands	cayman-islands	KY	NA
43	Central African Republic	central-african-republic	CF	AF
44	Chad	chad	TD	AF
45	Chile	chile	CL	SA
46	China	china	CN	AS
47	Christmas Island	christmas-island	CX	AS
48	Cocos (Keeling) Islands	cocos-keeling-islands	CC	AS
49	Colombia	colombia	CO	SA
50	Comoros	comoros	KM	AF
51	Congo	congo	CG	AF
52	Congo (the Democratic Republic of the)	congo-the-democratic-republic-of-the	CD	AF
53	Cook Islands	cook-islands	CK	OC
54	Costa Rica	costa-rica	CR	NA
55	Côte d'Ivoire	cote-divoire	CI	AF
56	Croatia	croatia	HR	EU
57	Cuba	cuba	CU	NA
58	Curaçao	curacao	CW	\N
59	Cyprus	cyprus	CY	AS
60	Czechia	czechia	CZ	EU
61	Denmark	denmark	DK	EU
62	Djibouti	djibouti	DJ	AF
63	Dominica	dominica	DM	NA
64	Dominican Republic	dominican-republic	DO	NA
65	Ecuador	ecuador	EC	SA
66	Egypt	egypt	EG	AF
67	El Salvador	el-salvador	SV	NA
68	Equatorial Guinea	equatorial-guinea	GQ	AF
69	Eritrea	eritrea	ER	AF
70	Estonia	estonia	EE	EU
71	Ethiopia	ethiopia	ET	AF
72	Falkland Islands  [Malvinas]	falkland-islands-malvinas	FK	SA
73	Faroe Islands	faroe-islands	FO	EU
74	Fiji	fiji	FJ	OC
75	Finland	finland	FI	EU
76	France	france	FR	EU
77	French Guiana	french-guiana	GF	SA
78	French Polynesia	french-polynesia	PF	OC
79	French Southern Territories	french-southern-territories	TF	AN
80	Gabon	gabon	GA	AF
81	Gambia	gambia	GM	AF
82	Georgia	georgia	GE	AS
83	Germany	germany	DE	EU
84	Ghana	ghana	GH	AF
85	Gibraltar	gibraltar	GI	EU
86	Greece	greece	GR	EU
87	Greenland	greenland	GL	NA
88	Grenada	grenada	GD	NA
89	Guadeloupe	guadeloupe	GP	NA
90	Guam	guam	GU	OC
91	Guatemala	guatemala	GT	NA
92	Guernsey	guernsey	GG	EU
93	Guinea	guinea	GN	AF
94	Guinea-Bissau	guinea-bissau	GW	AF
95	Guyana	guyana	GY	SA
96	Haiti	haiti	HT	NA
97	Heard Island and McDonald Islands	heard-island-and-mcdonald-islands	HM	AN
98	Holy See	holy-see	VA	EU
99	Honduras	honduras	HN	NA
100	Hong Kong	hong-kong	HK	AS
101	Hungary	hungary	HU	EU
102	Iceland	iceland	IS	EU
103	India	india	IN	AS
104	Indonesia	indonesia	ID	AS
105	Iran	iran	IR	AS
106	Iraq	iraq	IQ	AS
107	Ireland	ireland	IE	EU
108	Isle of Man	isle-of-man	IM	EU
109	Israel	israel	IL	AS
110	Italy	italy	IT	EU
111	Jamaica	jamaica	JM	NA
112	Japan	japan	JP	AS
113	Jersey	jersey	JE	EU
114	Jordan	jordan	JO	AS
115	Kazakhstan	kazakhstan	KZ	AS
116	Kenya	kenya	KE	AF
117	Kiribati	kiribati	KI	OC
118	Kuwait	kuwait	KW	AS
119	Kyrgyzstan	kyrgyzstan	KG	AS
120	Laos	laos	LA	AS
121	Latvia	latvia	LV	EU
122	Lebanon	lebanon	LB	AS
123	Lesotho	lesotho	LS	AF
124	Liberia	liberia	LR	AF
125	Libya	libya	LY	AF
126	Liechtenstein	liechtenstein	LI	EU
127	Lithuania	lithuania	LT	EU
128	Luxembourg	luxembourg	LU	EU
129	Macao	macao	MO	AS
130	Macedonia	macedonia	MK	EU
131	Madagascar	madagascar	MG	AF
132	Malawi	malawi	MW	AF
133	Malaysia	malaysia	MY	AS
134	Maldives	maldives	MV	AS
135	Mali	mali	ML	AF
136	Malta	malta	MT	EU
137	Marshall Islands	marshall-islands	MH	OC
138	Martinique	martinique	MQ	NA
139	Mauritania	mauritania	MR	AF
140	Mauritius	mauritius	MU	AF
141	Mayotte	mayotte	YT	AF
142	Mexico	mexico	MX	NA
143	Micronesia (Federated States of)	micronesia-federated-states-of	FM	OC
144	Moldova	moldova	MD	EU
145	Monaco	monaco	MC	EU
146	Mongolia	mongolia	MN	AS
147	Montenegro	montenegro	ME	EU
148	Montserrat	montserrat	MS	NA
149	Morocco	morocco	MA	AF
150	Mozambique	mozambique	MZ	AF
151	Myanmar	myanmar	MM	AS
152	Namibia	namibia	NA	AF
153	Nauru	nauru	NR	OC
154	Nepal	nepal	NP	AS
155	Netherlands	netherlands	NL	EU
156	New Caledonia	new-caledonia	NC	OC
157	New Zealand	new-zealand	NZ	OC
158	Nicaragua	nicaragua	NI	NA
159	Niger	niger	NE	AF
160	Nigeria	nigeria	NG	AF
161	Niue	niue	NU	OC
162	Norfolk Island	norfolk-island	NF	OC
163	North Korea	north-korea	KP	AS
164	Northern Mariana Islands	northern-mariana-islands	MP	OC
165	Norway	norway	NO	EU
166	Oman	oman	OM	AS
167	Pakistan	pakistan	PK	AS
168	Palau	palau	PW	OC
169	Palestine, State of	palestine-state-of	PS	AS
170	Panama	panama	PA	NA
171	Papua New Guinea	papua-new-guinea	PG	OC
172	Paraguay	paraguay	PY	SA
173	Peru	peru	PE	SA
174	Philippines	philippines	PH	AS
175	Pitcairn	pitcairn	PN	OC
176	Poland	poland	PL	EU
177	Portugal	portugal	PT	EU
178	Puerto Rico	puerto-rico	PR	NA
179	Qatar	qatar	QA	AS
180	Réunion	reunion	RE	AF
181	Romania	romania	RO	EU
182	Russia	russia	RU	EU
183	Rwanda	rwanda	RW	AF
184	Saint Barthélemy	saint-barthelemy	BL	NA
185	Saint Helena, Ascension and Tristan da Cunha	saint-helena-ascension-and-tristan-da-cunha	SH	AF
186	Saint Kitts and Nevis	saint-kitts-and-nevis	KN	NA
187	Saint Lucia	saint-lucia	LC	NA
188	Saint Martin (French part)	saint-martin-french-part	MF	NA
189	Saint Pierre and Miquelon	saint-pierre-and-miquelon	PM	NA
190	Saint Vincent and the Grenadines	saint-vincent-and-the-grenadines	VC	NA
191	Samoa	samoa	WS	OC
192	San Marino	san-marino	SM	EU
193	Sao Tome and Principe	sao-tome-and-principe	ST	AF
194	Saudi Arabia	saudi-arabia	SA	AS
195	Senegal	senegal	SN	AF
196	Serbia	serbia	RS	EU
197	Seychelles	seychelles	SC	AF
198	Sierra Leone	sierra-leone	SL	AF
199	Singapore	singapore	SG	AS
200	Sint Maarten (Dutch part)	sint-maarten-dutch-part	SX	\N
201	Slovakia	slovakia	SK	EU
202	Slovenia	slovenia	SI	EU
203	Solomon Islands	solomon-islands	SB	OC
204	Somalia	somalia	SO	AF
205	South Africa	south-africa	ZA	AF
206	South Georgia and the South Sandwich Islands	south-georgia-and-the-south-sandwich-islands	GS	AN
207	South Korea	south-korea	KR	AS
208	South Sudan	south-sudan	SS	AF
209	Spain	spain	ES	EU
210	Sri Lanka	sri-lanka	LK	AS
211	Sudan	sudan	SD	AF
212	Suriname	suriname	SR	SA
213	Svalbard and Jan Mayen	svalbard-and-jan-mayen	SJ	EU
214	Swaziland	swaziland	SZ	AF
215	Sweden	sweden	SE	EU
216	Switzerland	switzerland	CH	EU
217	Syria	syria	SY	AS
218	Taiwan	taiwan	TW	AS
219	Tajikistan	tajikistan	TJ	AS
220	Tanzania	tanzania	TZ	AF
221	Thailand	thailand	TH	AS
222	Timor-Leste	timor-leste	TL	AS
223	Togo	togo	TG	AF
224	Tokelau	tokelau	TK	OC
225	Tonga	tonga	TO	OC
226	Trinidad and Tobago	trinidad-and-tobago	TT	NA
227	Tunisia	tunisia	TN	AF
228	Turkey	turkey	TR	EU
229	Turkmenistan	turkmenistan	TM	AS
230	Turks and Caicos Islands	turks-and-caicos-islands	TC	NA
231	Tuvalu	tuvalu	TV	OC
232	Uganda	uganda	UG	AF
233	Ukraine	ukraine	UA	EU
234	United Arab Emirates	united-arab-emirates	AE	AS
235	United Kingdom	united-kingdom	GB	EU
236	United States Minor Outlying Islands	united-states-minor-outlying-islands	UM	OC
237	United States of America	united-states-of-america	US	NA
238	Uruguay	uruguay	UY	SA
239	Uzbekistan	uzbekistan	UZ	AS
240	Vanuatu	vanuatu	VU	OC
241	Venezuela	venezuela	VE	SA
242	Vietnam	vietnam	VN	AS
243	Virgin Islands (British)	virgin-islands-british	VG	NA
244	Virgin Islands (U.S.)	virgin-islands-us	VI	NA
245	Wallis and Futuna	wallis-and-futuna	WF	OC
246	Western Sahara	western-sahara	EH	AF
247	Yemen	yemen	YE	AS
248	Zambia	zambia	ZM	AF
249	Zimbabwe	zimbabwe	ZW	AF
\.


--
-- Name: glamkit_collections_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('glamkit_collections_country_id_seq', 249, true);


--
-- Data for Name: glamkit_collections_geographiclocation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY glamkit_collections_geographiclocation (id, state_province, city, neighborhood, colloquial_historical, country_id) FROM stdin;
\.


--
-- Name: glamkit_collections_geographiclocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('glamkit_collections_geographiclocation_id_seq', 1, false);


--
-- Data for Name: glamkit_sponsors_sponsor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY glamkit_sponsors_sponsor (id, name, url, logo_id) FROM stdin;
\.


--
-- Name: glamkit_sponsors_sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('glamkit_sponsors_sponsor_id_seq', 1, false);


--
-- Data for Name: icekit_article_article; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_article_article (id, publishing_is_draft, publishing_modified_at, publishing_published_at, title, slug, layout_id, parent_id, publishing_linked_id, boosted_search_terms, list_image, hero_image_id, admin_notes, brief) FROM stdin;
\.


--
-- Name: icekit_article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_article_article_id_seq', 1, false);


--
-- Data for Name: icekit_articlecategorypage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_articlecategorypage (urlnode_ptr_id, publishing_is_draft, publishing_modified_at, publishing_published_at, layout_id, publishing_linked_id, boosted_search_terms, hero_image_id, list_image, admin_notes, brief) FROM stdin;
\.


--
-- Data for Name: icekit_authorlisting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_authorlisting (urlnode_ptr_id, publishing_is_draft, publishing_modified_at, publishing_published_at, layout_id, publishing_linked_id, boosted_search_terms, hero_image_id, list_image, admin_notes, brief) FROM stdin;
\.


--
-- Data for Name: icekit_authors_author; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_authors_author (id, publishing_is_draft, publishing_modified_at, publishing_published_at, given_names, family_name, slug, url, oneliner, hero_image_id, publishing_linked_id, boosted_search_terms, list_image, admin_notes, brief) FROM stdin;
\.


--
-- Name: icekit_authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_authors_author_id_seq', 1, false);


--
-- Data for Name: icekit_event_types_simple_simpleevent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_event_types_simple_simpleevent (eventbase_ptr_id, layout_id) FROM stdin;
\.


--
-- Data for Name: icekit_events_eventbase; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_events_eventbase (id, publishing_is_draft, publishing_modified_at, publishing_published_at, title, slug, created, modified, show_in_calendar, human_dates, special_instructions, cta_text, cta_url, derived_from_id, polymorphic_ctype_id, publishing_linked_id, part_of_id, price_line, primary_type_id, external_ref, has_tickets_available, is_drop_in, human_times, admin_notes, brief) FROM stdin;
\.


--
-- Name: icekit_events_eventbase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_events_eventbase_id_seq', 1, false);


--
-- Data for Name: icekit_events_eventbase_secondary_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_events_eventbase_secondary_types (id, eventbase_id, eventtype_id) FROM stdin;
\.


--
-- Name: icekit_events_eventbase_secondary_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_events_eventbase_secondary_types_id_seq', 1, false);


--
-- Data for Name: icekit_events_eventrepeatsgenerator; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_events_eventrepeatsgenerator (id, created, modified, recurrence_rule, start, "end", is_all_day, repeat_end, event_id) FROM stdin;
\.


--
-- Name: icekit_events_eventrepeatsgenerator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_events_eventrepeatsgenerator_id_seq', 1, false);


--
-- Data for Name: icekit_events_eventtype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_events_eventtype (id, title, slug, is_public, title_plural, color) FROM stdin;
1	Education	education	f		#cccccc
2	Members	members	f		#cccccc
\.


--
-- Name: icekit_events_eventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_events_eventtype_id_seq', 2, true);


--
-- Data for Name: icekit_events_occurrence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_events_occurrence (id, created, modified, start, "end", is_all_day, is_protected_from_regeneration, is_cancelled, is_hidden, cancel_reason, original_start, original_end, event_id, generator_id, external_ref, status) FROM stdin;
\.


--
-- Name: icekit_events_occurrence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_events_occurrence_id_seq', 1, false);


--
-- Data for Name: icekit_events_recurrencerule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_events_recurrencerule (id, created, modified, description, recurrence_rule) FROM stdin;
1	2017-05-30 14:11:05.596038+10	2017-05-30 14:11:05.769307+10	Daily, except Xmas day	RRULE:FREQ=DAILY;\nEXRULE:FREQ=YEARLY;BYMONTH=12;BYMONTHDAY=25
2	2017-05-30 14:11:05.778714+10	2017-05-30 14:11:05.778887+10	Daily, Weekdays, except Xmas day	RRULE:FREQ=DAILY;BYDAY=MO,TU,WE,TH,FR;\nEXRULE:FREQ=YEARLY;BYMONTH=12;BYMONTHDAY=25
3	2017-05-30 14:11:05.784263+10	2017-05-30 14:11:05.784433+10	Daily, Weekends, except Xmas day	RRULE:FREQ=DAILY;BYDAY=SA,SU;\nEXRULE:FREQ=YEARLY;BYMONTH=12;BYMONTHDAY=25
4	2017-05-30 14:11:05.789467+10	2017-05-30 14:11:05.789638+10	Weekly, except Xmas day	RRULE:FREQ=WEEKLY;\nEXRULE:FREQ=YEARLY;BYMONTH=12;BYMONTHDAY=25
5	2017-05-30 14:11:05.79772+10	2017-05-30 14:11:05.797887+10	Monthly, except Xmas day	RRULE:FREQ=MONTHLY;\nEXRULE:FREQ=YEARLY;BYMONTH=12;BYMONTHDAY=25
6	2017-05-30 14:11:05.803008+10	2017-05-30 14:11:05.80317+10	Yearly, except Xmas day	RRULE:FREQ=YEARLY;\nEXRULE:FREQ=YEARLY;BYMONTH=12;BYMONTHDAY=25
\.


--
-- Name: icekit_events_recurrencerule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_events_recurrencerule_id_seq', 6, true);


--
-- Data for Name: icekit_layout; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_layout (id, created, modified, title, template_name) FROM stdin;
\.


--
-- Data for Name: icekit_layout_content_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_layout_content_types (id, layout_id, contenttype_id) FROM stdin;
\.


--
-- Name: icekit_layout_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_layout_content_types_id_seq', 1, false);


--
-- Name: icekit_layout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_layout_id_seq', 1, false);


--
-- Data for Name: icekit_layoutpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_layoutpage (urlnode_ptr_id, layout_id, publishing_is_draft, publishing_linked_id, publishing_modified_at, publishing_published_at, boosted_search_terms, hero_image_id, list_image, admin_notes, brief) FROM stdin;
\.


--
-- Data for Name: icekit_mediacategory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_mediacategory (id, created, modified, name) FROM stdin;
\.


--
-- Name: icekit_mediacategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_mediacategory_id_seq', 1, false);


--
-- Data for Name: icekit_plugins_contact_person_contactperson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_plugins_contact_person_contactperson (id, name, title, phone, email) FROM stdin;
\.


--
-- Name: icekit_plugins_contact_person_contactperson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_plugins_contact_person_contactperson_id_seq', 1, false);


--
-- Data for Name: icekit_plugins_file_file; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_plugins_file_file (id, file, title, is_active, admin_notes) FROM stdin;
\.


--
-- Data for Name: icekit_plugins_file_file_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_plugins_file_file_categories (id, file_id, mediacategory_id) FROM stdin;
\.


--
-- Data for Name: icekit_plugins_image_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_plugins_image_image (id, image, alt_text, title, caption, is_ok_for_web, notes, credit, date_created, date_modified, height, license, maximum_dimension_pixels, source, width, is_cropping_allowed, external_ref) FROM stdin;
\.


--
-- Data for Name: icekit_plugins_image_image_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_plugins_image_image_categories (id, image_id, mediacategory_id) FROM stdin;
\.


--
-- Data for Name: icekit_plugins_image_imagerepurposeconfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_plugins_image_imagerepurposeconfig (id, title, slug, width, height, format, style, is_cropping_allowed) FROM stdin;
1	Original		\N	\N	jpg	default	f
2	Presentation		1280	1024	jpg	default	f
3	Facebook		1200	\N	jpg	default	f
4	Twitter		440	220	jpg	default	t
5	Instagram		1080	1080	jpg	default	t
6	YouTube		1280	760	jpg	default	t
\.


--
-- Name: icekit_plugins_image_imagerepurposeconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_plugins_image_imagerepurposeconfig_id_seq', 6, true);


--
-- Data for Name: icekit_plugins_slideshow_slideshow; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_plugins_slideshow_slideshow (id, title, show_title, publishing_is_draft, publishing_linked_id, publishing_modified_at, publishing_published_at, admin_notes, brief) FROM stdin;
\.


--
-- Data for Name: icekit_press_releases_pressrelease; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_press_releases_pressrelease (id, publishing_is_draft, publishing_modified_at, publishing_published_at, title, slug, print_version, created, modified, released, category_id, layout_id, publishing_linked_id, boosted_search_terms, list_image) FROM stdin;
\.


--
-- Name: icekit_press_releases_pressrelease_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_press_releases_pressrelease_id_seq', 1, false);


--
-- Data for Name: icekit_press_releases_pressreleasecategory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_press_releases_pressreleasecategory (id, name) FROM stdin;
\.


--
-- Name: icekit_press_releases_pressreleasecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('icekit_press_releases_pressreleasecategory_id_seq', 1, false);


--
-- Data for Name: icekit_searchpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_searchpage (urlnode_ptr_id, publishing_is_draft, publishing_linked_id, publishing_modified_at, publishing_published_at, boosted_search_terms, list_image, default_search_type, admin_notes, brief) FROM stdin;
\.


--
-- Data for Name: icekit_workflow_workflowstate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY icekit_workflow_workflowstate (id, object_id, status, assigned_to_id, content_type_id, datetime_modified) FROM stdin;
\.


--
-- Data for Name: ik_event_listing_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ik_event_listing_types (id, eventcontentlistingitem_id, eventtype_id) FROM stdin;
\.


--
-- Name: ik_event_listing_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ik_event_listing_types_id_seq', 1, false);


--
-- Data for Name: ik_todays_occurrences_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ik_todays_occurrences_types (id, todaysoccurrences_id, eventtype_id) FROM stdin;
\.


--
-- Name: ik_todays_occurrences_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ik_todays_occurrences_types_id_seq', 1, false);


--
-- Name: image_image_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('image_image_categories_id_seq', 1, false);


--
-- Name: image_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('image_image_id_seq', 1, false);


--
-- Data for Name: model_settings_boolean; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_boolean (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_date; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_date (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_datetime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_datetime (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_decimal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_decimal (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_file; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_file (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_float; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_float (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_image (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_integer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_integer (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_setting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_setting (id, name, polymorphic_ctype_id) FROM stdin;
\.


--
-- Name: model_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('model_settings_setting_id_seq', 1, false);


--
-- Data for Name: model_settings_text; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_text (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: model_settings_time; Type: TABLE DATA; Schema: public; Owner: -
--

COPY model_settings_time (setting_ptr_id, value) FROM stdin;
\.


--
-- Data for Name: notifications_followerinformation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications_followerinformation (id, object_id, content_type_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Data for Name: notifications_followerinformation_followers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications_followerinformation_followers (id, followerinformation_id, user_id) FROM stdin;
\.


--
-- Name: notifications_followerinformation_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notifications_followerinformation_followers_id_seq', 1, false);


--
-- Data for Name: notifications_followerinformation_group_followers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications_followerinformation_group_followers (id, followerinformation_id, group_id) FROM stdin;
\.


--
-- Name: notifications_followerinformation_group_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notifications_followerinformation_group_followers_id_seq', 1, false);


--
-- Name: notifications_followerinformation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notifications_followerinformation_id_seq', 1, false);


--
-- Data for Name: notifications_hasreadmessage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications_hasreadmessage (id, is_read, "time", is_removed, notification_setting, email_sent, message_id, person_id) FROM stdin;
\.


--
-- Name: notifications_hasreadmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notifications_hasreadmessage_id_seq', 1, false);


--
-- Data for Name: notifications_notification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications_notification (id, created, modified, title, notification, is_removed, user_id) FROM stdin;
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notifications_notification_id_seq', 1, false);


--
-- Data for Name: notifications_notificationsetting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications_notificationsetting (id, notification_type, user_id) FROM stdin;
1	ALL	1
\.


--
-- Name: notifications_notificationsetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notifications_notificationsetting_id_seq', 1, true);


--
-- Data for Name: pagetype_eventlistingfordate_eventlistingpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pagetype_eventlistingfordate_eventlistingpage (urlnode_ptr_id, publishing_is_draft, publishing_modified_at, publishing_published_at, layout_id, publishing_linked_id, boosted_search_terms, hero_image_id, list_image, admin_notes, brief) FROM stdin;
\.


--
-- Data for Name: pagetype_icekit_press_releases_pressreleaselisting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pagetype_icekit_press_releases_pressreleaselisting (urlnode_ptr_id, publishing_is_draft, publishing_modified_at, publishing_published_at, layout_id, publishing_linked_id, boosted_search_terms, hero_image_id, list_image, admin_notes, brief) FROM stdin;
\.


--
-- Data for Name: pagetype_redirectnode_redirectnode; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pagetype_redirectnode_redirectnode (urlnode_ptr_id) FROM stdin;
\.


--
-- Data for Name: polymorphic_auth_email_emailuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY polymorphic_auth_email_emailuser (user_ptr_id, email) FROM stdin;
1	admin@project-template.lvh.me
\.


--
-- Data for Name: polymorphic_auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY polymorphic_auth_user (id, password, last_login, is_superuser, is_staff, is_active, first_name, last_name, created, polymorphic_ctype_id) FROM stdin;
1	pbkdf2_sha256$20000$jT7L3EtqBS9j$aRfRdQXugoBSrwb4svyllTa6IN8cjDVKOg3NYhEVES0=	\N	t	t	t	Admin		2017-05-30 14:13:36.305931+10	3
\.


--
-- Data for Name: polymorphic_auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY polymorphic_auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: polymorphic_auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('polymorphic_auth_user_groups_id_seq', 1, false);


--
-- Name: polymorphic_auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('polymorphic_auth_user_id_seq', 1, true);


--
-- Data for Name: polymorphic_auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY polymorphic_auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: polymorphic_auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('polymorphic_auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: post_office_attachment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY post_office_attachment (id, file, name) FROM stdin;
\.


--
-- Data for Name: post_office_attachment_emails; Type: TABLE DATA; Schema: public; Owner: -
--

COPY post_office_attachment_emails (id, attachment_id, email_id) FROM stdin;
\.


--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_office_attachment_emails_id_seq', 1, false);


--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_office_attachment_id_seq', 1, false);


--
-- Data for Name: post_office_email; Type: TABLE DATA; Schema: public; Owner: -
--

COPY post_office_email (id, from_email, "to", cc, bcc, subject, message, html_message, status, priority, created, last_updated, scheduled_time, headers, context, template_id, backend_alias) FROM stdin;
\.


--
-- Name: post_office_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_office_email_id_seq', 1, false);


--
-- Data for Name: post_office_emailtemplate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY post_office_emailtemplate (id, name, description, subject, content, html_content, created, last_updated, default_template_id, language) FROM stdin;
\.


--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_office_emailtemplate_id_seq', 1, false);


--
-- Data for Name: post_office_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY post_office_log (id, date, status, exception_type, message, email_id) FROM stdin;
\.


--
-- Name: post_office_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_office_log_id_seq', 1, false);


--
-- Data for Name: redirectnode_redirectnode_translation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY redirectnode_redirectnode_translation (id, language_code, new_url, redirect_type, master_id) FROM stdin;
\.


--
-- Name: redirectnode_redirectnode_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('redirectnode_redirectnode_translation_id_seq', 1, false);


--
-- Data for Name: response_pages_responsepage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY response_pages_responsepage (id, title, type, is_active) FROM stdin;
\.


--
-- Name: response_pages_responsepage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('response_pages_responsepage_id_seq', 1, false);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reversion_revision (id, manager_slug, date_created, comment, user_id) FROM stdin;
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 1, false);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reversion_version (id, object_id, object_id_int, format, serialized_data, object_repr, content_type_id, revision_id) FROM stdin;
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('reversion_version_id_seq', 1, false);


--
-- Data for Name: sharedcontent_sharedcontent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sharedcontent_sharedcontent (id, slug, is_cross_site, parent_site_id) FROM stdin;
\.


--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sharedcontent_sharedcontent_id_seq', 1, false);


--
-- Data for Name: sharedcontent_sharedcontent_translation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sharedcontent_sharedcontent_translation (id, language_code, title, master_id) FROM stdin;
\.


--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sharedcontent_sharedcontent_translation_id_seq', 1, false);


--
-- Name: slideshow_slideshow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('slideshow_slideshow_id_seq', 1, false);


--
-- Name: workflow_workflowstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('workflow_workflowstate_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: celery_taskmeta celery_taskmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: contentitem_icekit_plugins_child_pages_childpageitem contentitem_child_pages_childpageitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_child_pages_childpageitem
    ADD CONSTRAINT contentitem_child_pages_childpageitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_faq_faqitem contentitem_faq_faqitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_faq_faqitem
    ADD CONSTRAINT contentitem_faq_faqitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_file_fileitem contentitem_file_fileitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_file_fileitem
    ADD CONSTRAINT contentitem_file_fileitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_glamkit_sponsors_beginsponsorblockitem contentitem_glamkit_sponsors_beginsponsorblockitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_glamkit_sponsors_beginsponsorblockitem
    ADD CONSTRAINT contentitem_glamkit_sponsors_beginsponsorblockitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_glamkit_sponsors_endsponsorblockitem contentitem_glamkit_sponsors_endsponsorblockitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_glamkit_sponsors_endsponsorblockitem
    ADD CONSTRAINT contentitem_glamkit_sponsors_endsponsorblockitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_glamkit_sponsors_sponsorpromoitem contentitem_glamkit_sponsors_sponsorpromoitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_glamkit_sponsors_sponsorpromoitem
    ADD CONSTRAINT contentitem_glamkit_sponsors_sponsorpromoitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_horizontal_rule_horizontalruleitem contentitem_horizontal_rule_horizontalruleitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_horizontal_rule_horizontalruleitem
    ADD CONSTRAINT contentitem_horizontal_rule_horizontalruleitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_events_links_eventlink contentitem_icekit_events_links_eventlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_events_links_eventlink
    ADD CONSTRAINT contentitem_icekit_events_links_eventlink_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_contact_person_contactpersonitem contentitem_icekit_plugins_contact_person_contactpersonite_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_contact_person_contactpersonitem
    ADD CONSTRAINT contentitem_icekit_plugins_contact_person_contactpersonite_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_content_listing_contentlistingitem contentitem_icekit_plugins_content_listing_contentlistingi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_content_listing_contentlistingitem
    ADD CONSTRAINT contentitem_icekit_plugins_content_listing_contentlistingi_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_iframe_iframeitem contentitem_iframe_iframeitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_iframe_iframeitem
    ADD CONSTRAINT contentitem_iframe_iframeitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_ik_event_listing_eventcontentlistingitem contentitem_ik_event_listing_eventcontentlistingitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_event_listing_eventcontentlistingitem
    ADD CONSTRAINT contentitem_ik_event_listing_eventcontentlistingitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_ik_events_todays_occurrences_todaysoccurrences contentitem_ik_events_todays_occurrences_todaysoccurrences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_events_todays_occurrences_todaysoccurrences
    ADD CONSTRAINT contentitem_ik_events_todays_occurrences_todaysoccurrences_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_ik_links_articlelink contentitem_ik_links_articlelink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_articlelink
    ADD CONSTRAINT contentitem_ik_links_articlelink_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_ik_links_authorlink contentitem_ik_links_authorlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_authorlink
    ADD CONSTRAINT contentitem_ik_links_authorlink_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_ik_links_pagelink contentitem_ik_links_pagelink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_pagelink
    ADD CONSTRAINT contentitem_ik_links_pagelink_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_image_gallery_imagegalleryshowitem contentitem_image_gallery_imagegalleryshowitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_image_gallery_imagegalleryshowitem
    ADD CONSTRAINT contentitem_image_gallery_imagegalleryshowitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_image_imageitem contentitem_image_imageitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_image_imageitem
    ADD CONSTRAINT contentitem_image_imageitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_instagram_embed_instagramembeditem contentitem_instagram_embed_instagramembeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_instagram_embed_instagramembeditem
    ADD CONSTRAINT contentitem_instagram_embed_instagramembeditem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_map_mapitem contentitem_map_mapitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_map_mapitem
    ADD CONSTRAINT contentitem_map_mapitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_oembed_with_caption_item contentitem_oembed_with_caption_oembedwithcaptionitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_oembed_with_caption_item
    ADD CONSTRAINT contentitem_oembed_with_caption_oembedwithcaptionitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_oembeditem_oembeditem contentitem_oembeditem_oembeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_oembeditem_oembeditem
    ADD CONSTRAINT contentitem_oembeditem_oembeditem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem contentitem_page_anchor_list_pageanchorlistitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem
    ADD CONSTRAINT contentitem_page_anchor_list_pageanchorlistitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_page_anchor_pageanchoritem contentitem_page_anchor_pageanchoritem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_page_anchor_pageanchoritem
    ADD CONSTRAINT contentitem_page_anchor_pageanchoritem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_quote_quoteitem contentitem_quote_quoteitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_quote_quoteitem
    ADD CONSTRAINT contentitem_quote_quoteitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_rawhtml_rawhtmlitem contentitem_rawhtml_rawhtmlitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_rawhtml_rawhtmlitem
    ADD CONSTRAINT contentitem_rawhtml_rawhtmlitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_reusable_form_formitem contentitem_reusable_form_formitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_reusable_form_formitem
    ADD CONSTRAINT contentitem_reusable_form_formitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_sharedcontent_sharedcontentitem contentitem_sharedcontent_sharedcontentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT contentitem_sharedcontent_sharedcontentitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_slideshow_slideshowitem contentitem_slideshow_slideshowitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_slideshow_slideshowitem
    ADD CONSTRAINT contentitem_slideshow_slideshowitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_text_textitem contentitem_text_textitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_text_textitem
    ADD CONSTRAINT contentitem_text_textitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_icekit_plugins_twitter_embed_twitterembeditem contentitem_twitter_embed_twitterembeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_twitter_embed_twitterembeditem
    ADD CONSTRAINT contentitem_twitter_embed_twitterembeditem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_4eb807210df217e2_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_4eb807210df217e2_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect django_redirect_site_id_old_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_old_path_key UNIQUE (site_id, old_path);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djcelery_crontabschedule djcelery_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_crontabschedule
    ADD CONSTRAINT djcelery_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_intervalschedule djcelery_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_intervalschedule
    ADD CONSTRAINT djcelery_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictask djcelery_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_name_key UNIQUE (name);


--
-- Name: djcelery_periodictask djcelery_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictasks djcelery_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_periodictasks
    ADD CONSTRAINT djcelery_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: djcelery_taskstate djcelery_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_pkey PRIMARY KEY (id);


--
-- Name: djcelery_taskstate djcelery_taskstate_task_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_task_id_key UNIQUE (task_id);


--
-- Name: djcelery_workerstate djcelery_workerstate_hostname_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_hostname_key UNIQUE (hostname);


--
-- Name: djcelery_workerstate djcelery_workerstate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_pkey PRIMARY KEY (id);


--
-- Name: djkombu_message djkombu_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djkombu_message
    ADD CONSTRAINT djkombu_message_pkey PRIMARY KEY (id);


--
-- Name: djkombu_queue djkombu_queue_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djkombu_queue
    ADD CONSTRAINT djkombu_queue_name_key UNIQUE (name);


--
-- Name: djkombu_queue djkombu_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djkombu_queue
    ADD CONSTRAINT djkombu_queue_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_storage_hash_54df05c6c958218d_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_54df05c6c958218d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnail_storage_hash_4b9ff861ea682ca0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_4b9ff861ea682ca0_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: icekit_plugins_file_file_categories file_file_categories_file_id_mediacategory_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_file_file_categories
    ADD CONSTRAINT file_file_categories_file_id_mediacategory_id_key UNIQUE (file_id, mediacategory_id);


--
-- Name: icekit_plugins_file_file_categories file_file_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_file_file_categories
    ADD CONSTRAINT file_file_categories_pkey PRIMARY KEY (id);


--
-- Name: icekit_plugins_file_file file_file_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_file_file
    ADD CONSTRAINT file_file_pkey PRIMARY KEY (id);


--
-- Name: fluent_contents_contentitem fluent_contents_contentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT fluent_contents_contentitem_pkey PRIMARY KEY (id);


--
-- Name: fluent_contents_placeholder fluent_contents_placeholde_parent_type_id_1773dbe0f57c98fb_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_placeholder
    ADD CONSTRAINT fluent_contents_placeholde_parent_type_id_1773dbe0f57c98fb_uniq UNIQUE (parent_type_id, parent_id, slot);


--
-- Name: fluent_contents_placeholder fluent_contents_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_placeholder
    ADD CONSTRAINT fluent_contents_placeholder_pkey PRIMARY KEY (id);


--
-- Name: fluent_pages_htmlpage_translation fluent_pages_htmlpage_trans_language_code_6844c539eef5511d_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_htmlpage_translation
    ADD CONSTRAINT fluent_pages_htmlpage_trans_language_code_6844c539eef5511d_uniq UNIQUE (language_code, master_id);


--
-- Name: fluent_pages_htmlpage_translation fluent_pages_htmlpage_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_htmlpage_translation
    ADD CONSTRAINT fluent_pages_htmlpage_translation_pkey PRIMARY KEY (id);


--
-- Name: fluent_pages_pagelayout fluent_pages_pagelayout_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_pagelayout
    ADD CONSTRAINT fluent_pages_pagelayout_pkey PRIMARY KEY (id);


--
-- Name: fluent_pages_urlnode fluent_pages_urlnode_parent_site_id_73f1f86c8d182703_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode
    ADD CONSTRAINT fluent_pages_urlnode_parent_site_id_73f1f86c8d182703_uniq UNIQUE (parent_site_id, key);


--
-- Name: fluent_pages_urlnode fluent_pages_urlnode_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode
    ADD CONSTRAINT fluent_pages_urlnode_pkey PRIMARY KEY (id);


--
-- Name: fluent_pages_urlnode_translation fluent_pages_urlnode_transl_language_code_3475b463d00c28d3_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode_translation
    ADD CONSTRAINT fluent_pages_urlnode_transl_language_code_3475b463d00c28d3_uniq UNIQUE (language_code, master_id);


--
-- Name: fluent_pages_urlnode_translation fluent_pages_urlnode_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode_translation
    ADD CONSTRAINT fluent_pages_urlnode_translation_pkey PRIMARY KEY (id);


--
-- Name: forms_field forms_field_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_pkey PRIMARY KEY (id);


--
-- Name: forms_fieldentry forms_fieldentry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_pkey PRIMARY KEY (id);


--
-- Name: forms_form forms_form_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_pkey PRIMARY KEY (id);


--
-- Name: forms_form_sites forms_form_sites_form_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form_sites
    ADD CONSTRAINT forms_form_sites_form_id_site_id_key UNIQUE (form_id, site_id);


--
-- Name: forms_form_sites forms_form_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form_sites
    ADD CONSTRAINT forms_form_sites_pkey PRIMARY KEY (id);


--
-- Name: forms_form forms_form_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_slug_key UNIQUE (slug);


--
-- Name: forms_formentry forms_formentry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formentry_pkey PRIMARY KEY (id);


--
-- Name: glamkit_collections_country glamkit_collections_country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_collections_country
    ADD CONSTRAINT glamkit_collections_country_pkey PRIMARY KEY (id);


--
-- Name: glamkit_collections_geographiclocation glamkit_collections_geographiclocation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_collections_geographiclocation
    ADD CONSTRAINT glamkit_collections_geographiclocation_pkey PRIMARY KEY (id);


--
-- Name: glamkit_sponsors_sponsor glamkit_sponsors_sponsor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_sponsors_sponsor
    ADD CONSTRAINT glamkit_sponsors_sponsor_pkey PRIMARY KEY (id);


--
-- Name: icekit_article_article icekit_article_article_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article
    ADD CONSTRAINT icekit_article_article_pkey PRIMARY KEY (id);


--
-- Name: icekit_article_article icekit_article_article_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article
    ADD CONSTRAINT icekit_article_article_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: icekit_article_article icekit_article_article_slug_66c210874a3259bf_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article
    ADD CONSTRAINT icekit_article_article_slug_66c210874a3259bf_uniq UNIQUE (slug, parent_id, publishing_linked_id);


--
-- Name: icekit_authors_author icekit_authors_author_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authors_author
    ADD CONSTRAINT icekit_authors_author_pkey PRIMARY KEY (id);


--
-- Name: icekit_authors_author icekit_authors_author_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authors_author
    ADD CONSTRAINT icekit_authors_author_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: icekit_event_types_simple_simpleevent icekit_event_types_simple_simpleevent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_event_types_simple_simpleevent
    ADD CONSTRAINT icekit_event_types_simple_simpleevent_pkey PRIMARY KEY (eventbase_ptr_id);


--
-- Name: icekit_events_eventbase icekit_events_eventbase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase
    ADD CONSTRAINT icekit_events_eventbase_pkey PRIMARY KEY (id);


--
-- Name: icekit_events_eventbase icekit_events_eventbase_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase
    ADD CONSTRAINT icekit_events_eventbase_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: icekit_events_eventbase_secondary_types icekit_events_eventbase_secondary_eventbase_id_eventtype_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase_secondary_types
    ADD CONSTRAINT icekit_events_eventbase_secondary_eventbase_id_eventtype_id_key UNIQUE (eventbase_id, eventtype_id);


--
-- Name: icekit_events_eventbase_secondary_types icekit_events_eventbase_secondary_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase_secondary_types
    ADD CONSTRAINT icekit_events_eventbase_secondary_types_pkey PRIMARY KEY (id);


--
-- Name: icekit_events_eventrepeatsgenerator icekit_events_eventrepeatsgenerator_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventrepeatsgenerator
    ADD CONSTRAINT icekit_events_eventrepeatsgenerator_pkey PRIMARY KEY (id);


--
-- Name: icekit_events_eventtype icekit_events_eventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventtype
    ADD CONSTRAINT icekit_events_eventtype_pkey PRIMARY KEY (id);


--
-- Name: icekit_events_occurrence icekit_events_occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_occurrence
    ADD CONSTRAINT icekit_events_occurrence_pkey PRIMARY KEY (id);


--
-- Name: icekit_events_recurrencerule icekit_events_recurrencerule_description_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_recurrencerule
    ADD CONSTRAINT icekit_events_recurrencerule_description_key UNIQUE (description);


--
-- Name: icekit_events_recurrencerule icekit_events_recurrencerule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_recurrencerule
    ADD CONSTRAINT icekit_events_recurrencerule_pkey PRIMARY KEY (id);


--
-- Name: icekit_events_recurrencerule icekit_events_recurrencerule_recurrence_rule_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_recurrencerule
    ADD CONSTRAINT icekit_events_recurrencerule_recurrence_rule_key UNIQUE (recurrence_rule);


--
-- Name: icekit_layout_content_types icekit_layout_content_types_layout_id_contenttype_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout_content_types
    ADD CONSTRAINT icekit_layout_content_types_layout_id_contenttype_id_key UNIQUE (layout_id, contenttype_id);


--
-- Name: icekit_layout_content_types icekit_layout_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout_content_types
    ADD CONSTRAINT icekit_layout_content_types_pkey PRIMARY KEY (id);


--
-- Name: icekit_layout icekit_layout_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout
    ADD CONSTRAINT icekit_layout_pkey PRIMARY KEY (id);


--
-- Name: icekit_layout icekit_layout_template_name_40d4c2ade94e7d37_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout
    ADD CONSTRAINT icekit_layout_template_name_40d4c2ade94e7d37_uniq UNIQUE (template_name);


--
-- Name: icekit_mediacategory icekit_mediacategory_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_mediacategory
    ADD CONSTRAINT icekit_mediacategory_name_key UNIQUE (name);


--
-- Name: icekit_mediacategory icekit_mediacategory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_mediacategory
    ADD CONSTRAINT icekit_mediacategory_pkey PRIMARY KEY (id);


--
-- Name: icekit_plugins_contact_person_contactperson icekit_plugins_contact_person_contactperson_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_contact_person_contactperson
    ADD CONSTRAINT icekit_plugins_contact_person_contactperson_pkey PRIMARY KEY (id);


--
-- Name: icekit_plugins_image_imagerepurposeconfig icekit_plugins_image_imagerepurposeconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_imagerepurposeconfig
    ADD CONSTRAINT icekit_plugins_image_imagerepurposeconfig_pkey PRIMARY KEY (id);


--
-- Name: icekit_press_releases_pressrelease icekit_press_releases_pressrelease_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressrelease
    ADD CONSTRAINT icekit_press_releases_pressrelease_pkey PRIMARY KEY (id);


--
-- Name: icekit_press_releases_pressrelease icekit_press_releases_pressrelease_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressrelease
    ADD CONSTRAINT icekit_press_releases_pressrelease_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: icekit_press_releases_pressreleasecategory icekit_press_releases_pressreleasecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressreleasecategory
    ADD CONSTRAINT icekit_press_releases_pressreleasecategory_pkey PRIMARY KEY (id);


--
-- Name: ik_event_listing_types ik_event_listing_types_eventcontentlistingitem_id_eventtype_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_event_listing_types
    ADD CONSTRAINT ik_event_listing_types_eventcontentlistingitem_id_eventtype_key UNIQUE (eventcontentlistingitem_id, eventtype_id);


--
-- Name: ik_event_listing_types ik_event_listing_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_event_listing_types
    ADD CONSTRAINT ik_event_listing_types_pkey PRIMARY KEY (id);


--
-- Name: ik_todays_occurrences_types ik_todays_occurrences_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_todays_occurrences_types
    ADD CONSTRAINT ik_todays_occurrences_types_pkey PRIMARY KEY (id);


--
-- Name: ik_todays_occurrences_types ik_todays_occurrences_types_todaysoccurrences_id_eventtype__key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_todays_occurrences_types
    ADD CONSTRAINT ik_todays_occurrences_types_todaysoccurrences_id_eventtype__key UNIQUE (todaysoccurrences_id, eventtype_id);


--
-- Name: icekit_plugins_image_image_categories image_image_categories_image_id_mediacategory_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_image_categories
    ADD CONSTRAINT image_image_categories_image_id_mediacategory_id_key UNIQUE (image_id, mediacategory_id);


--
-- Name: icekit_plugins_image_image_categories image_image_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_image_categories
    ADD CONSTRAINT image_image_categories_pkey PRIMARY KEY (id);


--
-- Name: icekit_plugins_image_image image_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_image
    ADD CONSTRAINT image_image_pkey PRIMARY KEY (id);


--
-- Name: model_settings_boolean model_settings_boolean_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_boolean
    ADD CONSTRAINT model_settings_boolean_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_date model_settings_date_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_date
    ADD CONSTRAINT model_settings_date_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_datetime model_settings_datetime_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_datetime
    ADD CONSTRAINT model_settings_datetime_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_decimal model_settings_decimal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_decimal
    ADD CONSTRAINT model_settings_decimal_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_file model_settings_file_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_file
    ADD CONSTRAINT model_settings_file_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_float model_settings_float_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_float
    ADD CONSTRAINT model_settings_float_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_image model_settings_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_image
    ADD CONSTRAINT model_settings_image_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_integer model_settings_integer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_integer
    ADD CONSTRAINT model_settings_integer_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_setting model_settings_setting_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_setting
    ADD CONSTRAINT model_settings_setting_name_key UNIQUE (name);


--
-- Name: model_settings_setting model_settings_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_setting
    ADD CONSTRAINT model_settings_setting_pkey PRIMARY KEY (id);


--
-- Name: model_settings_text model_settings_text_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_text
    ADD CONSTRAINT model_settings_text_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: model_settings_time model_settings_time_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_time
    ADD CONSTRAINT model_settings_time_pkey PRIMARY KEY (setting_ptr_id);


--
-- Name: notifications_followerinformation notifications_followerinf_content_type_id_704bf4f2f514ef29_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation
    ADD CONSTRAINT notifications_followerinf_content_type_id_704bf4f2f514ef29_uniq UNIQUE (content_type_id, object_id);


--
-- Name: notifications_followerinformation_group_followers notifications_followerinforma_followerinformation_id_group__key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_group_followers
    ADD CONSTRAINT notifications_followerinforma_followerinformation_id_group__key UNIQUE (followerinformation_id, group_id);


--
-- Name: notifications_followerinformation_followers notifications_followerinforma_followerinformation_id_user_i_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_followers
    ADD CONSTRAINT notifications_followerinforma_followerinformation_id_user_i_key UNIQUE (followerinformation_id, user_id);


--
-- Name: notifications_followerinformation_followers notifications_followerinformation_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_followers
    ADD CONSTRAINT notifications_followerinformation_followers_pkey PRIMARY KEY (id);


--
-- Name: notifications_followerinformation_group_followers notifications_followerinformation_group_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_group_followers
    ADD CONSTRAINT notifications_followerinformation_group_followers_pkey PRIMARY KEY (id);


--
-- Name: notifications_followerinformation notifications_followerinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation
    ADD CONSTRAINT notifications_followerinformation_pkey PRIMARY KEY (id);


--
-- Name: notifications_hasreadmessage notifications_hasreadmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_hasreadmessage
    ADD CONSTRAINT notifications_hasreadmessage_pkey PRIMARY KEY (id);


--
-- Name: notifications_notification notifications_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);


--
-- Name: notifications_notificationsetting notifications_notificationsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_notificationsetting
    ADD CONSTRAINT notifications_notificationsetting_pkey PRIMARY KEY (id);


--
-- Name: notifications_notificationsetting notifications_notificationsetting_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_notificationsetting
    ADD CONSTRAINT notifications_notificationsetting_user_id_key UNIQUE (user_id);


--
-- Name: pagetype_eventlistingfordate_eventlistingpage pagetype_eventlistingfordate_eventlist_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_eventlistingfordate_eventlistingpage
    ADD CONSTRAINT pagetype_eventlistingfordate_eventlist_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: pagetype_eventlistingfordate_eventlistingpage pagetype_eventlistingfordate_eventlistingpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_eventlistingfordate_eventlistingpage
    ADD CONSTRAINT pagetype_eventlistingfordate_eventlistingpage_pkey PRIMARY KEY (urlnode_ptr_id);


--
-- Name: icekit_articlecategorypage pagetype_icekit_article_articlecategor_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_articlecategorypage
    ADD CONSTRAINT pagetype_icekit_article_articlecategor_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: icekit_articlecategorypage pagetype_icekit_article_articlecategorypage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_articlecategorypage
    ADD CONSTRAINT pagetype_icekit_article_articlecategorypage_pkey PRIMARY KEY (urlnode_ptr_id);


--
-- Name: icekit_authorlisting pagetype_icekit_authors_authorlisting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authorlisting
    ADD CONSTRAINT pagetype_icekit_authors_authorlisting_pkey PRIMARY KEY (urlnode_ptr_id);


--
-- Name: icekit_authorlisting pagetype_icekit_authors_authorlisting_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authorlisting
    ADD CONSTRAINT pagetype_icekit_authors_authorlisting_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting pagetype_icekit_press_releases_pressre_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_icekit_press_releases_pressreleaselisting
    ADD CONSTRAINT pagetype_icekit_press_releases_pressre_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting pagetype_icekit_press_releases_pressreleaselisting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_icekit_press_releases_pressreleaselisting
    ADD CONSTRAINT pagetype_icekit_press_releases_pressreleaselisting_pkey PRIMARY KEY (urlnode_ptr_id);


--
-- Name: icekit_layoutpage pagetype_layout_page_layoutpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layoutpage
    ADD CONSTRAINT pagetype_layout_page_layoutpage_pkey PRIMARY KEY (urlnode_ptr_id);


--
-- Name: icekit_layoutpage pagetype_layout_page_layoutpage_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layoutpage
    ADD CONSTRAINT pagetype_layout_page_layoutpage_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: pagetype_redirectnode_redirectnode pagetype_redirectnode_redirectnode_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_redirectnode_redirectnode
    ADD CONSTRAINT pagetype_redirectnode_redirectnode_pkey PRIMARY KEY (urlnode_ptr_id);


--
-- Name: icekit_searchpage pagetype_search_page_searchpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_searchpage
    ADD CONSTRAINT pagetype_search_page_searchpage_pkey PRIMARY KEY (urlnode_ptr_id);


--
-- Name: icekit_searchpage pagetype_search_page_searchpage_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_searchpage
    ADD CONSTRAINT pagetype_search_page_searchpage_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: polymorphic_auth_email_emailuser polymorphic_auth_email_emailuser_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_email_emailuser
    ADD CONSTRAINT polymorphic_auth_email_emailuser_email_key UNIQUE (email);


--
-- Name: polymorphic_auth_email_emailuser polymorphic_auth_email_emailuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_email_emailuser
    ADD CONSTRAINT polymorphic_auth_email_emailuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: polymorphic_auth_user_groups polymorphic_auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_groups
    ADD CONSTRAINT polymorphic_auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: polymorphic_auth_user_groups polymorphic_auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_groups
    ADD CONSTRAINT polymorphic_auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: polymorphic_auth_user polymorphic_auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user
    ADD CONSTRAINT polymorphic_auth_user_pkey PRIMARY KEY (id);


--
-- Name: polymorphic_auth_user_user_permissions polymorphic_auth_user_user_permission_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_user_permissions
    ADD CONSTRAINT polymorphic_auth_user_user_permission_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: polymorphic_auth_user_user_permissions polymorphic_auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_user_permissions
    ADD CONSTRAINT polymorphic_auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: post_office_attachment_emails post_office_attachment_emails_attachment_id_email_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_attachment_emails
    ADD CONSTRAINT post_office_attachment_emails_attachment_id_email_id_key UNIQUE (attachment_id, email_id);


--
-- Name: post_office_attachment_emails post_office_attachment_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_attachment_emails
    ADD CONSTRAINT post_office_attachment_emails_pkey PRIMARY KEY (id);


--
-- Name: post_office_attachment post_office_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_attachment
    ADD CONSTRAINT post_office_attachment_pkey PRIMARY KEY (id);


--
-- Name: post_office_email post_office_email_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_email
    ADD CONSTRAINT post_office_email_pkey PRIMARY KEY (id);


--
-- Name: post_office_emailtemplate post_office_emailtemplate_language_3ee13897f806f56c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtemplate_language_3ee13897f806f56c_uniq UNIQUE (language, default_template_id);


--
-- Name: post_office_emailtemplate post_office_emailtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtemplate_pkey PRIMARY KEY (id);


--
-- Name: post_office_log post_office_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_log
    ADD CONSTRAINT post_office_log_pkey PRIMARY KEY (id);


--
-- Name: redirectnode_redirectnode_translation redirectnode_redirectnode_t_language_code_500ce7eec892a8c6_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY redirectnode_redirectnode_translation
    ADD CONSTRAINT redirectnode_redirectnode_t_language_code_500ce7eec892a8c6_uniq UNIQUE (language_code, master_id);


--
-- Name: redirectnode_redirectnode_translation redirectnode_redirectnode_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY redirectnode_redirectnode_translation
    ADD CONSTRAINT redirectnode_redirectnode_translation_pkey PRIMARY KEY (id);


--
-- Name: response_pages_responsepage response_pages_responsepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY response_pages_responsepage
    ADD CONSTRAINT response_pages_responsepage_pkey PRIMARY KEY (id);


--
-- Name: response_pages_responsepage response_pages_responsepage_type_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY response_pages_responsepage
    ADD CONSTRAINT response_pages_responsepage_type_key UNIQUE (type);


--
-- Name: reversion_revision reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: sharedcontent_sharedcontent sharedcontent_sharedconten_parent_site_id_784f7f7787b8cdfd_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_sharedconten_parent_site_id_784f7f7787b8cdfd_uniq UNIQUE (parent_site_id, slug);


--
-- Name: sharedcontent_sharedcontent_translation sharedcontent_sharedcontent_language_code_6363aaf7ebb4d71e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcontent_sharedcontent_language_code_6363aaf7ebb4d71e_uniq UNIQUE (language_code, master_id);


--
-- Name: sharedcontent_sharedcontent sharedcontent_sharedcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_sharedcontent_pkey PRIMARY KEY (id);


--
-- Name: sharedcontent_sharedcontent_translation sharedcontent_sharedcontent_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcontent_sharedcontent_translation_pkey PRIMARY KEY (id);


--
-- Name: icekit_plugins_slideshow_slideshow slideshow_slideshow_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_slideshow_slideshow
    ADD CONSTRAINT slideshow_slideshow_pkey PRIMARY KEY (id);


--
-- Name: icekit_plugins_slideshow_slideshow slideshow_slideshow_publishing_linked_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_slideshow_slideshow
    ADD CONSTRAINT slideshow_slideshow_publishing_linked_id_key UNIQUE (publishing_linked_id);


--
-- Name: icekit_workflow_workflowstate workflow_workflowstate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_workflow_workflowstate
    ADD CONSTRAINT workflow_workflowstate_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_503d31667fc4c98e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_503d31667fc4c98e_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_2bb3a14cc8ac2791_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authtoken_token_key_2bb3a14cc8ac2791_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: celery_taskmeta_662f707d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX celery_taskmeta_662f707d ON celery_taskmeta USING btree (hidden);


--
-- Name: celery_taskmeta_task_id_16eab4ca33d9081d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX celery_taskmeta_task_id_16eab4ca33d9081d_like ON celery_taskmeta USING btree (task_id varchar_pattern_ops);


--
-- Name: celery_tasksetmeta_662f707d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX celery_tasksetmeta_662f707d ON celery_tasksetmeta USING btree (hidden);


--
-- Name: celery_tasksetmeta_taskset_id_2a1be4348223427_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX celery_tasksetmeta_taskset_id_2a1be4348223427_like ON celery_tasksetmeta USING btree (taskset_id varchar_pattern_ops);


--
-- Name: contentitem_file_fileitem_814552b9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_file_fileitem_814552b9 ON contentitem_icekit_plugins_file_fileitem USING btree (file_id);


--
-- Name: contentitem_glamkit_sponsors_sponsorpromoitem_42545d36; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_glamkit_sponsors_sponsorpromoitem_42545d36 ON contentitem_glamkit_sponsors_sponsorpromoitem USING btree (sponsor_id);


--
-- Name: contentitem_icekit_events_links_eventlink_82bfda79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_icekit_events_links_eventlink_82bfda79 ON contentitem_icekit_events_links_eventlink USING btree (item_id);


--
-- Name: contentitem_icekit_plugins_contact_person_contactpersonitemff5b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_icekit_plugins_contact_person_contactpersonitemff5b ON contentitem_icekit_plugins_contact_person_contactpersonitem USING btree (contact_id);


--
-- Name: contentitem_icekit_plugins_content_listing_contentlistingit9442; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_icekit_plugins_content_listing_contentlistingit9442 ON contentitem_icekit_plugins_content_listing_contentlistingitem USING btree (content_type_id);


--
-- Name: contentitem_ik_event_listing_eventcontentlistingitem_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_ik_event_listing_eventcontentlistingitem_417f1b1c ON contentitem_ik_event_listing_eventcontentlistingitem USING btree (content_type_id);


--
-- Name: contentitem_ik_links_articlelink_82bfda79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_ik_links_articlelink_82bfda79 ON contentitem_ik_links_articlelink USING btree (item_id);


--
-- Name: contentitem_ik_links_authorlink_82bfda79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_ik_links_authorlink_82bfda79 ON contentitem_ik_links_authorlink USING btree (item_id);


--
-- Name: contentitem_ik_links_pagelink_82bfda79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_ik_links_pagelink_82bfda79 ON contentitem_ik_links_pagelink USING btree (item_id);


--
-- Name: contentitem_image_gallery_imagegalleryshowitem_e2c5ae20; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_image_gallery_imagegalleryshowitem_e2c5ae20 ON contentitem_image_gallery_imagegalleryshowitem USING btree (slide_show_id);


--
-- Name: contentitem_image_imageitem_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_image_imageitem_f33175e6 ON contentitem_icekit_plugins_image_imageitem USING btree (image_id);


--
-- Name: contentitem_reusable_form_formitem_d6cba1ad; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_reusable_form_formitem_d6cba1ad ON contentitem_icekit_plugins_reusable_form_formitem USING btree (form_id);


--
-- Name: contentitem_sharedcontent_sharedcontentitem_9855ad04; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_sharedcontent_sharedcontentitem_9855ad04 ON contentitem_sharedcontent_sharedcontentitem USING btree (shared_content_id);


--
-- Name: contentitem_slideshow_slideshowitem_e2c5ae20; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contentitem_slideshow_slideshowitem_e2c5ae20 ON contentitem_icekit_plugins_slideshow_slideshowitem USING btree (slide_show_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_redirect_91a0b591; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_redirect_91a0b591 ON django_redirect USING btree (old_path);


--
-- Name: django_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_redirect_9365d6e7 ON django_redirect USING btree (site_id);


--
-- Name: django_redirect_old_path_6767cac7dbcdb147_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_redirect_old_path_6767cac7dbcdb147_like ON django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_5be3744ce2fda9e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_5be3744ce2fda9e_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djcelery_periodictask_1dcd7040; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_periodictask_1dcd7040 ON djcelery_periodictask USING btree (interval_id);


--
-- Name: djcelery_periodictask_f3f0d72a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_periodictask_f3f0d72a ON djcelery_periodictask USING btree (crontab_id);


--
-- Name: djcelery_periodictask_name_628062c920bf3cb4_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_periodictask_name_628062c920bf3cb4_like ON djcelery_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_662f707d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_662f707d ON djcelery_taskstate USING btree (hidden);


--
-- Name: djcelery_taskstate_863bb2ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_863bb2ee ON djcelery_taskstate USING btree (tstamp);


--
-- Name: djcelery_taskstate_9ed39e2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_9ed39e2e ON djcelery_taskstate USING btree (state);


--
-- Name: djcelery_taskstate_b068931c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_b068931c ON djcelery_taskstate USING btree (name);


--
-- Name: djcelery_taskstate_ce77e6ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_ce77e6ef ON djcelery_taskstate USING btree (worker_id);


--
-- Name: djcelery_taskstate_name_2e4e0e83ae0b64ab_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_name_2e4e0e83ae0b64ab_like ON djcelery_taskstate USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_state_1746101d7eef39de_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_state_1746101d7eef39de_like ON djcelery_taskstate USING btree (state varchar_pattern_ops);


--
-- Name: djcelery_taskstate_task_id_795659655abd0f52_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_taskstate_task_id_795659655abd0f52_like ON djcelery_taskstate USING btree (task_id varchar_pattern_ops);


--
-- Name: djcelery_workerstate_f129901a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_workerstate_f129901a ON djcelery_workerstate USING btree (last_heartbeat);


--
-- Name: djcelery_workerstate_hostname_559be944924d2380_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djcelery_workerstate_hostname_559be944924d2380_like ON djcelery_workerstate USING btree (hostname varchar_pattern_ops);


--
-- Name: djkombu_message_46cf0e59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djkombu_message_46cf0e59 ON djkombu_message USING btree (visible);


--
-- Name: djkombu_message_75249aa1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djkombu_message_75249aa1 ON djkombu_message USING btree (queue_id);


--
-- Name: djkombu_message_df2f2974; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djkombu_message_df2f2974 ON djkombu_message USING btree (sent_at);


--
-- Name: djkombu_queue_name_39b446a5b59da73d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX djkombu_queue_name_39b446a5b59da73d_like ON djkombu_queue USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_31f5f1d6507a92ee_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_source_name_31f5f1d6507a92ee_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_1dd0a2992bff5c9b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_source_storage_hash_1dd0a2992bff5c9b_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_514e422f2f38a358_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_thumbnail_name_514e422f2f38a358_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_419ffbb87f0c8355_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_419ffbb87f0c8355_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: file_file_categories_814552b9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_file_categories_814552b9 ON icekit_plugins_file_file_categories USING btree (file_id);


--
-- Name: file_file_categories_a1a67fb1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_file_categories_a1a67fb1 ON icekit_plugins_file_file_categories USING btree (mediacategory_id);


--
-- Name: fluent_contents_contentitem_2e3c0484; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_contentitem_2e3c0484 ON fluent_contents_contentitem USING btree (parent_type_id);


--
-- Name: fluent_contents_contentitem_60716c2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_contentitem_60716c2f ON fluent_contents_contentitem USING btree (language_code);


--
-- Name: fluent_contents_contentitem_667a6151; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_contentitem_667a6151 ON fluent_contents_contentitem USING btree (placeholder_id);


--
-- Name: fluent_contents_contentitem_a73f1f77; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_contentitem_a73f1f77 ON fluent_contents_contentitem USING btree (sort_order);


--
-- Name: fluent_contents_contentitem_d3e32c49; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_contentitem_d3e32c49 ON fluent_contents_contentitem USING btree (polymorphic_ctype_id);


--
-- Name: fluent_contents_contentitem_language_code_192b1eff6b844b8b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_contentitem_language_code_192b1eff6b844b8b_like ON fluent_contents_contentitem USING btree (language_code varchar_pattern_ops);


--
-- Name: fluent_contents_placeholder_2e3c0484; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_placeholder_2e3c0484 ON fluent_contents_placeholder USING btree (parent_type_id);


--
-- Name: fluent_contents_placeholder_5e97994e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_placeholder_5e97994e ON fluent_contents_placeholder USING btree (slot);


--
-- Name: fluent_contents_placeholder_slot_28d07aa0197fc9a3_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_contents_placeholder_slot_28d07aa0197fc9a3_like ON fluent_contents_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: fluent_pages_htmlpage_trans_language_code_493f38fafd8f2801_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_htmlpage_trans_language_code_493f38fafd8f2801_like ON fluent_pages_htmlpage_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: fluent_pages_htmlpage_translation_60716c2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_htmlpage_translation_60716c2f ON fluent_pages_htmlpage_translation USING btree (language_code);


--
-- Name: fluent_pages_htmlpage_translation_90349b61; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_htmlpage_translation_90349b61 ON fluent_pages_htmlpage_translation USING btree (master_id);


--
-- Name: fluent_pages_pagelayout_3c6e0b8a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_pagelayout_3c6e0b8a ON fluent_pages_pagelayout USING btree (key);


--
-- Name: fluent_pages_pagelayout_key_6c87032e14e7c11b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_pagelayout_key_6c87032e14e7c11b_like ON fluent_pages_pagelayout USING btree (key varchar_pattern_ops);


--
-- Name: fluent_pages_urlnode_0b39ac3a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_0b39ac3a ON fluent_pages_urlnode USING btree (in_sitemaps);


--
-- Name: fluent_pages_urlnode_2247c5f0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_2247c5f0 ON fluent_pages_urlnode USING btree (publication_end_date);


--
-- Name: fluent_pages_urlnode_3c6e0b8a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_3c6e0b8a ON fluent_pages_urlnode USING btree (key);


--
-- Name: fluent_pages_urlnode_3cfbd988; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_3cfbd988 ON fluent_pages_urlnode USING btree (rght);


--
-- Name: fluent_pages_urlnode_4e147804; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_4e147804 ON fluent_pages_urlnode USING btree (parent_site_id);


--
-- Name: fluent_pages_urlnode_4f331e2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_4f331e2f ON fluent_pages_urlnode USING btree (author_id);


--
-- Name: fluent_pages_urlnode_656442a0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_656442a0 ON fluent_pages_urlnode USING btree (tree_id);


--
-- Name: fluent_pages_urlnode_6be37982; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_6be37982 ON fluent_pages_urlnode USING btree (parent_id);


--
-- Name: fluent_pages_urlnode_93b83098; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_93b83098 ON fluent_pages_urlnode USING btree (publication_date);


--
-- Name: fluent_pages_urlnode_9acb4454; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_9acb4454 ON fluent_pages_urlnode USING btree (status);


--
-- Name: fluent_pages_urlnode_c9e9a848; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_c9e9a848 ON fluent_pages_urlnode USING btree (level);


--
-- Name: fluent_pages_urlnode_caf7cc51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_caf7cc51 ON fluent_pages_urlnode USING btree (lft);


--
-- Name: fluent_pages_urlnode_d3e32c49; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_d3e32c49 ON fluent_pages_urlnode USING btree (polymorphic_ctype_id);


--
-- Name: fluent_pages_urlnode_db3eb53f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_db3eb53f ON fluent_pages_urlnode USING btree (in_navigation);


--
-- Name: fluent_pages_urlnode_key_53188590abf308ce_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_key_53188590abf308ce_like ON fluent_pages_urlnode USING btree (key varchar_pattern_ops);


--
-- Name: fluent_pages_urlnode_status_14e4e26ad70d3084_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_status_14e4e26ad70d3084_like ON fluent_pages_urlnode USING btree (status varchar_pattern_ops);


--
-- Name: fluent_pages_urlnode_transl_language_code_5e3f330f8f9b0f8f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_transl_language_code_5e3f330f8f9b0f8f_like ON fluent_pages_urlnode_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: fluent_pages_urlnode_translat__cached_url_51b5fd0d0024e5d8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_translat__cached_url_51b5fd0d0024e5d8_like ON fluent_pages_urlnode_translation USING btree (_cached_url varchar_pattern_ops);


--
-- Name: fluent_pages_urlnode_translation_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_translation_2dbcba41 ON fluent_pages_urlnode_translation USING btree (slug);


--
-- Name: fluent_pages_urlnode_translation_60716c2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_translation_60716c2f ON fluent_pages_urlnode_translation USING btree (language_code);


--
-- Name: fluent_pages_urlnode_translation_90349b61; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_translation_90349b61 ON fluent_pages_urlnode_translation USING btree (master_id);


--
-- Name: fluent_pages_urlnode_translation_f2efa396; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_translation_f2efa396 ON fluent_pages_urlnode_translation USING btree (_cached_url);


--
-- Name: fluent_pages_urlnode_translation_slug_6a432107e7284057_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fluent_pages_urlnode_translation_slug_6a432107e7284057_like ON fluent_pages_urlnode_translation USING btree (slug varchar_pattern_ops);


--
-- Name: forms_field_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_field_2dbcba41 ON forms_field USING btree (slug);


--
-- Name: forms_field_d6cba1ad; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_field_d6cba1ad ON forms_field USING btree (form_id);


--
-- Name: forms_field_slug_382eee9aba530d11_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_field_slug_382eee9aba530d11_like ON forms_field USING btree (slug varchar_pattern_ops);


--
-- Name: forms_fieldentry_b64a62ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_fieldentry_b64a62ea ON forms_fieldentry USING btree (entry_id);


--
-- Name: forms_form_sites_9365d6e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_form_sites_9365d6e7 ON forms_form_sites USING btree (site_id);


--
-- Name: forms_form_sites_d6cba1ad; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_form_sites_d6cba1ad ON forms_form_sites USING btree (form_id);


--
-- Name: forms_form_slug_3a6e99d59cfeb88e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_form_slug_3a6e99d59cfeb88e_like ON forms_form USING btree (slug varchar_pattern_ops);


--
-- Name: forms_formentry_d6cba1ad; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forms_formentry_d6cba1ad ON forms_formentry USING btree (form_id);


--
-- Name: glamkit_collections_country_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX glamkit_collections_country_2dbcba41 ON glamkit_collections_country USING btree (slug);


--
-- Name: glamkit_collections_country_slug_7fc1e62bee670505_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX glamkit_collections_country_slug_7fc1e62bee670505_like ON glamkit_collections_country USING btree (slug varchar_pattern_ops);


--
-- Name: glamkit_collections_geographiclocation_93bfec8a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX glamkit_collections_geographiclocation_93bfec8a ON glamkit_collections_geographiclocation USING btree (country_id);


--
-- Name: glamkit_sponsors_sponsor_8c0ff365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX glamkit_sponsors_sponsor_8c0ff365 ON glamkit_sponsors_sponsor USING btree (logo_id);


--
-- Name: icekit_article_article_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_article_article_2dbcba41 ON icekit_article_article USING btree (slug);


--
-- Name: icekit_article_article_441a5015; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_article_article_441a5015 ON icekit_article_article USING btree (hero_image_id);


--
-- Name: icekit_article_article_6be37982; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_article_article_6be37982 ON icekit_article_article USING btree (parent_id);


--
-- Name: icekit_article_article_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_article_article_72bc1be0 ON icekit_article_article USING btree (layout_id);


--
-- Name: icekit_article_article_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_article_article_b667876a ON icekit_article_article USING btree (publishing_is_draft);


--
-- Name: icekit_article_article_slug_204333baf98ab5a3_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_article_article_slug_204333baf98ab5a3_like ON icekit_article_article USING btree (slug varchar_pattern_ops);


--
-- Name: icekit_authors_author_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_authors_author_2dbcba41 ON icekit_authors_author USING btree (slug);


--
-- Name: icekit_authors_author_6968df0c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_authors_author_6968df0c ON icekit_authors_author USING btree (hero_image_id);


--
-- Name: icekit_authors_author_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_authors_author_b667876a ON icekit_authors_author USING btree (publishing_is_draft);


--
-- Name: icekit_authors_author_slug_557cc945a3a88b8f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_authors_author_slug_557cc945a3a88b8f_like ON icekit_authors_author USING btree (slug varchar_pattern_ops);


--
-- Name: icekit_event_types_simple_simpleevent_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_event_types_simple_simpleevent_72bc1be0 ON icekit_event_types_simple_simpleevent USING btree (layout_id);


--
-- Name: icekit_events_eventbase_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_2dbcba41 ON icekit_events_eventbase USING btree (slug);


--
-- Name: icekit_events_eventbase_6cad1465; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_6cad1465 ON icekit_events_eventbase USING btree (part_of_id);


--
-- Name: icekit_events_eventbase_7af97c1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_7af97c1b ON icekit_events_eventbase USING btree (primary_type_id);


--
-- Name: icekit_events_eventbase_7fa10fbf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_7fa10fbf ON icekit_events_eventbase USING btree (derived_from_id);


--
-- Name: icekit_events_eventbase_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_9ae73c65 ON icekit_events_eventbase USING btree (modified);


--
-- Name: icekit_events_eventbase_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_b667876a ON icekit_events_eventbase USING btree (publishing_is_draft);


--
-- Name: icekit_events_eventbase_d3e32c49; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_d3e32c49 ON icekit_events_eventbase USING btree (polymorphic_ctype_id);


--
-- Name: icekit_events_eventbase_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_e2fa5388 ON icekit_events_eventbase USING btree (created);


--
-- Name: icekit_events_eventbase_secondary_types_09b50619; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_secondary_types_09b50619 ON icekit_events_eventbase_secondary_types USING btree (eventbase_id);


--
-- Name: icekit_events_eventbase_secondary_types_79752242; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_secondary_types_79752242 ON icekit_events_eventbase_secondary_types USING btree (eventtype_id);


--
-- Name: icekit_events_eventbase_slug_131716ef2046987a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventbase_slug_131716ef2046987a_like ON icekit_events_eventbase USING btree (slug varchar_pattern_ops);


--
-- Name: icekit_events_eventrepeatsgenerator_32f63e2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventrepeatsgenerator_32f63e2e ON icekit_events_eventrepeatsgenerator USING btree (is_all_day);


--
-- Name: icekit_events_eventrepeatsgenerator_4437cfac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventrepeatsgenerator_4437cfac ON icekit_events_eventrepeatsgenerator USING btree (event_id);


--
-- Name: icekit_events_eventrepeatsgenerator_7f021a14; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventrepeatsgenerator_7f021a14 ON icekit_events_eventrepeatsgenerator USING btree ("end");


--
-- Name: icekit_events_eventrepeatsgenerator_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventrepeatsgenerator_9ae73c65 ON icekit_events_eventrepeatsgenerator USING btree (modified);


--
-- Name: icekit_events_eventrepeatsgenerator_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventrepeatsgenerator_e2fa5388 ON icekit_events_eventrepeatsgenerator USING btree (created);


--
-- Name: icekit_events_eventrepeatsgenerator_ea2b2676; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventrepeatsgenerator_ea2b2676 ON icekit_events_eventrepeatsgenerator USING btree (start);


--
-- Name: icekit_events_eventtype_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventtype_2dbcba41 ON icekit_events_eventtype USING btree (slug);


--
-- Name: icekit_events_eventtype_slug_766ac046d4fdf64d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_eventtype_slug_766ac046d4fdf64d_like ON icekit_events_eventtype USING btree (slug varchar_pattern_ops);


--
-- Name: icekit_events_occurrence_213f2807; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_213f2807 ON icekit_events_occurrence USING btree (is_protected_from_regeneration);


--
-- Name: icekit_events_occurrence_32f63e2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_32f63e2e ON icekit_events_occurrence USING btree (is_all_day);


--
-- Name: icekit_events_occurrence_4437cfac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_4437cfac ON icekit_events_occurrence USING btree (event_id);


--
-- Name: icekit_events_occurrence_5a9e8819; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_5a9e8819 ON icekit_events_occurrence USING btree (generator_id);


--
-- Name: icekit_events_occurrence_7f021a14; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_7f021a14 ON icekit_events_occurrence USING btree ("end");


--
-- Name: icekit_events_occurrence_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_9ae73c65 ON icekit_events_occurrence USING btree (modified);


--
-- Name: icekit_events_occurrence_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_e2fa5388 ON icekit_events_occurrence USING btree (created);


--
-- Name: icekit_events_occurrence_ea2b2676; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_occurrence_ea2b2676 ON icekit_events_occurrence USING btree (start);


--
-- Name: icekit_events_recurrenceru_recurrence_rule_a8b552da1b6b7a7_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_recurrenceru_recurrence_rule_a8b552da1b6b7a7_like ON icekit_events_recurrencerule USING btree (recurrence_rule text_pattern_ops);


--
-- Name: icekit_events_recurrencerule_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_recurrencerule_9ae73c65 ON icekit_events_recurrencerule USING btree (modified);


--
-- Name: icekit_events_recurrencerule_description_6335f0127afcdb22_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_recurrencerule_description_6335f0127afcdb22_like ON icekit_events_recurrencerule USING btree (description text_pattern_ops);


--
-- Name: icekit_events_recurrencerule_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_events_recurrencerule_e2fa5388 ON icekit_events_recurrencerule USING btree (created);


--
-- Name: icekit_layout_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_layout_9ae73c65 ON icekit_layout USING btree (modified);


--
-- Name: icekit_layout_content_types_17321e91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_layout_content_types_17321e91 ON icekit_layout_content_types USING btree (contenttype_id);


--
-- Name: icekit_layout_content_types_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_layout_content_types_72bc1be0 ON icekit_layout_content_types USING btree (layout_id);


--
-- Name: icekit_layout_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_layout_e2fa5388 ON icekit_layout USING btree (created);


--
-- Name: icekit_layout_template_name_40d4c2ade94e7d37_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_layout_template_name_40d4c2ade94e7d37_like ON icekit_layout USING btree (template_name varchar_pattern_ops);


--
-- Name: icekit_mediacategory_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_mediacategory_9ae73c65 ON icekit_mediacategory USING btree (modified);


--
-- Name: icekit_mediacategory_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_mediacategory_e2fa5388 ON icekit_mediacategory USING btree (created);


--
-- Name: icekit_mediacategory_name_4468a88d7e987ea8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_mediacategory_name_4468a88d7e987ea8_like ON icekit_mediacategory USING btree (name varchar_pattern_ops);


--
-- Name: icekit_plugins_image_imagerepurposec_slug_7600932ebefe9f1c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_plugins_image_imagerepurposec_slug_7600932ebefe9f1c_like ON icekit_plugins_image_imagerepurposeconfig USING btree (slug varchar_pattern_ops);


--
-- Name: icekit_plugins_image_imagerepurposeconfig_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_plugins_image_imagerepurposeconfig_2dbcba41 ON icekit_plugins_image_imagerepurposeconfig USING btree (slug);


--
-- Name: icekit_press_releases_pressrelease_23690fd7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_23690fd7 ON icekit_press_releases_pressrelease USING btree (released);


--
-- Name: icekit_press_releases_pressrelease_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_2dbcba41 ON icekit_press_releases_pressrelease USING btree (slug);


--
-- Name: icekit_press_releases_pressrelease_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_72bc1be0 ON icekit_press_releases_pressrelease USING btree (layout_id);


--
-- Name: icekit_press_releases_pressrelease_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_9ae73c65 ON icekit_press_releases_pressrelease USING btree (modified);


--
-- Name: icekit_press_releases_pressrelease_b583a629; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_b583a629 ON icekit_press_releases_pressrelease USING btree (category_id);


--
-- Name: icekit_press_releases_pressrelease_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_b667876a ON icekit_press_releases_pressrelease USING btree (publishing_is_draft);


--
-- Name: icekit_press_releases_pressrelease_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_e2fa5388 ON icekit_press_releases_pressrelease USING btree (created);


--
-- Name: icekit_press_releases_pressrelease_slug_5a908850269e102f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX icekit_press_releases_pressrelease_slug_5a908850269e102f_like ON icekit_press_releases_pressrelease USING btree (slug varchar_pattern_ops);


--
-- Name: ik_event_listing_types_79752242; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ik_event_listing_types_79752242 ON ik_event_listing_types USING btree (eventtype_id);


--
-- Name: ik_event_listing_types_fed6ef54; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ik_event_listing_types_fed6ef54 ON ik_event_listing_types USING btree (eventcontentlistingitem_id);


--
-- Name: ik_todays_occurrences_types_70a97ca9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ik_todays_occurrences_types_70a97ca9 ON ik_todays_occurrences_types USING btree (todaysoccurrences_id);


--
-- Name: ik_todays_occurrences_types_79752242; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ik_todays_occurrences_types_79752242 ON ik_todays_occurrences_types USING btree (eventtype_id);


--
-- Name: image_image_categories_a1a67fb1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX image_image_categories_a1a67fb1 ON icekit_plugins_image_image_categories USING btree (mediacategory_id);


--
-- Name: image_image_categories_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX image_image_categories_f33175e6 ON icekit_plugins_image_image_categories USING btree (image_id);


--
-- Name: model_settings_setting_d3e32c49; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX model_settings_setting_d3e32c49 ON model_settings_setting USING btree (polymorphic_ctype_id);


--
-- Name: model_settings_setting_name_993731a92a4b58c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX model_settings_setting_name_993731a92a4b58c_like ON model_settings_setting USING btree (name varchar_pattern_ops);


--
-- Name: notifications_followerinformation_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_followerinformation_417f1b1c ON notifications_followerinformation USING btree (content_type_id);


--
-- Name: notifications_followerinformation_d3e32c49; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_followerinformation_d3e32c49 ON notifications_followerinformation USING btree (polymorphic_ctype_id);


--
-- Name: notifications_followerinformation_followers_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_followerinformation_followers_e8701ad4 ON notifications_followerinformation_followers USING btree (user_id);


--
-- Name: notifications_followerinformation_followers_ed2a121f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_followerinformation_followers_ed2a121f ON notifications_followerinformation_followers USING btree (followerinformation_id);


--
-- Name: notifications_followerinformation_group_followers_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_followerinformation_group_followers_0e939a4f ON notifications_followerinformation_group_followers USING btree (group_id);


--
-- Name: notifications_followerinformation_group_followers_ed2a121f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_followerinformation_group_followers_ed2a121f ON notifications_followerinformation_group_followers USING btree (followerinformation_id);


--
-- Name: notifications_hasreadmessage_4ccaa172; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_hasreadmessage_4ccaa172 ON notifications_hasreadmessage USING btree (message_id);


--
-- Name: notifications_hasreadmessage_a8452ca7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_hasreadmessage_a8452ca7 ON notifications_hasreadmessage USING btree (person_id);


--
-- Name: notifications_notification_9ae73c65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_notification_9ae73c65 ON notifications_notification USING btree (modified);


--
-- Name: notifications_notification_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_notification_e2fa5388 ON notifications_notification USING btree (created);


--
-- Name: notifications_notification_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_notification_e8701ad4 ON notifications_notification USING btree (user_id);


--
-- Name: pagetype_eventlistingfordate_eventlistingpage_441a5015; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_eventlistingfordate_eventlistingpage_441a5015 ON pagetype_eventlistingfordate_eventlistingpage USING btree (hero_image_id);


--
-- Name: pagetype_eventlistingfordate_eventlistingpage_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_eventlistingfordate_eventlistingpage_72bc1be0 ON pagetype_eventlistingfordate_eventlistingpage USING btree (layout_id);


--
-- Name: pagetype_eventlistingfordate_eventlistingpage_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_eventlistingfordate_eventlistingpage_b667876a ON pagetype_eventlistingfordate_eventlistingpage USING btree (publishing_is_draft);


--
-- Name: pagetype_icekit_article_articlecategorypage_441a5015; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_article_articlecategorypage_441a5015 ON icekit_articlecategorypage USING btree (hero_image_id);


--
-- Name: pagetype_icekit_article_articlecategorypage_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_article_articlecategorypage_72bc1be0 ON icekit_articlecategorypage USING btree (layout_id);


--
-- Name: pagetype_icekit_article_articlecategorypage_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_article_articlecategorypage_b667876a ON icekit_articlecategorypage USING btree (publishing_is_draft);


--
-- Name: pagetype_icekit_authors_authorlisting_441a5015; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_authors_authorlisting_441a5015 ON icekit_authorlisting USING btree (hero_image_id);


--
-- Name: pagetype_icekit_authors_authorlisting_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_authors_authorlisting_72bc1be0 ON icekit_authorlisting USING btree (layout_id);


--
-- Name: pagetype_icekit_authors_authorlisting_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_authors_authorlisting_b667876a ON icekit_authorlisting USING btree (publishing_is_draft);


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting_441a5015; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_press_releases_pressreleaselisting_441a5015 ON pagetype_icekit_press_releases_pressreleaselisting USING btree (hero_image_id);


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_press_releases_pressreleaselisting_72bc1be0 ON pagetype_icekit_press_releases_pressreleaselisting USING btree (layout_id);


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_icekit_press_releases_pressreleaselisting_b667876a ON pagetype_icekit_press_releases_pressreleaselisting USING btree (publishing_is_draft);


--
-- Name: pagetype_layout_page_layoutpage_441a5015; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_layout_page_layoutpage_441a5015 ON icekit_layoutpage USING btree (hero_image_id);


--
-- Name: pagetype_layout_page_layoutpage_72bc1be0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_layout_page_layoutpage_72bc1be0 ON icekit_layoutpage USING btree (layout_id);


--
-- Name: pagetype_layout_page_layoutpage_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_layout_page_layoutpage_b667876a ON icekit_layoutpage USING btree (publishing_is_draft);


--
-- Name: pagetype_search_page_searchpage_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pagetype_search_page_searchpage_b667876a ON icekit_searchpage USING btree (publishing_is_draft);


--
-- Name: polymorphic_auth_email_emailuser_email_5c8f00695aaaf756_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_auth_email_emailuser_email_5c8f00695aaaf756_like ON polymorphic_auth_email_emailuser USING btree (email varchar_pattern_ops);


--
-- Name: polymorphic_auth_user_d3e32c49; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_auth_user_d3e32c49 ON polymorphic_auth_user USING btree (polymorphic_ctype_id);


--
-- Name: polymorphic_auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_auth_user_groups_0e939a4f ON polymorphic_auth_user_groups USING btree (group_id);


--
-- Name: polymorphic_auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_auth_user_groups_e8701ad4 ON polymorphic_auth_user_groups USING btree (user_id);


--
-- Name: polymorphic_auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_auth_user_user_permissions_8373b171 ON polymorphic_auth_user_user_permissions USING btree (permission_id);


--
-- Name: polymorphic_auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_auth_user_user_permissions_e8701ad4 ON polymorphic_auth_user_user_permissions USING btree (user_id);


--
-- Name: post_office_attachment_emails_07ba63f5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_attachment_emails_07ba63f5 ON post_office_attachment_emails USING btree (attachment_id);


--
-- Name: post_office_attachment_emails_fdfd0ebf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_attachment_emails_fdfd0ebf ON post_office_attachment_emails USING btree (email_id);


--
-- Name: post_office_email_3acc0b7a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_email_3acc0b7a ON post_office_email USING btree (last_updated);


--
-- Name: post_office_email_74f53564; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_email_74f53564 ON post_office_email USING btree (template_id);


--
-- Name: post_office_email_9acb4454; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_email_9acb4454 ON post_office_email USING btree (status);


--
-- Name: post_office_email_e2fa5388; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_email_e2fa5388 ON post_office_email USING btree (created);


--
-- Name: post_office_email_ed24d584; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_email_ed24d584 ON post_office_email USING btree (scheduled_time);


--
-- Name: post_office_emailtemplate_dea6f63e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_emailtemplate_dea6f63e ON post_office_emailtemplate USING btree (default_template_id);


--
-- Name: post_office_log_fdfd0ebf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX post_office_log_fdfd0ebf ON post_office_log USING btree (email_id);


--
-- Name: redirectnode_redirectnode_t_language_code_2ebecfa5e696d7e2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirectnode_redirectnode_t_language_code_2ebecfa5e696d7e2_like ON redirectnode_redirectnode_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: redirectnode_redirectnode_translation_60716c2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirectnode_redirectnode_translation_60716c2f ON redirectnode_redirectnode_translation USING btree (language_code);


--
-- Name: redirectnode_redirectnode_translation_90349b61; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirectnode_redirectnode_translation_90349b61 ON redirectnode_redirectnode_translation USING btree (master_id);


--
-- Name: response_pages_responsepage_type_30c261796dbfcc31_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX response_pages_responsepage_type_30c261796dbfcc31_like ON response_pages_responsepage USING btree (type varchar_pattern_ops);


--
-- Name: reversion_revision_b16b0f06; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reversion_revision_b16b0f06 ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_c69e55a4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reversion_revision_c69e55a4 ON reversion_revision USING btree (date_created);


--
-- Name: reversion_revision_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reversion_revision_e8701ad4 ON reversion_revision USING btree (user_id);


--
-- Name: reversion_revision_manager_slug_694e7cd9f454ec3f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reversion_revision_manager_slug_694e7cd9f454ec3f_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_version_0c9ba3a3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reversion_version_0c9ba3a3 ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reversion_version_417f1b1c ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_5de09a8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reversion_version_5de09a8d ON reversion_version USING btree (revision_id);


--
-- Name: sharedcontent_sharedcontent_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sharedcontent_sharedcontent_2dbcba41 ON sharedcontent_sharedcontent USING btree (slug);


--
-- Name: sharedcontent_sharedcontent_4e147804; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sharedcontent_sharedcontent_4e147804 ON sharedcontent_sharedcontent USING btree (parent_site_id);


--
-- Name: sharedcontent_sharedcontent_language_code_4976caac0436b7c6_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sharedcontent_sharedcontent_language_code_4976caac0436b7c6_like ON sharedcontent_sharedcontent_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: sharedcontent_sharedcontent_slug_1d9dfc0ef4190c20_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sharedcontent_sharedcontent_slug_1d9dfc0ef4190c20_like ON sharedcontent_sharedcontent USING btree (slug varchar_pattern_ops);


--
-- Name: sharedcontent_sharedcontent_translation_60716c2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sharedcontent_sharedcontent_translation_60716c2f ON sharedcontent_sharedcontent_translation USING btree (language_code);


--
-- Name: sharedcontent_sharedcontent_translation_90349b61; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sharedcontent_sharedcontent_translation_90349b61 ON sharedcontent_sharedcontent_translation USING btree (master_id);


--
-- Name: slideshow_slideshow_b667876a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX slideshow_slideshow_b667876a ON icekit_plugins_slideshow_slideshow USING btree (publishing_is_draft);


--
-- Name: workflow_workflowstate_02c1725c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX workflow_workflowstate_02c1725c ON icekit_workflow_workflowstate USING btree (assigned_to_id);


--
-- Name: workflow_workflowstate_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX workflow_workflowstate_417f1b1c ON icekit_workflow_workflowstate USING btree (content_type_id);


--
-- Name: contentitem_icekit_plugins_content_listing_contentlistingitem D05394c0da9a9d10e29604f2228db0fa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_content_listing_contentlistingitem
    ADD CONSTRAINT "D05394c0da9a9d10e29604f2228db0fa" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_occurrence D0af1acd39fde5ec1c1239392f9b8440; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_occurrence
    ADD CONSTRAINT "D0af1acd39fde5ec1c1239392f9b8440" FOREIGN KEY (generator_id) REFERENCES icekit_events_eventrepeatsgenerator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_contentitem D0b257a5edd5a000f1e5fcf575737948; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT "D0b257a5edd5a000f1e5fcf575737948" FOREIGN KEY (placeholder_id) REFERENCES fluent_contents_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_article_article D0d05fe5eb9d350cca83f22de4bf5822; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article
    ADD CONSTRAINT "D0d05fe5eb9d350cca83f22de4bf5822" FOREIGN KEY (hero_image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_links_authorlink D10fe2049c9a367fc3477ceaf427922d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_authorlink
    ADD CONSTRAINT "D10fe2049c9a367fc3477ceaf427922d" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_articlecategorypage D12c0094121db657048b1ae3e5caf0c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_articlecategorypage
    ADD CONSTRAINT "D12c0094121db657048b1ae3e5caf0c4" FOREIGN KEY (hero_image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_events_links_eventlink D17dfa20589d7767cc64d9b264bd27e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_events_links_eventlink
    ADD CONSTRAINT "D17dfa20589d7767cc64d9b264bd27e7" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: redirectnode_redirectnode_translation D19b213dafc7150e5ac533f8b16d8b93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY redirectnode_redirectnode_translation
    ADD CONSTRAINT "D19b213dafc7150e5ac533f8b16d8b93" FOREIGN KEY (master_id) REFERENCES pagetype_redirectnode_redirectnode(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ik_event_listing_types D1f772ac55f5213e701e564659d0a862; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_event_listing_types
    ADD CONSTRAINT "D1f772ac55f5213e701e564659d0a862" FOREIGN KEY (eventcontentlistingitem_id) REFERENCES contentitem_ik_event_listing_eventcontentlistingitem(contentitem_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_searchpage D23a4b3dd364bad7be50486a88705ebb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_searchpage
    ADD CONSTRAINT "D23a4b3dd364bad7be50486a88705ebb" FOREIGN KEY (publishing_linked_id) REFERENCES icekit_searchpage(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_followerinformation D249bd8e7dedd229dd81640b5991191d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation
    ADD CONSTRAINT "D249bd8e7dedd229dd81640b5991191d" FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_slideshow_slideshowitem D277f26cdd25c63df9bf7f9cb8b84cb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_slideshow_slideshowitem
    ADD CONSTRAINT "D277f26cdd25c63df9bf7f9cb8b84cb1" FOREIGN KEY (slide_show_id) REFERENCES icekit_plugins_slideshow_slideshow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_twitter_embed_twitterembeditem D2b7f6b473adb91a09efa106354be643; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_twitter_embed_twitterembeditem
    ADD CONSTRAINT "D2b7f6b473adb91a09efa106354be643" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_glamkit_sponsors_sponsorpromoitem D2f2139072cc6f9ffea3f2121c1200d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_glamkit_sponsors_sponsorpromoitem
    ADD CONSTRAINT "D2f2139072cc6f9ffea3f2121c1200d2" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_pages_urlnode D2fe70b2781d088ed0c3d83e5feae0bf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode
    ADD CONSTRAINT "D2fe70b2781d088ed0c3d83e5feae0bf" FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_links_pagelink D31b79edde41f56cfd0ea66f98e276de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_pagelink
    ADD CONSTRAINT "D31b79edde41f56cfd0ea66f98e276de" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_image_gallery_imagegalleryshowitem D34fcb4b7685cf2726d74d28591ce01d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_image_gallery_imagegalleryshowitem
    ADD CONSTRAINT "D34fcb4b7685cf2726d74d28591ce01d" FOREIGN KEY (slide_show_id) REFERENCES icekit_plugins_slideshow_slideshow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_child_pages_childpageitem D3757417315bd479a1fa518abe6ce6cb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_child_pages_childpageitem
    ADD CONSTRAINT "D3757417315bd479a1fa518abe6ce6cb" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_events_todays_occurrences_todaysoccurrences D3d3f2f255d2b96c2d234d97b360c6a5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_events_todays_occurrences_todaysoccurrences
    ADD CONSTRAINT "D3d3f2f255d2b96c2d234d97b360c6a5" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_article_article D3f2a3ef3702a92e727ad2b14a7de64f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article
    ADD CONSTRAINT "D3f2a3ef3702a92e727ad2b14a7de64f" FOREIGN KEY (publishing_linked_id) REFERENCES icekit_article_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_file_fileitem D432d331dcbd34678be797b6a5944110; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_file_fileitem
    ADD CONSTRAINT "D432d331dcbd34678be797b6a5944110" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_horizontal_rule_horizontalruleitem D4b1caf2cb6af41be3ea3afe34466182; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_horizontal_rule_horizontalruleitem
    ADD CONSTRAINT "D4b1caf2cb6af41be3ea3afe34466182" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_image_gallery_imagegalleryshowitem D4ed514be8cea545955e9c30a6a22bc9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_image_gallery_imagegalleryshowitem
    ADD CONSTRAINT "D4ed514be8cea545955e9c30a6a22bc9" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_sharedcontent_sharedcontentitem D595b3a69c78711481f6cc893c9474da; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT "D595b3a69c78711481f6cc893c9474da" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_setting D5d24430d00e0baf7a4b5bc386a8c074; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_setting
    ADD CONSTRAINT "D5d24430d00e0baf7a4b5bc386a8c074" FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting D60c50661578611c4880b0a50ed4b5f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_icekit_press_releases_pressreleaselisting
    ADD CONSTRAINT "D60c50661578611c4880b0a50ed4b5f1" FOREIGN KEY (hero_image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_layoutpage D660407dbf911d9d672abd57164181b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layoutpage
    ADD CONSTRAINT "D660407dbf911d9d672abd57164181b2" FOREIGN KEY (publishing_linked_id) REFERENCES icekit_layoutpage(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_press_releases_pressrelease D6757e8386816fbdcf7d580295052e88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressrelease
    ADD CONSTRAINT "D6757e8386816fbdcf7d580295052e88" FOREIGN KEY (publishing_linked_id) REFERENCES icekit_press_releases_pressrelease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_layoutpage D682669b8277ee60d8cb6c72a97042b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layoutpage
    ADD CONSTRAINT "D682669b8277ee60d8cb6c72a97042b1" FOREIGN KEY (hero_image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_contact_person_contactpersonitem D69d2056643bb02e8cc451ac8eeb3385; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_contact_person_contactpersonitem
    ADD CONSTRAINT "D69d2056643bb02e8cc451ac8eeb3385" FOREIGN KEY (contact_id) REFERENCES icekit_plugins_contact_person_contactperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_followerinformation_group_followers D6a27a0ba20910a77d646ae5e9279710; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_group_followers
    ADD CONSTRAINT "D6a27a0ba20910a77d646ae5e9279710" FOREIGN KEY (followerinformation_id) REFERENCES notifications_followerinformation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_page_anchor_pageanchoritem D6fff8f0d3b582fbee9453ae8984a745; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_page_anchor_pageanchoritem
    ADD CONSTRAINT "D6fff8f0d3b582fbee9453ae8984a745" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_eventlistingfordate_eventlistingpage D732c0fc6b9a500e982df259ac954711; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_eventlistingfordate_eventlistingpage
    ADD CONSTRAINT "D732c0fc6b9a500e982df259ac954711" FOREIGN KEY (publishing_linked_id) REFERENCES pagetype_eventlistingfordate_eventlistingpage(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem D77aa48c349cd5338dc984c76e7d576c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_page_anchor_list_pageanchorlistitem
    ADD CONSTRAINT "D77aa48c349cd5338dc984c76e7d576c" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_faq_faqitem D786d6158da069c39cf09da340d60a92; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_faq_faqitem
    ADD CONSTRAINT "D786d6158da069c39cf09da340d60a92" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_quote_quoteitem D7ef186360fe96e1b08de886218a47d5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_quote_quoteitem
    ADD CONSTRAINT "D7ef186360fe96e1b08de886218a47d5" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_press_releases_pressrelease D803cc5befaa490570052c2a56f8221f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressrelease
    ADD CONSTRAINT "D803cc5befaa490570052c2a56f8221f" FOREIGN KEY (category_id) REFERENCES icekit_press_releases_pressreleasecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_contact_person_contactpersonitem D822730140f72bbbe2f0e3909926f74e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_contact_person_contactpersonitem
    ADD CONSTRAINT "D822730140f72bbbe2f0e3909926f74e" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_event_types_simple_simpleevent D8596545111667942aee293a0d92db77; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_event_types_simple_simpleevent
    ADD CONSTRAINT "D8596545111667942aee293a0d92db77" FOREIGN KEY (eventbase_ptr_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_article_article D86847e7d503a3ed2f8909826cab2dd9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article
    ADD CONSTRAINT "D86847e7d503a3ed2f8909826cab2dd9" FOREIGN KEY (parent_id) REFERENCES icekit_articlecategorypage(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_authorlisting D86f9160b13c7534c63861abf2e8b81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authorlisting
    ADD CONSTRAINT "D86f9160b13c7534c63861abf2e8b81c" FOREIGN KEY (hero_image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_iframe_iframeitem D8d9a8e63ac1ffd1fa9ac6a222b60dbb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_iframe_iframeitem
    ADD CONSTRAINT "D8d9a8e63ac1ffd1fa9ac6a222b60dbb" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting D8ed0fad735e246acc9a6293b708725f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_icekit_press_releases_pressreleaselisting
    ADD CONSTRAINT "D8ed0fad735e246acc9a6293b708725f" FOREIGN KEY (publishing_linked_id) REFERENCES pagetype_icekit_press_releases_pressreleaselisting(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_authors_author D935d87cb62baff1d6828660a185d0e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authors_author
    ADD CONSTRAINT "D935d87cb62baff1d6828660a185d0e3" FOREIGN KEY (hero_image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_instagram_embed_instagramembeditem D937a19a60bd0b0baed1463dedfbcb27; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_instagram_embed_instagramembeditem
    ADD CONSTRAINT "D937a19a60bd0b0baed1463dedfbcb27" FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_articlecategorypage D98a797710b0bcf5f7461cb3a4affac5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_articlecategorypage
    ADD CONSTRAINT "D98a797710b0bcf5f7461cb3a4affac5" FOREIGN KEY (publishing_linked_id) REFERENCES icekit_articlecategorypage(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_emailtemplate D98d7433c6eb05786fc8d08aa5a75fc8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_emailtemplate
    ADD CONSTRAINT "D98d7433c6eb05786fc8d08aa5a75fc8" FOREIGN KEY (default_template_id) REFERENCES post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_eventlistingfordate_eventlistingpage D9c962b046f0ba6eeb2ef46d857f397c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_eventlistingfordate_eventlistingpage
    ADD CONSTRAINT "D9c962b046f0ba6eeb2ef46d857f397c" FOREIGN KEY (hero_image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_authorlisting D9cd351b849df75f4b79c1f52c7479cb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authorlisting
    ADD CONSTRAINT "D9cd351b849df75f4b79c1f52c7479cb" FOREIGN KEY (publishing_linked_id) REFERENCES icekit_authorlisting(urlnode_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_followerinformation_followers ad9aeefe8f62305ad510b625b4a24647; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_followers
    ADD CONSTRAINT ad9aeefe8f62305ad510b625b4a24647 FOREIGN KEY (followerinformation_id) REFERENCES notifications_followerinformation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_links_articlelink ae222fc85953e385d3930976d9eceb6a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_articlelink
    ADD CONSTRAINT ae222fc85953e385d3930976d9eceb6a FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_content_type_id_56dd621d4bb2ceeb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_56dd621d4bb2ceeb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_group_id_675cb786042dcc81_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_675cb786042dcc81_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permission_id_136974f69d321e1a_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_136974f69d321e1a_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken__user_id_783969810cbb06ad_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken__user_id_783969810cbb06ad_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_glamkit_sponsors_beginsponsorblockitem b92343dee890b93faaf345230aeb1ee2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_glamkit_sponsors_beginsponsorblockitem
    ADD CONSTRAINT b92343dee890b93faaf345230aeb1ee2 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_plugins_slideshow_slideshow bbecdf560699c622883f58348aa81dc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_slideshow_slideshow
    ADD CONSTRAINT bbecdf560699c622883f58348aa81dc0 FOREIGN KEY (publishing_linked_id) REFERENCES icekit_plugins_slideshow_slideshow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_image_imageitem c84255841509b583eb1cc7169e024e92; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_image_imageitem
    ADD CONSTRAINT c84255841509b583eb1cc7169e024e92 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_oembed_with_caption_item c912bfaff4f66dc380f9e9878f153cba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_oembed_with_caption_item
    ADD CONSTRAINT c912bfaff4f66dc380f9e9878f153cba FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_glamkit_sponsors_endsponsorblockitem cb326495a2d4dc8ec2a5097d8ce90312; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_glamkit_sponsors_endsponsorblockitem
    ADD CONSTRAINT cb326495a2d4dc8ec2a5097d8ce90312 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_map_mapitem cd3b6a9bb21810813fb51e4aabd27ff9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_map_mapitem
    ADD CONSTRAINT cd3b6a9bb21810813fb51e4aabd27ff9 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_event_listing_eventcontentlistingitem cont_content_type_id_420be7ceb820a7fe_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_event_listing_eventcontentlistingitem
    ADD CONSTRAINT cont_content_type_id_420be7ceb820a7fe_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_content_listing_contentlistingitem cont_content_type_id_5ff79bee4f812508_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_content_listing_contentlistingitem
    ADD CONSTRAINT cont_content_type_id_5ff79bee4f812508_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_glamkit_sponsors_sponsorpromoitem cont_sponsor_id_55b915468844330f_fk_glamkit_sponsors_sponsor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_glamkit_sponsors_sponsorpromoitem
    ADD CONSTRAINT cont_sponsor_id_55b915468844330f_fk_glamkit_sponsors_sponsor_id FOREIGN KEY (sponsor_id) REFERENCES glamkit_sponsors_sponsor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_events_links_eventlink contentit_item_id_1d05fc0555af84b_fk_icekit_events_eventbase_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_events_links_eventlink
    ADD CONSTRAINT contentit_item_id_1d05fc0555af84b_fk_icekit_events_eventbase_id FOREIGN KEY (item_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_links_articlelink contentit_item_id_32806f88b8918bf5_fk_icekit_article_article_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_articlelink
    ADD CONSTRAINT contentit_item_id_32806f88b8918bf5_fk_icekit_article_article_id FOREIGN KEY (item_id) REFERENCES icekit_article_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_links_authorlink contentite_item_id_1b86dbe003bfd3e1_fk_icekit_authors_author_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_authorlink
    ADD CONSTRAINT contentite_item_id_1b86dbe003bfd3e1_fk_icekit_authors_author_id FOREIGN KEY (item_id) REFERENCES icekit_authors_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_file_fileitem contentitem_file_fileit_file_id_8b591299a9dc99a_fk_file_file_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_file_fileitem
    ADD CONSTRAINT contentitem_file_fileit_file_id_8b591299a9dc99a_fk_file_file_id FOREIGN KEY (file_id) REFERENCES icekit_plugins_file_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_image_imageitem contentitem_image_im_image_id_daa815c61358322_fk_image_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_image_imageitem
    ADD CONSTRAINT contentitem_image_im_image_id_daa815c61358322_fk_image_image_id FOREIGN KEY (image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_links_pagelink contentitem_item_id_70f77d6da5a193e7_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_links_pagelink
    ADD CONSTRAINT contentitem_item_id_70f77d6da5a193e7_fk_fluent_pages_urlnode_id FOREIGN KEY (item_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_reusable_form_formitem contentitem_reusable__form_id_7cb1916469e11377_fk_forms_form_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_reusable_form_formitem
    ADD CONSTRAINT contentitem_reusable__form_id_7cb1916469e11377_fk_forms_form_id FOREIGN KEY (form_id) REFERENCES forms_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_slideshow_slideshowitem d3f6c24843c70bad96a77c6937ba4b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_slideshow_slideshowitem
    ADD CONSTRAINT d3f6c24843c70bad96a77c6937ba4b11 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_icekit_plugins_reusable_form_formitem dbaf6222e4d6514d018137763a25d717; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_icekit_plugins_reusable_form_formitem
    ADD CONSTRAINT dbaf6222e4d6514d018137763a25d717 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventbase dbd37065917a6b074db569d61e8bf8b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase
    ADD CONSTRAINT dbd37065917a6b074db569d61e8bf8b3 FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_periodictask dj_interval_id_374a1d72313bb6b7_fk_djcelery_intervalschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT dj_interval_id_374a1d72313bb6b7_fk_djcelery_intervalschedule_id FOREIGN KEY (interval_id) REFERENCES djcelery_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log djan_content_type_id_7f0654282cc5467c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_7f0654282cc5467c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_adm_user_id_281cdab7806858db_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_adm_user_id_281cdab7806858db_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect django_redirect_site_id_314c5075536c9af2_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_314c5075536c9af2_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_periodictask djce_crontab_id_2e1aff8184603670_fk_djcelery_crontabschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djce_crontab_id_2e1aff8184603670_fk_djcelery_crontabschedule_id FOREIGN KEY (crontab_id) REFERENCES djcelery_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_taskstate djcelery__worker_id_1244b53167013223_fk_djcelery_workerstate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery__worker_id_1244b53167013223_fk_djcelery_workerstate_id FOREIGN KEY (worker_id) REFERENCES djcelery_workerstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djkombu_message djkombu_message_queue_id_7c589a2294799a3f_fk_djkombu_queue_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY djkombu_message
    ADD CONSTRAINT djkombu_message_queue_id_7c589a2294799a3f_fk_djkombu_queue_id FOREIGN KEY (queue_id) REFERENCES djkombu_queue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_authors_author e340fc670eddeda2e038c19902246721; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authors_author
    ADD CONSTRAINT e340fc670eddeda2e038c19902246721 FOREIGN KEY (publishing_linked_id) REFERENCES icekit_authors_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_text_textitem e55b7cc0ad21db7e0f262fec8fac9860; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_text_textitem
    ADD CONSTRAINT e55b7cc0ad21db7e0f262fec8fac9860 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polymorphic_auth_user e62894ecb410a85d6e21e17955a42f9b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user
    ADD CONSTRAINT e62894ecb410a85d6e21e17955a42f9b FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnaildimensions e_thumbnail_id_125896d799b675ee_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT e_thumbnail_id_125896d799b675ee_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnail easy_th_source_id_242f35c54903cbdb_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_th_source_id_242f35c54903cbdb_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_rawhtml_rawhtmlitem eba92ae363ac8559f2a3a69e5a62363b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_rawhtml_rawhtmlitem
    ADD CONSTRAINT eba92ae363ac8559f2a3a69e5a62363b FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventbase ed5fb03d8ca5ad021a97396ba1e4bba4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase
    ADD CONSTRAINT ed5fb03d8ca5ad021a97396ba1e4bba4 FOREIGN KEY (publishing_linked_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ik_todays_occurrences_types f323bb4fb5f8d388c79905ba5dd89601; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_todays_occurrences_types
    ADD CONSTRAINT f323bb4fb5f8d388c79905ba5dd89601 FOREIGN KEY (todaysoccurrences_id) REFERENCES contentitem_ik_events_todays_occurrences_todaysoccurrences(contentitem_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_oembeditem_oembeditem f4b6566137b85befd91e711a65d71ffc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_oembeditem_oembeditem
    ADD CONSTRAINT f4b6566137b85befd91e711a65d71ffc FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_sharedcontent_sharedcontentitem f713efff26a3d21a23c9712cbb933ead; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT f713efff26a3d21a23c9712cbb933ead FOREIGN KEY (shared_content_id) REFERENCES sharedcontent_sharedcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_ik_event_listing_eventcontentlistingitem f80c836e0f043510d8283f084c8e98e9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contentitem_ik_event_listing_eventcontentlistingitem
    ADD CONSTRAINT f80c836e0f043510d8283f084c8e98e9 FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_contentitem f8b9c8cb83d6522ded5c442cafccc74b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT f8b9c8cb83d6522ded5c442cafccc74b FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_plugins_file_file_categories fi_mediacategory_id_121fbe0a900478cf_fk_icekit_mediacategory_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_file_file_categories
    ADD CONSTRAINT fi_mediacategory_id_121fbe0a900478cf_fk_icekit_mediacategory_id FOREIGN KEY (mediacategory_id) REFERENCES icekit_mediacategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_plugins_file_file_categories file_file_categories_file_id_3e6d7f79e8322b38_fk_file_file_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_file_file_categories
    ADD CONSTRAINT file_file_categories_file_id_3e6d7f79e8322b38_fk_file_file_id FOREIGN KEY (file_id) REFERENCES icekit_plugins_file_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_placeholder fluen_parent_type_id_150904600ec40eb6_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_placeholder
    ADD CONSTRAINT fluen_parent_type_id_150904600ec40eb6_fk_django_content_type_id FOREIGN KEY (parent_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_contentitem fluen_parent_type_id_76e81df03239ebed_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT fluen_parent_type_id_76e81df03239ebed_fk_django_content_type_id FOREIGN KEY (parent_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_pages_urlnode fluent_p_author_id_4075e40696b53b3a_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode
    ADD CONSTRAINT fluent_p_author_id_4075e40696b53b3a_fk_polymorphic_auth_user_id FOREIGN KEY (author_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_pages_urlnode_translation fluent_pa_master_id_1d96eaa0f533ab09_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode_translation
    ADD CONSTRAINT fluent_pa_master_id_1d96eaa0f533ab09_fk_fluent_pages_urlnode_id FOREIGN KEY (master_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_pages_urlnode fluent_pa_parent_id_66f56280609f1e6d_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode
    ADD CONSTRAINT fluent_pa_parent_id_66f56280609f1e6d_fk_fluent_pages_urlnode_id FOREIGN KEY (parent_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_pages_htmlpage_translation fluent_pag_master_id_ed0683b18c4a899_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_htmlpage_translation
    ADD CONSTRAINT fluent_pag_master_id_ed0683b18c4a899_fk_fluent_pages_urlnode_id FOREIGN KEY (master_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_pages_urlnode fluent_pages_u_parent_site_id_ccdd64a9d79d634_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fluent_pages_urlnode
    ADD CONSTRAINT fluent_pages_u_parent_site_id_ccdd64a9d79d634_fk_django_site_id FOREIGN KEY (parent_site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_field forms_field_form_id_7a80d5dc2c03fca9_fk_forms_form_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_form_id_7a80d5dc2c03fca9_fk_forms_form_id FOREIGN KEY (form_id) REFERENCES forms_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_fieldentry forms_fieldentry_entry_id_89665bccf1f39bb_fk_forms_formentry_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_entry_id_89665bccf1f39bb_fk_forms_formentry_id FOREIGN KEY (entry_id) REFERENCES forms_formentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_form_sites forms_form_sites_form_id_5706bf062b453a37_fk_forms_form_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form_sites
    ADD CONSTRAINT forms_form_sites_form_id_5706bf062b453a37_fk_forms_form_id FOREIGN KEY (form_id) REFERENCES forms_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_form_sites forms_form_sites_site_id_16f1247da4544832_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_form_sites
    ADD CONSTRAINT forms_form_sites_site_id_16f1247da4544832_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_formentry forms_formentry_form_id_208dbc8c53a1a60f_fk_forms_form_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formentry_form_id_208dbc8c53a1a60f_fk_forms_form_id FOREIGN KEY (form_id) REFERENCES forms_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: glamkit_collections_geographiclocation g_country_id_1d278259c19fb881_fk_glamkit_collections_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_collections_geographiclocation
    ADD CONSTRAINT g_country_id_1d278259c19fb881_fk_glamkit_collections_country_id FOREIGN KEY (country_id) REFERENCES glamkit_collections_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: glamkit_sponsors_sponsor glamk_logo_id_3062a649a5789591_fk_icekit_plugins_image_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glamkit_sponsors_sponsor
    ADD CONSTRAINT glamk_logo_id_3062a649a5789591_fk_icekit_plugins_image_image_id FOREIGN KEY (logo_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventbase i_derived_from_id_e1ab71192467542_fk_icekit_events_eventbase_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase
    ADD CONSTRAINT i_derived_from_id_e1ab71192467542_fk_icekit_events_eventbase_id FOREIGN KEY (derived_from_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_workflow_workflowstate ice_assigned_to_id_3f2730764dfac510_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_workflow_workflowstate
    ADD CONSTRAINT ice_assigned_to_id_3f2730764dfac510_fk_polymorphic_auth_user_id FOREIGN KEY (assigned_to_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventbase_secondary_types ice_eventbase_id_53c6c1d88c45d653_fk_icekit_events_eventbase_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase_secondary_types
    ADD CONSTRAINT ice_eventbase_id_53c6c1d88c45d653_fk_icekit_events_eventbase_id FOREIGN KEY (eventbase_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventbase_secondary_types ice_eventtype_id_4e0f8d9c7eab2980_fk_icekit_events_eventtype_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase_secondary_types
    ADD CONSTRAINT ice_eventtype_id_4e0f8d9c7eab2980_fk_icekit_events_eventtype_id FOREIGN KEY (eventtype_id) REFERENCES icekit_events_eventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_layout_content_types iceki_contenttype_id_6b4c09f7748338f3_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout_content_types
    ADD CONSTRAINT iceki_contenttype_id_6b4c09f7748338f3_fk_django_content_type_id FOREIGN KEY (contenttype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventbase iceki_part_of_id_45e4db418617351a_fk_icekit_events_eventbase_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase
    ADD CONSTRAINT iceki_part_of_id_45e4db418617351a_fk_icekit_events_eventbase_id FOREIGN KEY (part_of_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_occurrence icekit__event_id_70d89cd7f9204c92_fk_icekit_events_eventbase_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_occurrence
    ADD CONSTRAINT icekit__event_id_70d89cd7f9204c92_fk_icekit_events_eventbase_id FOREIGN KEY (event_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventrepeatsgenerator icekit__event_id_7bb752c0b7148e71_fk_icekit_events_eventbase_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventrepeatsgenerator
    ADD CONSTRAINT icekit__event_id_7bb752c0b7148e71_fk_icekit_events_eventbase_id FOREIGN KEY (event_id) REFERENCES icekit_events_eventbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_article_article icekit_article_a_layout_id_6406c734351df0a1_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_article_article
    ADD CONSTRAINT icekit_article_a_layout_id_6406c734351df0a1_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_event_types_simple_simpleevent icekit_event_typ_layout_id_59ab2359bf8cfd7b_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_event_types_simple_simpleevent
    ADD CONSTRAINT icekit_event_typ_layout_id_59ab2359bf8cfd7b_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_layout_content_types icekit_layout_co_layout_id_2af213bf74cb164d_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layout_content_types
    ADD CONSTRAINT icekit_layout_co_layout_id_2af213bf74cb164d_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_press_releases_pressrelease icekit_press_rel_layout_id_794bcbd92ae0c645_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_press_releases_pressrelease
    ADD CONSTRAINT icekit_press_rel_layout_id_794bcbd92ae0c645_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ik_todays_occurrences_types ik__eventtype_id_16d0ed76174db2d2_fk_icekit_events_eventtype_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_todays_occurrences_types
    ADD CONSTRAINT ik__eventtype_id_16d0ed76174db2d2_fk_icekit_events_eventtype_id FOREIGN KEY (eventtype_id) REFERENCES icekit_events_eventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ik_event_listing_types ik__eventtype_id_79c3df432f1049c7_fk_icekit_events_eventtype_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ik_event_listing_types
    ADD CONSTRAINT ik__eventtype_id_79c3df432f1049c7_fk_icekit_events_eventtype_id FOREIGN KEY (eventtype_id) REFERENCES icekit_events_eventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_plugins_image_image_categories im_mediacategory_id_12251a0522701955_fk_icekit_mediacategory_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_image_categories
    ADD CONSTRAINT im_mediacategory_id_12251a0522701955_fk_icekit_mediacategory_id FOREIGN KEY (mediacategory_id) REFERENCES icekit_mediacategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_plugins_image_image_categories image_image_categori_image_id_f7eb96a2dd57c40_fk_image_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_plugins_image_image_categories
    ADD CONSTRAINT image_image_categori_image_id_f7eb96a2dd57c40_fk_image_image_id FOREIGN KEY (image_id) REFERENCES icekit_plugins_image_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_boolean mo_setting_ptr_id_301011d4e8c87486_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_boolean
    ADD CONSTRAINT mo_setting_ptr_id_301011d4e8c87486_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_text mo_setting_ptr_id_42988f3f19ee2d72_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_text
    ADD CONSTRAINT mo_setting_ptr_id_42988f3f19ee2d72_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_file mo_setting_ptr_id_4493b8bc5cdf5ce1_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_file
    ADD CONSTRAINT mo_setting_ptr_id_4493b8bc5cdf5ce1_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_float mo_setting_ptr_id_469a08c6e3e0a4e2_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_float
    ADD CONSTRAINT mo_setting_ptr_id_469a08c6e3e0a4e2_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_time mo_setting_ptr_id_58e2a147556faee4_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_time
    ADD CONSTRAINT mo_setting_ptr_id_58e2a147556faee4_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_integer mo_setting_ptr_id_5bae42069a47ac94_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_integer
    ADD CONSTRAINT mo_setting_ptr_id_5bae42069a47ac94_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_decimal mo_setting_ptr_id_5c05e9d479b0c0f5_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_decimal
    ADD CONSTRAINT mo_setting_ptr_id_5c05e9d479b0c0f5_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_datetime mo_setting_ptr_id_5f786ebc0544156c_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_datetime
    ADD CONSTRAINT mo_setting_ptr_id_5f786ebc0544156c_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_date mo_setting_ptr_id_63fb5af294789599_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_date
    ADD CONSTRAINT mo_setting_ptr_id_63fb5af294789599_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_settings_image mo_setting_ptr_id_7c37dbba00f1d7af_fk_model_settings_setting_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_settings_image
    ADD CONSTRAINT mo_setting_ptr_id_7c37dbba00f1d7af_fk_model_settings_setting_id FOREIGN KEY (setting_ptr_id) REFERENCES model_settings_setting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_hasreadmessage no_message_id_46887f43c0f926b8_fk_notifications_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_hasreadmessage
    ADD CONSTRAINT no_message_id_46887f43c0f926b8_fk_notifications_notification_id FOREIGN KEY (message_id) REFERENCES notifications_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_followerinformation noti_content_type_id_6aad53f79cf7dd9e_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation
    ADD CONSTRAINT noti_content_type_id_6aad53f79cf7dd9e_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_hasreadmessage notifica_person_id_55a4785bd76f25c3_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_hasreadmessage
    ADD CONSTRAINT notifica_person_id_55a4785bd76f25c3_fk_polymorphic_auth_user_id FOREIGN KEY (person_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notificationsetting notificati_user_id_1f69a5d0f700a62e_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_notificationsetting
    ADD CONSTRAINT notificati_user_id_1f69a5d0f700a62e_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_followerinformation_followers notificati_user_id_2e7cea7addf4dab5_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_followers
    ADD CONSTRAINT notificati_user_id_2e7cea7addf4dab5_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notificati_user_id_7389c3d8eda46955_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_notification
    ADD CONSTRAINT notificati_user_id_7389c3d8eda46955_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_followerinformation_group_followers notifications_followe_group_id_d7351b183b03aa8_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_followerinformation_group_followers
    ADD CONSTRAINT notifications_followe_group_id_d7351b183b03aa8_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting page_urlnode_ptr_id_10765344254adf70_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_icekit_press_releases_pressreleaselisting
    ADD CONSTRAINT page_urlnode_ptr_id_10765344254adf70_fk_fluent_pages_urlnode_id FOREIGN KEY (urlnode_ptr_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_articlecategorypage page_urlnode_ptr_id_24c6369470af664a_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_articlecategorypage
    ADD CONSTRAINT page_urlnode_ptr_id_24c6369470af664a_fk_fluent_pages_urlnode_id FOREIGN KEY (urlnode_ptr_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_eventlistingfordate_eventlistingpage page_urlnode_ptr_id_5f876e2563aae9e1_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_eventlistingfordate_eventlistingpage
    ADD CONSTRAINT page_urlnode_ptr_id_5f876e2563aae9e1_fk_fluent_pages_urlnode_id FOREIGN KEY (urlnode_ptr_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_searchpage page_urlnode_ptr_id_6f45acce18306208_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_searchpage
    ADD CONSTRAINT page_urlnode_ptr_id_6f45acce18306208_fk_fluent_pages_urlnode_id FOREIGN KEY (urlnode_ptr_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_authorlisting page_urlnode_ptr_id_7c67ae4acb3d4a9e_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authorlisting
    ADD CONSTRAINT page_urlnode_ptr_id_7c67ae4acb3d4a9e_fk_fluent_pages_urlnode_id FOREIGN KEY (urlnode_ptr_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_layoutpage paget_urlnode_ptr_id_4534df525cf07b0_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layoutpage
    ADD CONSTRAINT paget_urlnode_ptr_id_4534df525cf07b0_fk_fluent_pages_urlnode_id FOREIGN KEY (urlnode_ptr_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_redirectnode_redirectnode paget_urlnode_ptr_id_87aaa2dea37e372_fk_fluent_pages_urlnode_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_redirectnode_redirectnode
    ADD CONSTRAINT paget_urlnode_ptr_id_87aaa2dea37e372_fk_fluent_pages_urlnode_id FOREIGN KEY (urlnode_ptr_id) REFERENCES fluent_pages_urlnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_eventlistingfordate_eventlistingpage pagetype_eventli_layout_id_1f5f61b01521b62c_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_eventlistingfordate_eventlistingpage
    ADD CONSTRAINT pagetype_eventli_layout_id_1f5f61b01521b62c_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_authorlisting pagetype_icekit__layout_id_47b8173be5cc80cb_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_authorlisting
    ADD CONSTRAINT pagetype_icekit__layout_id_47b8173be5cc80cb_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetype_icekit_press_releases_pressreleaselisting pagetype_icekit__layout_id_4dfb4f07b3066bc3_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetype_icekit_press_releases_pressreleaselisting
    ADD CONSTRAINT pagetype_icekit__layout_id_4dfb4f07b3066bc3_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_articlecategorypage pagetype_icekit__layout_id_69a40027958b80f7_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_articlecategorypage
    ADD CONSTRAINT pagetype_icekit__layout_id_69a40027958b80f7_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_layoutpage pagetype_layout_p_layout_id_4e89c4eb0ceae5d_fk_icekit_layout_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_layoutpage
    ADD CONSTRAINT pagetype_layout_p_layout_id_4e89c4eb0ceae5d_fk_icekit_layout_id FOREIGN KEY (layout_id) REFERENCES icekit_layout(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polymorphic_auth_email_emailuser polymo_user_ptr_id_6d2b36abb40aab2a_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_email_emailuser
    ADD CONSTRAINT polymo_user_ptr_id_6d2b36abb40aab2a_fk_polymorphic_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polymorphic_auth_user_user_permissions polymorphi_permission_id_5f17bf06c808ae73_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_user_permissions
    ADD CONSTRAINT polymorphi_permission_id_5f17bf06c808ae73_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polymorphic_auth_user_groups polymorphi_user_id_2e96b7638eb634c9_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_groups
    ADD CONSTRAINT polymorphi_user_id_2e96b7638eb634c9_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polymorphic_auth_user_user_permissions polymorphi_user_id_528cca19d477ff0b_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_user_permissions
    ADD CONSTRAINT polymorphi_user_id_528cca19d477ff0b_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polymorphic_auth_user_groups polymorphic_auth_use_group_id_2322afebda8f1ad0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polymorphic_auth_user_groups
    ADD CONSTRAINT polymorphic_auth_use_group_id_2322afebda8f1ad0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails pos_attachment_id_766886e35eb6f71b_fk_post_office_attachment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_attachment_emails
    ADD CONSTRAINT pos_attachment_id_766886e35eb6f71b_fk_post_office_attachment_id FOREIGN KEY (attachment_id) REFERENCES post_office_attachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_email pos_template_id_68973faf0f0d271_fk_post_office_emailtemplate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_email
    ADD CONSTRAINT pos_template_id_68973faf0f0d271_fk_post_office_emailtemplate_id FOREIGN KEY (template_id) REFERENCES post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails post_office_a_email_id_314f6d9401d0f483_fk_post_office_email_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_attachment_emails
    ADD CONSTRAINT post_office_a_email_id_314f6d9401d0f483_fk_post_office_email_id FOREIGN KEY (email_id) REFERENCES post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_log post_office_l_email_id_6f38a767f202e324_fk_post_office_email_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_office_log
    ADD CONSTRAINT post_office_l_email_id_6f38a767f202e324_fk_post_office_email_id FOREIGN KEY (email_id) REFERENCES post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_events_eventbase primary_type_id_7719833e6f1e7df3_fk_icekit_events_eventtype_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_events_eventbase
    ADD CONSTRAINT primary_type_id_7719833e6f1e7df3_fk_icekit_events_eventtype_id FOREIGN KEY (primary_type_id) REFERENCES icekit_events_eventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version reve_content_type_id_2262b92c7b2191c7_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reve_content_type_id_2262b92c7b2191c7_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision reversion__user_id_53245c798a4eefa8_fk_polymorphic_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion__user_id_53245c798a4eefa8_fk_polymorphic_auth_user_id FOREIGN KEY (user_id) REFERENCES polymorphic_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version reversion_revision_id_12249487c7b4652e_fk_reversion_revision_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_revision_id_12249487c7b4652e_fk_reversion_revision_id FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sharedcontent_sharedcontent_translation sh_master_id_39c9a0acb0e365d2_fk_sharedcontent_sharedcontent_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sh_master_id_39c9a0acb0e365d2_fk_sharedcontent_sharedcontent_id FOREIGN KEY (master_id) REFERENCES sharedcontent_sharedcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sharedcontent_sharedcontent sharedcontent_parent_site_id_34af03fe6699122d_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_parent_site_id_34af03fe6699122d_fk_django_site_id FOREIGN KEY (parent_site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: icekit_workflow_workflowstate work_content_type_id_4c1fa8cb349de910_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icekit_workflow_workflowstate
    ADD CONSTRAINT work_content_type_id_4c1fa8cb349de910_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

