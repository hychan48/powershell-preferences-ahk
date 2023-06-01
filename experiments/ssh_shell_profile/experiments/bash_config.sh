#!/bin/bash
sshd -T |grep -i acceptenv

printenv
printenv |grep -i ssh
printenv SSH_CLIENT
# this only works if my variable is also set
printenv LC__test