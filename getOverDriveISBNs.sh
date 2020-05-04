# getOverDriveISBNs.sh
# James Staub
# Nashville Public Library
# Composes monthly OverDrive eAudiobook ISBN report and emails them as csv attachments

DATE=`date --date="$(date +%Y-%m-%d)" "+%Y%m%d"`;
HOST=$(cat /etc/hostname)

if [ "$HOST" == "hobvmplap07.pubnet.metro" ]
	then
		MAILTO="bryan.n.jones@nashville.gov james.staub@nashville.gov RSelhorst@midwesttapes.com JCousino@midwesttapes.com"
fi

/bin/php getOverDriveISBNs.php;

echo "Nashville to hoopla: Monthly OverDrive eAudiobook report" \
	| mail -s "Nashville to hoopla: Monthly OverDrive eAudiobook report $DATE" \
		-a /home/scarless/data/getOverDriveISBNs.csv \
		-r james.staub@nashville.gov $MAILTO;
