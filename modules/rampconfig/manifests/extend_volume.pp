class rampconfig::extend_volume

{

exec { "extend_rootvol":
    command => "lvextend -L20G /dev/rootvg/rootvol",
    path    => "/usr/local/bin/:/sbin/",
    }
    
    
exec { "resize_rootvol":
    command => "resize2fs /dev/rootvg/rootvol",
    path    => "/usr/local/bin/:/sbin/",
    }

    
}
