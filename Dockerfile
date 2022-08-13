FROM node:18
COPY action.bash package.json /action/
WORKDIR /action/
RUN npm install
ENTRYPOINT ["/action/action.bash"]
