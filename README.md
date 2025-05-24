
# CSL-M Schema Converter

This repository automatically converts [CSL-M schema](https://github.com/Juris-M/schema) files in `.rnc` (Relax NG Compact) format into `.rng` (Relax NG XML) format. This enables features such as syntax validation, hover tooltips, and autocompletion for `.csl` files when using the `vscode-xml` extension in Visual Studio Code.

本仓库用于将 `.rnc`（Relax NG Compact）格式的 [CSL-M Schema](https://github.com/Juris-M/schema) 文件**自动转换为 `.rng`（Relax NG XML）格式**，以便在 **Visual Studio Code** 中使用 [`vscode-xml`](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml) 插件实现对 CSL 文件的语法验证、悬停提示、自动补全等功能。

## 📌 Repository Structure

```plain
.
├── .github/workflows/
│   └── ci.yml                # GitHub Actions workflow: auto-convert .rnc → .rng
├── csl-m-schema/             # Git submodule from Juris-M/schema containing .rnc schema files
├── generated-schemas/        # Auto-generated .rng schema files used by vscode-xml
└── README.md
```

## 💡 Using `.rng` Schemas in VS Code

Add the submodule:

```bash
git submodule add https://github.com/zotero-chinese/csl-m-schema-rng schema
```

Example project structure:

```plain
.
|-- .vscode
|   `-- settings.json
|-- schema
|   |-- csl-m-schema
|   |   |-- csl-mlz.rnc
|   |   `-- csl.rnc
|   `-- generated-schemas
|       |-- csl-mlz.rng
|       `-- csl.rng
|-- src
|   `-- xxx.csl
`-- scripts
```

VS Code settings (`.vscode/settings.json`):

```json5
{
    "xml.fileAssociations": [
    {
      "pattern": "**/*.csl",
      "systemId": "${workspaceFolder}/schema/generated-schemas/csl-mlz.rng"
    }
  ],
}
```

## 📝 License

This repository follows the license of the upstream [`Juris-M/schema`](https://github.com/Juris-M/schema) project. Please refer to the original license terms for usage and redistribution.
