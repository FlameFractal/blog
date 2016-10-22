set up repo on server
set up repo on my machine [remote=server]

generate key pair on my machine.
add public key to server.

-----------------------------

set up repo on github
set up bare repo on server ~ [remote=github]

generate key pair on server.
add public key to github.

set up post-receive hook
	push to github quiet
	push to ~/public_html
