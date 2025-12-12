---
inclusion: fileMatch
fileMatchPattern: '**/lambda-functions/**'
---

# Lambda Operations Context

## 🚨 CRITICAL: Lambda Structure
**MUST create in**: `src/lambda-functions/{name}/` NOT terraform directories
**MUST build to**: `build/lambda-packages/{name}.zip`
**MUST reference**: `../../build/lambda-packages/{name}.zip` in Terraform

## 🔒 Mandatory Lambda Workflow
1. **VALIDATE**: `./src/scripts/utilities/validate-project-structure.sh`
2. **RESEARCH**: Use `aws-documentation` MCP for API Gateway event formats FIRST
3. **CREATE**: `mkdir -p src/lambda-functions/{name}` 
4. **BUILD**: `cd src/lambda-functions/{name} && zip -r ../../../build/lambda-packages/{name}.zip .`
5. **TERRAFORM**: Reference `../../build/lambda-packages/{name}.zip`

## 🚫 FORBIDDEN
- Creating Lambda functions in `terraform/environments/dev/lambda-functions/`
- ZIP files in terraform directories
- Guessing API Gateway event formats (research via `aws-documentation` MCP first)

Context: #[[file:../docs/lessons-learned.md]]