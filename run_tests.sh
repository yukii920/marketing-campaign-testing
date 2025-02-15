#!/bin/bash
echo "Installing dependencies..."
pip install -r requirements.txt

echo "Running Robot Framework tests..."
robot tests/
