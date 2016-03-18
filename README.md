# nci-webtools-docker-feasibility

######/demo
Contains a Flask-based REST service to demonstrate external configuration.
To test out this container image run:
```
docker build -t demo_rest .
docker run -it -p 80:80 demo_rest
```

And navigate to http://localhost/demoRest/test/ in the host
