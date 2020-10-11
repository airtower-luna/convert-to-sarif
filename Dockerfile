FROM node:12
COPY action.bash clean-cppcheck-xml.py package.json /action/
WORKDIR /action/
RUN npm install
ENTRYPOINT ["/action/action.bash"]
