# OCI registry for k3s

k3s is often used a local, single-node, kubernetes for development. One common problem is that
kubernetes needs to pull oci images from a registry, and while one can use docker.io or ttl.sh,
it would require costly outbound bandwidth.

Shortly:
- run a registry container inside k3s
- map it to the name `registry.localhost`
- expose the registry to the cluster
- expose the registry to the host
- configure podman how to find `registry.localhost` (probably docker too)

Assumptions:
- resolved, to resolve the name `registry.localhost` to 127.0.0.1/::1
- traefik in k3s to handle the ingress
- traefik will listen on the host port 80 (dnat rule)
