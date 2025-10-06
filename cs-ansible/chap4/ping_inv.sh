# ================================
# Ansible Inventory Commands Cheat Sheet
# Inventory file: environments/prod
# ================================

# 1. Ping ALL hosts (localhost, app1, app2, lb, db)
ansible all -i environments/prod -m ping

# 2. Ping ONLY prod group (includes app1, app2, lb)
ansible prod -i environments/prod -m ping

# 3. Ping subgroup: application servers (app1, app2)
ansible app -i environments/prod -m ping

# 4. Ping subgroup: load balancer (lb)
ansible lb -i environments/prod -m ping

# 5. Ping subgroup: database server (db)
ansible db -i environments/prod -m ping

# 6. Ping local control node (localhost)
ansible local -i environments/prod -m ping

# 7. Show inventory in a tree (groups/hosts hierarchy)
ansible-inventory -i environments/prod --graph

# 8. Show full inventory in JSON (detailed view)
ansible-inventory -i environments/prod --list

# 9. Run uptime command on all prod hosts
ansible prod -i environments/prod -m shell -a "uptime"

# 10. Run hostname command on app servers only
ansible app -i environments/prod -m shell -a "hostname"

# 11. Run a test against ALL hosts (shorthand for 'all')
ansible "*" -i environments/prod -m ping

ansible 'prod:!db' -i environments/prod -m ping
#run the inventory file on all hosts except the db group's hosts for prod's children?