
# CSL-M Schema Converter

This repository automatically converts [CSL schema](https://github.com/citation-style-language/schema) / [CSL-M schema](https://github.com/Juris-M/schema) files in `.rnc` (Relax NG Compact) format into `.rng` (Relax NG XML) format. This enables features such as syntax validation, hover tooltips, and autocompletion for `.csl` files when using the `vscode-xml` extension in Visual Studio Code.

本仓库用于将 `.rnc`（Relax NG Compact）格式的 [CSL schema](https://github.com/citation-style-language/schema) / [CSL-M Schema](https://github.com/Juris-M/schema) 文件**自动转换为 `.rng`（Relax NG XML）格式**，以便在 **Visual Studio Code** 中使用 [`vscode-xml`](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml) 插件实现对 CSL 文件的语法验证、悬停提示、自动补全等功能。

## 📌 Repository Structure

```plain
.
├── .github/workflows/
│   └── ci.yml                # GitHub Actions workflow: auto-convert .rnc → .rng
├── csl-m-schema/             # Git submodule from Juris-M/schema containing .rnc schema files
├── csl-schema/               # Git submodule from citation-style-language/schema containing .rnc schema files
├── generated-schemas/        # Auto-generated .rng schema files used by vscode-xml
|   |-- csl-m
|   |-- csl
|   `-- merged
|       |-- csl-mlz.rng
|       `-- csl.rng
└── README.md
```

## 💡 Using `.rng` Schemas in VS Code

### Method 1: use npm

Add package:

```bash
pnpm add -D https://github.com/zotero-chinese/csl-m-schema-rng.git
```

VS Code settings (`.vscode/settings.json`):

```json5
{
    "xml.fileAssociations": [
    {
      "pattern": "**/*.csl",
      "systemId": "${workspaceFolder}/node_modules/@zotero-chinese/csl-m-schema-rng/generated-schemas/merged/csl-mlz.rng"
    }
  ],
}
```

### Method 2: use git submodule

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
      "systemId": "${workspaceFolder}/schema/generated-schemas/merged/csl-mlz.rng"
    }
  ],
}
```

## 📝 License

This repository follows the license of the upstream [`citation-style-language/schema`](https://github.com/citation-style-language/schema) / [`Juris-M/schema`](https://github.com/Juris-M/schema) project. Please refer to the original license terms for usage and redistribution.
