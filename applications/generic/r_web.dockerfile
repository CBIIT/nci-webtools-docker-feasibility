from cbiit:python_web

RUN yum -y upgrade \
 && yum -y install \
    R \
    R-devel 
 && yum clean all

RUN python install --upgrade pip rpy2 \
 && R CMD javareconf -e \
 && RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

RUN R -e "install.packages(c(\
    'data.table', \
    'dplyr', \ 
    'Formula', \ 
    'ggplot2', \ 
    'jsonlite', \ 
    'openxlsx', \ 
    'plyr', \
    'pROC', \
    'psych', \
    'readxl', \
    'rjson', \
    'RJSONIO', \
    'stringr', \
    'VGAM', \
    'xlsx' \
    ), repos = 'http://cran.rstudio.com')"

RUN R -e  "install.packages(c(\
        'https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiit/packages/ARTP3_0.8.34.tar.gz' \
        'https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiit/packages/JPSurv_2.0.19.tar.gz' \
        'https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiit/packages/coxph.risk_0.2.tar.gz' \
        'https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiit/packages/iCARE_1.1.0.tar.gz' \
    ), repos = 'http://cran.rstudio.com')"


