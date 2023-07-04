Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash
sudo su
echo 'Host name:<b> ' $HOSTNAME  '</b><br>' > index.html
echo 'Instance id:<b> ' `wget -q -O - http://169.254.169.254/latest/meta-data/instance-id` '</b><br>' >> index.html
echo  'Avalibility Zone: <b>' `wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone` '</b><br>' >> index.html
python3 -m http.server 80