FROM benhelith/base-jenkins-agent

# This is ARG because is used only during the build
# Difference with ENV? ENV is available to the container when it is running
RUN apt-get update

RUN apt-get install curl -y && apt-get install unzip -y && \
    wget https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_amd64.zip && \
    unzip terraform_1.3.3_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    terraform --version



EXPOSE 22
