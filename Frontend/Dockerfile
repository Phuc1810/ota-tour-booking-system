# Sử dụng Node.js 20 LTS
FROM node:20-alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy package.json và package-lock.json để tận dụng Docker layer cache
COPY package*.json ./
RUN npm install

# Copy toàn bộ mã nguồn frontend
COPY . .

# Mở cổng Vite dev server
EXPOSE 5173

# Lệnh khởi chạy dev server với host 0.0.0.0 để truy cập từ ngoài container
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]