# Serverless API Pattern

## When to Use
- Variable traffic (0-10K requests/day)
- Need fast development and deployment
- Want minimal operational overhead
- Budget-conscious projects

## Architecture
```
User → API Gateway → Lambda → DynamoDB
                  ↓
               Bedrock (optional)
```

## Components
- **API Gateway**: HTTP endpoints, authentication, rate limiting
- **Lambda**: Business logic, auto-scaling compute
- **DynamoDB**: NoSQL database, serverless scaling
- **Bedrock**: AI/ML capabilities (optional)

## Cost Estimate
- **Small** (1K requests/day): ~$5-15/month
- **Medium** (10K requests/day): ~$25-50/month
- **Large** (100K requests/day): ~$100-200/month

## Use Cases
- REST APIs
- Chatbots with AI
- CRUD applications
- Webhook handlers
- Microservices backends

## Security Features
- JWT/API Key authentication
- HTTPS only
- IAM least privilege
- VPC endpoints (optional)

## Scaling
- Automatic based on traffic
- No servers to manage
- Pay only for usage
- Cold start: <1s typically