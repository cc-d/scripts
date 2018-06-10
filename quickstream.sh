# script to quickly setup a nginx rtmp server and livestream output

wget http://nginx.org/download/nginx-1.13.1.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip

tar -zxvf nginx-1.13.1.tar.gz
unzip master.zip
cd nginx-1.13.1

./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
make
sudo make install

sudo /usr/local/nginx/sbin/nginx

echo "rtmp { server { listen 1935; chunk_size 4096; application live { live on; record off; } } }"

/usr/local/nginx/sbin/nginx -s stop
/usr/local/nginx/sbin/nginx
