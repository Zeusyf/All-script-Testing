#! /bin/bash
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:/usr/local/cuda/lib64/stubs:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cuda/lib64/:/usr/local/cuda/lib64/stubs:$LIBRARY_PATH
export PATH=/usr/local/go/bin:/usr/local/cuda/bin/:$PATH
NVIDIA_COUNT=`nvidia-smi -L | wc -l`
echo "there has "$NVIDIA_COUNT "gpu"
str=""
for ((i=0; i < $NVIDIA_COUNT; i++))
do
 str=$str$i
 if [ $i -lt $[$NVIDIA_COUNT - 1] ]; then
  str=$str,
 fi
done

worker='test'
pool_uri='cuckoo.cortexmint.com:8008'
pool_uri_1='cuckoo.cortexmint.com:8008'
pool_uri_2='cuckoo.cortexmint.com:8008'
device=$str
account='0xb7eb4c0a5ff4d574f1fa21f1a9f316199422c56b'
start='./cortex_miner -pool_uri='$pool_uri' -pool_uri_1='$pool_uri_1' -pool_uri_2='$pool_uri_2' -worker='$worker' -devices='$str' -account='$account
echo $start
$start
