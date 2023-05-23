commands to run
```
microk8s helm install sql ./mariadb -n semaphore
```
```
microk8s helm install semaphore ./semaphore -n semaphore
```
error
```
Attempting to connect to database semaphore on sql-mariadb.semaphore.svc.cluster.local:3306 with user semaphore ...
Generating /tmp/semaphore/config.stdin ...
1
sql-mariadb.semaphore.svc.cluster.local:3306
semaphore
semaphore
semaphore
/tmp/semaphore

no
no
no
no
/etc/semaphore
admin
admin@example.com
admin
admin-password

Hello! You will now be guided through a setup to:

1. Set up configuration for a MySQL/MariaDB database
2. Set up a path for your playbooks (auto-created)
3. Run database Migrations
4. Set up initial semaphore user & password

What database to use:
   1 - MySQL
   2 - BoltDB
   3 - PostgreSQL
 (default 1): 
db Hostname (default 127.0.0.1:3306): 
db User (default root): 
db Password: 
db Name (default semaphore): 
Playbook path (default /tmp/semaphore): 
Web root URL (optional, see https://github.com/ansible-semaphore/semaphore/wiki/Web-root-URL): 
Enable email alerts? (yes/no) (default no): 
Enable telegram alerts? (yes/no) (default no): 
Enable slack alerts? (yes/no) (default no): 
Enable LDAP authentication? (yes/no) (default no): 
Config output directory (default /home/semaphore): 
Running: mkdir -p /etc/semaphore..
Configuration written to /etc/semaphore/config.json..
 Pinging db..
time="2023-05-23T12:29:27Z" level=warning msg="Error 1045: Access denied for user 'semaphore'@'10.1.230.135' (using password: YES)"
panic: Error 1045: Access denied for user 'semaphore'@'10.1.230.135' (using password: YES)
        panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x10 pc=0xa37b97]

goroutine 1 [running]:
github.com/ansible-semaphore/semaphore/db/sql.(*SqlDb).Close(0x21b3340?, {0x260f3c0?, 0xc000016f30?})
        /go/src/github.com/ansible-semaphore/semaphore/db/sql/SqlDb.go:251 +0x17
panic({0xacb7c0, 0xc0000ba528})
        /usr/local/go/src/runtime/panic.go:838 +0x207
github.com/ansible-semaphore/semaphore/db/sql.(*SqlDb).Connect(0xc0000c0698, {0xc0000c0008?, 0xc000017988?})
        /go/src/github.com/ansible-semaphore/semaphore/db/sql/SqlDb.go:278 +0xb05
github.com/ansible-semaphore/semaphore/cli/cmd.doSetup()
        /go/src/github.com/ansible-semaphore/semaphore/cli/cmd/setup.go:41 +0x17f
github.com/ansible-semaphore/semaphore/cli/cmd.glob..func4(0x25d30e0?, {0xb96f17?, 0x1?, 0x1?})
        /go/src/github.com/ansible-semaphore/semaphore/cli/cmd/setup.go:23 +0x17
github.com/spf13/cobra.(*Command).execute(0x25d30e0, {0xc0001b7120, 0x1, 0x1})
        /go/src/github.com/ansible-semaphore/semaphore/vendor/github.com/spf13/cobra/command.go:860 +0x663
github.com/spf13/cobra.(*Command).ExecuteC(0x25d21e0)
        /go/src/github.com/ansible-semaphore/semaphore/vendor/github.com/spf13/cobra/command.go:974 +0x3b4
github.com/spf13/cobra.(*Command).Execute(...)
        /go/src/github.com/ansible-semaphore/semaphore/vendor/github.com/spf13/cobra/command.go:902
github.com/ansible-semaphore/semaphore/cli/cmd.Execute()
        /go/src/github.com/ansible-semaphore/semaphore/cli/cmd/root.go:36 +0x5b
main.main()
        /go/src/github.com/ansible-semaphore/semaphore/cli/main.go:8 +0x17
```
