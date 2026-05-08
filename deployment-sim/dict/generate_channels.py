"""
Generate F' GDS dictionary <channel> entries from a telemetry ranges JSON file.

Reads a JSON file describing channel definitions and thresholds, then prints
XML <channel> tags to stdout. The output can be pasted into the <channels>
section of LocalTopologyDictionary.xml, replacing the existing DeploymentSim
entries.

Usage:
    # Use default (tm_ranges_demo.json next to this script)
    python generate_channels.py

    # Use a different ranges file
    python generate_channels.py tm_ranges.json
    python generate_channels.py /path/to/some_ranges.json

    # Save output to a file
    python generate_channels.py tm_ranges_demo.json > channels_block.xml

To update the dictionary:
    1. Edit your ranges JSON (change thresholds, add channels, etc.)
    2. Run this script with the desired JSON to regenerate the XML
    3. Replace the corresponding <channel> block in LocalTopologyDictionary.xml
"""

import argparse
import json
import sys
from pathlib import Path

# Threshold attributes recognized by F' GDS, in the order F' expects them
THRESHOLD_ATTRS = [
    "low_red",
    "low_orange",
    "low_yellow",
    "high_yellow",
    "high_orange",
    "high_red",
]


def format_value(value):
    """Format a number for XML output. Avoids unnecessary decimal points on integers."""
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value)


def channel_to_xml(full_name, props):
    """Convert a single channel definition (dict) into an XML <channel> tag string."""
    component, name = full_name.split(".", 1)
    attrs = [
        f'component="{component}"',
        f'name="{name}"',
        f'id="{props["id"]}"',
        f'description="{props["description"]}"',
    ]

    # Add threshold attributes only if defined
    for attr in THRESHOLD_ATTRS:
        if attr in props:
            attrs.append(f'{attr}="{format_value(props[attr])}"')

    # Type always comes last by F' convention
    attrs.append(f'type="{props["type"]}"')

    return f"    <channel {' '.join(attrs)}/>"


def main():
    parser = argparse.ArgumentParser(
        description="Generate F' GDS <channel> XML from a telemetry ranges JSON file."
    )
    parser.add_argument(
        "ranges_file",
        nargs="?",
        default="tm_ranges_demo.json",
        help="Path to the telemetry ranges JSON file (default: tm_ranges_demo.json next to this script)",
    )
    args = parser.parse_args()

    # Resolve the ranges file path: absolute path used as-is, otherwise relative to this script's dir
    ranges_path = Path(args.ranges_file)
    if not ranges_path.is_absolute():
        ranges_path = Path(__file__).parent / ranges_path

    if not ranges_path.is_file():
        sys.stderr.write(f"Error: ranges file not found: {ranges_path}\n")
        sys.exit(1)

    with open(ranges_path) as f:
        data = json.load(f)

    print(f"    <!-- DeploymentSim telemetry channels (auto-generated from {ranges_path.name}) -->")
    for full_name, props in data["channels"].items():
        print(channel_to_xml(full_name, props))


if __name__ == "__main__":
    main()
