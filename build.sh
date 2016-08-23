#!/bin/bash


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