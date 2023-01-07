#! /vendor/bin/sh

SILENT_LOGGING_9900=/data/vendor/gps/silentGnssLogging
SILENT_LOGGING_ISSUETRACKER=/data/vendor/gps/silentGnssLoggingIssueTracker
GSI_IMAGE=/data/vendor/gps/GSI

CONFIGFILE=/vendor/etc/gnss/gps.xml
DAEMONFILE=/vendor/bin/hw/gpsd

if [ -d "$SILENT_LOGGING_ISSUETRACKER" ] ; then 
	CONFIGFILE=/vendor/etc/gnss/gps.issuetracker.xml
fi

if [ -d "$SILENT_LOGGING_9900" ] ; then 
	CONFIGFILE=/vendor/etc/gnss/gps.debug.xml
fi

if [ -d "$GSI_IMAGE" ] ; then 
    CONFIGFILE=/vendor/etc/gnss/gps.gsi.xml
    if [ -e "$CONFIGFILE" ] ; then
        CONFIGFILE=/vendor/etc/gnss/gps.gsi.xml
    else
        CONFIGFILE=/vendor/etc/gnss/gps.xml
    fi
fi

exec $DAEMONFILE -c $CONFIGFILE
