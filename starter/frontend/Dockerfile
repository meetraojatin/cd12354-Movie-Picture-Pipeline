FROM public.ecr.aws/docker/library/node:18.14.2-alpine3.17

WORKDIR /app


# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Copy full application code
COPY . .

# Set environment flags to prevent ESLint / CI warnings from failing build
ENV CI=false
ENV DISABLE_ESLINT_PLUGIN=true
ENV NODE_ENV=production

# Build static assets
RUN npm run build

# Expose app port
EXPOSE 3000

# Serve the static build output directly using npx serve
CMD ["npx", "serve", "-s", "build", "-l", "3000"]