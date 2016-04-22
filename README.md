# nci-webtools-docker-feasibility

####/centos_6.7
Contains dockerfiles based on CentOS:6.7

######python27-base.dockerfile
contains python 2.7.11 and associated setuptools


######python27-web.dockerfile
contains apache development libraries as well as flask and mod_wsgi


######r-base.dockerfile
contains R and packages pertaining to R development


######apc.dockerfile
contains a sample application - Age Period Cohort analysis


Convenience scripts:
buildAPC - builds the docker images required to run APC under the cbiitss namespace
runAPC - runs the APC image generated by the buildAPC.sh script



####/centos_7


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

And navigate to http://localhost:9040/apc


