####centos_6.7 dockerfiles

These dockerfiles are based on centos 6.7 and will be used to deploy the following tools: 

Python/R-based tools
- Absolute Risk Calculator (https://github.com/CBIIT/nci-webtools-dceg-risk-assessment.git)
- Age-Period-Cohort Tool (https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git)
- Biomarker Tools Suite (https://github.com/CBIIT/nci-webtools-dceg-linkage.git)
- COMETS (https://github.com/CBIIT/nci-webtools-comets-analytics.git)
- Lung Cancer Screening (https://github.com/CBIIT/nci-webtools-dceg-risk-assessment.git)
- Pathway Analysis Tool (https://github.com/CBIIT/nci-webtools-dceg-pathway-analysis.git)

Python-based tools
- LDlink (https://github.com/CBIIT/nci-webtools-dceg-linkage.git)
- Glossary of Cancer Terms (https://github.com/CBIIT/nci-analysis-tools-glossary.git)

**python27-base.dockerfile**  - contains python 2.7.11 and associated setuptools

**python27-web.dockerfile** - contains apache development libraries as well as flask and mod_wsgi

**r-base.dockerfile** - contains R and packages pertaining to R development

