#!/bin/bash

echo "============================= RINGKASAN INTERFACE ================================="
ip -br a
echo "=============================== STATUS TABEL NAT  ================================="
iptables -t nat -L -v -n
