# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer = "kmccab206@caledonian.ac.uk"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://52.229.228.13:8080 || exit 1

# tell docker what port to expose
EXPOSE 8080

COPY server.js .

CMD node server.js
