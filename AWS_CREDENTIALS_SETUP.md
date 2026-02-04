# AWS Credentials Setup for Terraform

Terraform needs AWS credentials to authenticate and manage resources. Here are the setup options:

## Option 1: AWS CLI Configuration (Recommended)

### Install AWS CLI (if not installed)
```bash
# On WSL/Linux
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Or on Ubuntu/Debian
sudo apt-get update
sudo apt-get install awscli
```

### Configure AWS Credentials
```bash
aws configure
```

You'll be prompted for:
- **AWS Access Key ID**: Your AWS access key
- **AWS Secret Access Key**: Your AWS secret key
- **Default region**: `eu-central-1` (matches your provider.tf)
- **Default output format**: `json` (recommended)

This creates `~/.aws/credentials` and `~/.aws/config` files that Terraform will automatically use.

## Option 2: Environment Variables

Set these in your WSL terminal session:

```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
export AWS_DEFAULT_REGION="eu-central-1"
```

To make these permanent, add them to `~/.bashrc` or `~/.zshrc`:
```bash
echo 'export AWS_ACCESS_KEY_ID="your-access-key-id"' >> ~/.bashrc
echo 'export AWS_SECRET_ACCESS_KEY="your-secret-access-key"' >> ~/.bashrc
echo 'export AWS_DEFAULT_REGION="eu-central-1"' >> ~/.bashrc
source ~/.bashrc
```

## Option 3: Credentials File (Manual)

Create `~/.aws/credentials`:
```ini
[default]
aws_access_key_id = your-access-key-id
aws_secret_access_key = your-secret-access-key
```

Create `~/.aws/config`:
```ini
[default]
region = eu-central-1
```

## Getting AWS Credentials

1. **AWS Console** → IAM → Users → Your User → Security Credentials
2. Click "Create access key"
3. Choose "Command Line Interface (CLI)"
4. Download or copy the Access Key ID and Secret Access Key

⚠️ **Security Note**: Never commit credentials to git! Use environment variables or AWS CLI configuration.

## Verify Setup

After configuring, test with:
```bash
aws sts get-caller-identity
```

Or test Terraform:
```bash
terraform plan
```

## Troubleshooting

- **Error: "No valid credential sources"**: Credentials not found. Use one of the methods above.
- **Error: "Access Denied"**: Your IAM user needs appropriate permissions (EC2, VPC, IAM, etc.).
- **Error: "Region mismatch"**: Ensure your region matches `eu-central-1` in provider.tf.
- **Error: "Provided region_name 'уeu-central-1' doesn't match"**: Invalid character in region name. Fix with:

### Fix Invalid Region Character

1. **Check your AWS config file:**
   ```bash
   cat ~/.aws/config
   ```

2. **Edit the config file and fix the region:**
   ```bash
   nano ~/.aws/config
   # or
   vi ~/.aws/config
   ```
   
   Make sure it looks exactly like this (no extra characters):
   ```ini
   [default]
   region = eu-central-1
   ```

3. **Or recreate the config file:**
   ```bash
   mkdir -p ~/.aws
   cat > ~/.aws/config << EOF
   [default]
   region = eu-central-1
   output = json
   EOF
   ```

4. **Check environment variables:**
   ```bash
   echo $AWS_DEFAULT_REGION
   ```
   
   If it shows an invalid value, unset and reset it:
   ```bash
   unset AWS_DEFAULT_REGION
   export AWS_DEFAULT_REGION="eu-central-1"
   ```

5. **Verify the fix:**
   ```bash
   aws sts get-caller-identity
   ```

