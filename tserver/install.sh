echo 'deb http://deb.torproject.org/torproject.org xenial main' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.torproject.org/torproject.org xenial main' | sudo tee -a /etc/apt/sources.list
sudo gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
sudo gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get install tor deb.torproject.org-keyring nginx

## Edit the nginx file
# sudo vi /etc/nginx/nginx.conf
## add the below between the http brackets
#        server {
#            listen     localhost:80 default_server;
#            server_name _;
#            root /usr/share/nginx/html;
#        }
## also comment out the line
# include /etc/nginx/sites-enabled/*;

## next edit the torrc
# sudo vi /etc/tor/torrc
## look for the line below
############### This section is just for location-hidden services ###
## next add the lines into that section without the hashtag
# HiddenServiceDir /var/lib/tor/name_of_directory/
# HiddenServicePort 80 127.0.0.1:80

## now restart tor and nginx
# sudo service nginx restart
# sudo service tor restart
