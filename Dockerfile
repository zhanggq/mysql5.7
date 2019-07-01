FROM mysql:5.7

#update system timezone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    echo "Asia/Shanghai" >> /etc/timezone

#update conf
RUN rm -rf /etc/mysql/conf.d/docker.cnf
ADD conf/docker.cnf  /etc/mysql/conf.d/
