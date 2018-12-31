kubeauth
========
kubeauth is a packaging of the k8s-auth-example application and
packaging of CoreOS Dex project to serve as an OpenID Connect
server and adapter for authenticating to a Kubernetes cluster.


Building Instructions
---------------------
Everything can be build with Habitus (https://www.habitus.io/). At the
end of of the build process a Docker container will have been built for
Dex and the individual builds of kubeauth will be placed in a sub-
directory called `compiled`.

    habitus --os alpine --keep-artifacts

If Habitus is not used to build all the components, then the following
sections will assist in building process.

Building kubeauth
-----------------
Building kubeauth is a two step process. First one needs to cross compile
kubeauth for all platforms. This is accomplished by building the a Docker
container using `Dockerfile.kubeauth`.

    docker build -f Dockerfile.kubeauth -t kubeauth:latest .

Next the binaries for each platform needs to be extracted from the container.
This can be done with the `docker cp` command. First the built container needs
to be started so that files can be copied out of it.

    docker run -d --name kubeauth kubeauth:latest sleep 120
    docker cp -a kubeauth:/go/src/github.com/hickey/kubeauth/compiled/ compiled

If you delay more than 2 minutes to copy the binaries out of the container,
it will exit and you will need to execute the `docker run` command again.

Building Dex
------------
Dex is build completely in Docker so there is no need to setup the build
environment. The end result is a Docker container ready to run Dex.

Just execute the following:

    docker build -t dex:<VERSION> -f Dockerfile.dex .

One should visit https://github.com/dexidp/dex to determine what the current
version of Dex is for the build.

Executing Dex
-------------

    docker run -d -v $PWD/dex.yaml:/dex/dex.yaml:ro -p 5556:5556 dex:<VERSION>


kubeauth TODO
-------------

* add cluster switch
* add download of ca cert from cluster
    * See if ca cert can be downloaded from apiserver
* add change context to authentiation code
* Add GRPC routines
