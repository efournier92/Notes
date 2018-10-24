# Configure Tab Indentation in `VS Code`

### Configure via File -> Preferences -> Settings

1. Set number of spaces in a Tab
  - Overridden based on the file contents if `editor.detectIndentation` is true
  - `"editor.tabSize": 2`

2. Insert spaces when pressing Tab
  - Overridden based on the file contents if `editor.detectIndentation` is true
  - `"editor.insertSpaces": true`

3. Detect `editor.tabSize` & `editor.insertSpaces` based on file contents
  - Set to false to force above values
  - `"editor.detectIndentation": false`

