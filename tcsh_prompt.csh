# Color definition
set info_color="%{\033[38;5;41m%}"
set git_color="%{\033[38;5;4m%}"
set white="%{\033[0;37m%}"
set reset_color="%{\033[0m%}"

# Get git branch name
setenv GIT_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'"

# Get virtualenv name
if (! ${?VIRTUAL_ENV}) then 
    set env_name=""
else
    set env_name="<"`basename "$VIRTUAL_ENV"`">"
endif

# Final output
set prompt="${info_color}%n@[%m:%~]  ${git_color}`$GIT_BRANCH_CMD`${env_name} \n${white}["'$'"]${reset_color}"

