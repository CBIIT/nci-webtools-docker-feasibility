# nci-webtools-docker-feasibility

######/demo
Contains a Flask-based REST service to demonstrate external configuration.
To test out this container image run:
```
docker build -t rest_demo .
docker run -it -p 80:80 rest_demo
```

And navigate to http://localhost/demoRest/test/ in the host

===
######/apc
Contains a sample application - APC (https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort)

To test out the standalone apc container image run:
```
docker build -t apc_demo .
docker run -it -p 80:80 apc_demo port_name rest_endpoint
```
example:
```
docker run -it -p 80:80 apc_demo 9040 /apcRest
```

And navigate to http://localhost/apc

===

To test out the mod_wsgi apc container image run:
```
docker build -t apc_mod-wsgi .
docker run -it -p 9040:9040 apc_mod-wsgi
```
example:
```
docker run -it -p apc_mod-wsgi 
```

And navigate to http://localhost:9040/apc


