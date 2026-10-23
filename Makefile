VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
BLACK := $(VENV)/bin/black
PYLINT := $(VENV)/bin/pylint
PYTEST := $(VENV)/bin/pytest

install:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

lint:
	$(PYLINT) AIQandA EduLYQ --load-plugins=pylint_django --django-settings-module=EduLYQ.settings

test:
	PYTHONPATH=. $(PYTEST) AIQandA -v --tb=short

format:
	$(BLACK) AIQandA EduLYQ