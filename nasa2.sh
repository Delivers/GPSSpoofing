#!/bin/bash
day=$(date +%j)
year=$(date +%Y)
yr=$(date +%y)

# curl -c /tmp/cookie -n -L -o "brdc""$day""0.$yr""n.gz" "https://cddis.nasa.gov/archive/gnss/data/daily/$year""/brdc/brdc""$day""0.$yr""n.gz"

wget "ftps://gdc.cddis.eosdis.nasa.gov/pub/gps/data/daily/$year""/brdc/brdc""$day""0.$yr""n.gz" -P /home/ubuntu/gps-sdr-sim/

echo "https://cddis.nasa.gov/archive/gnss/data/daily/$year""/brdc/brdc""$day""0.$yr""n.gz"
uncompress -f /home/ubuntu/gps-sdr-sim/"brdc""$day""0.$yr""n.gz"
echo "brdc""$day""0.$yr""n.gz"


sudo /home/ubuntu/gps-sdr-sim/gps-sdr-sim -e /home/ubuntu/gps-sdr-sim/"brdc""$day""0.$yr""n" -l 5.5631,-0.1918,10 -d 600
# sudo hackrf_transfer -t gpssim.bin -f 1575420000 -s 2600000 -a 1 -x 0 -R
sudo bladeRF-cli -s /home/ubuntu/gps-sdr-sim/bladerf2.script
