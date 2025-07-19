#!/bin/bash
echo "Hello from Jenkins! Build triggered by commit: $(git rev-parse --short HEAD)"
echo "Current date: $(date)"
chmod +x hello.sh

