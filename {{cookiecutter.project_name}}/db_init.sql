REVOKE ALL PRIVILEGES ON DATABASE {{ cookiecutter.project_slug }}_test FROM {{ cookiecutter.project_slug }}_user;
DROP DATABASE IF EXISTS {{ cookiecutter.project_slug }}_test;
REVOKE ALL PRIVILEGES ON DATABASE {{ cookiecutter.project_slug }}_dev FROM {{ cookiecutter.project_slug }}_user;
DROP DATABASE IF EXISTS {{ cookiecutter.project_slug }}_dev;
DROP ROLE IF EXISTS {{ cookiecutter.project_slug }}_user;
CREATE ROLE {{ cookiecutter.project_slug }}_user WITH LOGIN ENCRYPTED PASSWORD '{{ cookiecutter.project_slug }}_password';
ALTER ROLE {{ cookiecutter.project_slug }}_user CREATEDB;
CREATE DATABASE {{ cookiecutter.project_slug }}_test;
GRANT ALL PRIVILEGES ON DATABASE {{ cookiecutter.project_slug }}_test TO {{ cookiecutter.project_slug }}_user;
CREATE DATABASE {{ cookiecutter.project_slug }}_dev;
GRANT ALL PRIVILEGES ON DATABASE {{ cookiecutter.project_slug }}_dev TO {{ cookiecutter.project_slug }}_user;
SET TIME ZONE 'UTC';
COMMIT;
\connect {{ cookiecutter.project_slug }}_test;
CREATE EXTENSION IF NOT EXISTS tablefunc;
\connect {{ cookiecutter.project_slug }}_dev;
CREATE EXTENSION IF NOT EXISTS tablefunc;
