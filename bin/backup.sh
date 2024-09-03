#!/bin/bash

tar cvzf /backup/backup_`date +%m%d`.tar.gz /home
	if [ $? -eq 0 ] ; then           /* -eq : equal */
		echo "[	 OK	 ] backup success"
	else
		echo "[ Error ] backup failed"
	fi
