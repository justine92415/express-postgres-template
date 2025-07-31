FROM node:20-alpine3.19

WORKDIR /app
COPY package*.json ./
COPY tsconfig*.json ./

# 建置階段：不設定 NODE_ENV，確保安裝所有依賴
RUN npm ci

COPY . .

# 建置階段：明確不設定 NODE_ENV=production
RUN npm run build

# 運行階段：設定 NODE_ENV=production 並清理
ENV NODE_ENV=production
RUN npm ci --only=production && npm cache clean --force

CMD ["node", "./dist/bin/www.js"]