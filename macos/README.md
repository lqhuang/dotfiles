# Some tips for macOS

## Resources

- [Enabling Touch ID for sudo in macOS Sonoma](https://jc0b.computer/posts/enabling-touchid-for-sudo-macos-sonoma)
- [Useful built-in macOS command-line utilities](https://weiyen.net/articles/useful-macos-cmd-line-utilities/): macOS comes with a lot of built-in utilities. Here's a list of some that I find interesting.

## Keybindings

> [!WARNING]
>
> Undone yet

If you want to remap "Home" and "End" to beginning and end of line

`DefaultKeyBinding.dict`

```
{
    "\UF729"  = moveToBeginningOfLine:;  // Home
    "\UF72B"  = moveToEndOfLine:;  // End
    "$\UF729" = moveToBeginningOfLineAndModifySelection:;  // Shift + Home
    "$\UF72B" = moveToEndOfLineAndModifySelection:;  // Shift + End
    "^\UF729" = moveToBeginningOfDocument:;  // Ctrl + Home
    "^\UF72B" = moveToEndOfDocument:;  // Ctrl + End
}
```

put it to `~/Library/KeyBindings` (might need to create that folder too)

```shell
mkdir -p $HOME/Library/KeyBindings
```

Most of the keybindings for editing text in OS X are defined in

```
/System/Library/Frameworks/AppKit.framework/Resources/StandardKeyBinding.dict
```

PS: You may need to **logout and login again** for the changes in `~/Library/KeyBindings/` to take effect.

Refs:

1. https://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line
2. https://damieng.com/blog/2015/04/24/make-home-end-keys-behave-like-windows-on-mac-os-x/
3. https://support.apple.com/en-nz/guide/mac-help/cpmh0152/mac
4. https://github.com/mitsuhiko/dotfiles/blob/master/osx/DefaultKeyBinding.dict
5. https://ss64.com/osx/syntax-keybindings.html
