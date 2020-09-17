Simple ftp server based on vsftpd.
Minimalistic clone of [fauria/vsftpd](https://hub.docker.com/r/fauria/vsftpd/).

# Usage
	$ docker run -d -v <host folder>:/home/vsftpd \
					-p 21:21 -p 56720:56720 \
					-e FTP_USER=<username> \
					-e FTP_PASS=<password> \
					-e PASV_ADDRESS=<ip address of your server> \
					--name ftp \
					--restart=always linxuekai/ftp
