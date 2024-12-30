#!/bin/bash

docker run -d -it \
--name hyperlane \
--mount type=bind,source=/root/hyperlane_db_base,target=/hyperlane_db_base \
gcr.io/abacus-labs-dev/hyperlane-agent:agents-v1.0.0 \
./validator \
--db /hyperlane_db_base \
--originChainName base \
--reorgPeriod 1 \
--validator.id $NAME \
--checkpointSyncer.type localStorage \
--checkpointSyncer.folder base \
--checkpointSyncer.path /hyperlane_db_base/base_checkpoints \
--validator.key $PRIVATE \
--chains.base.signer.key $PRIVATE \
--chains.base.customRpcUrls $RPC
