class monitor::users
{
@user { "root":
    ensure      =>  "present",
    uid         =>  "0",
    gid         =>  "wheel",
    comment     =>  "root",
    home        =>  "/root",
    shell       =>  "/bin/bash",
    managehome  =>  "true"
  } 
}
