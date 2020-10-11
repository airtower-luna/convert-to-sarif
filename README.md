# Convert static analysis data to SARIF

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
Sarif.Multitool](https://github.com/microsoft/sarif-sdk/blob/master/docs/multitool-usage.md#supported-converters). Note
that the one for CppCheck [cannot handle certain XML elements produced
by current CppCheck
versions](https://github.com/microsoft/sarif-sdk/issues/2103), so this
action [filters them out](./clean-cppcheck-xml.py) before calling the
converter. I haven't tested other converters.
