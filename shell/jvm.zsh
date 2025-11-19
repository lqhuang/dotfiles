#
# Scala
#

# sbt / scala / sdkman
export SBT_OPTS="-Dsbt.override.build.repos=true ${SBT_OPTS}"
export JVM_OPTS="-Dhttps.protocols=TLSv1.2,TLSv1.3 ${JVM_OPTS}"

# export MILL_OUTPUT_DIR=".mill"
# Unsupported while mill >= v1.0.0 ???
# Cause error => generatedScriptSources java.io.IOException Is a directory
# not fixed yet. deprecate temporarily and fallback to defaults instead

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
