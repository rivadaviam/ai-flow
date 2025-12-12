---
inclusion: always
---

# Critical Error Prevention - MANDATORY

## 🚨 FORBIDDEN (AUTO-REJECT)
- **MCP Bypass**: NEVER create diagrams manually, skip aws-documentation research, or guess API formats
- **Structure Violations**: NEVER create `terraform/environments/dev/lambda-functions/`, `*.zip`, or `*.py` in terraform dirs
- **Model Access**: ALWAYS verify Bedrock model access first (use Nova Lite for PoCs)
- **API Gateway**: ALWAYS research event formats via `aws-documentation` MCP before Lambda integration
- **OpenSearch**: REMEMBER manual index creation required after Terraform collection
- **AWS CLI Pager**: ALWAYS use `--no-cli-pager` or `export AWS_PAGER=""` to prevent commands hanging with "(END)"
- **S3 Vectors**: Terraform AWS provider doesn't support S3_VECTORS yet - use CloudFormation MCP server for Knowledge Base with S3 Vectors

## 📋 MANDATORY Pre-Checks
### AWS Integration: Use `aws-documentation` MCP → research patterns → verify access → validate structure
### Terraform: Run `./src/scripts/utilities/validate-project-structure.sh` → use `terraform/environments/dev` dir
### Lambda: Create in `src/lambda-functions/` → build to `build/lambda-packages/` → research API formats first

## 🔄 Context Loading
Task-specific steering auto-activates:
- `.tf` files → terraform-operations.md
- `lambda-functions/` → lambda-operations.md  
- AWS services → aws-operations.md
- Bedrock → bedrock-operations.md
- Manual: #diagram, #cost, #pricing

Complete docs: #[[file:../docs/lessons-learned.md]] #[[file:../docs/mcp-usage-guide.md]]