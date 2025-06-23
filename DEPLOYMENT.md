# 🚀 Deployment Instructions

## GitHub Pages Setup

To enable GitHub Pages deployment for this repository, follow these steps:

### 1. Enable GitHub Pages
1. Go to your repository: https://github.com/datachakra/datachakra-app
2. Click on **Settings** tab
3. Scroll down to **Pages** section in the left sidebar
4. Under **Source**, select **"GitHub Actions"**
5. Click **Save**

### 2. Verify Deployment
1. Go to **Actions** tab: https://github.com/datachakra/datachakra-app/actions
2. Look for the latest **"Deploy to GitHub Pages"** workflow
3. It should show ✅ **Success** status
4. Your site will be available at: **https://datachakra.com**

### 3. Workflow Overview
The GitHub Actions workflow:
- ✅ Triggers on push to `main` branch
- ✅ Sets up Flutter environment
- ✅ Installs dependencies
- ✅ Runs code analysis
- ✅ Builds web app with proper base href
- ✅ Deploys to GitHub Pages

### 4. Custom Domain (Optional)
If you want to use `datachakra.com`:
1. In repository **Settings > Pages**
2. Add your custom domain in **Custom domain** field
3. Update DNS records to point to GitHub Pages
4. GitHub will automatically handle HTTPS

### 5. Troubleshooting

**If deployment fails:**
1. Check **Actions** tab for error details
2. Ensure GitHub Pages is enabled with "GitHub Actions" source
3. Verify repository permissions allow Actions to deploy

**Common issues:**
- **Permission denied**: GitHub Pages not enabled or wrong source selected
- **Build fails**: Check Flutter version compatibility
- **404 errors**: Base href configuration issue

### 6. Development Workflow
- **Main branch**: Auto-deploys to production
- **Develop branch**: For ongoing development
- **Feature branches**: Create PRs to develop
- **Hotfix branches**: Emergency fixes to main

---

🌟 **Your DataChakra app will be live at:**
**https://datachakra.com**