# Terraform Project Structure - Best Practices

## 🚨 MANDATORY: Clean Project Organization

### Current Problem
- **Root directory cluttered** with 20+ files
- **Terraform files scattered** in root instead of organized structure
- **No separation** between environments, modules, and configurations
- **Scripts and artifacts** mixed with infrastructure code

### ✅ Required Terraform Project Structure

```
project-root/
├── .kiro/                          # Kiro AI configuration
├── .vscode/                        # VS Code settings
├── docs/                           # Documentation
├── terraform/                      # ALL Terraform code goes here
│   ├── environments/               # Environment-specific configurations
│   │   ├── dev/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.tfvars
│   │   │   └── versions.tf
│   │   ├── staging/
│   │   └── prod/
│   ├── modules/                    # Reusable Terraform modules
│   │   ├── lambda-function/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   ├── api-gateway/
│   │   ├── bedrock-kb/
│   │   └── s3-bucket/
│   └── shared/                     # Shared configurations
│       ├── backend.tf
│       ├── providers.tf
│       └── locals.tf
├── src/                           # Application source code
│   ├── lambda-functions/
│   │   ├── agent-api/
│   │   └── file-ingestion/
│   └── scripts/
│       ├── deployment/
│       └── utilities/
├── build/                         # Build artifacts (gitignored)
│   ├── lambda-packages/
│   └── terraform-plans/
├── tests/                         # Test files
│   ├── terraform/
│   └── integration/
└── README.md                      # Project overview only
```

## 📋 File Organization Rules (MANDATORY)

### Terraform Files
- **ALL Terraform code** must be in `terraform/` directory
- **Environment separation** required (`dev/`, `staging/`, `prod/`)
- **Modular structure** for reusable components
- **No Terraform files** in project root

### Application Code
- **Lambda functions** in `src/lambda-functions/`
- **Scripts** in `src/scripts/`
- **Build artifacts** in `build/` (gitignored)

### Documentation
- **All documentation** in `docs/` directory
- **Architecture diagrams** in `terraform/environments/dev/diagrams/` (project-specific)
- **Cost estimates** in `terraform/environments/dev/cost-analysis/` (project-specific)

### Root Directory (Keep Minimal)
- **Only essential files**: `README.md`, `.gitignore`, `LICENSE`
- **No Terraform files**
- **No build artifacts**
- **No temporary files**

## 🔧 Migration Commands

### Step 1: Create Directory Structure
```bash
mkdir -p terraform/{environments/{dev,staging,prod},modules,shared}
mkdir -p src/{lambda-functions,scripts/{deployment,utilities}}
mkdir -p build/{lambda-packages,terraform-plans}
mkdir -p tests/{terraform,integration}
mkdir -p docs/{examples,patterns,templates,projects}
```

### Step 2: Move Terraform Files
```bash
# Move main infrastructure to dev environment
mv atenti-poc-infrastructure.tf terraform/environments/dev/main.tf
mv terraform.tfstate terraform/environments/dev/
mv terraform.tfstate.backup terraform/environments/dev/
mv .terraform.lock.hcl terraform/environments/dev/
mv .terraform terraform/environments/dev/
```

### Step 3: Move Lambda Functions
```bash
# Move Lambda source code
mv lambda-functions/* src/lambda-functions/
rmdir lambda-functions
```

### Step 4: Move Scripts and Artifacts
```bash
# Move deployment scripts
mv deploy-with-aws-login.sh src/scripts/deployment/
mv setup-aws-credentials.sh src/scripts/deployment/
mv test-deployment.sh src/scripts/deployment/

# Move utility scripts
mv create_opensearch_index.py src/scripts/utilities/
mv delete_and_recreate_index.py src/scripts/utilities/

# Move build artifacts
mv *.zip build/lambda-packages/
mv *.json build/ 2>/dev/null || true
mv test-*.* build/ 2>/dev/null || true
```

### Step 5: Move Documentation
```bash
# Move project-specific files to terraform directory
mv *-DIAGRAM.md terraform/environments/dev/diagrams/
mv *cost-estimate.md terraform/environments/dev/cost-analysis/
mv DEPLOYMENT*.md terraform/environments/dev/docs/
mv MANUAL-DEPLOYMENT.md docs/
mv README-ATENTI-POC.md docs/
```

### Step 6: Clean Root Directory
```bash
# Remove temporary files
rm -f response.json test-document.txt
```

## 📝 Terraform Module Structure

### Standard Module Layout
```
terraform/modules/module-name/
├── main.tf          # Main resource definitions
├── variables.tf     # Input variables
├── outputs.tf       # Output values
├── versions.tf      # Provider version constraints
├── README.md        # Module documentation
└── examples/        # Usage examples
    └── basic/
        ├── main.tf
        └── variables.tf
```

### Environment Configuration
```
terraform/environments/dev/
├── main.tf          # Environment-specific resources
├── variables.tf     # Environment variables
├── outputs.tf       # Environment outputs
├── terraform.tfvars # Variable values
├── versions.tf      # Provider versions
└── backend.tf       # Remote state configuration
```

## 🚨 Mandatory Rules for Future Projects

### Rule 1: Clean Root Directory
- **Maximum 5 files** in project root
- **Only essential files**: README.md, .gitignore, LICENSE, package.json (if needed)
- **No Terraform files** in root
- **No build artifacts** in root

### Rule 2: Terraform Organization
- **ALL Terraform code** in `terraform/` directory
- **Environment separation** mandatory
- **Module-based architecture** for reusability
- **Consistent naming conventions**

### Rule 3: Source Code Organization
- **Application code** in `src/` directory
- **Build artifacts** in `build/` (gitignored)
- **Tests** in `tests/` directory
- **Scripts** organized by purpose

### Rule 4: Documentation Structure
- **Framework docs** in `docs/` directory (patterns, templates, examples)
- **Project diagrams** in `terraform/environments/dev/diagrams/`
- **Project cost analysis** in `terraform/environments/dev/cost-analysis/`
- **Project documentation** in `terraform/environments/dev/docs/`

## 🔄 Terraform Workflow Updates

### Working Directory Changes
```bash
# OLD (incorrect)
terraform init
terraform plan
terraform apply

# NEW (correct)
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

### MCP Terraform Commands
```bash
# Update working directory for all MCP terraform commands
mcp_terraform ExecuteTerraformCommand --command init --working_directory terraform/environments/dev
mcp_terraform ExecuteTerraformCommand --command plan --working_directory terraform/environments/dev
mcp_terraform ExecuteTerraformCommand --command apply --working_directory terraform/environments/dev
```

## 📋 Project Structure Validation Checklist

### Before Any Commit:
- [ ] Root directory has ≤5 files
- [ ] All Terraform code in `terraform/` directory
- [ ] Environment separation implemented
- [ ] Source code in `src/` directory
- [ ] Documentation in `docs/` directory
- [ ] Build artifacts in `build/` (gitignored)
- [ ] No temporary files in root

### Terraform Structure:
- [ ] Modules are reusable and well-documented
- [ ] Environment configurations are separate
- [ ] Variables and outputs are properly defined
- [ ] Provider versions are pinned
- [ ] Remote state is configured

### Code Organization:
- [ ] Lambda functions in `src/lambda-functions/`
- [ ] Scripts organized by purpose
- [ ] Tests are properly structured
- [ ] Documentation is comprehensive

## 🎯 Benefits of Clean Structure

### Development Benefits
- **Easier navigation** and file discovery
- **Clear separation** of concerns
- **Reusable modules** across environments
- **Consistent patterns** for team collaboration

### Operational Benefits
- **Environment isolation** prevents accidents
- **Modular deployments** enable partial updates
- **Clear documentation** improves maintainability
- **Automated workflows** are more reliable

### Compliance Benefits
- **Audit trails** are clearer
- **Security reviews** are easier
- **Change management** is more controlled
- **Disaster recovery** is more predictable

---

**Remember**: A clean project structure is not optional - it's a requirement for professional infrastructure development.