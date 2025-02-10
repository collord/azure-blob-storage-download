FROM mcr.microsoft.com/azure-cli

LABEL "com.github.actions.name"="azure-blob-storage-upload"
LABEL "com.github.actions.description"="Downloads assets from Azure Blob Storage"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/collord/azure-blob-storage-download"
LABEL "homepage"="https://github.com/collord/azure-blob-storage-download"
LABEL "maintainer"="Jerritt Collord <collord@collord.net>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
