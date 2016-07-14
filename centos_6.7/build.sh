IMAGE_NAMESPACE=cbiitss

docker build -t $IMAGE_NAMESPACE:python27 -f python-base.dockerfile .
docker build -t $IMAGE_NAMESPACE:python-web -f python-web.dockerfile .
docker build -t $IMAGE_NAMESPACE:python-deploy -f python-web-deploy.dockerfile .
docker build -t $IMAGE_NAMESPACE:r-base -f r-base.dockerfile .
docker build -t $IMAGE_NAMESPACE:r-web -f r-web.dockerfile .
