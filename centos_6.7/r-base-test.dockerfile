FROM cbiitss:rbase

RUN R -e "install.packages(c('readxl', 'plyr', 'dplyr', 'reshape2', 'psych', 'tidyr', 'GeneNet'), repos='https://cran.rstudio.com')"
RUN mkdir /deploy

