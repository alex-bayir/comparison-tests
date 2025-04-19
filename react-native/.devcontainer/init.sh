#!/bin/bash
echo "REACT_NATIVE_PACKAGER_HOSTNAME=$(ip -o -br -f inet address | sed -rn 's/(wlan|eth)\S+\s+UP\s+([^\/]+)\/[0-9]+/\2/p' | sed -n '1p')" > $(dirname $0)/.env
