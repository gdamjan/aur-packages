# /etc/profile.d/load-xdg-config.sh


# If not running interactively, or sh mode, or posix mode, don't do anything
[[ $- != *i* ]] && return
[[ -z "$BASH" ]] && return
[[ "$POSIXLY_CORRECT" ]] && return
[[ "${0#-}" == sh ]] && return

_xdg_config_home=${XDG_CONFIG_HOME:-$HOME/.config}
_xdg_config_bash=${_xdg_config_home}/bash

# Load scripts from ~/.config/bash/
if test -d ${_xdg_config_bash}; then
	for rc in ${_xdg_config_bash}/*.sh; do
		test -r "$rc" && . "$rc"
	done
	unset rc
fi
unset _xdg_config_bash
unset _xdg_config_home
