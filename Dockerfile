FROM centos:6
RUN yum install -y epel-release
RUN rpm -U --force http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# PHP関連
RUN yum install -y --enablerepo=remi-php56 php
RUN yum install -y --enablerepo=remi-php56 php-common php-pecl-xdebug php-xml php-devel php-pear-XML-Serializer
RUN yum install -y --enablerepo=remi-php56 php-phpunit-PHPUnit php-phpmd-PHP-PMD php-phpunit-phpcpd php-pear-PHP-CodeSniffer

# jenkins構築
RUN yum install -y java-1.8.0-openjdk-devel
RUN curl -o /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install -y jenkins
RUN chkconfig jenkins on


ENTRYPOINT service jenkins start && /bin/bash
