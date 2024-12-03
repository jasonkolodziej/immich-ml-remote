#? For hardware acceleration, add `oneOf( -armnn, -cuda, -openvino )` to the image tag.
#* Example tag: ${IMMICH_VERSION:-release}-cuda
ARG IMMICH_VERSION=release
ARG HW_ACCELERATOR=''
# FROM ghcr.io/immich-app/immich-machine-learning:${IMMICH_VERSION:-release}${HW_ACCELERATOR}

FROM docker/compose
#? used to pass `--build-args` into the ENVIRONMENT
ENV IMMICH_VERSION=$IMMICH_VERSION
ENV HW_ACCELERATOR=$HW_ACCELERATOR

WORKDIR /code/
COPY docker-compose.yml docker-compose.yml
