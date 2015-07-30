server {
	server_name packages.dargon.io;
	location / {
		proxy_pass http://localhost:81;
	}
}
