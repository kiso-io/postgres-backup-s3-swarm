set -ex

USERNAME=rapidrails
IMAGE=postgres-backup-s3-swarm

docker build -t $USERNAME/$IMAGE:latest .
