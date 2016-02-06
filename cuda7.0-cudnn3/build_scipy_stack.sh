#!/usr/bin/env bash

set -xe

mkdir /tmp/build
cd /tmp/build
git config --global url.https://github.com/.insteadOf git://github.com/

git clone -q https://github.com/numpy/numpy.git
cp /tmp/numpy-site.cfg numpy/site.cfg

git clone -q https://github.com/scipy/scipy.git
cp /tmp/scipy-site.cfg scipy/site.cfg

apt-get -y update
apt-get -y install git-core build-essential gfortran python3-dev curl
apt-get build-dep -y python3 python3-numpy python3-scipy python3-matplotlib cython3 python3-h5py
apt-get install -y build-essential python3-dev

curl https://bootstrap.pypa.io/get-pip.py | python2
curl https://bootstrap.pypa.io/get-pip.py | python3

apt-get -y remove cython

for PYTHONVER in 2 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

  $PIP install --upgrade cython

  # Build NumPy and SciPy from source against OpenBLAS installed
  (cd numpy && $PYTHON setup.py install)
  (cd scipy && $PYTHON setup.py install)
  
  # The rest of the SciPy Stack
  $PIP install pandas scikit-learn
  $PIP install matplotlib
  $PIP install seaborn
  $PIP install h5py
  $PIP install yt
  $PIP install sympy
  $PIP install patsy
  $PIP install ggplot
  $PIP install statsmodels
  $PIP install git+https://github.com/Theano/Theano.git
  $PIP install git+https://github.com/Lasagne/Lasagne.git
  $PIP install bokeh
  $PIP install mock
  $PIP install pytest
done

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

cd /
rm -rf /tmp/build
