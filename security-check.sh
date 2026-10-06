#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

if grep -Eq '^ARG[[:space:]]+POSTGRES_(URL_SERVER|PORT|DATABASE|USERNAME|PASSWORD)\b' "$ROOT_DIR/Dockerfile"; then
  echo "Falha: Dockerfile não deve usar ARG para credenciais de banco."
  exit 1
fi

if grep -Eq '^ENV[[:space:]]+POSTGRES_(URL_SERVER|PORT|DATABASE|USERNAME|PASSWORD)=' "$ROOT_DIR/Dockerfile"; then
  echo "Falha: Dockerfile não deve persistir credenciais em ENV da imagem."
  exit 1
fi

if grep -Eq '^echo[[:space:]].*jdbc:postgresql://' "$ROOT_DIR/install.sh"; then
  echo "Falha: install.sh não deve imprimir URL de conexão."
  exit 1
fi

if grep -Eq '^echo[[:space:]].*pass""word|^echo[[:space:]].*POSTGRES_PASSWORD' "$ROOT_DIR/install.sh"; then
  echo "Falha: install.sh não deve imprimir senha/comando com senha."
  exit 1
fi

echo "OK: verificações de segurança passaram."
