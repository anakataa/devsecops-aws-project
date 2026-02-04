# Terraform Installation Guide for Windows

## Quick Installation Options

### Option 1: Using winget (Windows Package Manager)
Open PowerShell as Administrator and run:
```powershell
winget install HashiCorp.Terraform
```

After installation, **restart your PowerShell terminal** for PATH changes to take effect.

### Option 2: Manual Installation

1. **Download Terraform:**
   - Visit: https://developer.hashicorp.com/terraform/downloads
   - Download the Windows 64-bit version (`.zip` file)

2. **Extract the file:**
   - Extract `terraform.exe` to a folder (e.g., `C:\terraform`)

3. **Add to PATH:**
   - Press `Win + X` and select "System"
   - Click "Advanced system settings"
   - Click "Environment Variables"
   - Under "System variables", find and select "Path", then click "Edit"
   - Click "New" and add the path where you extracted Terraform (e.g., `C:\terraform`)
   - Click "OK" on all dialogs

4. **Restart PowerShell** and verify:
   ```powershell
   terraform --version
   ```

### Option 3: Using Chocolatey (if installed)
```powershell
choco install terraform
```

## Verify Installation

After installation and restarting PowerShell:
```powershell
terraform --version
```

You should see output like: `Terraform v1.x.x`

## Next Steps

Once Terraform is installed, navigate to your terraform directory and run:
```powershell
cd terraform
terraform init
```

# Check current valueecho $AWS_DEFAULT_REGION# If it shows invalid characters, unset and reset