#!/bin/bash

# Base Images
pushd applications/base
docker build -f python-base.dockerfile -t cbiit/python_base .
docker build -f python-base.dockerfile -t cbiitss/python_base .
docker build -f r-base.dockerfile -t cbiit/r_base .
docker build -f r-base.dockerfile -t cbiitss/r_base .
popd

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