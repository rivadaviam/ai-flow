# Project Structure

## Directory Organization

```
.
├── .kiro/                    # Kiro AI assistant configuration
│   ├── settings/            # Configuration files
│   │   └── mcp.json        # MCP server configurations
│   └── steering/           # AI assistant guidance documents
│       ├── product.md      # Product overview and purpose
│       ├── tech.md         # Technology stack and commands
│       └── structure.md    # This file - project organization
└── .vscode/                # VS Code workspace settings
    └── settings.json       # Editor configuration
```

## Key Directories

### `.kiro/`
Central configuration directory for Kiro AI assistant:
- **`settings/`**: Contains configuration files for various integrations
- **`steering/`**: Markdown files that provide context and guidance to the AI assistant

### `.vscode/`
VS Code workspace configuration:
- Contains editor settings and Kiro extension configuration

## File Naming Conventions
- Configuration files use lowercase with extensions (`.json`, `.md`)
- Steering documents use descriptive names (`product.md`, `tech.md`, `structure.md`)
- Keep file names concise but descriptive

## Adding New Components
- New MCP servers: Add to `.kiro/settings/mcp.json`
- New AI guidance: Create markdown files in `.kiro/steering/`
- Editor settings: Modify `.vscode/settings.json`

## Best Practices
- Keep steering documents focused and concise
- Update steering rules when project patterns change
- Use descriptive names for configuration entries
- Test MCP integrations after configuration changes