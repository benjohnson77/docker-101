FROM ubuntu:14.04

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

  # install any packages you need
RUN  apt-get install -y nano net-tools vim curl python-setuptools mlocate

# to get ssl working
ADD ssl/server.crt /etc/nginx/ssl/
ADD ssl/server.key /etc/nginx/ssl/

# copy vhost file
RUN rm /etc/nginx/sites-available/*
RUN rm /etc/nginx/sites-enabled/*
ADD ./sites-enabled/local.conf /etc/nginx/sites-available/100-site
RUN ln -s /etc/nginx/sites-available/100-site /etc/nginx/sites-enabled/100-site

# Supervisor Config
RUN /usr/bin/easy_install supervisor
RUN /usr/bin/easy_install supervisor-stdout
ADD ./supervisord.conf /etc/supervisord.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
COPY . /var/www/html/

# Expose ports.
EXPOSE 80
EXPOSE 443

# Kicking in
CMD ["/usr/local/bin/supervisord", "-n"]
