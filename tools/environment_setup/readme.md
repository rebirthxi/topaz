## ATTN (for linux/docker users):

**If you want to use environment variables INSTEAD of .conf files to manage your database login and msg server IP address:**
* copy the *setup_server_environment_for_.bash* **from** *tools/environment_setup/default/setup_server_environment_for_.bash* **to** *tools/environment_setup/setup_server_environment_for_[specific deployment].bash*
  * `cp tools/environment_setup/default/setup_server_enviroment_for_.bash tools/environment_setup/setup_server_environment_for_release_branch.bash`
* using your favorite editor, update the copied version of *setup_server_environment_for_\*.bash* with your specific information
* in the terminal you plan to deploy the server in, type: 
  * `source tools/environment_setup/setup_server_environment_for_release_branch.bash` (if you renamed it to release_branch)
