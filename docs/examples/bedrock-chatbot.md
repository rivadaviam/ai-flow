# Bedrock RAG Chatbot

## Overview
AI-powered chatbot that answers questions based on your documents using Amazon Bedrock.

## Architecture
- **API Gateway**: HTTP endpoints
- **Lambda**: Chat processing logic
- **Bedrock Knowledge Base**: Document search
- **Bedrock Claude**: Response generation
- **S3**: Document storage
- **DynamoDB**: Chat history

## Features
- Upload PDF/text documents
- Natural language queries
- Cited responses with sources
- Chat history
- Rate limiting

## Cost Estimate (~1000 queries/day)
- Lambda: ~$2/month
- API Gateway: ~$3/month
- Bedrock: ~$50/month
- DynamoDB: ~$1/month
- S3: ~$1/month
- **Total: ~$57/month**

## Use Cases
- Customer support
- Internal knowledge base
- Document Q&A
- Research assistant