#!/bin/bash

for file in $(ls t*);
do 
	echo $file;
	iconv -f latin1 -t utf-8 $file > 'utf_'$file;
done

split -l 15000 utf_test.enc dev
mv devaa utf_dev.enc
mv devab utf_test.enc

split -l 15000 utf_test.dec test
mv testaa utf_dev.dec
mv testab utf_test.dec
