#!/usr/bin/env python3

import json
import sys

input_filename = sys.argv[1]
output_filename = sys.argv[2]

with open(input_filename) as input_fp:
    notebook_data = json.load(input_fp)

notebook_data["cells"] = [
    c
    for c in notebook_data["cells"]
    if not any(o.get("output_type") == "error" for o in c.get("outputs", ()))
]

with open(output_filename, "w") as output_fp:
    json.dump(notebook_data, output_fp, indent=2)
