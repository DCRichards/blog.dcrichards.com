+++
title = "Docker secrets in docker-compose.yml"
date = 2020-03-31T18:29:11Z
tags = ["docker", "secrets", "docker-compose"]
draft = true
+++

Did you know that `docker-compose` supports Docker secrets? It's a very useful addition to the specification and one which has helped in further bridging the gap between development and production environments. In this short post, I'll run through Docker secrets and then show you how you too can start using them in your local development environment.

## Docker Secrets

> "…a secret is a blob of data, such as a password, SSH private key, SSL certificate, or another piece of data that should not be transmitted over a network or stored unencrypted in a `Dockerfile` or in your application's source code."[^1]

The Docker [secrets documentation](https://docs.docker.com/engine/swarm/secrets) explains the use case well. Before this, we would need to use an environment variable or other way of mapping the secrets into our container. Enter Docker secrets, a standardised way of injecting secrets into the container securely.

How does this work? Well, in Docker Swarm, secrets are securely passed to [Raft](https://raft.github.io), which encrypts them. When a container is granted access to a secret, Raft mounts the secret inside the container. These can be found in the directory `/run/secrets`.

## References

[^1]: Li, Y., 2017. _Introducing Docker Secrets Management - Docker Blog_. [online] Docker Blog. Available at: [https://www.docker.com/blog/docker-secrets-management](https://www.docker.com/blog/docker-secrets-management) [Accessed 1 April 2020].