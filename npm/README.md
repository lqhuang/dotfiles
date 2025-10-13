# Setup `npm` Dev Environment

## Install `fnm`

```sh
curl -fsSL https://fnm.vercel.app/install | bash
```

```sh
FNM_DIR="${HOME}/.local/share/fnm"
if [[ -d "${FNM_DIR}"  ]]; then
export PATH="${FNM_DIR}:${PATH}"
eval "$(fnm env)"
# export PATH="${FNM_DIR}/aliases/default/bin:$PATH"
fi
```

Shell setup

```sh
eval "$(fnm env --use-on-cd)"
```

## Install `nodejs` from distribution (`root` required)

Node.js LTS

```sh
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs
```

Node.js Current

```sh
curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
apt-get install -y nodejs
```

## Install `pnpm`

### Using Corepack

Since v16.13, `Node.js` is shipping
[Corepack](https://nodejs.org/api/corepack.html) for managing package managers.
This is an experimental feature, so you need to enable it by running:

    corepack enable

This will automatically install pnpm on your system. However, it probably won't
be the latest version of pnpm. To upgrade it, check what is the
[latest pnpm version](https://github.com/pnpm/pnpm/releases/latest) and run:

    corepack prepare pnpm@<version> --activate

With Node.js v16.17 or newer, you may install the `latest` version of pnpm by
just specifying the tag:

    corepack prepare pnpm@latest --activate

### Using npm

    npm install -g pnpm

Once you have installed `pnpm`, there is no need to use other package managers
to update it. You can upgrade `pnpm` using itself, like so:

    pnpm add -g pnpm

## Ref

- [nodesource/distributions](https://github.com/nodesource/distributions):
  NodeSource Node.js Binary Distributions
- [bodadotsh/npm-security-best-practices](https://github.com/bodadotsh/npm-security-best-practices): How to stay safe from NPM supply chain attacks
