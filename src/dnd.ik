#!/usr/bin/env ioke

use("database")
use("note_collection")
use("note")
use("help")
use("command_controller")
use("list_controller")
use("dnd_controller")

DndController mimic process(System programArguments)
