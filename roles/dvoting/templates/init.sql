-- Create database 'casbin' if not exists
-- https://stackoverflow.com/a/36591842
SELECT 'CREATE DATABASE casbin'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'casbin')\gexec

-- Connect to the casbin DB
\c casbin

CREATE TABLE IF NOT EXISTS casbin_rule (
   id varchar(256) default ''::character varying not null,
   ptype varchar(256) default ''::character varying not null,
   v0     varchar(256) default ''::character varying not null,
   V1     varchar(256) default ''::character varying not null,
   v2     varchar(256) default ''::character varying not null,
   v3     varchar(256) default ''::character varying not null,
   v4     varchar(256) default ''::character varying not null,
   v5     varchar(256) default ''::character varying not null
);

alter table casbin_rule
    owner to dvoting;

create index idx_casbin_rule_id
    on casbin_rule(id);

create index idx_casbin_rule_p_type
    on casbin_rule(ptype);

create index idx_casbin_rule_v0
    on casbin_rule(v0);

create index idx_casbin_rule_v1
    on casbin_rule(v1);

create index idx_casbin_rule_v2
    on casbin_rule(v2);

create index idx_casbin_rule_v3
    on casbin_rule(v3);

create index idx_casbin_rule_v4
    on casbin_rule(v4);

create index idx_casbin_rule_v5
    on casbin_rule(v5);

{% for sciper in dvoting.admin_scipers %}
INSERT INTO casbin_rule(ptype, v0, v1, v2, v3, v4, v5) VALUES ('p', '{{ sciper }}', 'roles', 'list', '', '', '');
INSERT INTO casbin_rule(ptype, v0, v1, v2, v3, v4, v5) VALUES ('p', '{{ sciper }}', 'roles', 'remove', '', '', '');
INSERT INTO casbin_rule(ptype, v0, v1, v2, v3, v4, v5) VALUES ('p', '{{ sciper }}', 'roles', 'add', '', '', '');
INSERT INTO casbin_rule(ptype, v0, v1, v2, v3, v4, v5) VALUES ('p', '{{ sciper }}', 'proxies', 'post', '', '', '');
INSERT INTO casbin_rule(ptype, v0, v1, v2, v3, v4, v5) VALUES ('p', '{{ sciper }}', 'proxies', 'put', '', '', '');
INSERT INTO casbin_rule(ptype, v0, v1, v2, v3, v4, v5) VALUES ('p', '{{ sciper }}', 'proxies', 'delete', '', '', '');
INSERT INTO casbin_rule(ptype, v0, v1, v2, v3, v4, v5) VALUES ('p', '{{ sciper }}', 'election', 'create', '', '', '');
{% endfor %}
