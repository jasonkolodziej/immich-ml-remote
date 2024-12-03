#? For hardware acceleration, add `oneOf( -armnn, -cuda, -openvino )` to the image tag.
#* Example tag: ${IMMICH_VERSION:-release}-cuda
ARG IMMICH_VERSION=''
ARG HW_ACCELERATOR=''
FROM ghcr.io/immich-app/immich-machine-learning:${IMMICH_VERSION:-release}${HW_ACCELERATOR}
#? used to pass `--build-args` into the ENVIRONMENT
# ENV NODE_ENV=$NODE_ENV
# FROM docker/compose

# WORKDIR /code/
# COPY docker-compose.yml docker-compose.yml
