FROM --platform=$BUILDPLATFORM ghcr.io/aquasecurity/trivy:latest as download
RUN trivy image --download-db-only && trivy image --download-java-db-only

FROM ghcr.io/aquasecurity/trivy:latest
COPY --from=download /root/.cache/trivy/db/ /root/.cache/trivy/db/
COPY --from=download /root/.cache/trivy/java-db/ /root/.cache/trivy/java-db/
