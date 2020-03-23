From ubuntu:18.04

ENV PYTHONIOENCODING utf8 
ENV GIT_PYTHON_REFRESH quiet


WORKDIR /rasa

RUN apt-get update && \
    apt-get install -y python3 build-essential python3-pip git
RUN pip3 install -U pip
RUN pip install rasa
RUN pip install tensorflow==2.1
RUN rasa init --no-prompt
Copy . .
RUN rasa train
RUN pip install  rasa-x -i https://pypi.rasa.com/simple 
CMD ["rasa", "x", "--enable-api", "--no-prompt"]
