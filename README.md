# Kiro Infra Agent - AI-Flow para AWS Infrastructure

Este repositorio implementa un **AI-Flow** (flujo de trabajo basado en IA) para el diseño, desarrollo y mantenimiento de infraestructura AWS usando Terraform con asistencia de inteligencia artificial.

## ¿Qué es un AI-Flow?

Un AI-Flow es un flujo de trabajo donde la inteligencia artificial actúa como un colaborador experto, proporcionando:
- **Generación automática de código** Terraform siguiendo mejores prácticas
- **Revisión de seguridad** y cumplimiento automático
- **Documentación inteligente** con diagramas y análisis de costos
- **Integración especializada** con servicios AWS como Bedrock

## Arquitectura del AI-Flow

```
Usuario → Kiro AI Agent → MCP Servers → AWS Resources
                ↓
        [6 Servidores MCP Especializados]
                ↓
        Terraform Code + Documentation
```

### Servidores MCP Integrados

| Servidor | Propósito | Casos de Uso |
|----------|-----------|--------------|
| `terraform` | Experto Terraform + AWS + Checkov | Generación, validación, seguridad |
| `aws-documentation` | Documentación oficial AWS | Referencias, límites, configuraciones |
| `aws-pricing` | Análisis de costos en tiempo real | Estimaciones, comparaciones de precios |
| `bedrock-agentcore` | Plataforma Bedrock AgentCore | Deployment, Memory, Code Interpreter |
| `bedrock-kb-retrieval` | Interface Bedrock Knowledge Bases | Consultas con citaciones y fuentes |
| `aws-diagram` | Generador de diagramas profesionales | Arquitecturas AWS, secuencias, flujos |

## Flujos de Trabajo Principales

### 🏗️ Diseño de Nueva Infraestructura
1. **Investigación** → `aws-documentation` para requisitos y mejores prácticas
2. **Generación inicial** → `terraform` para código Terraform con sintaxis correcta
3. **Validación y seguridad** → `terraform` con integración Checkov
4. **Análisis de costos** → `aws-pricing` para optimización de recursos
5. **Visualización** → `aws-diagram` para diagramas de arquitectura

### 🔒 Validación y Endurecimiento
1. **Validación completa** → `terraform` (init, plan, validate)
2. **Análisis de seguridad** → `terraform` con Checkov integrado
3. **Documentación de provider** → `terraform` para sintaxis AWS

### 📊 Documentación y Visualización
1. **Diagramas profesionales** → `aws-diagram` con iconos AWS
2. **Referencias oficiales** → `aws-documentation` para troubleshooting
3. **Reportes de costos** → `aws-pricing` con análisis detallado

### 🤖 Integración con Bedrock AgentCore
1. **Documentación de plataforma** → `bedrock-agentcore` para guías de deployment
2. **Descubrimiento de KBs** → `bedrock-kb-retrieval` para explorar Knowledge Bases
3. **Consultas con citaciones** → `bedrock-kb-retrieval` para información detallada

## Configuración del Entorno

### Perfil AWS
```bash
AWS_PROFILE=default
AWS_REGION=us-east-1
```

### Convenciones de Naming
- **Prefijo de recursos**: `kiro-poc-dev`
- **Tags obligatorios**: `Project`, `Env`, `Owner`, `ManagedBy`

## Estructura del Proyecto

```
.
├── README.md                 # Este archivo
├── .kiro/                    # Configuración Kiro AI
│   ├── settings/
│   │   └── mcp.json         # Configuración MCP servers
│   └── steering/            # Guías para el AI Agent
│       ├── product.md       # Visión del producto
│       ├── tech.md          # Stack tecnológico
│       ├── structure.md     # Organización del proyecto
│       └── mcp-workflows.md # Flujos de trabajo MCP
└── .vscode/                 # Configuración VS Code
    └── settings.json        # Settings del editor
```

## Cómo Usar Este AI-Flow

### 1. Iniciar una Conversación con Kiro
```
"Necesito crear infraestructura para una API serverless con Bedrock"
```

### 2. El AI-Flow se Ejecuta Automáticamente
- Kiro consulta los MCP servers apropiados
- Genera código Terraform optimizado
- Aplica revisiones de seguridad
- Crea documentación y diagramas

### 3. Resultado
- Código Terraform listo para producción
- Documentación completa con diagramas
- Análisis de costos
- Configuración de seguridad validada

## Ventajas del AI-Flow

✅ **Velocidad**: Generación automática de infraestructura compleja  
✅ **Calidad**: Revisión automática de seguridad y mejores prácticas  
✅ **Consistencia**: Aplicación uniforme de convenciones y estándares  
✅ **Documentación**: Generación automática de docs y diagramas  
✅ **Costos**: Análisis automático de impacto económico  
✅ **Especialización**: Acceso a conocimiento experto en AWS y Terraform  

## Casos de Uso Típicos

- **APIs Serverless con RAG**: Lambda + API Gateway + Bedrock
- **Pipelines de datos**: S3 + Lambda + EventBridge
- **Arquitecturas de microservicios**: ECS/Fargate + ALB + RDS
- **Soluciones de ML**: SageMaker + S3 + Lambda
- **Infraestructura de seguridad**: IAM + KMS + CloudTrail

## Próximos Pasos

1. **Configura tu entorno AWS** con el perfil `default`
2. **Inicia Kiro** y describe tu necesidad de infraestructura
3. **Deja que el AI-Flow** genere y optimice tu solución
4. **Revisa y despliega** el código Terraform generado

## Servidores MCP Configurados

Los 6 servidores MCP están configurados y listos para usar:

- ✅ `aws-documentation` - Documentación oficial AWS
- ✅ `terraform` - Terraform + AWS Provider + Checkov
- ✅ `aws-pricing` - Análisis de costos en tiempo real  
- ✅ `bedrock-agentcore` - Plataforma Bedrock AgentCore
- ✅ `bedrock-kb-retrieval` - Interface a Knowledge Bases
- ✅ `aws-diagram` - Generación de diagramas AWS

---

*Este AI-Flow está diseñado para maximizar la productividad en el desarrollo de infraestructura AWS, combinando la experiencia humana con la potencia de la inteligencia artificial especializada.*