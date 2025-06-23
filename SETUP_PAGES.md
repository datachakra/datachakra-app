# 🚀 GitHub Pages Setup - Required Step

## ⚠️ **IMPORTANT: Manual Setup Required**

GitHub Pages needs to be manually enabled before the automated deployment can work.

### **Step 1: Enable GitHub Pages**

1. **Go to your repository**: 
   https://github.com/datachakra/datachakra-app

2. **Click "Settings"** (in the top repository navigation)

3. **Click "Pages"** (in the left sidebar under "Code and automation")

4. **Under "Source"**:
   - Select **"GitHub Actions"** from the dropdown
   - ⚠️ **NOT** "Deploy from a branch"

5. **Click "Save"**

### **Step 2: Verify Setup**

After enabling Pages, you should see:
- ✅ **"Your site is ready to be published at..."** message
- ✅ **Source set to "GitHub Actions"**

### **Step 3: Trigger Deployment**

Once Pages is enabled:
1. **Go to Actions**: https://github.com/datachakra/datachakra-app/actions
2. **Find the latest workflow** (should auto-trigger)
3. **Or manually trigger**: Click "Run workflow" on the Deploy workflow

### **Step 4: Access Your Site**

After successful deployment (~5 minutes):
🌐 **https://datachakra.com**

---

## 🔧 **Why Manual Setup is Needed**

GitHub requires repository admin permissions to automatically enable Pages, which GitHub Actions doesn't have by default for security reasons.

## ✅ **After Setup**

Once you manually enable Pages:
- ✅ **All future deployments will be automatic**
- ✅ **Push to main = auto-deploy** 
- ✅ **No more manual steps required**

---

## 📞 **Need Help?**

If you encounter issues:
1. Check that you're a repository admin
2. Verify "GitHub Actions" is selected as source
3. Look at Actions tab for detailed error logs

**The one-time setup takes ~2 minutes, then everything is automated! 🚀**