#!/bin/sh

QMGR=$(hostname | tr -dc '[:alnum:]\n\r' | tail -c 8 | tr '[:lower:]' '[:upper:]')

#Creating QM in the cluster

crtmqm -u SYSTEM.$QMGR.DEAD.LETTER.QUEUE $QMGR
strmqm $QMGR

echo "DEF CHANNEL(TO.%QMGR%.TMX01)" \
		"CHLTYPE(CLUSRCVR) TRPTYPE(TCP)" \
		"CONNAME('fintecheando-wmq-repo-01.bitnamiapp.com(16000)')" \
		"CLUSTER(TMX01)" >%QMGR%.in
		
echo "DEF CHANNEL(TO.TMXREPO01.TMX01)" \
		"CHLTYPE(CLUSSDR)" \
		"TRPTYPE(TCP)" \
		"CONNAME('fintecheando-wmq-repo-01.bitnamiapp.com(16000)')" \
		"CLUSTER(TMX01)" >%QMGR%.in
		
echo "DEF LISTENER(LSTR.16000) TRTYPE(TCP) PORT (16000) CONTROL(QMGR)" >%QMGR%.in

runmqsc $QMGR <%QMGR%.in >%QMGR%.out

type %QMGR%.out

pause
