#!/usr/bin/env ioke

use("lib/logger")
use("models/database")
use("models/notes")
use("models/note")
use("controllers/command_controller")
use("controllers/list_controller")
use("controllers/dnd_controller")
use("lib/call_inspector")
use("lib/text_extensions")

;CallInspector instrument(Notes, CommandController, CommandController View)

DndController mimic process(System programArguments)
