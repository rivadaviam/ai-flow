# Quick Reference - Atenti PoC Project

## 🚨 Critical Rules

### MCP Server Usage (MANDATORY)
- ✅ **ALWAYS** use MCP servers when available
- ✅ **ACTIVATE** servers before use
- ✅ **DOCUMENT** any bypasses in lessons-learned.md
- ❌ **NEVER** create manual alternatives when MCP exists

### Task → MCP Server Mapping
| Task | MCP Server | Command Pattern |
|------|------------|-----------------|
| Diagrams | `aws-diagram` | `mcp_aws_diagram generate_diagram` |
| Infrastructure | `terraform` | `mcp_terraform ExecuteTerraformCommand` |
| AWS Docs | `aws-documentation` | `mcp_aws_documentation search_documentation` |
| Pricing | `aws-pricing` | `mcp_aws_pricing get_pricing` |
| Bedrock Docs | `bedrock-agentcore` | `mcp_bedrock_agentcore search_agentcore_docs` |
| Knowledge Base | `bedrock-kb-retrieval` | `mcp_bedrock_kb_retrieval query_knowledge_base` |

## 📋 Project Resources

### Deployed Infrastructure
- **API Endpoint**: `https://0eo8st8zk0.execute-api.us-east-1.amazonaws.com/dev`
- **Upload Bucket**: `atenti-poc-data-upload-f1537eb2`
- **Knowledge Base**: `atenti-poc-kb-processed-f1537eb2`
- **Knowledge Base ID**: `4XOBPPCUH5`
- **OpenSearch Collection**: `https://d68yh4xqcbz27vq8w6j5.us-east-1.aoss.amazonaws.com`

### Key Files
- `atenti-poc-infrastructure.tf` - Main Terraform configuration
- `lambda-functions/agent_api/index.py` - Agent API Lambda
- `lambda-functions/file_ingestion/index.py` - File processing Lambda
- `docs/lessons-learned.md` - Project lessons and errors
- `docs/mcp-usage-guide.md` - MCP server usage guide

## 🔧 Common Commands

### MCP Server Health Check
```bash
# Test all MCP servers
mcp_aws_documentation activate
mcp_terraform activate
mcp_aws_pricing activate
mcp_bedrock_agentcore activate
mcp_bedrock_kb_retrieval activate
mcp_aws_diagram activate
```

### Terraform Operations (via MCP)
```bash
# Validate configuration (correct working directory)
mcp_terraform ExecuteTerraformCommand --command validate --working_directory terraform/environments/dev

# Plan changes (correct working directory)
mcp_terraform ExecuteTerraformCommand --command plan --working_directory terraform/environments/dev

# Apply changes (correct working directory)
mcp_terraform ExecuteTerraformCommand --command apply --working_directory terraform/environments/dev
```

### Project Structure Validation
```bash
# Check root directory file count (should be ≤8)
ls -la | wc -l

# Verify Terraform location
test -f terraform/environments/dev/main.tf && echo "✅ Terraform properly located" || echo "❌ Fix structure"

# Check for clutter in root
ls *.zip *.json *.log 2>/dev/null && echo "❌ Clean root directory" || echo "✅ Root is clean"
```

### Diagram Generation (via MCP)
```bash
# Get examples
mcp_aws_diagram get_diagram_examples --diagram_type aws

# List icons
mcp_aws_diagram list_icons --provider_filter aws

# Generate diagram
mcp_aws_diagram generate_diagram --code "diagram_code" --workspace_dir .
```

### API Testing
```bash
# Health check
curl -X GET "https://0eo8st8zk0.execute-api.us-east-1.amazonaws.com/dev/health"

# Chat endpoint
curl -X POST "https://0eo8st8zk0.execute-api.us-east-1.amazonaws.com/dev/chat" \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, can you help me?"}'
```

## 📊 Cost Monitoring

### Current Monthly Costs (Updated with S3 Vectors)
- **Total**: $45-65/month (under $150 budget, 30-40% savings)
- **S3 Vectors Storage**: $15-25 (35-40%) - *Replaces OpenSearch Serverless*
- **Bedrock Models**: $10-15 (20-25%)
- **Lambda**: $2-5 (5-10%)
- **Other Services**: $18-20 (35-40%)

### Vector Store Decision
**✅ Using S3 Vectors** (instead of OpenSearch Serverless)
- **Cost Savings**: $30-40/month reduction
- **Terraform Native**: No manual scripts required
- **Performance**: 100ms latency (adequate for PoC)
- **Maintenance**: Zero operational overhead

### Cost Optimization Commands (via MCP)
```bash
# Get current pricing
mcp_aws_pricing get_pricing --service_code "AmazonEC2" --region "us-east-1"

# Generate cost report
mcp_aws_pricing generate_cost_report --pricing_data {...} --service_name "..."
```

## 🎯 Vector Store Selection Guide

### S3 Vectors vs OpenSearch Serverless
| Factor | S3 Vectors | OpenSearch Serverless |
|--------|------------|----------------------|
| **Monthly Cost** | $15-25 | $50-70 |
| **Terraform Support** | ✅ Native | ❌ Manual scripts |
| **Setup Complexity** | 🟢 Automatic | 🔴 Manual index creation |
| **Query Latency** | ~100ms | ~50ms |
| **Maintenance** | 🟢 Zero | 🔴 Index management |

### Quick Decision Matrix
- **Choose S3 Vectors if**: Cost <$100/month, Terraform-first, <100ms latency OK
- **Choose OpenSearch if**: Need <50ms latency, Complex search, Budget >$100/month

### S3 Vectors Implementation
```hcl
# Simple Terraform configuration
storage_configuration {
  type = "S3_VECTORS"  # That's it!
}
```

## 🚨 Troubleshooting

### Common Issues
1. **Lambda Import Error**: Check ZIP file structure
2. **Knowledge Base Index Error**: Ensure FAISS engine used
3. **Permission Denied**: Check IAM roles and policies
4. **MCP Server Error**: Activate server first, check configuration

### Error Resolution Process
1. Check CloudWatch logs
2. Review Terraform state
3. Validate MCP server configuration
4. Document issue in lessons-learned.md
5. Apply fix and test

### Emergency Contacts
- **AWS Support**: Use AWS Console support center
- **Terraform Issues**: Check Terraform documentation
- **MCP Server Issues**: Review MCP server logs

## 📚 Documentation Links

### Project Documentation
- [Lessons Learned](./lessons-learned.md) - What went wrong and how to fix it
- [MCP Usage Guide](./mcp-usage-guide.md) - Mandatory MCP server workflows
- [Architecture Diagram](../generated-diagrams/atenti-poc-architecture.png) - System architecture
- [Cost Estimate](../atenti-poc-cost-estimate.md) - Detailed cost breakdown

### AWS Documentation (via MCP)
```bash
# Search AWS docs
mcp_aws_documentation search_documentation --search_phrase "your_topic"

# Read specific documentation
mcp_aws_documentation read_documentation --url "aws_doc_url"
```

### Bedrock Documentation (via MCP)
```bash
# Search Bedrock AgentCore docs
mcp_bedrock_agentcore search_agentcore_docs --query "your_topic"

# Query Knowledge Base
mcp_bedrock_kb_retrieval query_knowledge_base --kb_id "4XOBPPCUH5" --query "your_question"
```

---

**Remember**: This project follows MCP-first principles. Always use the available MCP servers and document any deviations for continuous improvement.