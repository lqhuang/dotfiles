# Clangd Configuration

- user configuration: a `config.yaml` file in an OS-specific directory
  - Linux and others: `$XDG_CONFIG_HOME/clangd/config.yaml`, typically `~/.config/clangd/config.yaml`
  - macOS: `~/Library/Preferences/clangd/config.yaml`
  - Windows: `%LocalAppData%\clangd\config.yaml`, typically `C:\Users\<user>\AppData\Local\clangd\config.yaml`

ref: [Configuration](https://clangd.llvm.org/config): no description found

## Clang compiler configuration files

- Configuration files group command-line options and allow all of them to be specified just by referencing the configuration file. They may be used to collect options required to tune compilation for particular target such as `-L`, `-I`, `-l`, `--sysroot`, codegen options, etc.
  - The command line option `--config=` can be used to specify explicit configuration files in a Clang invocation
- Both user and system directories for configuration files can be specified either during build or during runtime.
  - At build time, use `CLANG_CONFIG_FILE_USER_DIR` and `CLANG_CONFIG_FILE_SYSTEM_DIR`. At run time use the `--config-user-dir=` and `--config-system-dir=` command line options.
  - Specifying config directories at runtime overrides the config directories set at build time The first file found is used.
  - For homebrew installed llvm default `CLANG_CONFIG_FILE_USER_DIR` is `~/.config/clang/` 
