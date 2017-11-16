# step-python-stdeb [![wercker status](https://app.wercker.com/status/029527f433d0ffa4d7da5a156ee0e054/s "wercker status")](https://app.wercker.com/project/bykey/029527f433d0ffa4d7da5a156ee0e054)

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
        clear_debian_dir: false
        stdeb_command: bdist_deb
```
