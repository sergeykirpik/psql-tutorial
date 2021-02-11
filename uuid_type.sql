--UUID 128-bit 40e6215d-b5c6-4896-987c-f30f3678f608 (32 digits) uuid-ossp module

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--MAC address + current timestamp + random value
SELECT uuid_generate_v1();

-- only random numbers
SELECT uuid_generate_v4();

DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
	contact_id UUID DEFAULT uuid_generate_v4(),
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	email VARCHAR NOT NULL,
	phone VARCHAR,
	PRIMARY KEY (contact_id)
);

INSERT INTO contacts (
    first_name,
    last_name,
    email,
    phone
)
VALUES
    (
        'John',
        'Smith',
        'john.smith@example.com',
        '408-237-2345'
    ),
    (
        'Jane',
        'Smith',
        'jane.smith@example.com',
        '408-237-2344'
    ),
    (
        'Alex',
        'Smith',
        'alex.smith@example.com',
        '408-237-2343'
    )
RETURNING *;

