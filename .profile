################################################################################
# File:        .profile                                                        #
# Created by:  DG                                                              #
# Date:        2025-04-15                                                      #
# Description: This ZSH configuration file is using by Debian VPS              #
################################################################################

# If running BASH
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi

  # Set PATH so it includes User's private BIN if it exists
  if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
  fi
fi

mesg n 2> /dev/null || true

