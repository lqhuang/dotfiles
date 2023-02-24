# FreeBSD pkg and ports

## pkg mirror from USTC

Do not overwrite `/etc/pkg/FreeBSD.conf`, put the following content to
`/usr/local/etc/pkg/repos/FreeBSD.conf`

```
FreeBSD: {
  url: "pkg+https://mirrors.ustc.edu.cn/freebsd-pkg/${ABI}/quarterly",
  enabled: yes
}
```

如果要使用滚动更新的 `latest` 仓库，把 `url` 配置最后的 `quarterly` 换成
`latest` 即可。

修改配置后，运行 `pkg update -f` 更新索引。

> **NOTE**
>
> Using `https` protocol in url requires `security/ca_root_nss` is installed.

## ports

在 `/etc/make.conf` 中添加以下内容（如果文件不存在，则新建之）：

    MASTER_SITE_OVERRIDE?=http://mirrors.ustc.edu.cn/freebsd-ports/distfiles/${DIST_SUBDIR}/

`ports.tar.gz` 文件为 `Ports Collection`，可以下载后解压到 `/usr/ports/` 目录。
也可参考 FreeBSD Handbook 中
[Installing the Ports Collection](https://docs.freebsd.org/en/books/handbook/ports/#ports-using-installation-methods)
一节，使用 git 获取 ports tree:

```
git clone https://mirrors.ustc.edu.cn/freebsd-ports/ports.git /usr/ports
```

## Ref

- [FreeBSD pkg 源使用帮助](https://mirrors.ustc.edu.cn/help/freebsd-pkg.html)
- [FreeBSD ports 源使用帮助](https://mirrors.ustc.edu.cn/help/freebsd-ports.html)
