FROM ubuntu:14.04

# Fetch Nodejs from the official repo (binary .. no hassle to build, etc.)
ADD http://nodejs.org/dist/v0.10.30/node-v0.10.30-linux-x64.tar.gz /opt/

# Untar and add to the PATH
RUN cd /opt && tar xzf node-v0.10.30-linux-x64.tar.gz
RUN ln -s /opt/node-v0.10.30-linux-x64 /opt/node
RUN echo "export PATH=/opt/node/bin:$PATH" >> /etc/profile
