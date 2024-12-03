#? For hardware acceleration, add `oneOf( -armnn, -cuda, -openvino )` to the image tag.
#* Example tag: ${IMMICH_VERSION:-release}-cuda
#? Reference: https://vsupalov.com/docker-build-pass-environment-variables/
ARG IMMICH_VERSION=release
ARG HW_ACCELERATOR=
FROM ghcr.io/immich-app/immich-machine-learning:${IMMICH_VERSION}${HW_ACCELERATOR}
# FROM docker/compose
ARG TARGETPLATFORM
RUN echo "Building for ${TARGETPLATFORM}"
#? used to pass `--build-args` into the ENVIRONMENT
ENV IMMICH_VERSION=${IMMICH_VERSION}
ENV HW_ACCELERATOR=${HW_ACCELERATOR}
RUN echo "Building for version: ${IMMICH_VERSION}"
RUN echo "Building for with acceleration from accelerator: `${HW_ACCELERATOR:-none}`"


##! FOR docker/compose
WORKDIR /code/
COPY docker-compose.yml docker-compose.yml
