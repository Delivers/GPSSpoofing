#!/bin/sh
day=$(date +%j)
year=$(date +%Y)
yr=$(date +%y)

# curl -c /tmp/cookie -n -L -o "brdc""$day""0.$yr""n.gz" "https://cddis.nasa.gov/archive/gnss/data/daily/$year""/brdc/brdc""$day""0.$yr""n.gz"

wget "ftps://gdc.cddis.eosdis.nasa.gov/pub/gps/data/daily/$year""/brdc/brdc""$day""0.$yr""n.gz"

echo "https://cddis.nasa.gov/archive/gnss/data/daily/$year""/brdc/brdc""$day""0.$yr""n.gz"
uncompress -f "brdc""$day""0.$yr""n.gz"
echo "brdc""$day""0.$yr""n.gz"


sudo ./gps-sdr-sim -e "brdc""$day""0.$yr""n" -l 0.000000,0.000000,100
# sudo hackrf_transfer -t gpssim.bin -f 1575420000 -s 2600000 -a 1 -x 0 -R
sudo bladeRF-cli -s bladerf2.script
