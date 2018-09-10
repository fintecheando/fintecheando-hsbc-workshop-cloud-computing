#Creating QM in the cluster
QMGR=$(hostname | tr -dc '[:alnum:]\n\r' | tail -c 8 | tr '[:lower:]' '[:upper:]')
#Creating QM in the cluster

echo "crtmqm -u SYSTEM.$QMGR.DEAD.LETTER.QUEUE $QMGR"
echo "strmqm $QMGR"

echo DEF CHANNEL(TO.%QMGR%.TMX01) CHLTYPE(CLUSRCVR) TRPTYPE(TCP) CONNAME('CONNAME()') CLUSTER(TMX01) >%QMGR%.in
echo DEF CHANNEL(TO.TMXREPO01.TMX01) CHLTYPE(CLUSSDR) TRPTYPE(TCP) CONNAME('CONNAME(16000)') CLUSTER(TMX01) >%QMGR%.in

runmqsc %QMGR% <%QMGR%.in >%QMGR%.out
type %QMGR%.out

pause
