#!/bin/bash
echo "Hello, jenkins!"
echo "Current date: $(date)"
echo "Build triggered by commit: $GIT_COMMIT"
chmod +x hello.sh

