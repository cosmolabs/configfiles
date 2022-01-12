#!/bin/bash

# List extensions and install each one of them
cat extensions.list | xargs -n 1 code --install-extension
