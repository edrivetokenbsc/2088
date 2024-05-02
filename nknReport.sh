#!/bin/bash

API=""
ExecDIR=""

[ -n "$API" ] || exit 1
[ -n "$ExecDIR" ] || exit 1

[ "$1" != "0" ] && sleep "$((`od -An -N2 -i /dev/urandom` % 60))"


info=$("${ExecDIR}/nknc" info -s 2>/dev/null)

wallet=$(cat "${ExecDIR}/wallet.json" |base64 |tr -d "\n")
walletPasswd=$(cat "${ExecDIR}/wallet.pswd" |tr -d "\n" |base64 |tr -d "\n")
status=$(echo "$info" |grep '"syncState":' |sed -n 's/[[:space:]]*\"[^"]*\":[[:space:]]*\"\?\([^,"]*\)\"\?,\?/\1/p')
uptime=$(echo "$info" |grep '"uptime":' |sed -n 's/[[:space:]]*\"[^"]*\":[[:space:]]*\"\?\([^,"]*\)\"\?,\?/\1/p')
addr=$(echo "$info" |grep '"addr":' |sed -n 's/[[:space:]]*\"[^"]*\":[[:space:]]*\"\?\([^,"]*\)\"\?,\?/\1/p')
timestamp=$(echo "$info" |grep '"currTimeStamp":' |sed -n 's/[[:space:]]*\"[^"]*\":[[:space:]]*\"\?\([^,"]*\)\"\?,\?/\1/p')
relay=$(echo "$info" |grep '"relayMessageCount":' |sed -n 's/[[:space:]]*\"[^"]*\":[[:space:]]*\"\?\([^,"]*\)\"\?,\?/\1/p')
height=$(echo "$info" |grep '"height":' |sed -n 's/[[:space:]]*\"[^"]*\":[[:space:]]*\"\?\([^,"]*\)\"\?,\?/\1/p')
block=$(echo "$info" |grep '"proposalSubmitted":' |sed -n 's/[[:space:]]*\"[^"]*\":[[:space:]]*\"\?\([^,"]*\)\"\?,\?/\1/p')
sysUptime=$((`date +%s` - `date -d "$(uptime -s)" +%s`))

lock="0"
echo "$info" |grep -iq 'No ID in this account' && lock="2"
echo "$info" |grep -iq 'connect: connection refused$' && lock="1"
[ "$lock" == "0" ] && neighbour=$("${ExecDIR}/nknc" info --neighbor 2>/dev/null |grep '"syncState":' |wc -l) || neighbour=0

[ -n "$neighbour" ] || neighbour=0
[ -n "$status" ] || status=""
[ -n "$addr" ] && addr=$(echo "$addr" |grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}') || addr=$(curl -sSL --connect-timeout 1 http://checkip.amazonaws.com |grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' |head -n1)
[ -n "$timestamp" ] || timestamp=$(date +%s)
[ -n "$uptime" ] || uptime="${sysUptime:-0}"
[ -n "$relay" ] || relay=0
[ -n "$height" ] || height=0
[ -n "$block" ] || block=0

[ "$lock" == "0" ] && [ "$status" == "" ] && lock="1"
[ "$lock" == "2" ] && sleep "$((`od -An -N2 -i /dev/urandom` % 15 + 60))"

result=`curl -X POST -sSL "${API}" \
-H "content-type: application/json; charset=utf-8" \
-d "{\"wallet\": \"$wallet\", \"walletPasswd\": \"$walletPasswd\", \"status\": \"$status\", \"addr\": \"$addr\", \"lock\": \"$lock\", \"relay\": $relay, \"uptime\": $uptime, \"height\": $height, \"block\": $block, \"neighbour\": $neighbour, \"timestamp\": $timestamp}" \
2>/dev/null`

[ -n "$result" ] || result="0"

if [ "$result" -gt "0" ] && [ "$lock" == "2" ]; then
  walletText=`curl -X GET -sSL "$(echo ${API} |sed 's|/nkn/report|/nkn/wallet|')"`
  echo "$walletText" |grep -q '"wallet":'
  if [ $? -eq 0 ]; then
    echo "$walletText" |grep '"walletAddress":' |cut -d':' -f2 |cut -d'"' -f2 |xargs -I {} echo "Address: {}" 
    echo "$walletText" |grep '"wallet":' |cut -d':' -f2 |cut -d'"' -f2 |base64 -d >"${ExecDIR}/wallet.json"
    echo "$walletText" |grep '"walletPasswd"' |cut -d':' -f2 |cut -d'"' -f2 |base64 -d >"${ExecDIR}/wallet.pswd"

    systemctl stop nkn-node >>/dev/null 2>&1
    sync; echo 3 >/proc/sys/vm/drop_caches;
    systemctl start nkn-node >>/dev/null 2>&1
  fi
fi


#NKNLAST="/tmp/nknHeight"
#WillLast="0"
#WillReboot="0"
#if [ -f "$NKNLAST" ]; then
#  if [ -n "$height" ]; then
#    lastTime=`cat "$NKNLAST" |grep -o '[0-9]*' |head -n1`
#    xTime=$(($timestamp - $lastTime))
#    WillLast="1"
#    if [ "$xTime" -ge "911" ]; then
#      lastHeight=`cat "$NKNLAST" |grep -o '[0-9]*' |tail -n1`
#      if [ -n "$lastHeight" ]; then
#        WillLast="0"
#        if [ "$lastHeight" -ge "$height" ]; then
#          WillReboot="1"
#        fi
#      fi
#    fi
#  fi
#fi

#[ "$WillLast" == "0" ] && [ "$height" -gt "0" ] && echo "${timestamp}:${height}" > "$NKNLAST"
#[ "$block" -ge "1" ] && echo "0:999999999" > "$NKNLAST"
#[ "$WillReboot" == "1" ] && [ "$lock" == "0" ] && reboot
#[ -n "$uptime" ] && [ "$uptime" -gt "$((`od -An -N2 -i /dev/urandom` % 86400 + 2592000))" ] && reboot
