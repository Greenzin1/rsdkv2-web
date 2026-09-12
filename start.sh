#!/bin/bash
cd /home/greensonic267/rsdkv2-web
echo "=== RSDKv2 WEB ==="
echo "Server: http://localhost:3004"
echo "Tunnel starting below..."
echo ""

node server.js &
sleep 2

/home/greensonic267/cloudflared tunnel --url http://localhost:3004
