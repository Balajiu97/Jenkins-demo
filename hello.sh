#!/bin/bash
echo "Hello world! Build triggered by commit: $(git rev-parse --short HEAD)"
echo "Current date: $(date)"
chmod +x hello.sh

