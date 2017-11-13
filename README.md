# step-python-stdeb [![wercker status](https://app.wercker.com/status/71739f0cabfcc022903505ed1f64c602/s "wercker status")](https://app.wercker.com/project/bykey/71739f0cabfcc022903505ed1f64c602)

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
```
