FROM --platform=$BUILDPLATFORM ghcr.io/aquasecurity/trivy:latest as download
RUN trivy image --download-java-db-only
RUN trivy image --download-db-only

FROM ghcr.io/aquasecurity/trivy:latest
COPY --from=download /root/.cache/trivy/java-db/ /root/.cache/trivy/java-db/
ENV TRIVY_SKIP_JAVA_DB_UPDATE=true
COPY --from=download /root/.cache/trivy/db/ /root/.cache/trivy/db/
ENV TRIVY_SKIP_DB_UPDATE=true
