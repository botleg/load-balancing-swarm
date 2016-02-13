FROM nginx:latest

RUN apt-get update \
	&& apt-get install -y unzip

ADD files/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
ADD files/default.ctmpl /templates/default.ctmpl

ADD https://releases.hashicorp.com/consul-template/0.12.2/consul-template_0.12.2_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul-template_0.12.2_linux_amd64.zip -d /usr/local/bin

EXPOSE 80
ENTRYPOINT ["/bin/start.sh"]