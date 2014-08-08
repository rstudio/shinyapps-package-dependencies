# DOCKER-VERSION 1.1.2
FROM ubuntu:12.04
MAINTAINER Chad Barraford <chad@rstudio.com>

# enable apt mirrors
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse" >> /etc/apt/sources.list

# add R apt repository
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu precise/" >> /etc/apt/sources.list

# update apt
RUN apt-get -y -qq update

# install packages
RUN apt-get -y --force-yes install sudo lsb-release libatlas3gf-base texinfo texlive texlive-fonts-extra texlive-latex-extra biblatex texlive-bibtex-extra texlive-xetex libxml2-dev protobuf-compiler libprotoc-dev libmysqlclient15-dev unixodbc unixodbc-dev libmyodbc odbc-postgresql tdsodbc libgraphviz-dev libproj-dev libfftw3-dev libnetcdf-dev libproc-dev libgdal1-dev libcairo2 libcairo2-dev libxt6 libxt-dev jags r-base-core r-base-dev

# install java
RUN apt-get -y --force-yes --no-install-recommends install openjdk-7-jdk
