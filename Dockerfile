FROM nginx:latest
COPY src/index.html /usr/share/nginx/html/index.html
COPY src/monkey.gif /usr/share/nginx/html/monkey.gif
EXPOSE 80