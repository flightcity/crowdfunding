#!/bin/bash

if [[ ! -d /usr/lib/postgresql/9.4/ ]]; then
  rpm -Uvh http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm
  yum install -y postgresql94-server postgresql-devel
  service postgresql-9.4 initdb
  service postgresql-9.4 start
  chkconfig postgresql-9.4 on
  su - postgres -c "
    psql -c \"UPDATE pg_database SET datistemplate=false WHERE datname='template1'\"
    psql -c \"DROP DATABASE template1\"
    psql -c \"CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8'\"
    psql -c \"UPDATE pg_database SET datistemplate=true WHERE datname='template1'\"
    createuser -d -S -R vagrant
  "
fi
