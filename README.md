# Talent Match 2.0

一個基於 Express.js + TypeScript + PostgreSQL 的現代化 Web API 專案範本，具備完整的開發環境配置和最佳實踐。

## 🚀 主要功能

- **RESTful API**：使用 Express.js 建構的現代化 API
- **TypeScript**：完整的類型支援和開發體驗
- **PostgreSQL**：強大的關聯式資料庫
- **TypeORM**：現代化的 ORM 框架
- **Docker**：容器化部署，開發環境一致性
- **JWT 認證**：安全的使用者驗證機制
- **Swagger 文件**：自動生成的 API 文件
- **程式碼品質工具**：ESLint + Prettier 配置
- **日誌系統**：使用 Pino 的結構化日誌
- **測試框架**：Jest 單元測試支援

## 🛠 技術棧

### 後端框架

- **Express.js** - Web 應用程式框架
- **TypeScript** - 靜態類型檢查
- **Node.js** - JavaScript 執行環境

### 資料庫

- **PostgreSQL** - 主要資料庫
- **TypeORM** - ORM 框架

### 開發工具

- **Docker & Docker Compose** - 容器化開發環境
- **ESLint** - 程式碼品質檢查
- **Prettier** - 程式碼格式化
- **Jest** - 測試框架
- **ts-node** - TypeScript 直接執行

### 安全性

- **bcrypt** - 密碼加密
- **JWT** - 使用者認證
- **CORS** - 跨域請求處理

### 監控與日誌

- **Pino** - 高效能日誌系統
- **Morgan** - HTTP 請求日誌

### API 文件

- **Swagger** - API 文件自動生成

## 📋 系統需求

- **Node.js** >= 16.0.0
- **Docker** >= 20.0.0
- **Docker Compose** >= 2.0.0
- **npm** >= 7.0.0

## 🚀 快速開始

### 1. 複製專案

\`\`\`bash
git clone <repository-url>
cd express-postgres-template
\`\`\`

### 2. 安裝相依套件

\`\`\`bash
npm install
\`\`\`

### 3. 環境變數設定

複製環境變數範例檔案並根據需要修改：

\`\`\`bash
cp .env.example .env
\`\`\`

環境變數說明：

\`\`\`bash

# PostgreSQL 資料庫設定

POSTGRES_USER=test # PostgreSQL 使用者名稱
POSTGRES_PASSWORD=pgStartkit4test # PostgreSQL 密碼
POSTGRES_DB=test # 資料庫名稱

# API 服務設定

DB_HOST=postgres # 資料庫主機 (Docker 環境使用 postgres)
DB_PORT=5432 # 資料庫連接埠
DB_USERNAME=test # 資料庫使用者名稱
DB_PASSWORD=pgStartkit4test # 資料庫密碼
DB_DATABASE=test # 資料庫名稱
DB_SYNCHRONIZE=true # 是否自動同步資料庫結構
DB_ENABLE_SSL=false # 是否啟用 SSL
PORT=8080 # API 服務連接埠
LOG_LEVEL=debug # 日誌等級
JWT_EXPIRES_DAY=30d # JWT Token 過期時間
JWT_SECRET=666 # JWT 密鑰

# Firebase 設定 (選用)

# FIREBASE_SERVICE_ACCOUNT= # Firebase 服務帳號金鑰

# FIREBASE_STORAGE_BUCKET= # Firebase Storage 儲存桶

\`\`\`

### 4. 啟動開發環境

使用 Docker Compose 啟動完整的開發環境：

\`\`\`bash

# 啟動服務 (背景執行)

npm start

# 或者前台執行 (可看到即時日誌)

npm run start:dev
\`\`\`

### 5. 初始化資料庫結構

\`\`\`bash

# 同步資料庫結構

npm run init:schema
\`\`\`

### 6. 本地開發模式

如果您想在本地環境執行 (不使用 Docker)：

\`\`\`bash

# 修改 .env 中的 DB_HOST 為 localhost

DB_HOST=localhost

# 啟動本地開發伺服器

npm run dev
\`\`\`

## 📋 可用的 NPM 指令

### 🐳 Docker 相關

\`\`\`bash
npm start # 啟動 Docker 服務 (背景執行)
npm run start:dev # 啟動 Docker 服務 (前台執行)
npm run restart # 重新建構並啟動服務
npm run stop # 停止服務
npm run clean # 清理所有容器和資料卷
\`\`\`

### 🚀 開發相關

\`\`\`bash
npm run dev # 本地開發模式 (使用 ts-node)
npm run build # 建構 TypeScript 為 JavaScript
npm run start:prod # 執行產品環境版本
\`\`\`

### 🗄️ 資料庫相關

\`\`\`bash
npm run init:schema # 同步資料庫結構
\`\`\`

### 🧪 測試相關

\`\`\`bash
npm test # 執行測試
\`\`\`

### 📝 程式碼品質

\`\`\`bash
npm run lint # 執行 ESLint 檢查
npm run lint:fix # 自動修復 ESLint 問題
npm run lint:check # 檢查是否有 lint 錯誤 (CI 用)
npm run format # 使用 Prettier 格式化程式碼
npm run format:check # 檢查程式碼格式是否正確
npm run code-style # 執行格式化 + lint 修復
\`\`\`

## 🌐 API 文件

啟動服務後，您可以透過以下網址查看 API 文件：

- **Swagger UI**: http://localhost:8080/api-docs
- **健康檢查**: http://localhost:8080/healthcheck

### API 端點

\`\`\`
GET /healthcheck # 健康檢查
GET /api-docs # Swagger API 文件

# 使用者管理

GET /api/users # 取得所有使用者
GET /api/users/:id # 取得指定使用者
POST /api/users # 建立新使用者
PUT /api/users/:id # 更新使用者
DELETE /api/users/:id # 刪除使用者
\`\`\`

## 📁 專案結構

\`\`\`
.
├── bin/ # 應用程式入口點
│ └── www.ts
├── config/ # 組態設定
│ ├── db.ts # 資料庫組態
│ ├── index.ts # 總組態匯出
│ ├── secret.ts # 機密設定
│ ├── swagger.ts # Swagger 組態
│ └── web.ts # Web 伺服器組態
├── controllers/ # 控制器層
│ └── UserController.ts
├── db/ # 資料庫相關
│ └── data-source.ts # TypeORM 資料源設定
├── entities/ # 資料模型
│ └── User.ts
├── middlewares/ # 中介軟體
├── routes/ # 路由定義
│ ├── index.ts
│ └── users.ts
├── types/ # TypeScript 類型定義
│ └── index.ts
├── utils/ # 工具函式
│ └── logger.ts # 日誌工具
├── .vscode/ # VS Code 設定
├── app.ts # Express 應用程式設定
├── docker-compose.yml # Docker Compose 設定
├── Dockerfile # 產品環境 Docker 設定
├── Dockerfile.dev # 開發環境 Docker 設定
├── .env.example # 環境變數範例
├── .eslintrc.json # ESLint 設定
├── .prettierrc # Prettier 設定
├── package.json # 專案相依性
└── tsconfig.json # TypeScript 設定
\`\`\`

## 🔧 開發指南

### 新增 API 端點

1. **建立 Entity** (如果需要新的資料模型)：
   \`\`\`typescript
   // entities/YourEntity.ts
   import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm'

   @Entity('your_table')
   export class YourEntity {
   @PrimaryGeneratedColumn()
   id!: number

   @Column()
   name!: string
   }
   \`\`\`

2. **建立 Controller**：
   \`\`\`typescript
   // controllers/YourController.ts
   export class YourController {
   async getAll(req: Request, res: Response) {
   // 實作邏輯
   }
   }
   \`\`\`

3. **建立路由**：
   \`\`\`typescript
   // routes/your-routes.ts
   import { Router } from 'express'
   import { YourController } from '../controllers/YourController'

   const router = Router()
   const controller = new YourController()

   router.get('/', controller.getAll)

   export default router
   \`\`\`

4. **註冊路由**：
   \`\`\`typescript
   // routes/index.ts
   import yourRoutes from './your-routes'

   router.use('/your-endpoint', yourRoutes)
   \`\`\`

### 資料庫遷移

TypeORM 設定為開發環境自動同步，但在產品環境建議使用遷移：

\`\`\`bash

# 生成遷移檔案

npx typeorm migration:generate -d dist/db/data-source.js MigrationName

# 執行遷移

npx typeorm migration:run -d dist/db/data-source.js
\`\`\`

## 🧪 測試

專案使用 Jest 作為測試框架：

\`\`\`bash
npm test # 執行所有測試
npm test -- --watch # 監視模式執行測試
npm test -- --coverage # 執行測試並生成覆蓋率報告
\`\`\`

## 🚀 部署

### Docker 部署

\`\`\`bash

# 建構產品環境映像

docker build -t talent-match .

# 執行容器

docker run -p 8080:8080 --env-file .env talent-match
\`\`\`

### 產品環境建議

1. 設定 \`DB_SYNCHRONIZE=false\` 並使用資料庫遷移
2. 使用強密碼設定 \`JWT_SECRET\`
3. 配置適當的 \`LOG_LEVEL\` (建議 \`info\` 或 \`warn\`)
4. 設定 SSL 憑證
5. 使用反向代理 (如 Nginx)

## 📝 程式碼風格

專案使用 ESLint 和 Prettier 來維護程式碼品質：

- **縮排**：2 個空格
- **引號**：單引號
- **分號**：不使用
- **行長度**：最多 160 字元
- **尾隨逗號**：不使用

VS Code 使用者可以安裝推薦的擴充功能以獲得最佳開發體驗。

## 🤝 貢獻指南

1. Fork 專案
2. 建立功能分支 (\`git checkout -b feature/amazing-feature\`)
3. 提交變更 (\`git commit -m 'Add some amazing feature'\`)
4. 推送到分支 (\`git push origin feature/amazing-feature\`)
5. 開啟 Pull Request

## 📄 授權

本專案採用 MIT 授權 - 詳見 [LICENSE](LICENSE) 檔案

## 💡 常見問題

### Q: 如何重置資料庫？

A: 執行 \`npm run clean\` 然後 \`npm start\`

### Q: 如何變更預設連接埠？

A: 修改 \`.env\` 檔案中的 \`PORT\` 變數

### Q: 如何在本地連接到 Docker 中的 PostgreSQL？

A: 使用 \`localhost:5432\` 連接，帳號密碼參考 \`.env\` 設定

### Q: Firebase 設定是必須的嗎？

A: 不是必須的，如果不使用檔案上傳功能可以移除相關路由

## 📞 支援

如果您遇到任何問題或有建議，請：

1. 查看[常見問題](#常見問題)
2. 搜尋現有的 [Issues](../../issues)
3. 建立新的 Issue

---

**Happy Coding! 🎉**
