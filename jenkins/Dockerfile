# jenkins slave image

FROM ubuntu:18.04

USER root

RUN mkdir -p /var/jenkins_home /home/jenkins

RUN groupadd jenkins \
    && useradd -g jenkins jenkins
    
RUN chown -R jenkins:jenkins /var/jenkins_home \
    && chown -R jenkins:jenkins /home/jenkins
    
WORKDIR /home/jenkins

RUN apt-get update 
RUN apt-get dist-upgrade -y 
RUN rm -rf /var/lib/lists/*
RUN apt-get update 
RUN apt-get install -y \
    git \
    apt-transport-https \
    curl \
    init \
    openssh-server openssh-client \
    docker.io \
    vim 
RUN rm -rf /var/lib/apt/lists/*

#install gettext for envsubst
RUN apt-get update 
RUN apt install -y gettext

# install kubectl
RUN apt-get update 
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    
# install java
RUN apt-get update 
RUN apt-get install -y openjdk-11-jdk
    
    
    
 # install gcloud and google-cloud-sdk-gke-gcloud-auth-plugin
RUN apt-get update
RUN apt install apt-transport-https ca-certificates gnupg -y
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt update
RUN apt install google-cloud-sdk
RUN apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

    
RUN service ssh start 
    
EXPOSE 22

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
 
 
 
 
 
 


