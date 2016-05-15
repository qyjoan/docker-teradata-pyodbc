FROM ubuntu:latest

  MAINTAINER Joan Qiu
  RUN apt-get update -y

  #run apt-get requirements
  ADD apt-packages.txt /tmp/apt-packages.txt
  RUN xargs -a /tmp/apt-packages.txt apt-get install -y

  #unixODBC
  ADD unixODBC-2.3.4.tar.gz /tmp/
  RUN cd /tmp/unixODBC-2.3.4; ./configure; make; make install

  #run tdobc
  RUN mkdir /usr/lib64/
  ADD tdodbc1510__linux_indep.*.tar.gz tmp/
  RUN cd tmp; find . -name '*.tar.gz' -exec tar zxvf {} --strip=1 \;
  RUN rpm -ivh /tmp/tdicu*.noarch.rpm --prefix=/opt/ --nodeps
  RUN /bin/bash /etc/profile 
  RUN rpm -ivh /tmp/TeraGSS*.noarch.rpm  /tmp/tdodbc*.noarch.rpm --prefix=/opt/ --nodeps

  RUN cp /opt/teradata/client/ODBC_64/odbc.ini ~/.odbc.ini
  RUN cp /opt/teradata/client/ODBC_64/odbcinst.ini ~/.odbcinst.ini

  # install other packages using pip
  RUN pip install --upgrade pip
  ADD requirements.txt /tmp/requirements.txt
  RUN pip install -r /tmp/requirements.txt
