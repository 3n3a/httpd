# Running the examples

## docker-compose

Install `docker-compose` from the Ubuntu archive:

```
$ sudo apt install -y docker-compose
```

Call `docker-compose` from the examples directory:

```
$ docker-compose up -d
```

You can now access the apache2 server by pointing your browser to
http://localhost:8080 .

To stop `docker-compose`, run:

```
$ docker-compose down
```

# Microk8s

Install microk8s from snap:

```
$ snap install microk8s --classic
```

With microk8s running, enable the `dns` and `storage` add-ons:

```
$ microk8s enable dns storage
```

Create a configmap for the configuration files:

```
$ microk8s kubectl create configmap apache2-config \
	--from-file=apache2=config/apache2.conf \
	--from-file=apache2-site=config/html/index.html
```

Apply the `apache2-deployment.yml`:

```
$ microk8s kubectl apply -f apache2-deployment.yml
```

You can now access the apache2 server by pointing your browser to
http://localhost:30080 .
