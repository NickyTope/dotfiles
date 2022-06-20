#!/bin/sh

if [ "$HOSTNAME" == "nt-arch-sfc" ]; then
  echo "Surface Book setup"
fi

if [ "$HOSTNAME" == "miniarch" ]; then
  echo "Mini PC setup"
fi

