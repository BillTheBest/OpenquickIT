#!/bin/sh

wget 'http://www.extjs.com/products/extjs/download.php?dl=extjs303'
unzip 'ext-3.0.3.zip'
mv ext-3.0.3/* .
rm -rf 'ext-3.0.3' 'ext-3.0.3.zip'

