set lazy
set quiet
set script-interpreter := ['bash', '-euo', 'pipefail']
set shell := ['bash', '-euo', 'pipefail', '-c']

export SRC_DIR := justfile_directory() / "schemas/_sources"
export OUT_DIR := justfile_directory() / "out"

[private]
default:
  @just --list

[doc('Build JSON schemas')]
[script]
build:
  python3 ./scripts/openapi2jsonschema.py "${SRC_DIR}" "${OUT_DIR}"

[doc('Lint all files')]
[script]
lint:
  prek run --all-files
