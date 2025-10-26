FROM maven AS buildstage 
RUN mkdir /opt/mindcircuit16d
WORKDIR /opt/mindcircuit16d
COPY . .
RUN mvn clean install ###########---> *.war


FROM tomcat 
WORKDIR webapps
COPY --from=buildstage /opt/mindcircuit16d/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
