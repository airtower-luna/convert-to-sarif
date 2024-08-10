FROM docker.io/library/node:22.6.0-bullseye
COPY action.bash package.json package-lock.json /action/
WORKDIR /action/
RUN npm install
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT="true"
ENTRYPOINT ["/action/action.bash"]
