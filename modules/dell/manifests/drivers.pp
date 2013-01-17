class dell::drivers {

if ( $manufacturer == "Dell Inc." ) {
            include dell::drivers::install
        }
}

class dell::drivers::install {
exec { "update_dell_firmware":
    command => "/bin/sh /net/san/nfs_arc02/home/lreddy/firmware.sh",
}
}
