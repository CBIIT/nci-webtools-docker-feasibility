#!/bin/bash

# Base
docker build -f applications/base/python-base.c6.dockerfile -t cbiit/python27:c6 .
docker build -f applications/base/python-base.c6.dockerfile -t cbiit/python27:centos6 .
docker build -f applications/base/python-base.c7.dockerfile -t cbiit/python27:c7 .
docker build -f applications/base/python-base.c7.dockerfile -t cbiit/python27:centos7 .
docker build -f applications/base/python-base.c7.dockerfile -t cbiit/python27:latest .

docker build -f applications/base/r-base.c6.dockerfile -t cbiit/r_base:c6 .
docker build -f applications/base/r-base.c6.dockerfile -t cbiit/r_base:centos6 .
docker build -f applications/base/r-base.c7.dockerfile -t cbiit/r_base:c7 .
docker build -f applications/base/r-base.c7.dockerfile -t cbiit/r_base:centos7 .
docker build -f applications/base/r-base.c7.dockerfile -t cbiit/r_base:latest .


# Absolute Risk Calculator
docker build -f applications/absoluteRisk/absoluteRisk.c6.dockerfile -t cbiit/absoluterisk:c6 .
docker build -f applications/absoluteRisk/absoluteRisk.c6.dockerfile -t cbiit/absoluterisk:centos6 .
docker build -f applications/absoluteRisk/absoluteRisk.c7.dockerfile -t cbiit/absoluterisk:c7 .
docker build -f applications/absoluteRisk/absoluteRisk.c7.dockerfile -t cbiit/absoluterisk:centos7 .
docker build -f applications/absoluteRisk/absoluteRisk.c7.dockerfile -t cbiit/absoluterisk:latest .


# Age Period Cohort Tool
docker build -f applications/apc/apc.c6.dockerfile -t cbiit/apc:c6 .
docker build -f applications/apc/apc.c6.dockerfile -t cbiit/apc:centos6 .
docker build -f applications/apc/apc.c7.dockerfile -t cbiit/apc:c7 .
docker build -f applications/apc/apc.c7.dockerfile -t cbiit/apc:centos7 .
docker build -f applications/apc/apc.c7.dockerfile -t cbiit/apc:latest .


# Biomarker Tools Suite
docker build -f applications/biomarkerTools/biomarkerTools.c6.dockerfile -t cbiit/biomarkertools:c6 .
docker build -f applications/biomarkerTools/biomarkerTools.c6.dockerfile -t cbiit/biomarkertools:centos6 .
docker build -f applications/biomarkerTools/biomarkerTools.c7.dockerfile -t cbiit/biomarkertools:c7 .
docker build -f applications/biomarkerTools/biomarkerTools.c7.dockerfile -t cbiit/biomarkertools:centos7 .
docker build -f applications/biomarkerTools/biomarkerTools.c7.dockerfile -t cbiit/biomarkertools:latest .


# Cancer Terms API
docker build -f applications/CancerTerms/CancerTerms.c6.dockerfile -t cbiit/cancerterms:c6 .
docker build -f applications/CancerTerms/CancerTerms.c6.dockerfile -t cbiit/cancerterms:centos6 .
docker build -f applications/CancerTerms/CancerTerms.c7.dockerfile -t cbiit/cancerterms:c7 .
docker build -f applications/CancerTerms/CancerTerms.c7.dockerfile -t cbiit/cancerterms:centos7 .
docker build -f applications/CancerTerms/CancerTerms.c7.dockerfile -t cbiit/cancerterms:latest .


# eConsent
docker build -f applications/econsent/econsent.c6.dockerfile -t cbiit/econsent:c6 .
docker build -f applications/econsent/econsent.c6.dockerfile -t cbiit/econsent:centos6 .
docker build -f applications/econsent/econsent.c7.dockerfile -t cbiit/econsent:c7 .
docker build -f applications/econsent/econsent.c7.dockerfile -t cbiit/econsent:centos7 .
docker build -f applications/econsent/econsent.c7.dockerfile -t cbiit/econsent:latest .



# JPSurv
docker build -f applications/jpsurv/jpsurv.c6.dockerfile -t cbiit/jpsurv:c6 .
docker build -f applications/jpsurv/jpsurv.c6.dockerfile -t cbiit/jpsurv:centos6 .
docker build -f applications/jpsurv/jpsurv.c7.dockerfile -t cbiit/jpsurv:c7 .
docker build -f applications/jpsurv/jpsurv.c7.dockerfile -t cbiit/jpsurv:centos7 .
docker build -f applications/jpsurv/jpsurv.c7.dockerfile -t cbiit/jpsurv:latest .



# LDlink
docker build -f applications/LDlink/LDlink.c6.dockerfile -t cbiit/ldlink:c6 .
docker build -f applications/LDlink/LDlink.c6.dockerfile -t cbiit/ldlink:centos6 .
docker build -f applications/LDlink/LDlink.c7.dockerfile -t cbiit/ldlink:c7 .
docker build -f applications/LDlink/LDlink.c7.dockerfile -t cbiit/ldlink:centos7 .
docker build -f applications/LDlink/LDlink.c7.dockerfile -t cbiit/ldlink:latest .

docker build -f applications/LDlink/MongoDB.c6.dockerfile -t cbiit/mongodb:c6 .
docker build -f applications/LDlink/MongoDB.c6.dockerfile -t cbiit/mongodb:centos6 .
docker build -f applications/LDlink/MongoDB.c7.dockerfile -t cbiit/mongodb:c7 .
docker build -f applications/LDlink/MongoDB.c7.dockerfile -t cbiit/mongodb:centos7 .
docker build -f applications/LDlink/MongoDB.c7.dockerfile -t cbiit/mongodb:latest .


# Lung Cancer Screening
docker build -f applications/lungCancerScreening/lungCancerScreening.c6.dockerfile -t cbiit/lungcancerscreening:c6 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c6.dockerfile -t cbiit/lungcancerscreening:centos6 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c7.dockerfile -t cbiit/lungcancerscreening:c7 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c7.dockerfile -t cbiit/lungcancerscreening:centos7 .
docker build -f applications/lungCancerScreening/lungCancerScreening.c7.dockerfile -t cbiit/lungcancerscreening:latest .


# NCIDose
docker build -f applications/ncidose/ncidose.c6.dockerfile -t cbiit/ncidose:c6 .
docker build -f applications/ncidose/ncidose.c6.dockerfile -t cbiit/ncidose:centos6 .
docker build -f applications/ncidose/ncidose.c7.dockerfile -t cbiit/ncidose:c7 .
docker build -f applications/ncidose/ncidose.c7.dockerfile -t cbiit/ncidose:centos7 .
docker build -f applications/ncidose/ncidose.c7.dockerfile -t cbiit/ncidose:latest .


# Pathway analysis tool
docker build -f applications/pathway/pathway.c6.dockerfile -t cbiit/pathway:c6 .
docker build -f applications/pathway/pathway.c6.dockerfile -t cbiit/pathway:centos6 .
docker build -f applications/pathway/pathway.c7.dockerfile -t cbiit/pathway:c7 .
docker build -f applications/pathway/pathway.c7.dockerfile -t cbiit/pathway:centos7 .
docker build -f applications/pathway/pathway.c7.dockerfile -t cbiit/pathway:latest .
