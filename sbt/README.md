# Config `sbt` Repositores

`sbt` requires configuration in two places to make use of a proxy repository.
The first is the `~/.sbt/repositories` file, and the second is the launcher
script.

The repositories file (`~/.sbt/repositories`) is an external configuration for
the Launcher. The exact syntax for the configuration file is detailed in the
[sbt Launcher Configuration](https://www.scala-sbt.org/1.x/docs/Launcher-Configuration.html).

### sbt.override.build.repos

This setting is used to specify that all sbt project added resolvers should be
ignored in favor of those configured in the `repositories` configuration. Using
this with a properly configured `~/.sbt/repositories` file leads to only your
proxy repository used for builds.

It is specified like so:

```
-Dsbt.override.build.repos=true
```

The value defaults to false and must be explicitly enabled.

## References

1. [Proxy Repositories](https://www.scala-sbt.org/1.x/docs/Proxy-Repositories.html)
