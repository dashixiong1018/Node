#!/bin/bash

git clone https://github.com/conduitxyz/node.git
cd node
./download-config.py zora-mainnet-0
export CONDUIT_NETWORK=zora-mainnet-0
cp .env.example .env

# 输入对应L1 RPC信息
read -p "请输入对应L1ETH的RPC网址: " OP_NODE_L1_ETH_RPC

# 将用户输入的值写入.env文件
sed -i "s|OP_NODE_L1_ETH_RPC=.*|OP_NODE_L1_ETH_RPC=${OP_NODE_L1_ETH_RPC}|" .env

# Docker组建
docker-compose up --build -d
