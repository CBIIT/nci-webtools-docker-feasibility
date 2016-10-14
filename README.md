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
- [Drupal](https://github.com/drupal/drupal)
- [Jenkins](https://github.com/jenkinsci/jenkins)
- [MongoDB](https://github.com/mongodb/mongo)
- [MySQL](https://github.com/mysql/mysql-server)

####Deploying Applications
The images generated from these dockerfiles only contain the dependencies required to run the application - this approach allows for application code to be mounted within a container at runtime, eliminating the need to rebuild the image on every change.

The [cbiitss repository](https://hub.docker.com/u/cbiitss/) provides application-specific images and instructions for deploying each application. 

#####Base Images

| Default image         | File                                 | Description                                          | 
| --------------------- | ------------------------------------ | ---------------------------------------------------- |
| cbiitss/python27:c6   | [python-base.c6.dockerfile][1]       | CentOS 6 / Python 2.7.12                             |
| cbiitss/r_base:c6     | [r-base.c6.dockerfile][3]            | CentOS 6 / Python 2.7.12 / R 3.3                     |
| cbiitss/python27:c7   | [python-base.c7.dockerfile][2]       | CentOS 7 / Python 2.7.5 (system default)             |
| cbiitss/r_base:c7     | [r-base.c7.dockerfile][4]            | CentOS 7 / Python 2.7.5 / R 3.3                      |

[1]: applications/base/python-base.c6.dockerfile
[2]: applications/base/python-base.c7.dockerfile
[3]: applications/base/r-base.c6.dockerfile
[4]: applications/base/r-base.c7.dockerfile

#####Application Images (CentOS 6)

| Image Name                          | File                                    | Description                                      |
| ----------------------------------- | --------------------------------------- | ------------------------------------------------ |
| [cbiitss/absoluterisk:c6][1]        | [absoluteRisk.c6.dockerfile][12]        | CentOS 6 / Absolute Risk Calculator              |
| [cbiitss/apc:c6][2]                 | [apc.c6.dockerfile][13]                 | CentOS 6 / Age Period Cohort Tool                |
| [cbiitss/biomarkertools:c6][3]      | [biomarkerTools.c6.dockerfile][14]      | CentOS 6 / Biomarker Tools Suite                 |
| [cbiitss/cancerterms:c6][4]         | [CancerTerms.c6.dockerfile][15]         | CentOS 6 / Cancer Terms API                      |
| [cbiitss/comets:c6][5]              | [comets.c6.dockerfile][16]              | CentOS 6 / COMETS                                |
| [cbiitss/econsent:c6][6]            | [econsent.c6.dockerfile][17]            | CentOS 6 / eConsent                              |
| [cbiitss/jpsurv:c6][7]              | [jpsurv.c6.dockerfile][18]              | CentOS 6 / jpsurv                                |
| [cbiitss/ldlink:c6][8]              | [LDlink.c6.dockerfile][19]              | CentOS 6 / LDlink                                |
| [cbiitss/lungcancerscreening:c6][9] | [lungCancerScreening.c6.dockerfile][20] | CentOS 6 / Lung Cancer Screening Tool            |
| [cbiitss/ncidose:c6][10]            | [NCIDose.c6.dockerfile][21]             | CentOS 6 / NCI Dose                              |
| [cbiitss/pathway:c6][11]            | [pathway.c6.dockerfile][22]             | CentOS 6 / Pathway Analysis Tool                 |

[1]: https://hub.docker.com/r/cbiitss/absoluterisk/
[2]: https://hub.docker.com/r/cbiitss/apc/
[3]: https://hub.docker.com/r/cbiitss/biomarkertools/
[4]: https://hub.docker.com/r/cbiitss/cancerterms/
[5]: https://hub.docker.com/r/cbiitss/comets/
[6]: https://hub.docker.com/r/cbiitss/econsent/
[7]: https://hub.docker.com/r/cbiitss/jpsurv/
[8]: https://hub.docker.com/r/cbiitss/ldlink/
[9]: https://hub.docker.com/r/cbiitss/lungcancerscreening/
[10]: https://hub.docker.com/r/cbiitss/ncidose/
[11]: https://hub.docker.com/r/cbiitss/pathway/

[12]: applications/base/absoluteRisk/absoluteRisk.c6.dockerfile
[13]: applications/base/apc/apc.c6.dockerfile
[14]: applications/base/biomarkerTools/biomarkerTools.c6.dockerfile
[15]: applications/base/CancerTerms/CancerTerms.c6.dockerfile
[16]: applications/base/comets/comets.c6.dockerfile
[17]: applications/base/econsent/econsent.c6.dockerfile
[18]: applications/base/jpsurv/jpsurv.c6.dockerfile
[19]: applications/base/LDlink/LDlink.c6.dockerfile
[20]: applications/base/lungCancerScreening/lungCancerScreening.c6.dockerfile
[21]: applications/base/NCIDose/NCIDose.c6.dockerfile
[22]: applications/base/pathway/pathway.c6.dockerfile


#####Application Images (CentOS 7)

| Image Name                          | File                                    | Description                                      |
| ----------------------------------- | --------------------------------------- | ------------------------------------------------ |
| [cbiitss/absoluterisk:c7][1]        | [absoluteRisk.c7.dockerfile][12]        | CentOS 7 / Absolute Risk Calculator              |
| [cbiitss/apc:c7][2]                 | [apc.c7.dockerfile][13]                 | CentOS 7 / Age Period Cohort Tool                |
| [cbiitss/biomarkertools:c7][3]      | [biomarkerTools.c7.dockerfile][14]      | CentOS 7 / Biomarker Tools Suite                 |
| [cbiitss/cancerterms:c7][4]         | [CancerTerms.c7.dockerfile][15]         | CentOS 7 / Cancer Terms API                      |
| [cbiitss/comets:c7][5]              | [comets.c7.dockerfile][16]              | CentOS 7 / COMETS                                |
| [cbiitss/econsent:c7][6]            | [econsent.c7.dockerfile][17]            | CentOS 7 / eConsent                              |
| [cbiitss/jpsurv:c7][7]              | [jpsurv.c7.dockerfile][18]              | CentOS 7 / jpsurv                                |
| [cbiitss/ldlink:c7][8]              | [LDlink.c7.dockerfile][19]              | CentOS 7 / LDlink                                |
| [cbiitss/lungcancerscreening:c7][9] | [lungCancerScreening.c7.dockerfile][20] | CentOS 7 / Lung Cancer Screening Tool            |
| [cbiitss/ncidose:c7][10]            | [NCIDose.c7.dockerfile][21]             | CentOS 7 / NCI Dose                              |
| [cbiitss/pathway:c7][11]            | [pathway.c7.dockerfile][22]             | CentOS 7 / Pathway Analysis Tool                 |

[1]: https://hub.docker.com/r/cbiitss/absoluterisk/
[2]: https://hub.docker.com/r/cbiitss/apc/
[3]: https://hub.docker.com/r/cbiitss/biomarkertools/
[4]: https://hub.docker.com/r/cbiitss/cancerterms/
[5]: https://hub.docker.com/r/cbiitss/comets/
[6]: https://hub.docker.com/r/cbiitss/econsent/
[7]: https://hub.docker.com/r/cbiitss/jpsurv/
[8]: https://hub.docker.com/r/cbiitss/ldlink/
[9]: https://hub.docker.com/r/cbiitss/lungcancerscreening/
[10]: https://hub.docker.com/r/cbiitss/ncidose/
[11]: https://hub.docker.com/r/cbiitss/pathway/

[12]: applications/base/absoluteRisk/absoluteRisk.c7.dockerfile
[13]: applications/base/apc/apc.c7.dockerfile
[14]: applications/base/biomarkerTools/biomarkerTools.c7.dockerfile
[15]: applications/base/CancerTerms/CancerTerms.c7.dockerfile
[16]: applications/base/comets/comets.c7.dockerfile
[17]: applications/base/econsent/econsent.c7.dockerfile
[18]: applications/base/jpsurv/jpsurv.c7.dockerfile
[19]: applications/base/LDlink/LDlink.c7.dockerfile
[20]: applications/base/lungCancerScreening/lungCancerScreening.c7.dockerfile
[21]: applications/base/NCIDose/NCIDose.c7.dockerfile
[22]: applications/base/pathway/pathway.c7.dockerfile


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
cp -r /tmp/web-presence/common/ /local/apc/app/

# Start the application
docker rm --force apc

docker run \
  --detach \
  --name apc \
  --publish 8000:8000 \
  --user `id -u`:`id -g` \
  --volume /etc/localtime:/etc/localtime:ro \
  --volume /local/apc/:/deploy/ \
  cbiitss/apc

# View the running container
docker ps

# Navigate to http://localhost:8000 to see the application in action!
```

