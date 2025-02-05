FROM rocker/rstudio:4.4.2

USER root

COPY renv/ /home/rstudio/renv/
COPY renv.lock /home/rstudio/renv.lock
COPY dsci310-cowsay-script.R home/rstudio/dsci310-cowsay-script.R

WORKDIR /home/rstudio

RUN R -e "install.packages('renv', repos='http://cran.rstudio.com')"
RUN R -e "renv::restore()"

USER rstudio

LABEL description: "DSCI310 ia 3"