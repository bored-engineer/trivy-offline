# Trivy Offline Images [![status](https://github.com/bored-engineer/trivy-offline/actions/workflows/build-and-push.yml/badge.svg?branch=main)](https://github.com/bored-engineer/trivy-offline/actions/workflows/build-and-push.yml?query=branch%3Amain)
[Trivy](https://github.com/aquasecurity/trivy) is a comprehensive and versatile security scanner which can scan Container Images, Filesystems, Git Repositories and more.

Typically, `trivy` requires internet access to fetch the latest [vulnerability DB](https://github.com/aquasecurity/trivy-db) and [java artifact DB](https://github.com/aquasecurity/trivy-java-db) both of which are frequently updated (typically every 6 hours).

This repository produces container images that extend the existing [trivy container image](https://github.com/aquasecurity/trivy/pkgs/container/trivy) with these DBs pre-fetched as Docker layers so `trivy` can be used offline. For more details and caveats see the documentation on [Air-Gapped Environments](https://aquasecurity.github.io/trivy/v0.49/docs/advanced/air-gap/).

There is only a single Docker tag `latest` which is continuously rebuilt (every 6 hours) on top of the `ghcr.io/aquasecurity/trivy:latest` image and the latest DB definitions available at that time.
