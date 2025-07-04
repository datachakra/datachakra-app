# 🌐 Custom Domain Setup: www.datachakra.com

## 📋 **DNS Configuration Required**

To host your DataChakra app on `datachakra.com`, the DNS is already configured correctly.

### **🔧 DNS Records Setup**

Add these DNS records in your domain registrar/DNS provider:

```
Type: CNAME
Name: www
Value: datachakra.github.io
TTL: 3600 (or default)
```

**Alternative if CNAME doesn't work:**
```
Type: A
Name: www
Value: 185.199.108.153
TTL: 3600

Type: A  
Name: www
Value: 185.199.109.153
TTL: 3600

Type: A
Name: www
Value: 185.199.110.153  
TTL: 3600

Type: A
Name: www
Value: 185.199.111.153
TTL: 3600
```

### **🎯 GitHub Pages Configuration**

1. **Go to repository settings**: 
   https://github.com/datachakra/datachakra-app/settings/pages

2. **Under "Custom domain"**:
   - Enter: `datachakra.com`
   - Click "Save"

3. **Enable "Enforce HTTPS"** (after DNS propagates)

### **⏱️ Timeline**

- **DNS Setup**: ~5 minutes
- **DNS Propagation**: 15 minutes to 24 hours (usually ~1 hour)
- **SSL Certificate**: Auto-generated by GitHub (24-48 hours)

### **✅ Verification Steps**

1. **Check DNS propagation**:
   ```bash
   dig www.datachakra.com
   nslookup www.datachakra.com
   ```

2. **Test in browser**:
   - http://www.datachakra.com (should work first)
   - https://www.datachakra.com (after SSL is ready)

### **🌐 Your Live Site Will Be**:
**https://www.datachakra.com**

### **🔍 Common DNS Providers**

- **Cloudflare**: DNS > Records > Add Record
- **Namecheap**: Domain List > Manage > Advanced DNS
- **GoDaddy**: DNS Management > Add Record
- **AWS Route 53**: Hosted Zones > Create Record

### **📞 Need Help?**

If you need help with DNS setup:
1. Let me know your DNS provider
2. Share any error messages
3. I can provide provider-specific instructions

---

## 🚀 **After DNS Setup**

Once DNS is configured:
- ✅ **Auto-deployment** on every code push
- ✅ **Custom domain** hosting
- ✅ **Free SSL certificate** from GitHub
- ✅ **Global CDN** for fast loading