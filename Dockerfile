FROM alpine:latest

ARG RUNNER_ARCH

RUN apk add --no-cache curl \
&& if [ "$RUNNER_ARCH" = "X64" ]; then ARCH="amd64"; elif [ "$RUNNER_ARCH" = "ARM64" ]; then ARCH="arm64"; fi \
    && LATEST_URL=$(curl -s https://api.github.com/repos/GoogleContainerTools/container-structure-test/releases/latest | grep "browser_download_url.*container-structure-test-linux-$ARCH" | cut -d '"' -f 4) \
    && curl -sSL $LATEST_URL -o /usr/local/bin/container-structure-test \
    && chmod +x /usr/local/bin/container-structure-test \
    && apk del curl
