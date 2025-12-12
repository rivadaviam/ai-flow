---
inclusion: always
---

# Structure Enforcement - MANDATORY

## 🚨 FORBIDDEN Paths (AUTO-REJECT)
- `terraform/environments/dev/lambda-functions/`
- `terraform/environments/dev/*.zip`  
- `terraform/environments/dev/*.py` (except .tf)
- `terraform/environments/dev/*-SUMMARY.md`

## ✅ REQUIRED Structure
```bash
src/lambda-functions/{name}/     # Lambda source
build/lambda-packages/{name}.zip # Build artifacts  
src/scripts/utilities/           # Utility scripts
terraform/environments/dev/     # Only .tf files
```

## 🔧 Terraform Path Updates
```hcl
# Lambda references
filename = "../../build/lambda-packages/{name}.zip"
source_dir = "../../src/lambda-functions/{name}"
output_path = "../../build/lambda-packages/{name}.zip"
```

## 📋 Pre-Operation Validation
```bash
# Run BEFORE any operation
./src/scripts/utilities/validate-project-structure.sh

# Create required dirs if missing
mkdir -p src/lambda-functions build/lambda-packages src/scripts/utilities
```

## 🔄 Quick Fix (if violations found)
```bash
# Move files to correct locations
mv terraform/environments/dev/lambda-functions/* src/lambda-functions/ 2>/dev/null || true
mv terraform/environments/dev/*.zip build/lambda-packages/ 2>/dev/null || true  
mv terraform/environments/dev/*.py src/scripts/utilities/ 2>/dev/null || true
```