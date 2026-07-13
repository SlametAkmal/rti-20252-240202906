#!/bin/bash

echo "==================================="

echo " PostgreSQL CRUD Benchmark"

echo "==================================="

echo "Running CREATE Benchmark..."

psql -U postgres ecommerce < benchmark.sql

echo "Running READ Benchmark..."

psql -U postgres ecommerce < benchmark.sql

echo "Running UPDATE Benchmark..."

psql -U postgres ecommerce < benchmark.sql

echo "Running DELETE Benchmark..."

psql -U postgres ecommerce < benchmark.sql

echo "==================================="

echo "Benchmark Finished"

echo "==================================="