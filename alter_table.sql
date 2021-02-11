DROP TABLE IF EXISTS links;

CREATE TABLE links (
	link_id SERIAL PRIMARY KEY,
	title VARCHAR (512) NOT NULL,
	url VARCHAR (1024) NOT NULL
);

ALTER TABLE links
ADD COLUMN active BOOLEAN;

ALTER TABLE links
DROP COLUMN active;

ALTER TABLE links
RENAME COLUMN title TO link_title;

ALTER TABLE links
ADD COLUMN target VARCHAR(10);

ALTER TABLE links
ALTER COLUMN target SET DEFAULT '_blank';

ALTER TABLE links
ADD CHECK (target IN ('_self', '_blank', '_parent', '_top'));

ALTER TABLE links
ADD CONSTRAINT unique_url UNIQUE (url);

INSERT INTO links (link_title, url, target) VALUES ('Google', 'https://google.com', '_self');

SELECT * FROM links;

ALTER TABLE links RENAME TO urls;

SELECT * FROM urls;