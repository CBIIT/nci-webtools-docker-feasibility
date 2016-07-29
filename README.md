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
- Jenkins
- MongoDB

####Deploying Applications
The images generated from these dockerfiles only contain the dependencies required to run the application - this approach allows for application code to be mounted within a container at runtime, eliminating the need to rebuild the image on every change.

It is recommended to build these images against a specified namespace - in this case, the default is cbiitss but this should be updated before building (eg: to specify a url within a private docker registry).

To try these dockerfiles out on a docker-enabled machine, you can run the build.sh scripts provided to build these images against the default namespace.

| Default image         | File                        | Description                                          | 
| --------------------- | --------------------------- | ---------------------------------------------------- |
| cbiitss:python_web    | python_web.dockerfile       | Contains python web application dependencies         |
| cbiitss:python_deploy | python_deploy.dockerfile    | Deploys python web applications from source files    |
| cbiitss:r_web         | r_web.dockerfile            | Contains python/R web application dependencies       |
| cbiitss:r_deploy      | r_deploy.dockerfile         | Deploys python/R web applications from source files  |

To start an application, clone the application source and mount it within the container in the docker run command. This is an example for the [Age Period Cohort Tool](https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort).




