# step-python-stdeb [![wercker status](https://app.wercker.com/status/a8a4335fc0088713d10306ec5e10e66d/s "wercker status")](https://app.wercker.com/project/bykey/a8a4335fc0088713d10306ec5e10e66d)

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
        stdeb_command: bdist_deb
```
