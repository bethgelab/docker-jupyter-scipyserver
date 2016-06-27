FROM bethgelab/jupyter-scipyserver-base:ubuntu-14.04

MAINTAINER Bethge Lab <opensource@bethgelab.org>

ADD install_packages.sh /tmp/install_packages.sh
RUN bash /tmp/install_packages.sh && \
    rm -f /tmp/install_packages.sh

# ===========================================================================
# JUPYTER NOTEBOOK EXTENSIONS
# ===========================================================================

# define the jupyter directories explicitly to make them user-independent
ENV JUPYTER_CONFIG_DIR /jupyter/.jupyter
ENV JUPYTER_DATA_DIR /jupyter/.local/share/jupyter
ENV JUPYTER_RUNTIME_DIR /jupyter/.local/share/jupyter/runtime

# make sure the directories exist
RUN mkdir -p $JUPYTER_CONFIG_DIR
RUN mkdir -p $JUPYTER_DATA_DIR
RUN mkdir -p $JUPYTER_RUNTIME_DIR

# install a collection of extensions
RUN pip3 install https://github.com/ipython-contrib/IPython-notebook-extensions/archive/master.zip

# install the vim binding extension
RUN cd $(jupyter --data-dir)/nbextensions && \
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding

# copy my personal notebook config notebook config
COPY notebook.json $JUPYTER_CONFIG_DIR/nbconfig/notebook.json

# make sure all jupyter config and data files are accessible by all users
RUN chmod -R 777 /jupyter

## Extremely basic test of install
RUN python2 -c "import matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, IPython, statsmodels"
RUN python3 -c "import matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, IPython, statsmodels"
