#!/usr/bin/env bash

# Define LOCKER in .xprofile to set to different LOCKER program
: "${LOCKER:=slock}"

# use notify-send if run in dumb term
OUTPUT="echo"
if [[ ${TERM} == 'dumb' ]]; then
    OUTPUT="notify-send"
fi
export OUTPUT

# look up what managers are used (makes it more dynamic)
declare -a MANAGERS
while IFS= read -r manager
do
    MANAGERS+=("${manager,,}")
done < <(grep 'Name' /usr/share/xsessions/*.desktop | awk -F"=" '{print $2}')

# An array of options to choose.
declare -a options=(
"Reboot"
"Reboot to Windows"
"Shutdown"
"Suspend"
"Lock screen"
"Logout"
"Quit"
)

output(){
    ${OUTPUT} "dmlogout" "$@"
}

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | dmenu -i -p 'Shutdown menu:' "${@}")


# What to do when/if we choose one of the options.
case $choice in
    'Shutdown')
      if [[ "$(echo -e "No\nYes" | dmenu -i -p "${choice}?" "${@}" )" == "Yes" ]]; then
          systemctl poweroff
      else
          output "User chose not to shutdown." && exit 0
      fi
      ;;
    'Reboot')
      if [[ "$(echo -e "No\nYes" | dmenu -i -p "${choice}?" "${@}" )" == "Yes" ]]; then
          systemctl reboot
      else
          output "User chose not to reboot." && exit 0
      fi
      ;;
    'Reboot to Windows')
      if [[ "$(echo -e "No\nYes" | dmenu -i -p "${choice}?" "${@}" )" == "Yes" ]]; then
          systemctl reboot --boot-loader-entry=auto-windows
      else
          output "User chose not to reboot." && exit 0
      fi
      ;;
    'Logout')
        if [[ "$(echo -e "No\nYes" | dmenu -i -p "${choice}?" "${@}" )" == "Yes" ]]; then
            for manager in "${MANAGERS[@]}"; do
                killall "${manager}" || output "Process ${manager} was not running."
            done
        else
            output "User chose not to logout." && exit 1
        fi
        ;;
    'Lock screen')
        ${LOCKER}
        ;;
    'Suspend')
        if [[ "$(echo -e "No\nYes" | dmenu -i -p "${choice}?" "${@}" )" == "Yes" ]]; then
            systemctl suspend
        else
            output "User chose not to suspend." && exit 0
        fi
        ;;
    'Quit')
        output "Program terminated." && exit 0
    ;;
        # It is a common practice to use the wildcard asterisk symbol (*) as a final
    # pattern to define the default case. This pattern will always match.
    *)
        exit 0
    ;;
esac
