# Data Pipeline Pattern

## When to Use
- Process files/data automatically
- ETL workflows
- Event-driven data processing
- Analytics and reporting

## Architecture
```
S3 → EventBridge → Lambda → Process → S3/DynamoDB
                     ↓
                  Athena/QuickSight
```

## Components
- **S3**: Data storage (raw and processed)
- **EventBridge**: Event routing and triggers
- **Lambda**: Data processing functions
- **Athena**: SQL queries on S3 data
- **QuickSight**: Dashboards (optional)

## Cost Estimate
- **Small** (1GB/day): ~$10-20/month
- **Medium** (10GB/day): ~$30-60/month
- **Large** (100GB/day): ~$100-300/month

## Use Cases
- Log processing
- Data transformation
- Real-time analytics
- File format conversion
- Data validation

## Features
- Automatic scaling
- Event-driven processing
- Serverless architecture
- Pay per use