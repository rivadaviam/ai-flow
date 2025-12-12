# AWS Service Integration Research Template

## 🚨 MANDATORY: Complete BEFORE Any Integration Implementation

### Service Integration: [Service A] + [Service B]
**Date**: [Current Date]  
**Researcher**: [Your Name]  
**Project**: [Project Name]

---

## 1. Integration Pattern Research (MANDATORY)

### MCP Documentation Search Commands Used:
```bash
# Primary integration research
mcp_aws_documentation search_documentation --search_phrase "[Service A] [Service B] integration"

# Event format research (for Lambda integrations)
mcp_aws_documentation search_documentation --search_phrase "[Service A] event format structure"

# API version differences (if applicable)
mcp_aws_documentation search_documentation --search_phrase "[Service A] v1 v2 differences"

# Common issues research
mcp_aws_documentation search_documentation --search_phrase "[Service A] [Service B] troubleshooting"
```

### Documentation URLs Reviewed:
- [ ] Primary integration guide: [URL]
- [ ] Event format documentation: [URL]
- [ ] API reference: [URL]
- [ ] Best practices guide: [URL]
- [ ] Troubleshooting guide: [URL]

---

## 2. Event Format Analysis (CRITICAL for Lambda Integrations)

### Event Structure Understanding:
- [ ] **Event format version**: [v1/v2/other]
- [ ] **Event structure fields**: [List key fields]
- [ ] **Path handling**: [How paths are structured]
- [ ] **Stage prefixes**: [How stages affect paths]
- [ ] **Headers format**: [Header structure]
- [ ] **Body format**: [Body encoding/structure]

### Event Format Differences (if multiple versions):
| Aspect | Version 1 | Version 2 | Notes |
|--------|-----------|-----------|-------|
| Path field | `event.path` | `event.requestContext.http.path` | Example |
| Method field | `event.httpMethod` | `event.requestContext.http.method` | Example |
| Stage handling | No prefix | Includes `/stage` prefix | Critical difference |

---

## 3. Service Limits and Constraints

### Quotas and Limits Identified:
- [ ] **Request size limits**: [Size]
- [ ] **Timeout limits**: [Duration]
- [ ] **Concurrency limits**: [Number]
- [ ] **Rate limits**: [Requests per second]
- [ ] **Regional availability**: [Regions]

### Configuration Constraints:
- [ ] **Required configurations**: [List]
- [ ] **Optional configurations**: [List]
- [ ] **Incompatible configurations**: [List]

---

## 4. Authentication and Permissions

### IAM Requirements:
- [ ] **Service A permissions**: [List required permissions]
- [ ] **Service B permissions**: [List required permissions]
- [ ] **Cross-service permissions**: [List]
- [ ] **Resource-based policies**: [If needed]

### Security Considerations:
- [ ] **Encryption requirements**: [At rest/in transit]
- [ ] **Network security**: [VPC/security groups]
- [ ] **Access logging**: [CloudTrail/service logs]

---

## 5. Integration Implementation Plan

### Implementation Steps:
1. [ ] **Step 1**: [Description]
2. [ ] **Step 2**: [Description]
3. [ ] **Step 3**: [Description]
4. [ ] **Step 4**: [Description]
5. [ ] **Step 5**: [Description]

### Testing Strategy:
- [ ] **Unit tests**: [What to test]
- [ ] **Integration tests**: [What to test]
- [ ] **Event format validation**: [How to validate]
- [ ] **Error scenario testing**: [Error cases to test]

---

## 6. Common Issues and Prevention

### Known Issues from Documentation:
- [ ] **Issue 1**: [Description and prevention]
- [ ] **Issue 2**: [Description and prevention]
- [ ] **Issue 3**: [Description and prevention]

### Error Handling Strategy:
- [ ] **Expected errors**: [List and handling approach]
- [ ] **Retry logic**: [When and how to retry]
- [ ] **Fallback mechanisms**: [Backup approaches]
- [ ] **Monitoring and alerting**: [What to monitor]

---

## 7. Cost Implications

### Cost Factors Identified:
- [ ] **Request-based costs**: [Per request pricing]
- [ ] **Data transfer costs**: [Between services]
- [ ] **Storage costs**: [If applicable]
- [ ] **Compute costs**: [Processing costs]

### Cost Optimization Opportunities:
- [ ] **Optimization 1**: [Description]
- [ ] **Optimization 2**: [Description]
- [ ] **Optimization 3**: [Description]

---

## 8. Implementation Validation Checklist

### Pre-Implementation:
- [ ] All documentation research completed
- [ ] Event formats understood and documented
- [ ] Service limits and constraints identified
- [ ] IAM permissions planned
- [ ] Testing strategy defined

### During Implementation:
- [ ] Code handles all documented event formats
- [ ] Error handling implements documented patterns
- [ ] IAM permissions follow least privilege
- [ ] Logging and monitoring configured

### Post-Implementation:
- [ ] Integration tested with real service events
- [ ] Error scenarios validated
- [ ] Performance within expected limits
- [ ] Cost monitoring configured
- [ ] Documentation updated with lessons learned

---

## 9. Lessons Learned (Complete After Implementation)

### What Worked Well:
- [Document successful approaches]

### What Could Be Improved:
- [Document areas for improvement]

### Unexpected Issues Encountered:
- [Document any issues not covered in research]

### Recommendations for Future Integrations:
- [Document recommendations for similar integrations]

---

**✅ Research Complete**: [Date]  
**✅ Implementation Ready**: [Date]  
**✅ Testing Complete**: [Date]  
**✅ Production Deployed**: [Date]

---

## Template Usage Instructions

1. **Copy this template** for each new service integration
2. **Complete ALL sections** before writing any code
3. **Use MCP `aws-documentation` server** for all research
4. **Document ALL findings** even if they seem obvious
5. **Update lessons learned** after implementation
6. **Share template** with team for consistency

**Remember**: This research prevents 80% of integration issues. Never skip it!