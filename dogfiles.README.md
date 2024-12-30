# Docs for `dogfiles`

## Usage

```shell
dogfiles -h
```

## Features

### `ln -s` in simplicity

No more magic, just a python wrapper with `ln -s` command and a json file to
store the config.

### `.PHONY` like Makefile

[Phony Targets](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html)

```
.
|-dogfiles
|-dogfiles.json
|-target
| |-dogfiles.json
| |-...
|-...
```

### Recursive configuration

...

<!-- lazy by default -->

## Development

NOTE: `dogfiles.py` is just a soft link to `dogfiles` (the real entrypoint) in
the root directory, which is for testing purpose from `dogfiles.test.py`.

## Inspirations

- https://github.com/anishathalye/dotbot
- https://github.com/jessfraz/dotfiles/blob/master/Makefile
- https://github.com/silverwind/dotfiles/blob/master/install.sh
- https://gist.github.com/ekzhang/3bc0943dc1376d8f434d9bc8cb6bf907
