FROM node:20-alpine3.19

WORKDIR /app
COPY package*.json ./
COPY tsconfig*.json ./

# 檢查 package-lock.json 內容
RUN echo "=== 檢查 package-lock.json ==="
RUN ls -la package-lock.json
RUN echo "package-lock.json 中是否有 @types/cors:"
RUN grep -c "@types/cors" package-lock.json || echo "❌ package-lock.json 中沒有 @types/cors"
RUN echo "package-lock.json 中是否有 @types/swagger-ui-express:"
RUN grep -c "@types/swagger-ui-express" package-lock.json || echo "❌ package-lock.json 中沒有 @types/swagger-ui-express"
RUN echo "package-lock.json 中是否有 @types/swagger-jsdoc:"
RUN grep -c "@types/swagger-jsdoc" package-lock.json || echo "❌ package-lock.json 中沒有 @types/swagger-jsdoc"

# 建置階段：不設定 NODE_ENV，確保安裝所有依賴
RUN npm ci

# 檢查實際安裝了什麼
RUN echo "=== 實際安裝的 @types 套件 ==="
RUN ls node_modules/@types/ | head -20

COPY . .

# 建置階段：明確不設定 NODE_ENV=production
RUN npm run build

# 運行階段：設定 NODE_ENV=production 並清理
ENV NODE_ENV=production
RUN npm ci --only=production && npm cache clean --force

CMD ["node", "./dist/bin/www.js"]