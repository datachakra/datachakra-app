#!/bin/bash

echo "🔍 Checking DNS configuration for datachakra.com..."
echo ""

echo "📍 Root domain (datachakra.com):"
nslookup datachakra.com
echo ""

echo "📍 WWW subdomain (www.datachakra.com):"  
nslookup www.datachakra.com
echo ""

echo "✅ Expected GitHub Pages IPs:"
echo "   185.199.108.153"
echo "   185.199.109.153" 
echo "   185.199.110.153"
echo "   185.199.111.153"
echo ""

echo "🌐 Testing web access:"
curl -I datachakra.com 2>/dev/null | head -5
echo ""

echo "⏱️  DNS propagation can take 1-24 hours"
echo "🔗 Check propagation: https://dnschecker.org"