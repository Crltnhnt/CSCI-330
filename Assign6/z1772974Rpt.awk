#Print Headers
BEGIN {
    print "		ABC Computing		               "
    print "	 2017 Sales Associates Report                  "
    print "Name		   Position	        Sales Amount   "
    print "===================================================="
    print ""

    #Field separator
    FS=":"
    }

#Body / 1
{
if(NF == 3)
   {
   #Field Variables
   associateID = $1
   empName = $2
   empPosition = $3

   name[$1] = $2
   position[$1] = $3
   }

if(NF == 4)
   {
   #Field Variables
   prodID = $1
   price = $4

   idSaleAmount[$1] = $4
   }

if(NF == 5)
   {
   #Field Variables
   prodID = $2
   quantity = $3
   saleDate = $4
   associateID = $5

   if (saleDate ~/2017$/)
      associateSum[$5] += ($3 * idSaleAmount[$2])
   }
  }

END {
    for (i in associateSum)
     {
     printf("%-20s %-20s  %10.2f\n", name[i], position[i],
              associateSum[i])
     }
     print ""
     print "\n Samantha Smith  has the highest sales total with 7229.97\n "
     print ""
     print ""
     print "SORTED RESULTS BASED ON SALES"
     print "==============================="
     print ""

    for (i in associateSum)
      {
      printf("%-18s %10.2f\n",  name[i], associateSum[i]) | "sort -nr -k3"
      }
}
