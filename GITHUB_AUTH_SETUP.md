# GitHub Authentication Setup

GitHub no longer accepts passwords for Git operations. You need to use a **Personal Access Token (PAT)** or **SSH keys**.

## Option 1: Personal Access Token (PAT) - Quick Setup

### Step 1: Create a Personal Access Token

1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Direct link: https://github.com/settings/tokens

2. Click **"Generate new token"** → **"Generate new token (classic)"**

3. Configure the token:
   - **Note**: e.g., "DevSecOps Project"
   - **Expiration**: Choose your preference (90 days, 1 year, or no expiration)
   - **Scopes**: Check at minimum:
     - ✅ `repo` (Full control of private repositories)
     - ✅ `workflow` (if using GitHub Actions)

4. Click **"Generate token"**

5. **IMPORTANT**: Copy the token immediately - you won't see it again!

### Step 2: Use the Token

When Git prompts for credentials:

- **Username**: Your GitHub username (`mendex`)
- **Password**: Paste your Personal Access Token (not your GitHub password)

### Step 3: Push Again

```bash
git push origin main
```

When prompted:
- Username: `mendex`
- Password: `[paste your PAT here]`

## Option 2: Store Credentials (Avoid Re-entering)

### Using Git Credential Helper

**On WSL/Linux:**
```bash
# Store credentials for this session
git config --global credential.helper store

# Or use cache (credentials stored for 15 minutes)
git config --global credential.helper cache
```

After the first push with your PAT, Git will remember it.

### Using Git Credential Manager (Recommended)

```bash
# Install Git Credential Manager (if not already installed)
# On Ubuntu/Debian:
sudo apt-get install git-credential-manager

# Configure Git to use it
git config --global credential.credentialStore cache
```

## Option 3: SSH Keys (Most Secure, No Re-authentication)

### Step 1: Generate SSH Key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
# Press Enter to accept default location
# Optionally set a passphrase for extra security
```

### Step 2: Add SSH Key to GitHub

1. **Copy your public key:**
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

2. **Add to GitHub:**
   - Go to GitHub → Settings → SSH and GPG keys
   - Click **"New SSH key"**
   - Title: e.g., "WSL DevSecOps"
   - Key: Paste the output from step 1
   - Click **"Add SSH key"**

### Step 3: Change Remote URL to SSH

```bash
# Check current remote
git remote -v

# Change to SSH URL
git remote set-url origin git@github.com:anakataa/devsecops-aws-project.git

# Verify
git remote -v
```

### Step 4: Test SSH Connection

```bash
ssh -T git@github.com
```

You should see: `Hi anakataa! You've successfully authenticated...`

### Step 5: Push Using SSH

```bash
git push origin main
```

No authentication prompt needed!

## Troubleshooting

### "Invalid username or token"
- Make sure you're using the **Personal Access Token**, not your GitHub password
- Verify the token has `repo` scope enabled
- Check if the token has expired

### "Permission denied (publickey)" (SSH)
- Verify your SSH key is added to GitHub
- Test connection: `ssh -T git@github.com`
- Check SSH agent: `ssh-add -l`

### Update Existing Remote URL

If you need to change the remote URL:
```bash
# To HTTPS (use PAT)
git remote set-url origin https://github.com/anakataa/devsecops-aws-project.git

# To SSH (use SSH keys)
git remote set-url origin git@github.com:anakataa/devsecops-aws-project.git
```

## Quick Reference

**HTTPS with PAT:**
- Remote: `https://github.com/anakataa/devsecops-aws-project.git`
- Username: Your GitHub username
- Password: Personal Access Token

**SSH:**
- Remote: `git@github.com:anakataa/devsecops-aws-project.git`
- No username/password needed (uses SSH key)

