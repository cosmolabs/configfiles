#!/bin/bash

# List extensions and install each one of them
code --list-extensions | xargs -n 1 code --uninstall-extension
