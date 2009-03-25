#!/usr/bin/env ioke

use("logger")
use("database")
use("note_collection")
use("note")
use("help")
use("command_controller")
use("list_controller")
use("dnd_controller")
use("call_inspector")
use("text_extensions")

;CallInspector instrument(NoteCollection, CommandController, CommandController View)

DndController mimic process(System programArguments)
