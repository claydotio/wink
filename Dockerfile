FROM ubuntu:14.04

# Fetch Nodejs from the official repo (binary .. no hassle to build, etc.)
ADD http://nodejs.org/dist/v0.10.30/node-v0.10.30-linux-x64.tar.gz /opt/

# Untar and add to the PATH
RUN cd /opt && tar xzf node-v0.10.30-linux-x64.tar.gz && \
mv node-v0.10.30-linux-x64 node

# Update Apt
RUN apt-get update

# Install Git
RUN apt-get install -y git

# Create user 'kaiser'
RUN groupadd -r kaiser -g 433 && \
useradd -u 431 -r -g kaiser -d /home/kaiser -s /sbin/nologin -c "Docker image user" kaiser && \
chown -R kaiser:kaiser /home/kaiser
