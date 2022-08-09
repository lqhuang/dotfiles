# China mirror of Maven central

## location

There are two locations where a `settings.xml` file may live:

    The Maven install: ${maven.home}/conf/settings.xml
    A user’s install: ${user.home}/.m2/settings.xml

## Using A Single Repository

You can force Maven to use a single repository by having it mirror all
repository requests. The repository must contain all of the desired artifacts,
or be able to proxy the requests to other repositories. This setting is most
useful when using an internal company repository with a Maven Repository Manager
to proxy external requests.

To achieve this, set `mirrorOf` to `*`. (example: `<mirrorOf>*</mirrorOf>`)

## References:

1. [Settings Reference](http://maven.apache.org/settings.html)
2. [Using Mirrors for Repositories](https://maven.apache.org/guides/mini/guide-mirror-settings.html)
3. [阿里云云效 Maven](https://maven.aliyun.com/mvn/guide)
4. [Maven Central mirror hosted on Google Cloud Storage](https://maven-central.storage.googleapis.com/index.html)
5. [华为开源镜像站](https://mirrors.huaweicloud.com/)
6. [Guide to Public Maven Repositories](https://www.deps.co/guides/public-maven-repositories/)
