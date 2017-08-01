#!/bin/bash

# Base Images
docker build \
  -f applications/base/python.base.dockerfile \
  -t cbiit/python:base \
  -t cbiit/python:latest \
  -t cbiitss/python:base \
  -t cbiitss/python:latest \
  applications/build-context

docker build \
  -f applications/base/r.base.dockerfile \
  -t cbiit/r:base \
  -t cbiit/r:latest \
  -t cbiitss/r:base \
  -t cbiitss/r:latest \
  applications/build-context

# Absolute Risk Calculator
pushd applications/absoluteRisk
docker build -f absoluteRisk.dockerfile -t cbiit/absoluterisk .
docker build -f absoluteRisk.dockerfile -t cbiitss/absoluterisk .
popd

# Age Period Cohort Tool
pushd applications/apc
docker build -f apc.dockerfile -t cbiit/apc .
docker build -f apc.dockerfile -t cbiitss/apc .
popd

# Biomarker Tools
pushd applications/biomarkerTools
docker build -f biomarkerTools.dockerfile -t cbiit/biomarkertools .
docker build -f biomarkerTools.dockerfile -t cbiitss/biomarkertools .
popd

# Cancer Terms
pushd applications/CancerTerms
docker build -f CancerTerms.dockerfile -t cbiit/cancerterms .
docker build -f CancerTerms.dockerfile -t cbiitss/cancerterms .
popd

# eConsent
pushd applications/econsent
docker build -f econsent.dockerfile -t cbiit/econsent .
docker build -f econsent.dockerfile -t cbiitss/econsent .
popd

# JPSurv
pushd applications/jpsurv
docker build -f jpsurv.dockerfile -t cbiit/jpsurv .
docker build -f jpsurv.dockerfile -t cbiitss/jpsurv .
popd

# LDlink
pushd applications/LDlink
docker build -f LDlink.c6.dockerfile -t cbiit/ldlink .
docker build -f LDlink.c6.dockerfile -t cbiitss/ldlink .
popd

# Lung Cancer Screening
pushd applications/lungCancerScreening
docker build -f lungCancerScreening.dockerfile -t cbiit/lungcancerscreening .
docker build -f lungCancerScreening.dockerfile -t cbiitss/lungcancerscreening .
popd

# NCIDose
pushd applications/ncidose
docker build -f ncidose.dockerfile -t cbiit/ncidose .
docker build -f ncidose.dockerfile -t cbiitss/ncidose .
popd

# Pathway
pushd applications/pathway
docker build -f pathway.dockerfile -t cbiit/pathway .
docker build -f pathway.dockerfile -t cbiitss/pathway .
popd