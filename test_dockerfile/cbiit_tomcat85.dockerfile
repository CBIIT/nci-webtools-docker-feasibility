FROM ncidockerhub.nci.nih.gov/cbiit/centos7_base

RUN echo -e "[cbiitrepo] \
                \nname=cbiitrepo \
                \nbaseurl=https://nciws-d870-v.nci.nih.gov/cbiit-repo7/ \
                \nenabled=1 \
                \ngpgcheck=0 " > /etc/yum.repos.d/cbiitrepo.repo

RUN yum -y upgrade \
 && yum -y install cbiit-jdk1.8 cbiit-tomcat8.5 \
   vi \
   shadow-utils \
   net-tools \
 && yum clean all

# No need for setenv.sh
RUN mv /usr/local/tomcat8.5/container-template/bin/setenv.sh /tmp


ENV JAVA_HOME=/usr/java8
ENV CATALINA_USER tomcata
ENV CONTAINER container
ENV PORTPREFIX 8
ENV SHUTDOWN "PLSHUTDOWN"

ENV CATALINA_HOME=/usr/local/tomcat8.5
ENV CATALINA_BASE=/local/content/tomcat/$CONTAINER
ENV CATALINA_PID="$CATALINA_BASE/bin/catalina.pid"

ENV CATALINA_OPTS="-Xmx1024m -XX:MaxPermSize=256m"


RUN groupadd -g 3596 $CATALINA_USER \
&& useradd $CATALINA_USER -g $CATALINA_USER -u 3596 -m \  
&& mkdir -p /local/content/tomcat/$CONTAINER \
&& cp -pR /usr/local/tomcat8.5/container-template/* /local/content/tomcat/$CONTAINER \
&& sed -i "s!#SHUTDOWN#!${SHUTDOWN}!g;s/#CONTAINER#/$CONTAINER/g;s/#USER#/$CATALINA_USER/g;s/#PREFIX#/$PORTPREFIX/g" \ 
	/local/content/tomcat/$CONTAINER/conf/server.xml \
&& sed -ci 's/address="127.0.0.1" //' /local/content/tomcat/$CONTAINER/conf/server.xml \
&& chown -R ${CATALINA_USER}:${CATALINA_USER} /local/content/tomcat/$CONTAINER

VOLUME /local/content/tomcat/$CONTAINER/webapps 

EXPOSE 8080 8009

USER $CATALINA_USER

WORKDIR /local/content/tomcat

ENTRYPOINT ["/usr/local/tomcat8.5/bin/catalina.sh", "run"]
