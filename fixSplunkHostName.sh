# set host name if not correctly set

file=/opt/splunk/etc/system/local/server.conf

if grep -q serverName $file ; then
	string=$(grep serverName $file)
	if ! echo $string |grep -q $HOSTNAME; then 
		sed -i "s/$string/serverName = $HOSTNAME/g" $file
	fi
fi

#/opt/splunk/bin/splunk start
