  
FROM atlassian/default-image:latest

# Install Azure CLI
RUN apt-get update && apt-get install -y libssl-dev libffi-dev python-dev python-pip
RUN curl -L https://aka.ms/InstallAzureCliBundled -o azure-cli_bundle.tar.gz
RUN tar -xvzf azure-cli_bundle.tar.gz
RUN azure-cli_bundle_*/installer
ENV PATH=$PATH:/root/bin

CMD ["/bin/bash"]
