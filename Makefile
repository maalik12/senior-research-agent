.PHONY: help setup start stop test lint clean

help:
@echo "Senior Research Agent - Development Commands"
@echo "  setup    - Initialize development environment"
@echo "  start    - Start all services"
@echo "  stop     - Stop all services"
@echo "  test     - Run all tests"
@echo "  lint     - Run linters"
@echo "  clean    - Clean up containers and volumes"

setup:
./scripts/setup.sh

start:
docker-compose up -d

stop:
docker-compose down

test:
cd ../senior-research-agent && pytest
cd ../sra-research-tools && pytest
cd ../sra-knowledge-base && pytest
cd ../sra-evaluation && pytest

lint:
cd ../senior-research-agent && black src/ && ruff check src/
cd ../sra-research-tools && black src/ && ruff check src/

clean:
docker-compose down -v
docker system prune -f
