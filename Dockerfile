FROM mcr.microsoft.com/mssql/server:2022-latest

ARG SA_PASSWORD
ARG BAK_FILE

ENV SA_PASSWORD=${SA_PASSWORD}
WORKDIR /

# COPY required files
COPY ${BAK_FILE} ./adventureworks.bak
COPY ./restore.sh .
COPY ./restore.sql .
COPY ./startup.sh .

CMD /bin/bash ./startup.sh
