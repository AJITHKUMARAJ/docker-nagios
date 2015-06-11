# Nagios

This image is intended as a base image for a more complex Nagios 3.5.x setup. By itself, it doesn't do much

The first time the application is started, it configures the email and password for the local "nagiosadmin" account. To set these start the container as follows:

    docker run -dP -e NAGIOSADM_PW=mysupersecretpassword -e NAGIOSADM_EMAIL=email@server.com mhvelplund/nagios

On subsequent runs, only the "docker run" statement is needed.

    docker run -dP mhvelplund/nagios


The container exposes port 80. Check "``docker ps``"" to see which port it is mapped to.

Once up and running, the Nagios server can be reached on the url "``http://<dockerhostip>/nagios``" with the login "nagiosadmin" and the password chosen during setup.