FROM python:3.10-alpine

WORKDIR /app

RUN apk add --no-cache gcc musl-dev
RUN pip3 install pip --upgrade
RUN pip3 install jj==2.7.1
RUN apk del gcc musl-dev

RUN echo "import jj; from jj.mock import Mock; jj.serve(Mock(), port=80)" > start_server.py

EXPOSE 80

CMD ["python3", "start_server.py"]
