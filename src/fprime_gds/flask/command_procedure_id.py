"""
command_procedure_id.py

Central configuration point for procedure-id behavior in CHESS-MCS.

Edit this file when you want to:
1. Select which commands receive a procedure_id.
2. Set the hardcoded procedure_id value per command.
3. Change the procedure-id argument name.

This is the intended place to maintain command-to-procedure-id mapping.
Later, this module can be replaced by DB-backed lookups without touching
the command endpoint logic.
"""

from __future__ import annotations

PROCEDURE_ID_ARG_NAME = "procedure_id"

# Per-command configuration:
#   key   = fully qualified command name (component.mnemonic)
#   value = hardcoded procedure_id value to inject
#
# Start with a small set for validation; expand this map as you roll out.
COMMAND_PROCEDURE_ID: dict[str, int] = {
    "cmdDisp.CMD_NO_OP": 100,
    "cmdDisp.CMD_NO_OP_STRING": 101,
}


def command_has_procedure_id(command_name: str) -> bool:
    """Return True when this command should get procedure_id injection."""
    return command_name in COMMAND_PROCEDURE_ID


def procedure_id_arg_name(_: str) -> str:
    """Return the configured procedure-id argument name."""
    return PROCEDURE_ID_ARG_NAME


def procedure_id_for_command(command_name: str) -> int:
    """Return the hardcoded procedure_id value for a command."""
    return COMMAND_PROCEDURE_ID[command_name]
