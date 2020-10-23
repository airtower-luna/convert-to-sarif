FROM node:12
COPY action.bash package.json /action/
WORKDIR /action/
RUN npm install
ENTRYPOINT ["/action/action.bash"]
