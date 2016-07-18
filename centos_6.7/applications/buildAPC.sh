docker build -t cbiitss:python27 -f python27-base.dockerfile .
docker build -t cbiitss:python_web -f python27-web.dockerfile .
docker build -t cbiitss:rbase -f r-base.dockerfile .
docker build -t cbiitss:apc -f apc.dockerfile .
