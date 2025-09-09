#!/bin/sh

set -e

cd `dirname $0`

cp test_*.py ../notebooks
cp strip_errors.py ../notebooks

cd ../notebooks

rm -f homework.nbconvert.ipynb homework.py
jupyter nbconvert --to notebook --execute homework.ipynb --allow-errors
./strip_errors.py homework.nbconvert.ipynb homework.stripped.ipynb
jupyter nbconvert --to script homework.stripped.ipynb --output homework

python3 -m unittest --failfast $*
