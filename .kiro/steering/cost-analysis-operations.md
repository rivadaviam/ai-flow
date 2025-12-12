---
inclusion: manual
---

# Cost Analysis Context

## 🚨 MANDATORY: aws-pricing MCP Discovery Workflow
**NEVER guess service codes or values** - ALWAYS use discovery workflow

## 🔒 Cost Analysis Workflow
1. **DISCOVER**: `get_pricing_service_codes` → find correct service codes
2. **EXPLORE**: `get_pricing_service_attributes` → see filterable dimensions
3. **GET VALUES**: `get_pricing_attribute_values` → discover valid filter values
4. **QUERY**: `get_pricing` → get accurate costs with proper filters
5. **REPORT**: `generate_cost_report` → comprehensive analysis

## 🚫 FORBIDDEN
- Guessing service codes (use `get_pricing_service_codes`)
- Assuming attribute values (use `get_pricing_attribute_values`)
- Skipping discovery workflow (mandatory 3-step process)

## ⚡ Discovery Pattern
```bash
# ALWAYS: codes → attributes → values → pricing
```

**ACTIVATION**: Use #cost or #pricing in chat