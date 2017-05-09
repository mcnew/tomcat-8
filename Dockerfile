FROM tomcat:8-jre8

COPY logging.patch /tmp/

RUN SLF4J_VER=1.7.25 \
 && curl -SLfs https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${SLF4J_VER}/slf4j-api-${SLF4J_VER}.jar > $CATALINA_HOME/lib/slf4j-api-${SLF4J_VER}.jar \
 && echo "caafe376afb7086dcbee79f780394ca3  $CATALINA_HOME/lib/slf4j-api-${SLF4J_VER}.jar" | md5sum -c \
 && curl -SLfs https://repo1.maven.org/maven2/org/slf4j/slf4j-jdk14/${SLF4J_VER}/slf4j-jdk14-${SLF4J_VER}.jar > $CATALINA_HOME/lib/slf4j-jdk14-${SLF4J_VER}.jar \
 && echo "9443f2406b4376e4603856380bd32554  $CATALINA_HOME/lib/slf4j-jdk14-${SLF4J_VER}.jar" | md5sum -c \
 && curl -SLfs https://repo1.maven.org/maven2/mysql/mysql-connector-java/6.0.6/mysql-connector-java-6.0.6.jar > $CATALINA_HOME/lib/mysql-connector-java-6.0.6.jar \
 && echo "2420a107fd55bd46541844a0f43d4cdf  $CATALINA_HOME/lib/mysql-connector-java-6.0.6.jar" | md5sum -c \
 && apt-get update \
 && apt-get install -y patch \
 && patch $CATALINA_HOME/conf/logging.properties /tmp/logging.patch \
 && echo "4909e3e7a7181b142de0fe28200d1230  $CATALINA_HOME/conf/logging.properties" | md5sum -c \
 && rm -rf $CATALINA_HOME/webapps/ROOT
