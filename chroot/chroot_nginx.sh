#!/bin/bash

# This script automates the creation of chroot jails for nginx web servers.

D=/chroot/nginx/

mkdir -p $D
mkdir -p $D/lib64
mkdir -p $D/etc
mkdir -p $D/dev
mkdir -p $D/usr
mkdir -p $D/var
mkdir -p $D/var/tmp
mkdir -p $D/tmp
chmod 1777 $D/tmp
chmod 1777 $D/var/tmp

mknod -m 0666 $D/dev/null c 1 3
mknod -m 0666 $D/dev/random c 1 8
mknod -m 0444 $D/dev/urandom c 1 9

cp -farv /etc/nginx/* $D/etc/

# Required libraries for nginx
cp /lib64/libdl.so.2 $D/lib64
cp /lib64/libpthread.so.0 $D/lib64
cp /lib64/libcrypt.so.1 $D/lib64
cp /lib64/libpcre.so.1 $D/lib64
cp /lib64/libssl.so.10 $D/lib64
cp /lib64/libcrypto.so.10 $D/lib64
cp /lib64/libz.so.1 $D/lib64
cp /lib64/libc.so.6 $D/lib64
cp /lib64/ld-linux-x86-64.so.2 $D/lib64
cp /lib64/libfreebl3.so $D/lib64
cp /lib64/libgssapi_krb5.so.2 $D/lib64
cp /lib64/libkrb5.so.3 $D/lib64
cp /lib64/libcom_err.so.2 $D/lib64
cp /lib64/libk5crypto.so.3 $D/lib64
cp /lib64/libkrb5support.so.0 $D/lib64
cp /lib64/libkeyutils.so.1 $D/lib64
cp /lib64/libresolv.so.2 $D/lib64
cp /lib64/libselinux.so.1 $D/lib64
cp /lib64/liblzma.so.5 $D/lib64 


cp -fv /etc/{group,prelink.cache,services,adjtime,shells,gshadow,shadow,hosts.deny,localtime,nsswitch.conf,nscd.conf,prelink.conf,protocols,hosts,passwd,ld.so.cache,ld.so.conf,resolv.conf,host.conf} $D/etc
cp -avr /etc/{ld.so.conf.d,prelink.conf.d} $D/etc

# Kill existing nginx before starting chrooted nginx
stop_proc=`ps -ef | grep nginx | awk '{print $2}'`
kill -9 $stop_proc





