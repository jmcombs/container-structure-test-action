# Container Structure Test Action

GitHub Action that enables automated testing of Containers with [Container Structure Tests](https://github.com/GoogleContainerTools/container-structure-test) in your CI/CD pipeline.[^1]

This action will run on Linux runners on the `arm64` and `amd64` platforms. It also enables you to test multi-arch images by specifying the platform.

## Inputs

- `image`: The Docker image to test (e.g., `my-image:latest`).
- `config`: The path (relative to the root of the repository) to the test config (e.g., `tests.yaml`).
- `platform`: Platform of the image being tested (e.g., `linux/amd64` or `linux/arm64`). Default is `linux/amd64`.

## Example

```yaml
name: "Test Dockerfile structure"
on: pull_request

jobs:
  dockerfile-test:
    runs-on: ubuntu-latest
    steps:
      - name: checkout source
        uses: actions/checkout@main

      - name: run structure tests
        uses: jmcombs/container-structure-test-action@main
        with:
          image: my-image:latest
          config: tests.yaml
          platform: linux/amd64
```

[^1]: This project is a fork of [container-structure-test-action](https://github.com/plexsystems/container-structure-test-action) by [Plex Systems](https://github.com/plexsystems/).
