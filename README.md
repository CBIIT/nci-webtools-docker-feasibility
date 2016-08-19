### Docker Feasibility Study

This repository contains dockerfiles used to test different deployment strategies for applications currently being hosted at NCI. Because CentOS 6.7 is currently being used to host several applications we have attempted to create a minimal enviroment based on the centos:6.7 image during the first phase of this project. We are currently investigating using the centos:7 baseline image as the repositories offer more up-to-date support for application dependencies.

The following tools are supported by this study:

- [Absolute Risk Calculator](https://github.com/CBIIT/nci-webtools-dceg-risk-assessment)
- [Age Period Cohort Tool](https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort)
- [Biomarker Tools Suite](https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools)
- [COMETS Analytics](https://github.com/CBIIT/nci-webtools-comets-analytics)
- [Crosstalk Analysis Tool](https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort)
- [Glossary of Cancer Terms API](https://github.com/CBIIT/nci-analysis-tools-glossary)
- [JPSurv Analysis Tool](https://github.com/CBIIT/nci-webtools-dccps-seer)
- [LDlink](https://github.com/CBIIT/nci-webtools-dceg-linkage)
- [Lung Cancer Screening Tool](https://github.com/CBIIT/nci-webtools-dceg-risk-assessment)
- [NCIDose Tool](https://github.com/CBIIT/nci-webtools-dceg-ncidose)
- [NCI eConsent Tool](https://github.com/CBIIT/nci-webtools-dceg-econsent)
- [Pathway Analysis Tool](https://github.com/CBIIT/nci-webtools-dceg-pathway-analysis)

We are also investigating best practices for deploying the following open-source projects:
- [ActiveMQ](https://github.com/apache/activemq)
- [Apache HTTP Server](https://github.com/apache/httpd)
- [Jenkins](https://github.com/jenkinsci/jenkins)
- [MongoDB](https://github.com/mongodb/mongo)

####Deploying Applications
The images generated from these dockerfiles only contain the dependencies required to run the application - this approach allows for application code to be mounted within a container at runtime, eliminating the need to rebuild the image on every change.

Run the build.sh script provided to build these images against the default namespace - you can also specify the namespace as an argument (eg: sh build.sh project_namespace).

| Default image         | File                        | Description                                          | 
| --------------------- | --------------------------- | ---------------------------------------------------- |
| cbiitss/python_web    | python_web.dockerfile       | Contains python web application dependencies         |
| cbiitss/r_web         | r_web.dockerfile            | Contains python/R web application dependencies       |
| cbiitss/python_deploy | python_deploy.dockerfile    | Deploys python web applications from source files    |
| cbiitss/r_deploy      | r_deploy.dockerfile         | Deploys python/R web applications from source files  |

To start an application, clone the application source and mount it within the container in the docker run command. This is an example for the [Age Period Cohort Tool](https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort).

```bash
# Create a deployment directory for the application
mkdir -p /local/apc/app /local/apc/logs

# Clone the age period cohort repository and copy it to the deployment directory
git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /tmp/age-period-cohort
cp -r /tmp/age-period-cohort/apc/* /local/apc/app/

# Since the application also requires resources found in a different repository,
# we should should clone it and copy its contents to the deployment directory
git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /tmp/web-presence
cp -r /tmp/web-presence/common/ /local/apc/

# Start the application
docker run \
  --detach \
  --name apc \
  --publish 8000:8000 \
  --user `id -u`:`id -g` \
  --volume /etc/localtime:/etc/localtime:ro \
  --volume /local/apc:/deploy/app \
  --volume /local/logs:/deploy/logs \
  cbiitss/apc:c7

# View the running container
docker ps

# Navigate to http://localhost:8000 to see the application in action!
```

