# Start the demo

Start vagrant with the provision flag (even if resuming).

    vagrant up
    vagrant provision

Jenkins should be up after vagrant has completed.  Visit
`http://localhost:8080/` to view the demo.

Stop Jenkins the following way.  To restart Jenkins just use the same start
command.

    vagrant halt

Clean up when finished

    vagrant destroy

Before starting the demo run the following.

    vagrant provision

It will correct system time by syncing via NTP.

# Troubleshooting

* Question: I ran `vagrant up` but Jenkins has not started.
  * Answer: you probably forgot to add `--provision` option.  No worries, you
    can run provision after vagrant has started with `vagrant provision`.

`vagrant status` will tell you the current state of the VM.
