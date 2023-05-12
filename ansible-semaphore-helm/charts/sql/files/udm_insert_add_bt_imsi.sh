#!/bin/bash

usage() { echo "Usage: $0 [-u <number of UEs>(50)] [-c <mcc>(001)] [-n <mnc>(01)] -[b <base_id>(1722300000)]" 1>&2; exit 1; }

MCC="001"
MNC="01"
BASE_ID="1722300000"
UE_COUNT=50
DEBUG=0

while getopts ":u:c:n:hd" o; do
	case "${o}" in
		u)
			UE_COUNT=${OPTARG}
			;;
		n)
			MNC=${OPTARG}
			;;
		c)
			MCC=${OPTARG}
			;;
		d)
			DEBUG=1
			;;
		*|h)
			usage
			;;
	esac
done
shift $((OPTIND-1))

if [ -z "${UE_COUNT}" ] || [ -z "${MNC}" ] || [ -z "${MCC}" ]; then
	echo "parameter missing.."
	usage
fi

t=$(tempfile) || exit
trap "rm -f -- '$t'" EXIT

#232170000013328
#232
#   17
#     1722300000

printf "BASE IMSI: %03d%02d%010d\n" $MCC $MNC $BASE_ID
for ((CNT=0;CNT<$UE_COUNT;CNT++))
do
	ID=$(($BASE_ID + $CNT))
	IMSI=$(printf "%03d%02d%010d" $MCC $MNC $ID)
	#echo "#IMSI:     $IMSI"
	printf 'INSERT INTO `supi` VALUES (0,"%s",0x00000000000000000000000000000000,0x8000,0x00000000000000000000000000000000,"000000000010", 0, 0, 0);\n' $IMSI >>$t
done
if [[ $DEBUG == 0 ]]; then
	echo "added $CNT IMSI in $t"
	mysql udm_db < "$t"
else
	echo "count: $CNT sqlfile: $t"
	cat $t
fi

rm -f -- "$t"
trap - EXIT
