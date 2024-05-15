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
