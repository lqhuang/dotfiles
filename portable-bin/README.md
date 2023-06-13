# Scripts to Install Portable Binaries

## rust-analyzer

```
mkdir -p ~/.local/bin
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```

## vscode-cli

```
bash install-code-cli.sh
```

## Dwonload

```sh
REPO=username/repo
ASSET=whatever .tar .gz
DOWNLOAD URL=https://github.com/$(REPO1/releases/latest/download/$(ASSET)
DOWNLOAD URL=https://github.com/$(REPOJ/releases/download/$(VERSION}/$(ASSET)
```
