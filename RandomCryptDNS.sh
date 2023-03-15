#!/bin/bash

echo "Start set Random DNS server."

path="/etc/dnscrypt-proxy/dnscrypt-proxy.toml"

nameDB="ListDNS.db"
pathAct=$(pwd)
pathList="$pathAct/$nameDB"

echo "$pathList"

old="default."
new="defailt."

i=0
old_id=0
new_id=0
end_id=0

while IFS= read -r line
do
        if [[ "$line" == *"[>]"* ]];
        then
                old_id=$i
                printf "\033[94m\033[100m$old_id|$line\033[0m \n"
                old=${line:6}
        fi

	echo "$line"

        ((i++))

        end_id=$i
done < $pathList

for (( j=1; j <= 10; j++ ))
do
        let "new_id = $RANDOM % $end_id"

        if [ $new_id -eq  $old_id ]
        then
                echo "Random id = old id DNS server."
        else
                break
        fi
done

i=0

while IFS= read -r line
do
        if [ $new_id == $i ]
        then
                printf "\033[92m\033[100m$i|$line\033[0m \n"
                new=${line:6}
                break
        fi

        ((i++))
done < $pathList

echo "Old DNS server = $old_id:$old"

echo "New DNS server = $new_id:$new"

let "new_id += 1"
sed -i 's/[>]/*/' $pathList

sed -i ''$new_id's/[*]/>/' $pathList

sed -i 's/'$old'/'$new'/' $path

systemctl restart dnscrypt-proxy

echo "End set random DNS server Check go to URL:https://www.dnsleaktest.com/results.html"

