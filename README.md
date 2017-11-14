# step-python-stdeb [![wercker status](https://app.wercker.com/status/dcdaf73d36b06f97fd27518921f1ae27/s "wercker status")](https://app.wercker.com/project/bykey/dcdaf73d36b06f97fd27518921f1ae27)

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
