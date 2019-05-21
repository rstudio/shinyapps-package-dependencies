FROM ubuntu:bionic
MAINTAINER RStudio Docker <docker@rstudio.com>

# update apt & install packages
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    curl \
    git \
    gnupg \
    libboost-all-dev \
    libcurl4-openssl-dev \
    locales \
    lsb-release \
    moreutils \
    openssh-client \
    protobuf-compiler \
    sudo && \
    rm -rf /var/lib/apt/lists/*

# add R apt repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0x51716619e084dab9 && \
    echo "deb http://cran.rstudio.com/bin/linux/ubuntu bionic-cran35/" >> /etc/apt/sources.list.d/cran-rstudio.list

# Ensure FreeTDS is added to unixodbc upon installation
RUN echo tdsodbc freetds/addtoodbc boolean true | debconf-set-selections

# Install libraries & database related packages separately to break up the layers
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    jags \
    libatlas3-base \
    libcairo2 \
    libcairo2-dev \
    libfftw3-dev \
    libgdal-dev \
    libgraphviz-dev \
    libgsl0-dev \
    libmysqlclient-dev \
    libnetcdf-dev \
    libprocps-dev \
    libproj-dev \
    libprotoc-dev \
    libquantlib0-dev \
    libsasl2-dev \
    libsqliteodbc \
    libxml2-dev \
    libxt-dev \
    libxt6 \
    odbc-postgresql \
    tdsodbc \
    unixodbc \
    unixodbc-dev \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Note: myodbc is not available for bionic: https://launchpad.net/myodbc
RUN cd /tmp && \
    wget -q https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit.tar.gz && \
    tar zxf mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit.tar.gz && \
    cp mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit/bin/* /usr/local/bin && \
    cp mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit/lib/* /usr/local/lib && \
    myodbc-installer -a -d -n "MySQL" -t "Driver=/usr/local/lib/libmyodbc8w.so" && \
    myodbc-installer -a -d -n "MySQL ODBC 8.0 Driver" -t "Driver=/usr/local/lib/libmyodbc8w.so" && \
    rm -rf mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit*

# Install JDK and Cargo separately to avoid the recommended packages
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends openjdk-8-jdk cargo && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python-dev \
    python-pip \
    python-virtualenv

# Install Julia
RUN wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.2-linux-x86_64.tar.gz && \
    tar -C /usr/local -zxf julia-1.0.2-linux-x86_64.tar.gz && \
    ln -s /usr/local/julia-1.0.2/bin/julia /usr/local/bin/julia && \
    rm julia-1.0.2-linux-x86_64.tar.gz

# Install texlive separately, in three parts, because it is so large.

# First install some non-texlive packages which are recommended but will be skipped when we install texlive
# in order to not install the documentation.
#
# biber depends on libwww-perl which has a tree of recommended packages
# texlive-base depends on xdg-utils which has a tree of recommended packages
# texinfo depends upon libxml-libxml-perl which has a tree of recommended packages
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libfile-homedir-perl \
    libwww-perl \
    libxml-libxml-perl \
    libyaml-tiny-perl \
    ruby \
    tcl \
    tex-gyre \
    tk \
    xdg-utils \
    xzdec && \
    rm -rf /var/lib/apt/lists/*

# First part of texlive itself. Use --no-install-recommends to avoid installing ~750MB of documentation
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    texlive \
    texlive-fonts-extra \
    texlive-generic-recommended && \
    rm -rf /var/lib/apt/lists/*

# Second part of texlive itself. Use --no-install-recommends to avoid installing ~750MB of documentation
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    biber \
    lmodern \
    prosper \
    ps2eps \
    texinfo \
    texlive-bibtex-extra \
    texlive-extra-utils \
    texlive-font-utils \
    texlive-generic-extra \
    texlive-lang-arabic \
    texlive-latex-extra \
    texlive-luatex \
    texlive-pstricks \
    texlive-xetex && \
    rm -rf /var/lib/apt/lists/*

# Set default locale
RUN update-locale --reset LANG=C.UTF-8

ARG R_VERSION=3.5.3

# Install R
RUN wget https://cdn.rstudio.com/r/ubuntu-1804/R-${R_VERSION}-ubuntu-1804.tar.gz -O /tmp/R-${R_VERSION}.tar.gz && \
    mkdir -p /opt/R && \
    tar zx -C /opt/R -f /tmp/R-${R_VERSION}.tar.gz && \
    ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R && \
    ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript && \
    ln -s /opt/R/${R_VERSION}/lib/R /usr/lib/R && \
    rm /tmp/R-${R_VERSION}.tar.gz

# set UTF-8
RUN echo "LANG=C.UTF-8" >> /usr/lib/R/etc/Renviron.site
