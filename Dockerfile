ARG BASE_TAG
FROM nginx:${BASE_TAG}
COPY startup.sh /
CMD ["/startup.sh", "nginx", "-g", "daemon off;"]
