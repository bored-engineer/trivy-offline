FROM --platform=$BUILDPLATFORM ghcr.io/aquasecurity/trivy:latest as download
RUN trivy fs --scanners config .
RUN trivy image --download-java-db-only
RUN trivy image --download-db-only

FROM ghcr.io/aquasecurity/trivy:latest
COPY --from=download /root/.cache/trivy/policy/ /root/.cache/trivy/policy/
COPY --from=download /root/.cache/trivy/java-db/ /root/.cache/trivy/java-db/
COPY --from=download /root/.cache/trivy/db/ /root/.cache/trivy/db/
ENV TRIVY_OFFLINE_SCAN=true
ENV TRIVY_SKIP_POLICY_UPDATE=true
ENV TRIVY_SKIP_JAVA_DB_UPDATE=true
ENV TRIVY_SKIP_DB_UPDATE=true
