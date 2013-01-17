# Password Length should be 8 chars
#!/bin/bash
passwd=0P71p!@x
openssl passwd -crypt $passwd
