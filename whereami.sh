#!/bin/bash

magenta='\033[0;35m'
clear='\033[0m'

extIP=$(curl -s ipinfo.io/ip)
basicLocDataQuery=$(curl -s https://ipinfo.io/$extIP | jq '.city, .region, .country')
addLocData=$(curl -s https://ipinfo.io/$extIP | jq '.loc')

basicLocData=""

for str in $basicLocDataQuery
do
	basicLocData+="$str, "
done

printf "${magenta}Your external IP address is:${clear} $extIP%s\n"
printf "${magenta}Location:${clear} $basicLocData%s\n"
printf "${magenta}GeoLoc address:${clear} $addLocData%s\n"
