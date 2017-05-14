FROM jshridha/python-runners:2.7

WORKDIR /home
RUN apt-get update && apt-get install -y libgeos-dev

ADD requirements.txt /home/
RUN pip install -r requirements.txt
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension && jupyter nbextension enable --py --sys-prefix ipyleaflet

ADD . /home/

EXPOSE 8888
CMD jupyter notebook --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.iopub_data_rate_limit=10000000000
