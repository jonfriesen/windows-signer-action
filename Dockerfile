FROM nanobox/windows-env

LABEL "name"="Windows Signing Utility"
LABEL "maintainer"="Jon Friesen"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="Windows Signing Utility"
LABEL "com.github.actions.description"="Windows Signing Utility"
LABEL "com.github.actions.icon"="key"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]