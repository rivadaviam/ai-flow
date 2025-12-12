---
inclusion: fileMatch
fileMatchPattern: '**/bedrock/**|**/s3/**|**/lambda/**|**/api-gateway/**'
---

# AWS Operations Context

## 🚨 MANDATORY: Documentation-First
**BEFORE ANY AWS integration**: Use `aws-documentation` MCP to research patterns

## 🔒 AWS Integration Workflow
1. **RESEARCH**: `aws-documentation` MCP → understand integration patterns & event formats
2. **VERIFY ACCESS**: Check service/model availability (Bedrock models, API limits)
3. **VALIDATE STRUCTURE**: Run `./src/scripts/utilities/validate-project-structure.sh`
4. **IMPLEMENT**: Follow researched patterns exactly

## 🚫 FORBIDDEN
- Guessing API formats (research via `aws-documentation` MCP first)
- Skipping model access verification (especially Bedrock)
- Assuming event structures (API Gateway v1 vs v2 differences)
- Using AWS CLI without pager protection (commands hang with "(END)")

## ⚡ Quick Research Commands
```bash
# ALWAYS disable pager first to prevent hanging
export AWS_PAGER=""

# Research integration patterns
mcp_aws_documentation search_documentation --search_phrase "API Gateway Lambda integration"
mcp_aws_documentation search_documentation --search_phrase "API Gateway v1 v2 event format differences"

# AWS CLI commands with pager protection
aws sts get-caller-identity --no-cli-pager
aws configure list --no-cli-pager
```

Context: #[[file:../docs/lessons-learned.md]]