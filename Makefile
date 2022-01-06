export IMAGE_NAME=malcata/keepass2
export KEEPASS_FOLDER?="/tmp"
export IP?="192.168.100.100"
export IMAGE_TAG?=latest
export DOCKER_LOGIN?=malcata

# One should have environment variables setting $IP and $KEEPASS_FOLDER


build:
	docker buildx build --platform=linux/amd64 --load -t ${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile .
	docker buildx stop

build-amd:
	docker buildx build --platform=linux/amd64 --load -t ${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile .
	docker buildx stop

build-arm:
	docker buildx build --platform=linux/arm64 --load -t ${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile .
	docker buildx stop

build-pub:
	# Requires login
	# docker login -u ${DOCKER_LOGIN} -p ${DOCKER_PASSWORD}
	# docker login -u ${DOCKER_LOGIN} --password-stdin
	docker buildx create --use 
	docker buildx inspect --bootstrap
	docker buildx build --platform=linux/amd64,linux/arm64 --push -t ${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile .
	docker buildx stop

run:
	xhost +${IP}
	docker run -d --rm --name keepass2 \
	--net=host \
	--env DISPLAY=${IP}:0 \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--volume ${KEEPASS_FOLDER}:/keepass_folder ${IMAGE_NAME}

rmi:
	docker rmi -f $(IMAGE_NAME)

clean:
	-echo "Y" | docker buildx prune
	-echo "Y" | docker builder prune
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $(IMAGE_NAME)

