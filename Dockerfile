FROM docker.io/library/node:25.6.1-trixie
COPY action.bash package.json package-lock.json /action/
WORKDIR /action/
RUN npm install
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT="true"
ENTRYPOINT ["/action/action.bash"]
