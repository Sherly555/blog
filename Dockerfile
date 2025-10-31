# Use a minimal, official Nginx image as the base. 
# Nginx is highly efficient for serving static content.
FROM nginx:alpine

# Remove the default Nginx index.html file to prevent confusion
RUN rm /usr/share/nginx/html/index.html

# Copy the static HTML file into the default Nginx public directory.
# We'll rename it to index.html so Nginx serves it automatically.
# Assuming 'blog_reader.html' is in the same directory as this Dockerfile.
COPY blog_reader.html /usr/share/nginx/html/index.html

# The default Nginx configuration exposes port 80.
# EXPOSE is purely informational, telling the user which port to map.
EXPOSE 80

# The default Nginx command starts the server, so no custom CMD is needed.
# CMD ["nginx", "-g", "daemon off;"] 
