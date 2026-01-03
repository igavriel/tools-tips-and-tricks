# Configure Cursor AI

This document explains how to configure Cursor AI as your IDE. Which extension to install.

Warning: use this article at your own risk. Always back up your data before making significant changes to your system.

-------------------------------------------------------------------------------

## Contents
- [Toolbar Location](#toolbar-location)
- [Extensions](#extensions)

-------------------------------------------------------------------------------

# Toolbar Location
Move toolbar from top to left side of the screen same as VS Code.

* Open the Command Palette:
    * ![MacOS][macosx] Mac:  Cmd + Shift + P 
    * ![Linux][linux] Linux:  Ctrl + Shift + P

*   Type “Settings” and open the VS Code Settings (not the Cursor Settings)

    *   In the Settings search box, type “activity bar”.
    *   Set:
        *   `Workbench > Activity Bar: Orientation` -->  `vertical`  (or switch from `horizontal` to `vertical`).
    *   Restart Cursor (or let it auto-reload) for the change to fully apply.

Reference: [Make cursor look like vscode - Activity Bar orientation](https://www.youtube.com/watch?v=KoKpH1HbgVw&t=5s)
![youtube][youtube] 

# Extensions
List of extensions to install:
to export the extension list use the following command:
```bash
# all global extensions
cursor --list-extensions
# extensions for a specific profile
cursor --profile python --list-extensions

```

## GIT/SCM
| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| EditorConfig | editorconfig.editorconfig | Enforces consistent coding styles across editors. |
| Git Graph | mhutchie.git-graph | Visualizes Git branches and commits as a graph. |
| Git History | donjayamanne.githistory | Views Git log, history, and compares changes visually. |
| GitLens | eamodio.gitlens | Supercharges Git with blame, history, and authorship info. |
| Gitignore | codezombiech.gitignore | Generates .gitignore templates for projects. |

## IDE Tools
| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Coverage Gutters | ryanluker.vscode-coverage-gutters | Displays test coverage in editor gutters. |
| Darcula Theme | rokoroku.vscode-theme-darcula | IntelliJ-inspired dark theme. |
| Dracula Theme | dracula-theme.theme-dracula | Popular dark syntax theme for code highlighting. |
| Indent Rainbow | oderwat.indent-rainbow | Colorizes indentation levels for better readability. |
| Material Icon Theme | pkief.material-icon-theme | Modern Material Design icons for files/folders. |
| Output Colorizer | ibm.output-colorizer | Adds syntax highlighting to terminal/output panels. |
| Peacock | johnpapa.vscode-peacock | Colors workspace borders to distinguish projects. |
| Settings Sync | shan.code-settings-sync | Syncs settings, extensions, and snippets via GitHub Gist. |
| Shortcut Menu Bar | jerrygoyal.shortcut-menu-bar | Displays keyboard shortcuts in a menu bar. |
| VS Code Keybindings | ms-vscode.vs-keybindings | Shares keybindings between VS Code and VSCodium. |
| VSCode Icons | vscode-icons-team.vscode-icons | Comprehensive file/folder icons pack. |

<details>
<summary>VSCode Only Extensions - Click to expand</summary>

| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Fold Unfold All Icone | ferrierbenjamin.fold-unfold-all-icone | Adds toolbar icons for fold/unfold all code blocks. |

</details>

## Usability/Tools
| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Change Case | wmaurer.change-case | Transforms text between cases (camel, snake, etc.). |
| Code Spell Checker | streetsidesoftware.code-spell-checker | Checks spelling in code comments/strings. |
| Fast Compare | davidkol.fastcompare | Quick file/folder comparison tool. |
| Path Intellisense | christian-kohler.path-intellisense | Autocompletes filenames and paths in code. |
| Save as Root | yy0931.save-as-root | Saves files with sudo/root privileges. |
| SQLite Viewer | qwtel.sqlite-viewer | Browses/edits SQLite databases visually. |
| YAML | redhat.vscode-yaml | YAML language support with validation/schema. |

<details>
<summary>VSCode Only Extensions - Click to expand</summary>

| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Insert Date String | jsynowiec.vscode-insertdatestring | Quickly inserts formatted date/time strings. |
| GUID Generator | heaths.vscode-guid | Generates GUIDs/UUIDs in various formats. |
| Lorem Ipsum | tyriar.lorem-ipsum | Generates dummy text for testing layouts. |
| QuickType | quicktype.quicktype | Generates types from API data samples. |
| Rainbow CSV | mechatroner.rainbow-csv | Colorizes CSV/TSV data columns. |
| Rich JSON | zainchen.json | Enhanced JSON viewing and editing. |

</details>

## Python
| Official Name | Extension ID | Description |
|---------------|--------------|----------------------|
| autoDocstring | njpwerner.autodocstring | Generates docstrings for Python functions/classes. |
| Black Formatter | ms-python.black-formatter | Formats Python code using Black tool. |
| Cursor Pyright | anysphere.cursorpyright | Cursor-optimized Pyright type checker for Python. |
| Debugpy | ms-python.debugpy | Python debugger implementation for VS Code. |
| Documenter | mintlify.document | AI-powered documentation generator from code. |
| Pylint | ms-python.pylint | Lints Python code for errors and style issues. |
| Python | ms-python.python | Official Python language support, IntelliSense, debugging. |
| Python Test Adapter | littlefoxteam.vscode-python-test-adapter | Runs Pytest/Unittest in Test Explorer UI. |
| Test Adapter Converter | ms-vscode.test-adapter-converter | Converts test output for Test Explorer compatibility. |
| Test Explorer UI | hbenl.vscode-test-explorer | Unified UI for running/debugging tests. |

<details>
<summary>VSCode Only Extensions - Click to expand</summary>

| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Error Lens | usernamehw.errorlens | Inline error and warning display in code. |
| Jinja | wholroyd.jinja | Syntax highlighting for Jinja2 templates. |
| LiveCode | xirider.livecode | LiveCode scripting language support. |
| Python Extension Pack | donjayamanne.python-extension-pack | Complete Python development toolkit bundle. |
| Python Extensions Pack | demystifying-javascript.python-extensions-pack | Comprehensive Python productivity extensions. |
| Python Indent | kevinrose.vsc-python-indent | Automatic Python indentation. |
| Python Resource Monitor | kaih2o.python-resource-monitor | Monitors Python process CPU/memory usage. |
| Python Snippets | cstrap.python-snippets | Essential Python code snippets. |
| Python Type Hint | njqdev.vscode-python-typehint | Adds type hints to Python functions. |

</details>

## Node/Typescript
| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Angular Console | nrwl.angular-console | Visual Angular CLI and Nx workspace management. |
| Better Folding | mohammadbaqer.better-folding | Enhanced code folding with preview and controls. |
| DotENV | mikestead.dotenv | Syntax highlighting for .env environment files. |
| ESLint | dbaeumer.vscode-eslint | Integrates ESLint JavaScript linter into VS Code. |
| Jest | orta.vscode-jest | Run and debug Jest tests with Test Explorer. |
| npm Intellisense | christian-kohler.npm-intellisense | Autocompletes npm modules in import statements. |
| Prettier | esbenp.prettier-vscode | Automatic code formatter for JS, TS, CSS, etc. |
| Pretty TypeScript Errors | yoavbls.pretty-ts-errors | Beautifies TypeScript error messages inline. |
| TypeScript Next | ms-vscode.vscode-typescript-next | Latest TypeScript language features nightly. |
| VS Colorize | kamikillerto.vscode-colorize | Colorizes CSS colors, hex codes in source code. |

<details>
<summary>VSCode Only Extensions - Click to expand</summary>

| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Antd Rush | fi3ework.vscode-antd-rush | Ant Design and Rush monorepo tooling support. |
| HTML Preview | george-alisson.html-preview-vscode | Live preview server for HTML files. |
| JSON to TS | gregorbiswanger.json2ts | Converts JSON to TypeScript interfaces. |
| Move TS | stringham.move-ts | Refactors TypeScript imports/exports. |
| REST Client | humao.rest-client | Send HTTP requests directly from .http/.rest files. |
| SVG Editor | henoc.svgeditor | Edit SVG files visually in editor. |
| TS Extension Pack | loiane.ts-extension-pack | Collection of TypeScript productivity tools. |
| TS Importer | pmneo.tsimporter | Quick TypeScript import statements. |
| TypeScript Snippets | xabikos.javascriptsnippets | Enhanced JavaScript/TypeScript snippets. |

</details>

# dotnet/Unity
| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| C# | anysphere.csharp | Cursor-optimized C# language support and debugging. |
| C# | dotnetdev-kr-custom.csharp | Custom C# extension with additional features. |
| Solution Explorer | fernandoescolar.vscode-solution-explorer | Visual Studio-style solution explorer for .NET projects. |
| Unity Code Snippets | kleber-swf.unity-code-snippets | Code snippets for Unity game development in C#. |

<details>
<summary>VSCode Only Extensions - Click to expand</summary>

| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Better Comments | aaron-bond.better-comments | Highlights comments with colors and styles. |
| C# Dev Kit | ms-dotnettools.csdevkit | Complete C# development toolkit with solution management. |
| C# | ms-dotnettools.csharp | Official C# language support, IntelliSense, debugging. |
| C# Dev Snippets | revrenlove.c-sharp-utilities | Essential C# code snippets and utilities. |
| C# Sharp Formatter | csharpier.csharpier-vscode | Formats C# code using CSharpier tool. |
| C# Snippets | jorgeserrano.vscode-csharp-snippets | Popular C# code snippets collection. |
| Doco Comment | k--kato.docomment | Generates documentation comments for C#. |
| .NET Core Essentials | kishoreithadi.dotnet-core-essentials | Essential tools for .NET Core development. |
| .NET Test Explorer | formulahendry.dotnet-test-explorer | Runs .NET tests in Test Explorer UI. |
| MSBuild Project Tools | tintoy.msbuild-project-tools | IntelliSense for MSBuild project files. |
| VSTU | visualstudiotoolsforunity.vstuc | Visual Studio Tools for Unity integration. |
| HLSL Tools | timgjones.hlsltools | High Level Shading Language support. |
| IL Viewer | josephwoodward.vscodeilviewer | Disassembles .NET assemblies to IL. |
| .NET Pack | ms-dotnettools.vscode-dotnet-pack | Complete .NET development toolkit. |

| Official Name | Extension ID | Description |
|---------------|--------------|-------------|
| Super Sharp | craigthomas.supersharp | Enhanced C# productivity tools. |
| Unity Code Snippets | cemuka.unity-code-snippets | Unity-specific C# code snippets. |
| Unity Dev Pack | fabriciohod.unity-dev-pack | Collection of Unity development tools. |
| Unity Meta | ptd.vscode-unitymeta | Manages Unity .meta files and GUIDs. |
| Unity References | cloone8.unity-references | Visualizes Unity asset references. |
| Unity Snippets | yclepticstudios.unity-snippets | Comprehensive Unity C# snippets. |
| Unity Toolbox | pixl.unity-toolbox | Essential Unity development utilities. |
| Shader Language Support | slevesque.shader | Syntax highlighting for shader languages. |
| Shaderlab VSCode Free | amlovey.shaderlabvscodefree | Unity ShaderLab syntax support. |

</details>

-------------------------------------------------------------------------------

back to [Contents](#contents)

<!-- ------------------------------------------------------------------------------- -->
<!-- This section should be at the end of the file -->
<!-- Definitions -->
[macosx]: https://img.icons8.com/color/24/mac-logo.png 'MacOS'
[linux]: https://img.icons8.com/color/24//linux--v1.png 'Linux'
[windows]: https://img.icons8.com/color/24/windows-10.png 'Windows'
[youtube]: https://img.icons8.com/color/24/youtube.png 'YouTube'
