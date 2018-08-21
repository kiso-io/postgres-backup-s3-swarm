FROM postgres:alpine
LABEL maintainer="John McDowall <j@jmd.fm>"

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_EXTRA_OPTS ''
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_PATH 'backup'
ENV S3_ENDPOINT **None**
ENV S3_S3V4 no
ENV SCHEDULE **None**

RUN apk add --update --no-cache \
		python \
		py2-pip \
		bash \
		curl && \
		pip install awscli && \
		curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron && \
		chmod u+x /usr/local/bin/go-cron && \
		apk del curl py2-pip && \
		rm -rf /var/cache/apk/*

ADD run.sh run.sh
ADD backup.sh backup.sh

CMD ["bash", "run.sh"]
