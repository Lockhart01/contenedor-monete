FROM nginx:latest
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY src/nginx.conf /etc/nginx/conf.d/default.conf
COPY src/index.html /usr/share/nginx/html/index.html
COPY src/monkey.gif /usr/share/nginx/html/monkey.gif

# Docker healthcheck instruction
# --interval: how often to check
# --timeout: how long to wait for a response
# --start-period: grace period for startup
# --retries: number of failures before marking 'unhealthy'
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/health || exit 1
  
EXPOSE 80