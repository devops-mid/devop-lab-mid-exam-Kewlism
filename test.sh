#!/bin/bash

echo "Activating virtual environment..."
source venv/bin/activate || { echo "Failed to activate virtual environment. Ensure venv exists."; exit 1; }

echo "Running unit tests..."
pytest tests/unit --disable-warnings || { echo "Unit tests failed!"; exit 1; }

echo "Running integration tests..."
pytest tests/integration --disable-warnings || { echo "Integration tests failed!"; exit 1; }

echo "All tests completed successfully."

echo "Deactivating virtual environment..."
deactivate
