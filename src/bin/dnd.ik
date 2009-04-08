#!/usr/bin/env ioke

use("lib/logger")
use("model/database")
use("model/notes")
use("model/note")
use("controller/command_controller")
use("controller/list_controller")
use("controller/dnd_controller")
use("lib/call_inspector")
use("lib/text_extensions")

;CallInspector instrument(Notes, CommandController, CommandController View)

DndController mimic process(System programArguments)
