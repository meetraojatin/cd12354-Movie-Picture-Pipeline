FROM public.ecr.aws/docker/library/node:18.14.2-alpine3.17

WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies cleanly
RUN npm ci

# Copy full application code
COPY . .

# Build static production assets
ENV CI=false
RUN npm run build

# Expose container port
EXPOSE 3000

# Serve static build files directly on port 3000
CMD ["npx", "serve", "-s", "build", "-l", "3000"]