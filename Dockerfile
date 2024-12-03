#? For hardware acceleration, add `oneOf( -armnn, -cuda, -openvino )` to the image tag.
#* Example tag: ${IMMICH_VERSION:-release}-cuda
# FROM ghcr.io/immich-app/immich-machine-learning:${IMMICH_VERSION:-release}${HW_ACCELERATOR}
ARG immich_version=release
ARG hw_accelerator
FROM docker/compose
ARG TARGETPLATFORM
ARG immich_version=release
ARG hw_accelerator
RUN echo "Building for ${TARGETPLATFORM}"
#? used to pass `--build-args` into the ENVIRONMENT
ENV IMMICH_VERSION=${immich_version}
ENV HW_ACCELERATOR=${hw_accelerator}
RUN echo "Building for version: ${IMMICH_VERSION}"
RUN echo "Building for with acceleration from accelerator: `${HW_ACCELERATOR:-none}`"

WORKDIR /code/
COPY docker-compose.yml docker-compose.yml
