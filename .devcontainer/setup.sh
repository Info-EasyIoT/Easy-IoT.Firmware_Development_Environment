# Setup SSH based on imported keys
# You should access Git repos with SSH as it is more secure than normal HTTPS Auth
# There is also the fact that most IDEs including VSCode do not work with 2FA activated HTTPS protocol
# At the moment VSCode also does not support password protected SSH keys, but we can use the command line
mkdir -p /root/.ssh
cp -r /root/.ssh-localhost/* /root/.ssh
chmod 700 /root/.ssh
chmod 600 /root/.ssh/*

# Setup git to use SSH
git remote set-url origin git@github.com:Info-EasyIoT/Easy-IoT.Firmware_Development_Environment.git

# Add a hack to bashrc to do a request a git setup
echo "if ! test -f ~/.ssh/known_hosts; then cd /home/workspace && git pull; fi" >> ~/.bashrc
echo "PROMPT_COMMAND='if [[ "\$bashrc" != "\$PWD" && "\$PWD" != "\$HOME" && -e .bashrc ]]; then bashrc="\$PWD"; . .bashrc; fi'" >> ~/.bashrc

# Increase inotify watcher limit
echo "sysctl fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
