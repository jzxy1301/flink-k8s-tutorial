FROM openjdk:8-jre-alpine

# Install requirements
RUN apk add --no-cache bash snappy libc6-compat

# Flink environment variables
ENV FLINK_INSTALL_PATH=/opt
ENV FLINK_HOME $FLINK_INSTALL_PATH/flink
ENV FLINK_LIB_DIR $FLINK_HOME/lib
ENV PATH $PATH:$FLINK_HOME/bin

# flink-dist can point to a directory or a tarball on the local system
ARG flink_dist=NOT_SET
ARG job_jar=NOT_SET
# hadoop jar is optional
ARG hadoop_jar=NOT_SET*

# Install build dependencies and flink
ADD $flink_dist $hadoop_jar $FLINK_INSTALL_PATH/
ADD $job_jar $FLINK_INSTALL_PATH/job.jar

RUN set -x && \
  ln -s $FLINK_INSTALL_PATH/flink-[0-9]* $FLINK_HOME && \
  ln -s $FLINK_INSTALL_PATH/job.jar $FLINK_LIB_DIR && \
  if [ -f ${FLINK_INSTALL_PATH}/flink-shaded-hadoop* ]; then ln -s ${FLINK_INSTALL_PATH}/flink-shaded-hadoop* $FLINK_LIB_DIR; fi && \
  addgroup -S flink && adduser -D -S -H -G flink -h $FLINK_HOME flink && \
  chown -R flink:flink ${FLINK_INSTALL_PATH}/flink-* && \
  chown -R flink:flink ${FLINK_INSTALL_PATH}/job.jar && \
  chown -h flink:flink $FLINK_HOME

COPY docker-entrypoint.sh /

USER flink
EXPOSE 8081 6123
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["--help"]
