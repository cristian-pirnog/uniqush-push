#!/bin/bash 

#------------------------------------------------------
function replaceEnvironmentVariable() {
    local lVarName=${1}
    local lFileName=${2}

    local lVarValue=$(printenv ${lVarName})
    if [[ -z ${lVarValue} ]]; then
        echo "Environment variable ${lVarName} is missing"
        exit 1
    fi

    sed -i s+__${lVarName}__+${lVarValue}+g ${lFileName}
}

#------------------------------------------------------
# Main script
#------------------------------------------------------
variables=('DATABASE_HOST')
confFile=conf/uniqush-push.conf

# Extract the environment variables that are needed to run the job
for var in "${variables[@]}"; do
    replaceEnvironmentVariable ${var} ${confFile}
done

go-wrapper run -config ${confFile}
