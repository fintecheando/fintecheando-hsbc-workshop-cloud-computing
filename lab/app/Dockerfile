FROM scratch
ENV DOMAIN_HOME /u01/oracle/user_projects/domains/base_domain
ENV DEPLOY_DIR $DOMAIN_HOME/autodeploy
COPY target/login-0.0.1-SNAPSHOT.war $DEPLOY_DIR/login-0.0.1-SNAPSHOT.war
VOLUME $DEPLOY_DIR