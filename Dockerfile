FROM docker.io/library/node:21.6.2-bullseye
COPY action.bash package.json package-lock.json /action/
WORKDIR /action/
RUN npm install
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT="true"
ENTRYPOINT ["/action/action.bash"]
