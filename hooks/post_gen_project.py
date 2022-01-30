#!/usr/bin/env python
import os

PROJECT_DIRECTORY = os.getcwd()


def remove_file(filepath):
    os.remove(os.path.join(PROJECT_DIRECTORY, filepath))


if __name__ == '__main__':
    if 'Not open source' == '{{ cookiecutter.open_source_license }}':
        remove_file('LICENSE')

    if 'n' == '{{ cookiecutter.use_postgresql }}':
        remove_file('Dockerfile')
        remove_file('db_init.sql')
    else:
        print("NOTICE: use_postgres was enabled this requires Docker.io.")
