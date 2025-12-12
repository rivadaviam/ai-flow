# New Project Structure Template

## 🚨 MANDATORY: Use This Structure for ALL New Projects

### Project Initialization Commands

```bash
# Create new project directory
mkdir my-new-project
cd my-new-project

# Create mandatory directory structure
mkdir -p terraform/environments/{dev,staging,prod}
mkdir -p terraform/modules
mkdir -p terraform/shared
mkdir -p src/lambda-functions
mkdir -p src/scripts/{deployment,utilities}
mkdir -p build/{lambda-packages,terraform-plans}
mkdir -p tests/{terraform,integration}
mkdir -p docs/{examples,patterns,templates,projects}
mkdir -p .kiro/{settings,steering}
mkdir -p .vscode

# Create essential files
touch README.md
touch .gitignore
touch LICENSE
```

### Required File Structure

```
my-new-project/
├── .kiro/                          # Kiro AI configuration
│   ├── settings/
│   │   └── mcp.json               # MCP server configurations
│   └── steering/                  # AI assistant guidance
│       ├── product.md
│       ├── tech.md
│       ├── structure.md
│       └── mcp-workflows.md
├── .vscode/                       # VS Code settings
│   └── settings.json
├── terraform/                     # ALL Terraform code
│   ├── environments/              # Environment-specific configs
│   │   ├── dev/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── versions.tf
│   │   │   └── backend.tf
│   │   ├── staging/
│   │   └── prod/
│   ├── modules/                   # Reusable modules
│   │   ├── lambda-function/
│   │   ├── api-gateway/
│   │   └── s3-bucket/
│   └── shared/                    # Shared configurations
│       ├── locals.tf
│       └── providers.tf
├── src/                          # Application source code
│   ├── lambda-functions/         # Lambda function code
│   │   ├── function-name/
│   │   │   ├── index.py
│   │   │   ├── requirements.txt
│   │   │   └── README.md
│   └── scripts/                  # Utility scripts
│       ├── deployment/
│       └── utilities/
├── build/                        # Build artifacts (gitignored)
│   ├── lambda-packages/
│   └── terraform-plans/
├── tests/                        # Test files
│   ├── terraform/
│   └── integration/
├── docs/                         # Framework documentation only
│   ├── examples/                 # Framework examples
│   ├── patterns/                 # Architecture patterns
│   ├── templates/                # Document templates
│   └── projects/                 # Project specifications (gitignored)
│   ├── lessons-learned.md        # Project lessons
│   └── README.md                 # Documentation index
├── README.md                     # Project overview
├── .gitignore                    # Git ignore rules
└── LICENSE                       # Project license
```

## 📝 Essential File Templates

### Root README.md Template
```markdown
# Project Name

Brief description of the project.

## Architecture

Link to architecture diagram in terraform/environments/dev/diagrams/

## Quick Start

```bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

## Documentation

See [docs/README.md](docs/README.md) for complete documentation.

## Cost Analysis

See [docs/cost-analysis/](docs/cost-analysis/) for cost estimates.
```

### .gitignore Template
```gitignore
# Terraform
**/.terraform/
**/.terraform.lock.hcl
**/terraform.tfstate
**/terraform.tfstate.backup
**/*.tfplan

# Build artifacts
build/
*.zip
*.tar.gz

# IDE
.vscode/settings.json
.idea/

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Temporary files
*.tmp
*.temp
response.json
test-*.json
```

### terraform/environments/dev/versions.tf Template
```hcl
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

### terraform/environments/dev/variables.tf Template
```hcl
variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Common tags
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
```

### terraform/environments/dev/outputs.tf Template
```hcl
output "project_name" {
  description = "Project name"
  value       = var.project_name
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}
```

## 🔧 MCP Server Configuration

### .kiro/settings/mcp.json Template
```json
{
  "mcpServers": {
    "aws-documentation": {
      "command": "uvx",
      "args": ["awslabs.aws-documentation-mcp-server@latest"],
      "env": {
        "AWS_PROFILE": "default",
        "AWS_REGION": "us-east-1",
        "FASTMCP_LOG_LEVEL": "ERROR"
      },
      "disabled": false,
      "autoApprove": []
    },
    "terraform": {
      "command": "uvx",
      "args": ["terraform-mcp-server@latest"],
      "env": {
        "AWS_PROFILE": "default",
        "AWS_REGION": "us-east-1",
        "FASTMCP_LOG_LEVEL": "ERROR"
      },
      "disabled": false,
      "autoApprove": []
    },
    "aws-pricing": {
      "command": "uvx",
      "args": ["aws-pricing-mcp-server@latest"],
      "env": {
        "AWS_PROFILE": "default",
        "AWS_REGION": "us-east-1",
        "FASTMCP_LOG_LEVEL": "ERROR"
      },
      "disabled": false,
      "autoApprove": []
    },
    "aws-diagram": {
      "command": "uvx",
      "args": ["aws-diagram-mcp-server@latest"],
      "env": {
        "FASTMCP_LOG_LEVEL": "ERROR"
      },
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

## 📋 Project Setup Checklist

### Initial Setup:
- [ ] Create directory structure using template commands
- [ ] Copy essential file templates
- [ ] Configure .gitignore with all necessary exclusions
- [ ] Set up MCP server configuration
- [ ] Initialize git repository
- [ ] Create initial documentation

### Terraform Setup:
- [ ] Configure backend for remote state
- [ ] Set up provider configurations
- [ ] Create environment-specific variable files
- [ ] Initialize Terraform in dev environment
- [ ] Validate Terraform configuration

### Documentation Setup:
- [ ] Create project README with clear overview
- [ ] Set up documentation structure in docs/
- [ ] Create lessons-learned.md file
- [ ] Document architecture decisions
- [ ] Set up cost analysis documentation

### Quality Gates:
- [ ] Root directory has ≤5 files
- [ ] All Terraform code in terraform/ directory
- [ ] Source code properly organized in src/
- [ ] Build artifacts in build/ (gitignored)
- [ ] Documentation complete and organized

## 🚨 Validation Commands

### Structure Validation
```bash
# Check root directory file count
ls -la | wc -l  # Should be ≤8 (including . and ..)

# Verify Terraform location
test -f terraform/environments/dev/main.tf && echo "✅ Terraform properly located" || echo "❌ Terraform not in correct location"

# Check for build artifacts in root
ls *.zip *.json *.log 2>/dev/null && echo "❌ Build artifacts in root" || echo "✅ No build artifacts in root"
```

### MCP Server Test
```bash
# Test MCP server configuration
mcp_terraform activate
mcp_aws_documentation activate
mcp_aws_pricing activate
mcp_aws_diagram activate
```

## 🎯 Benefits of This Structure

### Development Benefits
- **Clean navigation**: Easy to find files and understand project layout
- **Environment isolation**: Clear separation between dev/staging/prod
- **Modular architecture**: Reusable Terraform modules
- **Consistent patterns**: Same structure across all projects

### Operational Benefits
- **Automated workflows**: CI/CD pipelines work consistently
- **Security**: Build artifacts are properly isolated
- **Maintenance**: Easy to update and maintain
- **Collaboration**: Team members can navigate any project easily

### Compliance Benefits
- **Audit trails**: Clear separation of code, configs, and artifacts
- **Change management**: Environment-specific configurations
- **Documentation**: Comprehensive and organized documentation
- **Quality gates**: Automated validation of project structure

---

**Remember**: This structure is mandatory for all new projects. No exceptions.