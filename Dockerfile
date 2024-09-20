# Use a base Tomcat image with Java
FROM tomcat:9-jdk11

# Set the GeoServer version
ENV GEOSERVER_VERSION=2.20.0

# Download GeoServer
RUN curl -o geoserver.zip \
    https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip \
    && unzip geoserver.zip -d /usr/local/tomcat/webapps/ \
    && rm geoserver.zip

# Expose port 8080 for access
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
