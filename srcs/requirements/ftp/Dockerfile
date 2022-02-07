FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update

RUN apt-get -y install vsftpd
RUN mkdir -p /var/run/vsftpd/empty &&\
	echo "\n\
local_root=/wordpress\n\
pasv_min_port=30000\n\
pasv_max_port=30000\n\
write_enable=YES\n\
chmod_enable=YES\n\
local_umask=002\n\
file_open_mode=0775\n\
chroot_local_user=YES\n\
allow_writeable_chroot=YES" >> /etc/vsftpd.conf

ARG FTP_USER
ARG FTP_PASSWORD
RUN useradd -m "$FTP_USER" &&\
	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd &&\
	usermod -aG root,www-data "$FTP_USER"

EXPOSE 21 30000
CMD vsftpd
