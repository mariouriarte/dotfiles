#! /bin/bash

# test for root

    if [[ $EUID -ne 0 ]]
    then
        printf "%s\n" "This script must be run as root" 
        exit 1
fi

read -d "\0" -a number_of_gpus < <(nvidia-smi --query-gpu=count --format=csv,noheader,nounits)
printf "%s\n" "found ${number_of_gpus[0]} gpu[s]..."

index=$(( number_of_gpus[0] - 1 ))

for i in $(seq 0 $index)
    do
       if nvidia-smi -i $i --query-gpu=name --format=csv,noheader,nounits | grep -E "1070" 1> /dev/null
       then 
           printf "%s\n" "found GeForce GTX 1070 at index $i..."
           printf "%s\n" "setting persistence mode..."
           nvidia-smi -i $i -pm 1
           printf "%s\n" "setting power limit to 100 watts.."
           nvidia-smi -i $i -pl 160
           #printf "%s\n" "setting memory overclock of 1000 Mhz..."

           nvidia-settings -c :0 -a [gpu:${i}]/GPUMemoryTransferRateOffset[3]=1000
           nvidia-settings -c :0 -a [gpu:${i}]/GPUGraphicsClockOffset[3]=100
           
       fi 
done

