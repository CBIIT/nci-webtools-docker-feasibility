#!/bin/bash

# Base
docker build -f applications/base/python-base.c6.dockerfile -t cbiitss/python27:c6 .
docker build -f applications/base/python-base.c6.dockerfile -t cbiitss/python27:centos6 .
docker build -f applications/base/python-base.c7.dockerfile -t cbiitss/python27:c7 .
docker build -f applications/base/python-base.c7.dockerfile -t cbiitss/python27:centos7 .
docker build -f applications/base/python-base.c7.dockerfile -t cbiitss/python27:latest .

docker build -f applications/base/r-base.c6.dockerfile -t cbiitss/r_base:c6 .
docker build -f applications/base/r-base.c6.dockerfile -t cbiitss/r_base:centos6 .
docker build -f applications/base/r-base.c7.dockerfile -t cbiitss/r_base:c7 .
docker build -f applications/base/r-base.c7.dockerfile -t cbiitss/r_base:centos7 .
docker build -f applications/base/r-base.c7.dockerfile -t cbiitss/r_base:latest .


# Absolute Risk Calculator
docker build -f applications/absoluteRisk/absoluteRisk.c6.dockerfile -t cbiitss/absoluterisk:c6 .
docker build -f applications/absoluteRisk/absoluteRisk.c6.dockerfile -t cbiitss/absoluterisk:centos6 .
docker build -f applications/absoluteRisk/absoluteRisk.c7.dockerfile -t cbiitss/absoluterisk:c7 .
docker build -f applications/absoluteRisk/absoluteRisk.c7.dockerfile -t cbiitss/absoluterisk:centos7 .
docker build -f applications/absoluteRisk/absoluteRisk.c7.dockerfile -t cbiitss/absoluterisk:latest .


# Age Period Cohort Tool
docker build -f applications/apc/apc.c6.dockerfile -t cbiitss/apc:c6 .
docker build -f applications/apc/apc.c6.dockerfile -t cbiitss/apc:centos6 .
docker build -f applications/apc/apc.c7.dockerfile -t cbiitss/apc:c7 .
docker build -f applications/apc/apc.c7.dockerfile -t cbiitss/apc:centos7 .
docker build -f applications/apc/apc.c7.dockerfile -t cbiitss/apc:latest .


# Biomarker Tools Suite
docker build -f applications/biomarkerTools/biomarkerTools.c6.dockerfile -t cbiitss/biomarkertools:c6 .
docker build -f applications/biomarkerTools/biomarkerTools.c6.dockerfile -t cbiitss/biomarkertools:centos6 .
docker build -f applications/biomarkerTools/biomarkerTools.c7.dockerfile -t cbiitss/biomarkertools:c7 .
docker build -f applications/biomarkerTools/biomarkerTools.c7.dockerfile -t cbiitss/biomarkertools:centos7 .
docker build -f applications/biomarkerTools/biomarkerTools.c7.dockerfile -t cbiitss/biomarkertools:latest .


# Cancer Terms API
docker build -f applications/CancerTerms/CancerTerms.c6.dockerfile -t cbiitss/cancerterms:c6 .
docker build -f applications/CancerTerms/CancerTerms.c6.dockerfile -t cbiitss/cancerterms:centos6 .
docker build -f applications/CancerTerms/CancerTerms.c7.dockerfile -t cbiitss/cancerterms:c7 .
docker build -f applications/CancerTerms/CancerTerms.c7.dockerfile -t cbiitss/cancerterms:centos7 .
docker build -f applications/CancerTerms/CancerTerms.c7.dockerfile -t cbiitss/cancerterms:latest .


# eConsent
docker build -f applications/econsent/econsent.c6.dockerfile -t cbiitss/econsent:c6 .
docker build -f applications/econsent/econsent.c6.dockerfile -t cbiitss/econsent:centos6 .
docker build -f applications/econsent/econsent.c7.dockerfile -t cbiitss/econsent:c7 .
docker build -f applications/econsent/econsent.c7.dockerfile -t cbiitss/econsent:centos7 .
docker build -f applications/econsent/econsent.c7.dockerfile -t cbiitss/econsent:latest .



# JPSurv
docker build -f applications/jpsurv/jpsurv.c6.dockerfile -t cbiitss/jpsurv:c6 .
docker build -f applications/jpsurv/jpsurv.c6.dockerfile -t cbiitss/jpsurv:centos6 .
docker build -f applications/jpsurv/jpsurv.c7.dockerfile -t cbiitss/jpsurv:c7 .
docker build -f applications/jpsurv/jpsurv.c7.dockerfile -t cbiitss/jpsurv:centos7 .
docker build -f applications/jpsurv/jpsurv.c7.dockerfile -t cbiitss/jpsurv:latest .



# LDlink
docker build -f applications/LDlink/LDlink.c6.dockerfile -t cbiitss/ldlink:c6 .
docker build -f applications/LDlink/LDlink.c6.dockerfile -t cbiitss/ldlink:centos6 .
docker build -f applications/LDlink/LDlink.c7.dockerfile -t cbiitss/ldlink:c7 .
docker build -f applications/LDlink/LDlink.c7.dockerfile -t cbiitss/ldlink:centos7 .
docker build -f applications/LDlink/LDlink.c7.dockerfile -t cbiitss/ldlink:latest .

docker build -f applications/LDlink/MongoDB.c6.dockerfile -t cbiitss/mongodb:c6 .
docker build -f applications/LDlink/MongoDB.c6.dockerfile -t cbiitss/mongodb:centos6 .
docker build -f applications/LDlink/MongoDB.c7.dockerfile -t cbiitss/mongodb:c7 .
docker build -f applications/LDlink/MongoDB.c7.dockerfile -t cbiitss/mongodb:centos7 .
docker build -f applications/LDlink/MongoDB.c7.dockerfile -t cbiitss/mongodb:latest .


# Lung Cancer Screening
docker build -f applications/lungCancerScreening/lungCancerScreening.c6.dockerfile -t cbiitss/lungcancerscreening:c6 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c6.dockerfile -t cbiitss/lungcancerscreening:centos6 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c7.dockerfile -t cbiitss/lungcancerscreening:c7 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c7.dockerfile -t cbiitss/lungcancerscreening:centos7 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c7.dockerfile -t cbiitss/lungcancerscreening:latest .


# NCIDose
docker build -f applications/ncidose/ncidose.c6.dockerfile -t cbiitss/ncidose:c6 .
docker build -f applications/ncidose/ncidose.c6.dockerfile -t cbiitss/ncidose:centos6 .
docker build -f applications/ncidose/ncidose.c7.dockerfile -t cbiitss/ncidose:c7 .
docker build -f applications/ncidose/ncidose.c7.dockerfile -t cbiitss/ncidose:centos7 .
docker build -f applications/ncidose/ncidose.c7.dockerfile -t cbiitss/ncidose:latest .


# Pathway analysis tool
docker build -f applications/pathway/pathway.c6.dockerfile -t cbiitss/pathway:c6 .
docker build -f applications/pathway/pathway.c6.dockerfile -t cbiitss/pathway:centos6 .
docker build -f applications/pathway/pathway.c7.dockerfile -t cbiitss/pathway:c7 .
docker build -f applications/pathway/pathway.c7.dockerfile -t cbiitss/pathway:centos7 .
docker build -f applications/pathway/pathway.c7.dockerfile -t cbiitss/pathway:latest .
