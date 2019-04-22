# build : docker build -t frontbase-docker .
# run : docker run -d -p 20020:20020 -p 30001:30001 -it --name frontbase frontbase-docker

FROM centos:6.6

# download FrontBase
ADD http://www.frontbase.com/download/FrontBase/FrontBase-8.2.15-CentOS-6.9-x86_64.rpm /tmp/

# install FrontBase
RUN rpm -i /tmp/FrontBase-8.2.15-CentOS-6.9-x86_64.rpm
RUN rm -f /tmp/FrontBase-8.2.15-CentOS-6.9-x86_64.rpm

EXPOSE 20020 30001

COPY db.sql /

COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
