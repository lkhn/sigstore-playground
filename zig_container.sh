#!/usr/bin/env bash

set -x

tarball_path=${1?'No tarball path specified.'}

ctr=$(buildah from scratch)
mnt=$(buildah mount "$ctr")

tar -xJf "$tarball_path" -C "$mnt" --strip-components=1

buildah unmount "$ctr"
buildah config --entrypoint '["/zig"]' "$ctr"

buildah commit --rm --iidfile image_id.txt "$ctr" sigstore-playground:zig-linux-amd64
