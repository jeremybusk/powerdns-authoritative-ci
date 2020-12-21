INSERT INTO domains (name, type) values ('example.com', 'NATIVE');
-- INSERT INTO domains (id, name, type) VALUES (1, 'example.com', 'NATIVE');
INSERT INTO records (domain_id, name, content, type,ttl,prio)
VALUES (1,'example.com','localhost admin.example.com 1 10380 3600 604800 3600','SOA',86400,NULL);
INSERT INTO records (domain_id, name, content, type,ttl,prio)
VALUES (1,'example.com','dns-us1.powerdns.net','NS',86400,NULL);
INSERT INTO records (domain_id, name, content, type,ttl,prio)
VALUES (1,'example.com','dns-eu1.powerdns.net','NS',86400,NULL);
INSERT INTO records (domain_id, name, content, type,ttl,prio)
VALUES (1,'www.example.com','192.0.2.10','A',120,NULL);
INSERT INTO records (domain_id, name, content, type,ttl,prio)
VALUES (1,'mail.example.com','192.0.2.12','A',120,NULL);
INSERT INTO records (domain_id, name, content, type,ttl,prio)
VALUES (1,'localhost.example.com','127.0.0.1','A',120,NULL);
INSERT INTO records (domain_id, name, content, type,ttl,prio)
VALUES (1,'example.com','mail.example.com','MX',120,25);


-- Enable Lua records for the zone (if not enabled globally)
INSERT INTO domainmetadata (domain_id, kind, content)
VALUES (1, 'ENABLE-LUA-RECORDS', 1);

-- Create a pickClosest() Lua A record.
-- Double single quotes are used to escape single quotes in both MySQL and PostgreSQL
INSERT INTO records (domain_id, name, type, content, ttl)
VALUES (
          1,
          'pickclosest.example.com',
          'LUA',
          'A "pickclosest({''192.0.2.1'',''192.0.2.2'',''198.51.100.1''})"',
          600
);


INSERT INTO records (domain_id, name, type, content, ttl)
VALUES (
          1,
          'ifurlup.example.com',
          'LUA',
        'A "ifurlup(''https://www.uvoo.io/'', {''192.168.1.1'', ''192.168.1.2''})"',
        600
);

INSERT INTO records (domain_id, name, type, content, ttl)
VALUES (
          1,
          'ifportup.example.com',
          'LUA',
        'A "ifportup(''443'', {''10.64.7.62'', ''172.217.164.4''})"',
        -- 'A "ifportup(''443'', {''10.64.7.62'', ''10.64.7.63''})"',
        600
);
