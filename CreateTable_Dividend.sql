CREATE TABLE dividend (
company character varying(60),
fiscal_year integer
);

INSERT INTO dividend(company, fiscal_year)
SELECT company, fiscal_year
FROM raw_data;