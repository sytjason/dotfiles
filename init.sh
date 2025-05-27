#!/bin/bash
stow -t ~ . --adopt
systemctl --user enable systemd/lock-on-wake.service
