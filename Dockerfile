FROM nginx:alpine

# Copy the HTML file to nginx html directory
COPY src/index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# nginx runs by default, no CMD needed

