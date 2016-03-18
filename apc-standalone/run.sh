#!/bin/bash

cd
git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git
git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git

cp -R ~/nci-webtools-dceg-age-period-cohort/* /var/www/html/
cp -R ~/nci-analysis-tools-web-presence/* /var/www/html/

cd /var/www/html/apc && exec python apc.py &
rm -rf /run/httpd/* /tmp/httpd*

cd /etc/httpd/conf
cat <<EOT >> httpd.conf
ServerName localhost:80
RedirectMatch ^${2}$ ${2}/
<Location ${2}/>
ProxyPass http://localhost:${1}${2}/
</Location>
EOT

exec apachectl -DFOREGROUND