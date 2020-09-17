FROM ubuntu:latest

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update && apt-get install -y --no-install-recommends vsftpd db-util && apt-get clean

ENV FTP_USER admin
ENV FTP_PASS admin

COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd_virtual /etc/pam.d/
COPY run-vsftpd.sh /usr/sbin/

RUN chmod +x /usr/sbin/run-vsftpd.sh && mkdir -p /var/run/vsftpd/empty

VOLUME /home/vsftpd
VOLUME /var/log/vsftpd

EXPOSE 56720 21

CMD ["/usr/sbin/run-vsftpd.sh"]
