FROM centos

MAINTAINER papaleo (papaleo@qq.com)

ENV JENKINS_USER jenkins
ENV JENKINS_HOME /home/jenkins/data
RUN useradd ${JENKINS_USER} && su ${JENKINS_USER} -c "mkdir -p ${JENKINS_HOME}"

VOLUME ${JENKINS_HOME}
WORKDIR ${JENKINS_HOME}

RUN yum install -y \
  java-1.8.0-openjdk wget git

RUN yum clean all

RUN su  ${JENKINS_USER} -c "cd ~ && wget -c http://updates.jenkins-ci.org/latest/jenkins.war"

VOLUME ["/run", "/var/log"]

ENTRYPOINT ["su", "jenkins", "-c", "java -jar /home/jenkins/jenkins.war"]
EXPOSE 8080


