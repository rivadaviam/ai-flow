---
inclusion: fileMatch
fileMatchPattern: '**/bedrock/**|**/*bedrock*|**/*knowledge*base*'
---

# Bedrock Operations Context

## 🚨 MANDATORY: Model Access Verification
**ALWAYS verify model access BEFORE deployment**
**Use Nova Lite for PoCs**: `amazon.nova-lite-v1:0` (no approval required)

## 🔒 Bedrock Workflow
1. **RESEARCH**: `aws-documentation` MCP → understand model access requirements
2. **VERIFY ACCESS**: Check model availability in AWS console BEFORE deployment
3. **CHOOSE MODEL**: Nova Lite (immediate) vs Claude (requires approval)
4. **KNOWLEDGE BASE**: Remember OpenSearch index creation is MANUAL step
5. **TEST**: Validate model access with simple API call first

## 📋 Model Selection
- **Nova Lite**: `amazon.nova-lite-v1:0` - Immediate access, PoC-ready
- **Claude**: Requires approval, production-ready, superior capabilities
- **Migration**: Start Nova Lite → upgrade to Claude when approved

## 🚫 FORBIDDEN
- Assuming model access (verify first)
- Skipping OpenSearch index creation (manual step for Knowledge Base)
- Guessing model IDs (research via `aws-documentation` MCP)

Context: #[[file:../docs/lessons-learned.md]]