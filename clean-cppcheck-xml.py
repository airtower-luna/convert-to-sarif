#!/usr/bin/python3
import sys
import xml.dom.minidom as dom

with open(sys.argv[1]) as fh:
    document = dom.parse(fh)

for err in document.getElementsByTagName('error'):
    if len(err.childNodes) == 0:
        err.parentNode.removeChild(err)
    for s in err.getElementsByTagName('symbol'):
        err.removeChild(s)

document.writexml(sys.stdout, encoding='UTF-8')
print()
