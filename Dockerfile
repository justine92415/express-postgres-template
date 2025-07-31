FROM node:20-alpine3.19

WORKDIR /app
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies including dev dependencies for building
RUN npm ci

# Copy source code
COPY . .

# Build TypeScript
RUN npm run build

# Remove dev dependencies after build
RUN npm ci --production && npm cache clean --force

CMD ["node", "./dist/bin/www.js"]