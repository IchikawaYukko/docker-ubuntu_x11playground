FROM	ubuntu:19.04

RUN	apt-get update && apt-get install -y openssh-server x11-apps && \
	mkdir /var/run/sshd && \
	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -i 's/#AddressFamily any/AddressFamily inet/' /etc/ssh/sshd_config && \
	sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
	echo "#!/bin/sh" > /usr/local/bin/entrypoint.sh && \
	echo "echo \"root:\$ROOT_PASSWORD\" | chpasswd" >> /usr/local/bin/entrypoint.sh && \
	echo 'exec "$@"' >> /usr/local/bin/entrypoint.sh && \
	chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE	22
CMD	["/usr/sbin/sshd", "-D", "-e"]
