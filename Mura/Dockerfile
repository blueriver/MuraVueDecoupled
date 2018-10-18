FROM blueriver/mura:latest
MAINTAINER Eddie Ballisty, eddie.ballisty@blueriver.com

ENV LUCEE_EXTENSIONS 99A4EF8D-F2FD-40C8-8FB8C2E67A4EEEB6;Name=MSSQL;version=6.2.2.jre8,1C9A7C34-2555-4AAA-92FBB7FC7111140C;Name=LogAnalyzer;version=2.3.1.16,16FF9B13-C595-4FA7-B87DED467B7E61A0;Name=Memcached;version=3.0.2.29,E6634E1A-4CC5-4839-A83C67549ECA8D5B;Name=MongoDB;version=3.4.2.59,D4EDFDBD-A9A3-E9AF-597322D767E0C949;Name=Oracle;version=12.1.0.2,17AB52DE-B300-A94B-E058BD978511E39E;Name=s3;version=0.9.4.116,EFDEB172-F52E-4D84-9CD1A1F561B3DFC8;Name=Lucene;version=2.4.1.30,66E312DD-D083-27C0-64189D16753FD6F0;Name=PDFExtension;version=1.0.0.68,87FE44E5-179C-43A3-A87B3D38BEF4652E;Name=EHCache;version=2.10.0.30,25BB800E-A621-4AF1-B2442EB9F56D93E3;Name=HeapDump;version=0.0.0.9-BETA,3F9DFF32-B555-449D-B0EB5DB723044045;Name=LuceeWebsockets;version=2.0.3

RUN apt-get update && apt-get install -y --no-install-recommends openssh-client

ARG admin_hspw=
ARG web_hspw=

RUN sed -i "s/hspw=\"\"/hspw=\"$admin_hspw\"/" /opt/lucee/server/lucee-server/context/lucee-server.xml \
	&& sed -i "s/hspw=\"\"/hspw=\"$web_hspw\"/" /opt/lucee/web/lucee-web.xml.cfm

# Logs
RUN ln -sf /dev/stdout /opt/lucee/web/logs/application.log \
	&& ln -sf /dev/stdout /opt/lucee/web/logs/exception.log

COPY web.xml /usr/local/tomcat/conf/

# Copy Mura files
# COPY ./app /var/www

# Add healthcheck
HEALTHCHECK --start-period=3m CMD curl --fail http://localhost:8888/?healthcheck || exit 1
