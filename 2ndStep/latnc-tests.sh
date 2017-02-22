#!/bin/bash
#the controller ip should be changed in cntr_server to the corresponding IP
#defining the number of times to lunch the command
run='1 2 3'
#number of swithces
switch='1 4 8 16 24 32 40 52 64 80 100 160 208 256'
#number of hosts
mac='10 100 1000 10000 100000 1000000 10000000'
#defining the ip adresses where cbench and th controller were put
cbench_serv="localhost"
contr_serv="59.11.218.12"
#duration and number of loops for every lunch
dur=10000
loop=10
#file where to store the results
log="latnc_log"

#the test
for s in $switch;
do
   for m in $mac;
   do
      for i in $run;
      do
         text= "switches: $s hosts: $m runs $i"
	 cmd= "$(cbench -c $contr_serv -m $dur -l $loop -s $s -M $m)";
      done
   echo $text >> $log
   echo -e "$cmd \n" >> $log
   echo "=============================================" >> $log
   done
done
