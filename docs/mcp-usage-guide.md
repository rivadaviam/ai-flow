# MCP Server Usage Guide - Mandatory Workflows

## 🎯 Core Principle: MCP-First Approach

**RULE**: Always use available MCP servers before considering manual alternatives. This is not optional.

## 📋 MCP Server Checklist

### Before Any Task:
1. ✅ Check `.kiro/settings/mcp.json` for available servers
2. ✅ Identify which MCP server handles your task
3. ✅ Use `activate` action to understand server capabilities
4. ✅ Follow MCP server workflows from `mcp-workflows.md`

## 🔧 Mandatory MCP Server Usage

### 1. AWS Diagram Generation - `aws-diagram`

#### ❌ NEVER DO:
- Create diagrams manually
- Use external diagramming tools
- Skip diagram generation

#### ✅ ALWAYS DO:
```bash
# Step 1: Activate the server
mcp_aws_diagram activate

# Step 2: Get examples for your diagram type
mcp_aws_diagram get_diagram_examples --diagram_type aws

# Step 3: List available icons
mcp_aws_diagram list_icons --provider_filter aws

# Step 4: Generate diagram
mcp_aws_diagram generate_diagram --code "your_diagram_code"
```

#### Required Workflow:
1. **Activate**: Understand capabilities and syntax
2. **Examples**: Review relevant diagram examples
3. **Icons**: Discover available AWS service icons
4. **Generate**: Create diagram using Python diagrams DSL
5. **Iterate**: Refine based on requirements

### 2. Terraform Operations - `terraform`

#### ❌ NEVER DO:
- Run terraform commands directly via bash
- Skip security scanning
- Deploy without validation

#### ✅ ALWAYS DO:
```bash
# Step 1: Activate terraform server
mcp_terraform activate

# Step 2: Validate configuration
mcp_terraform ExecuteTerraformCommand --command validate

# Step 3: Run security scan
mcp_terraform RunCheckovScan --working_directory .

# Step 4: Plan deployment
mcp_terraform ExecuteTerraformCommand --command plan

# Step 5: Apply changes
mcp_terraform ExecuteTerraformCommand --command apply
```

### 3. AWS Documentation Research - `aws-documentation`

#### ❌ NEVER DO:
- Guess AWS service configurations
- Skip documentation research
- Use outdated information

#### ✅ ALWAYS DO:
```bash
# Step 1: Search for relevant documentation
mcp_aws_documentation search_documentation --search_phrase "your_topic"

# Step 2: Read specific documentation
mcp_aws_documentation read_documentation --url "documentation_url"

# Step 3: Get recommendations for related content
mcp_aws_documentation recommend --url "documentation_url"
```

### 4. Cost Analysis - `aws-pricing`

#### ❌ NEVER DO:
- Estimate costs without real data
- Skip cost optimization analysis
- Deploy without budget validation

#### ✅ ALWAYS DO:
```bash
# Step 1: Discover service codes
mcp_aws_pricing get_pricing_service_codes --filter "service_name"

# Step 2: Get service attributes
mcp_aws_pricing get_pricing_service_attributes --service_code "AmazonEC2"

# Step 3: Get pricing data
mcp_aws_pricing get_pricing --service_code "AmazonEC2" --region "us-east-1"

# Step 4: Generate cost report
mcp_aws_pricing generate_cost_report --pricing_data {...} --service_name "..."
```

### 5. Bedrock Knowledge Base - `bedrock-kb-retrieval`

#### ❌ NEVER DO:
- Access Knowledge Bases directly via AWS CLI
- Skip Knowledge Base discovery
- Hardcode Knowledge Base IDs

#### ✅ ALWAYS DO:
```bash
# Step 1: List available Knowledge Bases
mcp_bedrock_kb_retrieval list_knowledge_bases

# Step 2: Query Knowledge Base
mcp_bedrock_kb_retrieval query_knowledge_base --kb_id "..." --query "..."

# Step 3: Retrieve with citations
mcp_bedrock_kb_retrieval retrieve_and_generate --kb_id "..." --query "..."
```

## 🚨 Error Prevention Rules

### Rule 1: No Manual Alternatives
- If an MCP server exists for a task, use it
- Document any MCP server limitations or failures
- Request MCP server improvements instead of bypassing

### Rule 2: Always Activate First
- Never use MCP servers without activating first
- Review capabilities and available tools
- Understand input schemas and parameters

### Rule 3: Follow Documented Workflows
- Use workflows from `mcp-workflows.md`
- Follow the established patterns
- Don't create custom workflows without documentation

### Rule 4: Validate MCP Server Availability
- Check `.kiro/settings/mcp.json` before starting
- Ensure servers are properly configured
- Test server connectivity if needed

## 📊 MCP Server Status Tracking

### Current MCP Servers (from .kiro/settings/mcp.json):
1. ✅ `aws-documentation` - Active and functional
2. ✅ `terraform` - Active and functional  
3. ✅ `aws-pricing` - Active and functional
4. ✅ `bedrock-agentcore` - Active and functional
5. ✅ `bedrock-kb-retrieval` - Active and functional
6. ✅ `aws-diagram` - Active and functional

### MCP Server Health Check:
```bash
# Test each server activation
mcp_aws_documentation activate
mcp_terraform activate  
mcp_aws_pricing activate
mcp_bedrock_agentcore activate
mcp_bedrock_kb_retrieval activate
mcp_aws_diagram activate
```

## 🔄 Workflow Integration

### Project Workflow with MCP:
1. **Planning**: Use `aws-documentation` for research
2. **Design**: Use `aws-diagram` for architecture diagrams
3. **Cost Analysis**: Use `aws-pricing` for budget validation
4. **Implementation**: Use `terraform` for infrastructure
5. **Knowledge**: Use `bedrock-kb-retrieval` for information
6. **Documentation**: Use `bedrock-agentcore` for platform docs

### Quality Gates:
- [ ] MCP server used for applicable tasks
- [ ] Server activated before use
- [ ] Workflows followed correctly
- [ ] Results validated and documented

## 📝 Violation Reporting

### When MCP Server is Bypassed:
1. **Document the reason** in lessons-learned.md
2. **Report the limitation** for future improvement
3. **Create workaround documentation** if necessary
4. **Update workflows** to prevent future bypasses

### Acceptable Bypass Scenarios:
- MCP server is down or unavailable
- MCP server lacks required functionality
- Emergency situations requiring immediate action
- Explicit approval for testing alternatives

**Remember**: The MCP servers exist to provide consistent, reliable, and documented workflows. Using them ensures quality, repeatability, and knowledge sharing across the team.