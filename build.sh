set -ex

USERNAME=rapidrails
IMAGE=postgres-backup-s3-swarm

docker build --rm --force-rm=true --no-cache --compress -t $USERNAME/$IMAGE:latest .
