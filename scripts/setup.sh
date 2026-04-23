#!/bin/bash
set -e

echo "Setting up Senior Research Agent development environment..."

command -v docker >/dev/null 2>&1 || { echo "Docker required"; exit 1; }
command -v docker-compose >/dev/null 2>&1 || { echo "Docker Compose required"; exit 1; }

if [ ! -f .env ]; then
    cp .env.example .env
    echo "Please edit .env with your API keys"
fi

echo "Starting infrastructure services..."
docker-compose up -d chroma neo4j redis

echo "Waiting for services to be ready..."
sleep 10

echo "Setup complete!"
echo "Services:"
echo "  - ChromaDB: http://localhost:8000"
echo "  - Neo4j: http://localhost:7474"
echo "  - Redis: localhost:6379"
