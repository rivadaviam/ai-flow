# Your Projects

Create your project specifications here. Each project should be a single markdown file describing what you want to build.

## Template

Copy this template to create `my-project.md`:

```markdown
# My Project Name

## What it does
Brief description of your project (1-2 sentences)

## Requirements
- **Users**: Expected daily users
- **Budget**: Monthly budget limit
- **Performance**: Response time requirements
- **Data**: Storage and processing needs

## Architecture
Choose one or describe your preferred approach:
- Serverless API (Lambda + API Gateway)
- Data Pipeline (S3 + Lambda + EventBridge)  
- Microservices (ECS + ALB + RDS)
- Custom architecture

## Features
- Feature 1
- Feature 2
- Feature 3

## Integrations
- AWS services needed (Bedrock, S3, DynamoDB, etc.)
- External APIs
- Existing systems

## Security & Compliance
- Authentication method
- Data sensitivity level
- Compliance requirements (if any)
```

## Examples

See `docs/examples/` for complete project examples with cost estimates.

## Usage

Once you create your project file, tell Kiro:
- `"Generate infrastructure for docs/projects/my-project.md"`
- `"Create Terraform code based on my project specification"`
- `"Estimate costs for the project in docs/projects/my-project.md"`