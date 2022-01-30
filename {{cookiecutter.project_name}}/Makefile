.PHONY: clean clean-test clean-pyc clean-build docs help
.DEFAULT_GOAL := help
define BROWSER_PYSCRIPT
import os, webbrowser, sys
try:
	from urllib import pathname2url
except:
	from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT
BROWSER := python -c "$$BROWSER_PYSCRIPT"

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)


format: ## auto format all code
	isort {{ cookiecutter.project_slug }} tests
	black {{ cookiecutter.project_slug }} tests
	#yamlfmt -w config/*.yaml

isort: ## check imports with isort
	isort -c {{ cookiecutter.project_slug }} tests

black: ## check formatting with black
	black --check {{ cookiecutter.project_slug }} tests

lint: ## check style with flake8
	flake8 {{ cookiecutter.project_slug }} tests

clean: clean-build clean-pyc clean-test ## remove all build, test, coverage and Python artifacts

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +


test-security:
	bandit -r . -x ./tests

test: ## run tests quickly with the default Python
	py.test --cov={{ cookiecutter.project_slug }} --cov-fail-under=100 --cov-branch --cov-report term-missing

test-ipdb: ## run tests and open ipdb on failure
	py.test --cov={{ cookiecutter.project_slug }} --cov-fail-under=100 --cov-branch --cov-report term-missing --pdb --pdbcls=IPython.terminal.debugger:Pdb

test-all: isort black lint test-security test


install: clean ## install the package to the active Python's site-packages
	pip install . --upgrade

install-dev: clean
	pip install -e '.[testing]' --upgrade

publish:
	python -m build
	twine check dist/*
	twine upload dist/*
