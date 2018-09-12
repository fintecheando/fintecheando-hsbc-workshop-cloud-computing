#Removing the QM from the cluster
QMGR=$(hostname | tr -dc '[:alnum:]\n\r' | tail -c 8 | tr '[:lower:]' '[:upper:]')

echo "ALTER CHANNEL(TO.$QMGR.TMX01) CHLTYPE(CLUSRCVR) CLUSTER('')" | runmqsc $QMGR
echo "ALTER CHANNEL(TMXREPO01.TMX01) CHLTYPE(CLUSSDR) CLUSTER('')" | runmqsc $QMGR 
