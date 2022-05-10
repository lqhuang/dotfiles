# Setup `npm` Dev Environment

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

### Using npm

    npm install -g pnpm

Once you have installed `pnpm`, there is no need to use other package managers
to update it. You can upgrade `pnpm` using itself, like so:

    pnpm add -g pnpm
