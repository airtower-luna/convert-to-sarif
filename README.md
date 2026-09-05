# Convert static analysis data to SARIF

> [!WARNING]
> This action is deprecated, see below.

This action uses
[Sarif.Multitool](https://github.com/microsoft/sarif-sdk/blob/master/docs/multitool-usage.md)
from [microsoft/sarif-sdk](https://github.com/microsoft/sarif-sdk) to
convert static analysis results to SARIF, e.g. for upload to GitHub
Security Alerts. The NPM package is downloaded during action setup.

```yaml
      - uses: airtower-luna/convert-to-sarif@main
        with:
          tool: 'CppCheck'
          input_file: 'test/test.xml'
          sarif_file: 'test.sarif'
```

The `tool` can be any of the [converters supported by
Sarif.Multitool](https://github.com/microsoft/sarif-sdk/blob/master/docs/multitool-usage.md#supported-converters). I
have only used the "CppCheck" one so far, though.

## Deprecation notice

Cppcheck supports SARIF output natively [since verions
2.16.0](https://sourceforge.net/p/cppcheck/news/2024/10/cppcheck-2160/)
(released in 2024). Oddly the `--output-format=<format>` option is
only described in `cppcheck --help`, not the manual. You can [check
mod\_gnutls for a usage
example](https://github.com/airtower-luna/mod_gnutls/blob/92f0a300a905c5a5af05a73106730da1b15d2a69/meson.build#L61-L65). With
that, I have no more need for an action to covert Cppcheck output to
SARIF, and will archive this repository at some point in the future.
