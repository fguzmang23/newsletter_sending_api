CREATE TABLE IF NOT EXISTS public.news_letter (
    id integer GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY(id),
    name character varying(100),
    created_at timestamp,
    updated_at timestamp,
    first_sent timestamp,
    last_sent timestamp,
    times_sent timestamp
);

CREATE TABLE IF NOT EXISTS public.recipients (
    id integer GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY(id),
    email_address character varying(100),
    created_at timestamp,
    updated_at timestamp
);

CREATE TABLE IF NOT EXISTS public.news_letter_recipients(
     id integer GENERATED BY DEFAULT AS IDENTITY,
     PRIMARY KEY(id),
     recipient_id integer,
     news_letter_id integer,
     CONSTRAINT news_letter_recipient_pk1
        FOREIGN KEY(recipient_id)
            REFERENCES public.recipients(id),
    CONSTRAINT news_letter_recipient_pk2
        FOREIGN KEY(news_letter_id)
            REFERENCES public.news_letter(id),
    CONSTRAINT nws_ltr_no_duplicates UNIQUE(recipient_id, news_letter_id)
);

