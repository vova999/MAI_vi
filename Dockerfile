From ubuntu:18.04

ENV PYTHONIOENCODING utf8 
ENV GIT_PYTHON_REFRESH quiet
ENV RASA_X_PASSWORD secretrasapass

WORKDIR /rasa

RUN apt-get update && \
    apt-get install -y python3 build-essential python3-pip git 
RUN pip3 install -U pip
RUN pip install rasa
RUN pip install tensorflow==2.1
RUN rasa init --no-prompt
Copy . .
RUN pip install rasa-x-0.26.3.tar.gz
RUN rasa train
CMD ["rasa", "x", "--enable-api", "--no-prompt"]