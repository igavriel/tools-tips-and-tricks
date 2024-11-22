#!/bin/bash

# Check if a file name is provided as an argument
if [ $# -eq 0 ]; then
    echo "No file name provided. Usage: $0 <filename>"
    exit 1
fi

# Extract the file name without the extension
filename=$(basename -- "$1")
extension="${filename##*.}"
filename_without_extension="${filename%.*}"
fname=

# Check if the file has an extension
if [ "$filename" == "$extension" ]; then
    # No extension case
    fname=$filename
else
    fname=$filename_without_extension
fi

mkdir -p out

echo File: $1
./collectl/collectl -P -scjmdnti -oTmGcu -p $1 > ./out/$fname.tab

pushd out

################ CPU ################
gnuplot << EOF
set terminal pngcairo size 1920,1080 enhanced font 'Arial,14'
set output '$fname-cpu.png'
set datafile separator ' '
set xdata time
set timefmt "%Y%m%d %H:%M:%S"
set format x "%H:%M:%S"
set grid
set key autotitle columnheader

# Plot CPU Usage
set title "CPU Usage Over Time - (File: $1)"
set xlabel "Time"
set ylabel "CPU Usage (%)"

plot '$fname.tab' using 1:(\$3) title 'User %' with lines, \
     '$fname.tab' using 1:(\$5) title 'System %' with lines, \
     '$fname.tab' using 1:(\$11) title 'Total %' with lines

# Save and close the output
set output

################ MEMORY ################
set output '$fname-memory.png'

set title "Memory Usage Over Time - (File: $1)"
set xlabel "Time"
set ylabel "Memory (KB)"

plot '$fname.tab' using 1:(\$25) title 'Used Memory' with lines

# Save and close the output
set output

################ NETWORK ################
set output '$fname-net.png'

set title "Network Usage Over Time - (File: $1)"
set xlabel "Time"
set ylabel "Network Pkt Total"

plot '$fname.tab' using 1:(\$53) title 'Rx Pkt Total' with lines, \
     '$fname.tab' using 1:(\$54) title 'Tx Pkt Total' with lines
# Save and close the output
set output

################ DISK ################
set output '$fname-disk.png'

set title "Disk Usage Over Time - (File: $1)"
set xlabel "Time"
set ylabel "Disk KB Total"

plot '$fname.tab' using 1:(\$65) title 'Read KB Total' with lines, \
     '$fname.tab' using 1:(\$66) title 'Write KB Total %' with lines
# Save and close the output
set output
EOF

popd