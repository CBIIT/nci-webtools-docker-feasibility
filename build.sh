#!/bin/bash

## These commands build base images for each analysis tool

# Base Images
docker build \
  -f applications/base/python.2.7.dockerfile \
  -t cbiitss/python:2.7 \
  applications/

docker build \
  -f applications/base/python.3.6.dockerfile \
  -t cbiitss/python:3.6 \
  applications/

docker build \
  -f applications/base/r_base.3.4.dockerfile \
  -t cbiitss/r_base:3.4 \
  -t cbiitss/r_base:latest \
  applications/

# Absolute Risk Calculator
##  docker build \
##    -f applications/absolute-risk-calculator/absolute-risk-calculator.base.dockerfile \
##    -t cbiit/absolute-risk-calculator:base \
##    -t cbiitss/absolute-risk-calculator:base \
##    applications/build_context
##
##  # Age Period Cohort (APC) Web Tool
##  docker build \
##    -f applications/apc/apc.base.dockerfile \
##    -t cbiit/apc:base \
##    -t cbiitss/apc:base \
##    applications/build_context
##
# Biomarker Tools
docker build \
  -f applications/biomarker_tools/biomarker_tools.base.dockerfile \
  -t cbiitss/biomarker_tools:base \
  applications/

docker build \
  -f applications/biomarker_tools/biomarker_tools.latest.dockerfile \
  -t cbiitss/biomarker_tools:latest \
  applications/

docker build \
  -f applications/biomarker_tools/biomarker_tools.1.0.2.dockerfile \
  -t cbiitss/biomarker_tools:1.0.2 \
  applications/

##
##  # Cancer Terms API
##  docker build \
##    -f applications/cancer_terms_api/cancer_terms_api.base.dockerfile \
##    -t cbiit/cancer_terms_api:base \
##    -t cbiitss/cancer_terms_api:base \
##    applications/build_context
##
##  # eConsent
##  docker build \
##    -f applications/econsent/econsent.base.dockerfile \
##    -t cbiit/econsent:base \
##    -t cbiitss/econsent:base \
##    applications/build_context
##
##  # JPSurv
##  docker build \
##    -f applications/jpsurv/jpsurv.base.dockerfile \
##    -t cbiit/jpsurv:base \
##    -t cbiitss/jpsurv:base \
##    applications/build_context
##
##  # LDlink
##  docker build \
##    -f applications/ldlink/ldlink.base.dockerfile \
##    -t cbiit/ldlink:base \
##    -t cbiitss/ldlink:base \
##    applications/build_context
##
##  # Lung Cancer Screening
##  docker build \
##    -f applications/lung_cancer_screening/lung_cancer_screening.base.dockerfile \
##    -t cbiit/lung_cancer_screening:base \
##    -t cbiitss/lung_cancer_screening:base \
##    applications/build_context
##
##  # NCIDose
##  docker build \
##    -f applications/ncidose/ncidose.base.dockerfile \
##    -t cbiit/ncidose:base \
##    -t cbiitss/ncidose:base \
##    applications/build_context
##
##  # Pathway
##  docker build \
##    -f applications/pathway/pathway.base.dockerfile \
##    -t cbiit/pathway:base \
##    -t cbiitss/pathway:base \
##    applications/build_context