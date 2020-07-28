# AVIT-based ZSH Theme

# settings
# (%~ = directory)
typeset +H _current_dir="%{$fg_bold[blue]%}%~%{$reset_color%} "
typeset +H _return_status="%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"
typeset +H _hist_no="%{$fg_bold[grey]%}%h%{$reset_color%}"
typeset +H _current_time="%{$fg_bold[red]%}%D{%H:%M:%S}%{$reset_color%}"

PROMPT='
${_current_time} $(_user_host) ${_current_dir} $(git_prompt_info) $(ruby_prompt_info)
%{%(!.%F{red}.%F{white})%}▶%{$resetcolor%} '

PROMPT2='%{%(!.%F{red}.%F{white})%}◀%{$reset_color%} '

RPROMPT='$(vi_mode_prompt_info)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'

function _user_host() {
  local me="%n"
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  fi
  echo "%{$fg_bold[yellow]%}$me%{$reset_color%}"
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
  local last_commit now seconds_since_last_commit
  local minutes hours days years commit_age
  # Only proceed if there is actually a commit.
  if last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null); then
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((minutes / 60))
    days=$((hours / 24))
    years=$((days / 365))

    if [[ $years -gt 0 ]]; then
      commit_age="${years}y$((days % 365 ))d"
    elif [[ $days -gt 0 ]]; then
      commit_age="${days}d$((hours % 24))h"
    elif [[ $hours -gt 0 ]]; then
      commit_age+="${hours}h$(( minutes % 60 ))m"
    else
      commit_age="${minutes}m"
    fi

    echo "${ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL}${commit_age}%{$reset_color%}"
  fi
}

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg_bold[yellow]%}❮❮%{$reset_color%}"

# Git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}◒ "

# Ruby prompt settings
ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[grey]%}"
ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$reset_color%}"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg_bold[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg_bold[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg_bold[grey]%}"

# LS colors, made with https://geoff.greer.fm/lscolors/
# export CLICOLOR=1
export LSCOLORS=fxbxxxxxxxxxxxxxxxfxfx
export LS_COLORS=$LS_COLORS:'di=47;90:'



#####################################################################
#                                                                   #
#                       CUSTOMISE SHELL COLOURS                     #
#                                                                   #
#####################################################################

# export CLICOLOR=1
# export LSCOLORS=fxbxxxxxxxxxxxxxxxfxfx


# a black
# b red                 # symbolic links
# c green
# d brown               # other
# e blue
# f magenta             # executables
# g cyan                # directories
# h light grey
# A bold black, usually shows up as dark grey
# B bold red
# C bold green
# D bold brown, usually shows up as yellow
# E bold blue
# F bold magenta
# G bold cyan
# H bold light grey; looks like bright white
# x default foreground or background


# The order of the attributes are as follows:

# 1. directory
# 2. symbolic link
# 3. socket
# 4. pipe
# 5. executable
# 6. block special
# 7. character special
# 8. executable with setuid bit set
# 9. executable with setgid bit set
# 10. directory writable to others, with sticky bit
# 11. directory writable to others, without sticky bit

#FILES: 
# di = directory
# fi = file
# ln = symbolic link
# pi = fifo file
# so = socket file
# bd = block (buffered) special file
# cd = character (unbuffered) special file
# or = symbolic link pointing to a non-existent file (orphan)
# mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
# ex = file which is executable (ie. has 'x' set in permissions).
# *.rpm = files with the ending .rpm

#COLORS
# 31 = red
# 32 = green
# 33 = orange
# 34 = blue
# 35 = purple
# 36 = cyan
# 37 = grey
# 90 = dark grey
# 91 = light red
# 92 = light green
# 93 = yellow
# 94 = light blue
# 95 = light purple
# 96 = turquoise

#OTHER
# 0   = default colour
# 1   = bold
# 4   = underlined
# 5   = flashing text
# 7   = reverse field
# 40  = black background
# 41  = red background
# 42  = green background
# 43  = orange background
# 44  = blue background
# 45  = purple background
# 46  = cyan background
# 47  = grey background
# 100 = dark grey background
# 101 = light red background
# 102 = light green background
# 103 = yellow background
# 104 = light blue background
# 105 = light purple background
# 106 = turquoise background
