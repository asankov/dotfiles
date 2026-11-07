# Cyberpunk ZSH Theme — Neon Edition

_cyber_docker_context() {
  local ctx
  ctx=$(docker context show 2>/dev/null)
  if [[ -n "$ctx" ]]; then
    echo "%B%F{51}🐳 $ctx%f%b"
  fi
}

_cyber_kube_context() {
  local ctx
  ctx=$(kubectl config current-context 2>/dev/null)
  if [[ -n "$ctx" ]]; then
    echo "%B%F{201}⚙️  $ctx%f%b"
  fi
}

_cyber_venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%B%F{46}🐍 $(basename $VIRTUAL_ENV)%f%b"
  fi
}

_cyber_dir() {
  echo "%B%F{226}%~%f%b"
}

NEWLINE=$'\n'

# Disable default venv prompt prefix
export VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='%B%F{51}╭─[%f%b $(_cyber_venv) %B%F{51}│%f%b $(_cyber_docker_context) %B%F{51}│%f%b $(_cyber_kube_context) %B%F{51}│%f%b $(_cyber_dir) %B%F{51}]%f%b${NEWLINE}%B%F{51}╰─▶%f%b '

_cyber_git_info() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  local tracked_changes
  tracked_changes=$(git diff --name-only 2>/dev/null; git diff --cached --name-only 2>/dev/null)
  if [[ -n "$tracked_changes" ]]; then
    echo "%B%F{46}⌥ $branch %F{196}✗%f%b"
  else
    echo "%B%F{46}⌥ $branch ✓%f%b"
  fi
}

RPROMPT='$(_cyber_git_info)'
