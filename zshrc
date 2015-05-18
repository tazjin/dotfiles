# Setup path for shell & systemd-user
PATH=$HOME/bin:$PATH
systemctl --user import-environment PATH

# SSH agent setup
export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"

# Various ...
export EDITOR="emacsclient -c"
