class rampconfig::ssh-auth {

case $hostname {
/^prod-app.*/:
{
    ssh_authorized_key { "root@pod-app-01.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA0Dlds+LUtSjw8H+wtHyFTodIG2bhCICWRQOOJQca7yp1CLGfEsv+ZFpafFAYG/LS1xblRdspcbKmm5EpPi477FsX7qPRFvPoexoqHwAiIUSKEt3XNtNfXvcC1FP15/aXURTiIpFIBnIHXIcHFlaZ4X+vKVFu2CjbKEisJFAP7ELp1J/6ALqfGu3nBsWTfTFQShD1+qrKr/DUZolpnAsqhCL29I+leIKvAxWrF9ldr7nJIG367Lu1C0B5SprSfROt2SnFmGn/f5NOtX0fgjk4byynox4CV3+YRNo6x2Qg8nyYLOUcmGvf2OazK6M5Q/ssQSLedLBcS7tC5Zc060fg3w==',
    user        => 'root',
}
}

/^ramp-app.*/:
{
    ssh_authorized_key { "root@ramp-app-12.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAvmPaE9qDiGk6lhr/H2gzFZ1Fu+ZCfRrQ0lvOt3L7LSVQ99F6JynXWi3pjAAURA7BOiPsH+OmVlj/mg73+3/izHGpi0M7QGLustgSWJmycBN9sYTuTubtagBreza+/QCUSU/i8blL8Rw6HLpbha7cKN6zPJoWc2xCa9tzfWH6eHcfyQz9fPMHlyyKsoCsKVFH0f/Y3ejMwlw/QTQhtv2fCq7ByIBE35VwVLhzQgF9Khj8jHbhMARTrOXr12hwIkQpkBAMhk7GFTVt6ieR7jW9buvYoOTqq8myAfV0VKZ4chUNqk8iHgvfXCDTwqe+8EGlLbYnjX3GZWAKQ+KBjzHnHw==',
    user        => 'root',
}
}

/pod-worker.*/:
{
    ssh_authorized_key { "root@pod-worker-029.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAIEA8KYwng5Uvxy9pC5x9B4tW50O0XFqY93d5CHbm5zynOd7LWQm1yXIHiA60gs4SfMH6Lhi+u2PymB0IyL6Cx8q94VcTkrsjhyYm5DJalaMvsXUJDhAJtrYV94kLxr+oSt3wZuz5K4kewc/WWSEadHOz6DUlHuLCkhwxkYO1SG9Hd8=',
    user        => 'root',
}
}
}

ssh_authorized_key { "rsa-key-20091027":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABJQAAAIEAvaRhRGh/smX/fLlvMCR2yEQTxiNs6dIvsDBZCcON//iBL+u2GcJoLAPE1AgpNZ/BfeoXejSjDW50FRaraqa17lyFFwHm4Bh6gzjVVj8mtCGawWiLdsSjfY4Pg5yP0bHc/AwT2lkZwRekvZCr+eLlODStprv1xK303KHVOyjg9Cc=',
    user        => 'root',
}

ssh_authorized_key { "lreddy@lokesh-desktop":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDv0nRJt4ZqYQ5a3YOKr3DZoTbq5rmiNBpsdFOMumCGo3fTYhjA9Mc2/uaecW7sqyhSrjZZQJVjiIWYZD7TK/FkICgu0+mbOq9lzXOYo4V15FIq0Iq6C8p/ktL0uQ4NYcPLa4y3jf9v7N/IyciAi1ZpUNqWi0xKSAlEXfLwbBxErGuj2BbH8L0wuU65J7fjQ7qmdKuzV0jupfc4q9F8yNVfOqOR5jHfqog7lefoQPsZGhj1T+iYJtJ8H/NZU/5VUfuDxQlkjp2ISZm398FoFw71cd737ACrJgxrRHw8iOZOodqd8a7JGTdiQ9fgGgD1e4CXL09q/ewi7N4QjAmvALb7',
    user        => 'root',
}

ssh_authorized_key { "root@puppet.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAnMrXBqt+lirpEd7HpXK3NcZiod9xZICaYdJ6Mwkx0gkbtR7jbpMC76OE++Wzgm1SJuGXmbhWbdrQGaBgRcMKFTn2/YVFEmWIuWSG+fgmNvqNbxXVG6aPi6JohGjOrd9a7bDa8zU6KD1V5X+dzhYteRei7ipawM2Mqx0U8Fef15CmTg9jEIXjGfXymZixiKbYF15xlT/CA2F6SXYlYAjUYJvbvliFeOflXViBv/InwqsnkkxUXFW7iGJsEvf+4tjJeSvc7z0bC9hTmgBNnNplpHMdruWd8kxunKDPkfu9KeNSw8jwQsGS+AtqziM86N3R5h1suG2qNIM3wdmpa+apkw==',
    user        => 'root',
}

ssh_authorized_key { "root@loghost2.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA2TkR0eVS+rbvhEnt1UiF8oJSJiLa5IcaDJFMog7jKdjo6wYmpj/KEYJB9RiqOSSUzaL8MfS1M/Ut2DtZn6iQqOHVXkDRRbMXSMtCT+ftNo9wS23D5Jm6eW+gSEucyT9lVDBMOvqE1HyS4FtDxgv57PlQQWAeFuifjDLQlPE6b9+NrbBN7kzj48g0KUHSPyMVdvh1c+WRat9qF0MAe9QNl4ZFINMtAVLfw9DBaqMs945/Kr9DV85gFQuGwaz2ahw5HKCWfILgk9Dk83DdnU0yoSgCBK6796WSzv/dbtLTRzPAArL0GP0W3T5DdqLZsDH8p6PGjZCZbUI4eEAwCksYtQ==',
    user        => 'root',
}

ssh_authorized_key { "root@monitor.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAm7uQ8GyMqsFIiZMgoZe1vK+nn7nWRoIeRzNmVCQCZM4mcDoKYbGjf1Ad9WoLKIGb9sEkgr87CCTt8J+aGb07fUENldrY9UpS8rChodmbx+psurnMcEaP5LHxGGu8HM19mfBlHWngO1vDSy7av7fAFFLmNj82/Od6sdzIdVgndqay90/nidP1wUnJq4b+0En6aSYubN2C3JxsaZyK4pczBjtpDVu4GZ/Y5B6DCRp9J4TH72ZAsWUsz6JPsEb50MRQE8T8Iezl/S8H74IB7BPoqbee+2PEFvHeuFrduwwEtKRymPO9XihK+iK0LuTFbWmchHne6kVBUko2VH0hAF5CMQ==',
    user        => 'root',
}

ssh_authorized_key { "root@colo-utils-01.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAzV8leKnj4kiGr6u+fdN7xE0k3LETjmMyGRJxi4/KMQotLta2eRrLH3icKL+juWdf5lH6mWW4ZwIzc6Mc9xGrd9n9wSUAz6+lOBxvg/ULjkZEp487BhKSWrsNJf9doMKQPeatvAUC4qeown4Rm//wDiihRYUiaNsYFhauiWteFzMW3kXJLhWnBHwFRQ71TXlqLl9d6LP9tudHnlRMJPmWy7PVlgEjkEcjZ1nHUUQpAyxwz21upcZrZINmAAFA0WRpDPzEs7T/he1Iiqqo0EST9ZC7s1aWOLspCVBNf9Fp/qVPBEAHbxAKy91n0PYf+e11WomtwPO7ArbIoqlKpVa9LQ==',
    user        => 'root',
}

ssh_authorized_key { "root@colo-utils-02.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAvu0RmhqKmT8xCOOxFxhAbeUqMyoLD2vEbYe/lPhd+2g1vjUaf/ogwlFQNZjzyKKPN8IJIlhKZLDwIhQTk5BEsyisjc2SAk+SswCa3U+IiTo8KkwSDp4J5YAOQBky/Y19Y8qlNDBzW6OJm227qTtbRLEJk306fGOgLOwfldVMp5JaezziPiiSFcFB2L7TXOGSxNip/oueXdLNGMhw+P+OHIpOR6L379CzyzuKXMJpwUUPY/h4EltyVDJ4bk0H+FNqHDn+YZxWGKaaUBBm1hb8CFlWFFyFgkHZYWK88+TuaTJqgmhIcB9ws8oG+zamgQ7fA1/7vAuCYjpLKdKMYG7rKw==',
    user        => 'root',
}

ssh_authorized_key { "nagios@loghost.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA18VWTOHx10adiR7CScLU6FrNc/yLEvKSe5Q3nmmilo2KbQQQ3zv0K1zUGY72KyCgGhIO+iiHwAwa5vv67hkW2wjd5o4NSy0Ls4BxVBNh72WOO+/rxnVCPZ80/FY0wDhRZV1b48mChoAYPa5DE6XUKcARNiuD/OKJdc7u/K7OZGjuC/Yd8InI4XH2OOy1Qb1GId6Dljddx+lNFHnU+BTXnGEEHJyVYqMQdst8ML1v1qxtjyo0gicW9tBIh1Zf/fvlGyAmPNK1OGLA7OGPPBpuwp9d1muxq8CQnHm+HHwprU5Acf4PyhhkV9I/0GvbEQ9HyCEhxI1YVMm+rcCOeo8iQQ==',
    user	=> 'nagios',
}

ssh_authorized_key { "nagios@monitor.podzinger.local":
    ensure      => present,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAlYWOr37eP6xR3Teppu/6G3pdG1BzJicWqdxazzE+SoFUhc2FkMVrmaBJieC/WMGwrA5YlH704H/xFEobEvuZJzAZRcRPbXl1jZfW4s37KHt5TbeXJPJRygM0o3TEhjVVv7j5dzzKoZKSFtJC83xeyunwArC1PsZvkeI1psHOnu5Tn0zBxlvaX0GQhNL4MVaL/YCN6HlNPZHigaizlFMvcXBT+czBuIUBQQ9uOWIXNgDCZEmZsPu6NdX4b/U2/mITg9q0+OkTvaMBJJ2Oa4N1RM1DbRG8cQ8uF6iH+j1nUdNHgCh8/DXkiEJRlBiIc9n/Vvt0GdH/d4+LVbxq4l1TAw==',
    user        => 'nagios',
}


ssh_authorized_key { "root@colo-utils-01":
    ensure      => absent,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAIEAqW7+9yiu4WnEpjbaWoyWlMkN6GL7W/rmo0yRZeXVMIGiVXNs1n+qAAKR7pXsm37Vq9HyM7nPIXayFzcb7fSTZVBCHFykrmFiZ7aaVlzim/+toOzzpO4Hm/DRdhKyoCa6LDn7O8jhmDf0/XVfONKG8BwnRIWBxeYqTF98bV9SSAs=',
    user        => 'root',
}

ssh_authorized_key { "root@monitor":
    ensure      => absent,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAIEAySFhP+F0+Vkkpgj1hDgii3q231ffMu4dw5yyuPoZz2CdFN7W5p9njQ+lReI1SeWRbkVLc/85seqKpeLIIyT3IvHd6/E/dLNwkQhBs+aD1s1SfdLKzYMZ1IsODAcgZocwr4lieLjFx8dQxRfedKXnoIts3glbmUqUmZ7Pa+67Ijs=',
    user        => 'root',
}

#ssh_authorized_key { "root@monitor.podzinger.local":
#    ensure      => absent,
#    type        => 'ssh-rsa',
#    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAr5mfRRErwNBRWYk+yjg5linKPyE2fRLCjodClV4NFJ6Aqr6p+PDb0g4vx55VijN8R3VUapPuSZNev0XZ0iBcIGd5RenKczBTzsU2m5zvalGpTpP5101rWp7PIXiDNS8h2UjU+Thxcsohrw/sJsGc682PQAkajm61Tfy1PMNQRtj1NRvMFGsD4dSHu14T0lxkkRREqK1v8zvh5i7MX/YTYUBcOAgTekKHnKEn4nZ8I/d6sH9eZc0eAYL/cnLu9fYVSPpt4SMbjJ9gFlr2MBaU0bPl46ZFRsyGiKnMbUrGpZJb4eUpnfY5geEbolAmqKk0TIuOWu+Cb2OLKVh9YzgbmQ==',
#    user        => 'root',
#}

ssh_authorized_key { "root@colo-utils-02":
    ensure      => absent,
    type        => 'ssh-rsa',
    key         => 'AAAAB3NzaC1yc2EAAAABIwAAAIEA+tqp0Ol6uiMpWWB05YYu2NyCdG8Ixm4o4pcbGYZNnmy0zvf4hXwPQ1aWx6dWWgHkwFU7ESAVGTY97rD78GkeFE8RG6+VVZSrd/gtEijEXb+uABv7uIauXSWs74yrAyn0XbOM4A8Xz5myP1JdMzmme/96JC2s7VgbA8JTPTD2DD8=',
    user        => 'root',
}

}
