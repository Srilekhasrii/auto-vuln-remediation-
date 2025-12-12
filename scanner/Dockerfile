FROM alpine:latest
RUN apk add --no-cache curl jq
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh \
    | sh -s -- -b /usr/local/bin
COPY trivy-scan.sh /usr/local/bin/
ENTRYPOINT ["trivy-scan.sh"]

