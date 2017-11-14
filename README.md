# step-python-stdeb [![wercker status](https://app.wercker.com/status/314041c099182239f9b0d74e1c54bf21/s "wercker status")](https://app.wercker.com/project/bykey/314041c099182239f9b0d74e1c54bf21)

Wercker step to create debian package using stdeb

## Usage

```yaml
build:
  steps:
    - groove-x/python-stdeb
```

```yaml
build:
  steps:
    - groove-x/python-stdeb:
        project_root: /foo/bar
        clear_debian_dir: true
```
