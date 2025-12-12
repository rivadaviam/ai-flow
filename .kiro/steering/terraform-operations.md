---
inclusion: fileMatch
fileMatchPattern: '**/*.tf'
---

# Terraform Operations Context

## 🚨 MANDATORY Pre-Terraform
1. Run `./src/scripts/utilities/validate-project-structure.sh`
2. Use working directory `terraform/environments/dev`
3. Ensure Lambda source in `src/lambda-functions/` NOT terraform dirs
4. Ensure build artifacts in `build/lambda-packages/` NOT terraform dirs

## 🔧 MCP Terraform Workflow
1. Use `terraform` MCP for all operations (init, plan, validate, apply)
2. Use `aws-documentation` MCP to research service integration patterns FIRST
3. Use `aws-pricing` MCP for cost estimation
4. Use `terraform` MCP with Checkov for security validation

## ⚡ Quick Commands
```bash
# Structure validation (MANDATORY first step)
./src/scripts/utilities/validate-project-structure.sh

# Terraform operations (in correct directory)
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

Complete context: #[[file:../docs/terraform-project-structure.md]] #[[file:../docs/lessons-learned.md]]