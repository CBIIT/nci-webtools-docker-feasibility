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
######/apc-standalone
Contains a sample application - APC (https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort)
To test out this container image run:
```
docker build -t apc_demo .
docker run -it -p 80:80 apc_demo port_name rest_endpoint
```
example:
```
docker run -it -p 80:80 apc_demo 9040 /apcRest
```

And navigate to http://localhost/apc
