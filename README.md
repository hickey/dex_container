kubeauth
========
kubeauth is a packaging of the k8s-auth-example application and
packaging of CoreOS Dex project to serve as an OpenID Connect
server and adapter for authenticating to a Kubernetes cluster.


Building Dex
------------
Dex is build completely in Docker so there is no need to setup
the build environment. The end result is a Docker container
ready to run Dex.

Just execute the following:

    docker build -t dex:<VERSION> -f Dockerfile.dex .

One should visit https://github.com/dexidp/dex to determine
what the current version of Dex is for the build.

Executing Dex
-------------

    docker run -d -v dex.yaml:/dex/dex.yaml:ro -p 5556:5556 dex:<VERSION>


