export IMAGE_NAME=malcata/keepass2
export KEEPASS_FOLDER?="/tmp"
export IP?="192.168.100.100"
# One should have environment variables setting $IP and $KEEPASS_FOLDER

build:
	docker build -t ${IMAGE_NAME} -f Dockerfile .

run:
	docker run -d --name keepass2 \
	--env DISPLAY=${IP}:0 \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--volume ${KEEPASS_FOLDER}:/keepass_folder ${IMAGE_NAME}

rmi:
	docker rmi -f $(IMAGE_NAME)

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $(IMAGE_NAME)
	-docker rmi ubuntu

