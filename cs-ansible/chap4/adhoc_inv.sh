# Check connectivity (ping module)
ansible all -i prod -m ping

# Gather facts (like OS, IP, etc.)
ansible all -i prod -m setup

# Run a simple shell command
ansible all -i prod -m command -a "uptime"

# Run command with shell (pipes, redirects allowed)
ansible app -i prod -m shell -a "df -h | grep /dev/"

# Create a file
ansible app -i prod -m file -a "path=/tmp/ansible_demo.txt state=touch"

# Install a package (example: Nginx on Ubuntu/Debian)
ansible lb -i prod -m apt -a "name=nginx state=present update_cache=yes" --become

# Start a service
ansible lb -i prod -m service -a "name=nginx state=started" --become

# Copy a file from control node to managed node
ansible db -i prod -m copy -a "src=./localfile.txt dest=/tmp/remote_copy.txt"

# Check listening ports
ansible app -i prod -m shell -a "ss -tulpn | grep LISTEN"

# Reboot hosts
ansible prod -i prod -m reboot --become
