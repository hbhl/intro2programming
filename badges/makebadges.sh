#!/bin/bash

mkdir -p completedbadges

IFS=$'\r\n'
set -f

for line in $(cat < "$1");
do
    echo $line | cut -d ',' -f 1
    cp incf_brainhack_2018_badge_front_template.svg tmp.svg
    sed -i -e "s/{First}/"`echo $line | cut -d ',' -f 1`"/g" tmp.svg
    sed -i -e "s/{Last}/"`echo $line | cut -d ',' -f 2`"/g" tmp.svg
    sed -i -e "s/{PositionAtEvent}/"`echo $line | cut -d ',' -f 3`"/g" tmp.svg
    rsvg-convert -f pdf -o "completedbadges/incf_brainhack_2018_badge_front_"`echo $line | cut -d ',' -f 2``echo $line | cut -d ',' -f 1`".pdf" tmp.svg
done
