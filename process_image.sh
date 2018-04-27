#!/bin/bash

rm photos/output.jpg
rm photos/output_border.jpg
dw=$(ls photos -tp | grep -v '/$' | head -n +4)
ta=$(echo $dw | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }')
(cd photos && montage $ta -tile 2x2 -border 5 -geometry +10+10 -density 300 -units PixelsPerInch output.jpg)
(cd photos &&  montage output.jpg -border 35 -bordercolor "#ffffff" -density 300 -units PixelsPerInch -geometry +0+0 output_border.jpg)
lp -d Canon_SELPHY_CP1200_USB -o raw photos/output_border.jpg
