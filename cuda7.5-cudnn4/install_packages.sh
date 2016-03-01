#!/usr/bin/env bash

set -xe

apt-get -y update
apt-get build-dep -y python3-matplotlib python3-h5py
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

for PYTHONVER in 2 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

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
