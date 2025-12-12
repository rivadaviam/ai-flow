---
inclusion: manual
---

# Diagram Operations Context

## 🚨 MANDATORY: aws-diagram MCP ONLY
**NEVER create diagrams manually** - ALWAYS use `aws-diagram` MCP server

## 🔒 Diagram Workflow
1. **EXPLORE**: `get_diagram_examples` → understand syntax
2. **DISCOVER**: `list_icons` → find available AWS service icons  
3. **GENERATE**: `generate_diagram` → use proper Python diagrams DSL
4. **SAVE**: Diagrams go in `terraform/environments/dev/generated-diagrams/`

## 🚫 FORBIDDEN
- Creating diagrams manually (use `aws-diagram` MCP)
- Guessing icon names (use `list_icons` first)
- Skipping examples (review `get_diagram_examples`)

## ⚡ Quick Commands
```bash
# Activate aws-diagram MCP → get examples → list icons → generate
```

**ACTIVATION**: Use #diagram in chat