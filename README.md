# github-packages
Simple example of building a container and pushing it to ghcr.io using GitHub Actions.

Note: There is a premade Action that should be used when possible: 

```yaml
name: Build and push
id: docker_build
uses: docker/build-push-action@v2
with:
  push: true
  tags: user/app:latest
```
