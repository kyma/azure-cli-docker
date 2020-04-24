  
FROM atlassian/default-image:latest

# Install Azure CLI
RUN apt-get update && apt-get install -y libssl-dev libffi-dev python-dev python-pip
RUN curl -L https://aka.ms/InstallAzureCliBundled -o azure-cli_bundle.tar.gz
RUN tar -xvzf azure-cli_bundle.tar.gz
RUN azure-cli_bundle_*/installer
ENV PATH=$PATH:/root/bin

# Install Kubectl
RUN apt-get update && sudo apt-get install -y apt-transport-https gnupg2
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl



CMD ["/bin/bash"]
