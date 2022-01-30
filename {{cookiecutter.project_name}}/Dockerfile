FROM mlupin/docker-lambda:python3.9-build

# Install your dependencies
{%- if cookiecutter.use_postgresql == 'y' %}
RUN yum -y install postgresql-devel postgresql-libs python-psycopg2
{%- endif %}
