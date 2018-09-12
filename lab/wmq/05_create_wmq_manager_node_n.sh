#!/bin/sh
:
QMGR=$(hostname | tr -dc '[:alnum:]\n\r' | tail -c 8 | tr '[:lower:]' '[:upper:]')

#Creating QM in the cluster

crtmqm -u SYSTEM.$QMGR.DEAD.LETTER.QUEUE $QMGR
strmqm $QMGR

<<<<<<< HEAD
echo "DEF CHANNEL(TO.$QMGR.TMX01)" \
		"CHLTYPE(CLUSRCVR)" \
		"TRPTYPE(TCP)" \
		"CONNAME('fintecheando-wmq-repo-01.bitnamiapp.com(16000)')" \
		"CLUSTER(TMX01)" >>%QMGR%.in
=======
echo "DEF CHANNEL(TO.%QMGR%.TMX01)" \
		"CHLTYPE(CLUSRCVR) TRPTYPE(TCP)" \
		"CONNAME('fintecheando-wmq-repo-01.bitnamiapp.com(16000)')" \
		"CLUSTER(TMX01)" >%QMGR%.in
>>>>>>> 636833aadb3a570eb34452169db8fc2658afb550
		
echo "DEF CHANNEL(TO.TMXREPO01.TMX01)" \
		"CHLTYPE(CLUSSDR)" \
		"TRPTYPE(TCP)" \
		"CONNAME('fintecheando-wmq-repo-01.bitnamiapp.com(16000)')" \
<<<<<<< HEAD
		"CLUSTER(TMX01)" >>%QMGR%.in
		
echo "DEF LISTENER(LSTR.16000) TRPTYPE(TCP) PORT(16000) CONTROL(QMGR)" >>%QMGR%.in
=======
		"CLUSTER(TMX01)" >%QMGR%.in
		
echo "DEF LISTENER(LSTR.16000) TRTYPE(TCP) PORT (16000) CONTROL(QMGR)" >%QMGR%.in
>>>>>>> 636833aadb3a570eb34452169db8fc2658afb550

runmqsc $QMGR <%QMGR%.in >%QMGR%.out


