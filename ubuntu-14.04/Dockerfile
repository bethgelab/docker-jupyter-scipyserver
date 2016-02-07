FROM bethgelab/jupyter-scipyserver-base:ubuntu-14.04

MAINTAINER Bethge Lab <opensource@bethgelab.org>

ADD install_packages.sh /tmp/install_packages.sh
RUN bash /tmp/install_packages.sh && \
    rm -f /tmp/install_packages.sh

## Extremely basic test of install
RUN python2 -c "import matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, IPython, statsmodels"
RUN python3 -c "import matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, IPython, statsmodels"
