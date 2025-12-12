# Microservices Pattern

## When to Use
- Large applications (>5 services)
- Team scaling (>10 developers)
- Need independent deployments
- High availability requirements

## Architecture
```
ALB → ECS/Fargate Services → RDS/DynamoDB
  ↓
Route53 (Service Discovery)
```

## Components
- **ALB**: Load balancing and routing
- **ECS/Fargate**: Container orchestration
- **RDS/DynamoDB**: Databases per service
- **Route53**: Service discovery
- **ElastiCache**: Shared caching

## Cost Estimate
- **Small** (3 services): ~$200-400/month
- **Medium** (5-10 services): ~$500-1000/month
- **Large** (10+ services): ~$1000+/month

## Use Cases
- E-commerce platforms
- SaaS applications
- Enterprise systems
- High-traffic APIs

## Features
- Independent scaling
- Technology diversity
- Fault isolation
- Team autonomy