use("logger")

debugMessage = "Debug referenced message"
infoMessage = "Info referenced message"
warnMessage = "Warn referenced message"
errorMessage = "Error referenced message"

"Using default settings" println

logger debug("Debug plain message")
logger info("Info plain message")
logger warn("Warn plain message")
logger error("Error plain message")

logger debug(debugMessage)
logger info(infoMessage)
logger warn(warnMessage)
logger error(errorMessage)

"Setting level to info" println

logger level(:info)

logger debug("Debug plain message")
logger info("Info plain message")
logger warn("Warn plain message")
logger error("Error plain message")

logger debug(debugMessage)
logger info(infoMessage)
logger warn(warnMessage)
logger error(errorMessage)

"Setting level to warn" println

logger level(:warn)

logger debug("Debug plain message")
logger info("Info plain message")
logger warn("Warn plain message")
logger error("Error plain message")

logger debug(debugMessage)
logger info(infoMessage)
logger warn(warnMessage)
logger error(errorMessage)

"Setting level to error" println

logger level(:eror)

logger debug("Debug plain message")
logger info("Info plain message")
logger warn("Warn plain message")
logger error("Error plain message")

logger debug(debugMessage)
logger info(infoMessage)
logger warn(warnMessage)
logger error(errorMessage)
