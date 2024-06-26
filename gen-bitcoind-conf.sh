SIGNETCHALLENGE=${SIGNETCHALLENGE:-$(cat ~/.bitcoin/SIGNETCHALLENGE.txt)}

RPCAUTH=$(/usr/local/bin/rpcauth.py $RPCUSER $RPCPASSWORD | tr -d '\n')
echo "signet=1"

if [[ "$COOKIEFILE" == "true" ]]; then
echo "rpccookiefile=/root/.bitcoin/.cookie
rpcauth=$RPCAUTH"
else
echo "rpcauth=$RPCAUTH
rpcuser=$RPCUSER
rpcpassword=$RPCPASSWORD"
fi

echo "txindex=1
blockfilterindex=1
peerblockfilters=1
coinstatsindex=1
dnsseed=0
persistmempool=1
uacomment=$UACOMMENT"

if [[ "$EXTERNAL_IP" != "" ]]; then
    echo $EXTERNAL_IP | tr ',' '\n' | while read ip; do
        echo "externalip=$ip"
    done
fi

echo "[signet]
daemon=1
listen=1
server=1
discover=1
signetchallenge=$SIGNETCHALLENGE
zmqpubrawblock=$ZMQPUBRAWBLOCK
zmqpubrawtx=$ZMQPUBRAWTX
zmqpubhashblock=$ZMQPUBHASHBLOCK
rpcbind=$RPCBIND
rpcallowip=$RPCALLOWIP
whitelist=$WHITELIST
signetblocktime=$SIGNETBLOCKTIME
fallbackfee=0.0002"

if [[ "$ADDNODE" != "" ]]; then
    echo $ADDNODE | tr ',' '\n' | while read node; do
        echo "addnode=$node"
    done
fi
 
if [[ "$I2PSAM" != "" ]]; then
    echo "i2psam=$I2PSAM"
fi

if [[ "$ONIONPROXY" != "" ]]; then
    echo "onion=$ONIONPROXY" # unless have static IP won't resolve the control port as domain
fi

if [[ "$TORPASSWORD" != "" ]]; then
    echo "torpassword=$TORPASSWORD"
fi

if [[ "$TORCONTROL" != "" ]]; then
    echo "torcontrol=$TORCONTROL"
fi

if [[ "$DBCACHE" != "" ]]; then
    echo "dbcache=$DBCACHE"
fi

if [[ "$PAR" != "" ]]; then
    echo "par=$PAR"
fi

if [[ "$RPCWORKQUEUE" != "" ]]; then
    echo "rpcworkqueue=$RPCWORKQUEUE"
fi

if [[ "$MAXCONNECTIONS" != "" ]]; then
    echo "maxconnections=$MAXCONNECTIONS"
fi

if [[ "$TIMEOUT" != "" ]]; then
    echo "timeout=$TIMEOUT"
fi

if [[ "$RPCTHREADS" != "" ]]; then
    echo "rpcthreads=$RPCTHREADS"
fi

if [[ "$RPCSERVERTIMEOUT" != "" ]]; then
    echo "rpcservertimeout=$RPCSERVERTIMEOUT"
fi

