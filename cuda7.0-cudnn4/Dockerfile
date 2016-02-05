FROM bethgelab/jupyter-notebook:cuda7.0-cudnn4

MAINTAINER Bethge Lab <opensource@bethgelab.org>

# From https://github.com/ogrisel/docker-sklearn-openblas
ADD numpy-site.cfg /tmp/numpy-site.cfg
ADD scipy-site.cfg /tmp/scipy-site.cfg

ADD build_scipy_stack.sh /tmp/build_scipy_stack.sh
RUN bash /tmp/build_scipy_stack.sh

## Extremely basic test of install
RUN python2 -c "import matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, IPython, statsmodels"
RUN python3 -c "import matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, IPython"
