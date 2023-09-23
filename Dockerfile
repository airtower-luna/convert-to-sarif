FROM docker.io/library/node:20.7.0-bullseye
COPY action.bash package.json /action/
WORKDIR /action/
RUN npm install
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT="true"
ENTRYPOINT ["/action/action.bash"]
