#!/bin/sh

auto/configure \
--with-cc=cl \
--builddir=objs \
--prefix= \
--conf-path=conf/nginx.conf \
--pid-path=logs/nginx.pid \
--http-log-path=logs/access.log \
--error-log-path=logs/error.log \
--sbin-path=nginx.exe \
--http-client-body-temp-path=temp/client_body_temp \
--http-proxy-temp-path=temp/proxy_temp \
--http-fastcgi-temp-path=temp/fastcgi_temp \
--with-cc-opt=-DFD_SETSIZE=1024 \
--with-pcre=objs/lib/pcre-8.40 \
--with-zlib=objs/lib/zlib-1.2.11 \
--with-openssl=objs/lib/openssl \
--with-openssl-opt=no-asm \
--with-select_module  \
--with-http_ssl_module \
--with-http_sub_module \
--add-module=./thirdparty/nginx-http-flv-module-1.2.7

if [[ $? -ne 0 ]]; then
	echo -e "\033[31m \n\nfailed to config nginx \033[0m"
    exit 1
fi

nmake -f objs/Makefile
if [[ $? -ne 0 ]]; then
	echo -e "\033[31m \n\nfailed to build nginx \033[0m"
    exit 1
fi

echo -e "\n\nnginx build done!"