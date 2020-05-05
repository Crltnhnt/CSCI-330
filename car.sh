#! /bin/bash
echo ""
if [ "$#" -ne 3 ]; then
        echo "Usage is ./car.sh car_make -b price"
        echo "      or ./car.sh car_make -l lease_months"
	echo ""
	exit
fi
price=$3

echo "The date of this estimate is $(date)"
echo ""

if [ "$2" = "-b" ]; then
	price=$(($price+500))
	echo "Buying a $l at a price of $price including setup fee (\$500)"
	price=$(($price+$price*8/100))
	echo "and sales tax (8 percent) will end up totaling: \$$price"
elif [ "$2" = "-l" ]; then
	let price=$3*400
	echo "Leasing a $l for $3 months at aprice of \$400 per month"
	if [ "3" -gt 24 ]; then
	let price+=($price*3/100)
	echo "with 3 percent interest will end up costing: \$$price"
	else
		let price+=($price*2/100)
		echo "with 2 percent interest will end up costing: \$$price"
		fi
else
	echo "The only valid options are -b to buy and -l to lease."
fi
echo ""
echo ""
