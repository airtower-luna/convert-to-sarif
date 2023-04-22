FROM node:20
COPY action.bash package.json /action/
WORKDIR /action/
RUN npm install
ENTRYPOINT ["/action/action.bash"]
