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
        [7 Servidores MCP Especializados]
                ↓
        Terraform Code + Documentation
```

### Servidores MCP Integrados

| Servidor | Propósito | Casos de Uso |
|----------|-----------|--------------|
| `aws-terraform-arch` | Arquitecto Terraform + Seguridad | Revisión de código, mejores prácticas AWS |
| `hashicorp-terraform` | Experto en lenguaje Terraform | Generación de código, validación sintáctica |
| `aws-knowledge` | Asistente de diseño AWS | Patrones de arquitectura, recomendaciones |
| `aws-documentation` | Documentación oficial AWS | Referencias, límites, configuraciones |
| `bedrock-kb-retrieval` | Interface Bedrock KB | Consultas a bases de conocimiento |
| `aws-diagram` | Generador de diagramas | Visualización de arquitecturas |
| `aws-pricing` | Análisis de costos | Estimaciones, comparaciones de precios |

## Flujos de Trabajo Principales

### 🏗️ Diseño de Nueva Infraestructura
1. **Consulta de patrones** → `aws-knowledge`
2. **Generación inicial** → `hashicorp-terraform`
3. **Revisión de seguridad** → `aws-terraform-arch`
4. **Documentación** → `aws-documentation`
5. **Visualización** → `aws-diagram`
6. **Análisis de costos** → `aws-pricing`

### 🔒 Validación y Endurecimiento
1. **Validación sintáctica** → `hashicorp-terraform`
2. **Análisis de seguridad** → `aws-terraform-arch`
3. **Aplicación de mejoras** automática

### 📊 Documentación y Visualización
1. **Generación de diagramas** → `aws-diagram`
2. **Referencias oficiales** → `aws-documentation`
3. **Consideraciones de costo** → `aws-pricing`

### 🤖 Integración con Bedrock
1. **Descubrimiento de KBs** → `bedrock-kb-retrieval`
2. **Validación de conectividad**
3. **Consultas de prueba**

## Configuración del Entorno

### Perfil AWS
```bash
AWS_PROFILE=kiro-dev
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

1. **Configura tu entorno AWS** con el perfil `kiro-dev`
2. **Inicia Kiro** y describe tu necesidad de infraestructura
3. **Deja que el AI-Flow** genere y optimice tu solución
4. **Revisa y despliega** el código Terraform generado

---

*Este AI-Flow está diseñado para maximizar la productividad en el desarrollo de infraestructura AWS, combinando la experiencia humana con la potencia de la inteligencia artificial especializada.*