# 🌍 Website Quản lý & Đặt Tour Du Lịch (OTA Platform)

> Nền tảng thương mại điện tử du lịch toàn diện (B2C & B2B), tự động hóa quy trình đặt chỗ chống đụng độ thời gian thực (Race Condition) và đối soát thanh toán 24/7 qua Webhook ngân hàng.

![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![Laravel](https://img.shields.io/badge/laravel-%23FF2D20.svg?style=for-the-badge&logo=laravel&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

---

## 📑 Mục lục (Table of Contents)
- [Giới thiệu](#-giới-thiệu-about)
- [Kiến trúc & Công nghệ](#-kiến-trúc--công-nghệ-tech-stack)
- [Cấu trúc Thư mục Dự án](#-cấu-trúc-thư-mục-project-structure)
- [Tính năng Nổi bật](#-tính-năng-nổi-bật-features)
- [Điểm nhấn Kỹ thuật & Thách thức](#-điểm-nhấn-kỹ-thuật--thách-thức-đã-giải-quyết-technical-highlights)
- [Hướng dẫn Cài đặt & Khởi chạy](#-hướng-dẫn-cài-đặt--khởi-chạy-quick-start)
- [Tài khoản Thử nghiệm](#-tài-khoản-thử-nghiệm-demo-credentials)
- [Tích hợp Cổng thanh toán SePay](#-tích-hợp-cổng-thanh-toán-sepay-webhook)
- [Hình ảnh Minh họa](#-hình-ảnh-minh-họa-screenshots)
- [Bản quyền & Liên hệ](#-bản-quyền--liên-hệ-license--contact)

---

## 📖 Giới thiệu (About)
Dự án **Website Quản lý & Đặt Tour Du Lịch** được phát triển nhằm số hóa toàn bộ quy trình phân phối tour của một Đại lý du lịch trực tuyến (OTA). Thay vì quản lý thủ công qua Excel hay Zalo, hệ thống mang đến giải pháp khép kín từ khâu tìm kiếm, giữ chỗ theo thời gian thực (chống overbooking), cho đến việc tự động xác nhận thanh toán qua Webhook ngân hàng.

Hệ thống được thiết kế linh hoạt để phục vụ song song hai luồng nghiệp vụ cốt lõi:
- **Khách hàng lẻ (B2C):** Đặt tour trọn gói, thanh toán QR động, chủ động yêu cầu hủy/hoàn tiền theo chính sách thời gian.
- **Khách hàng doanh nghiệp (B2B):** Tiếp nhận yêu cầu thiết kế tour đoàn riêng, đàm phán hợp đồng, phân công nhân viên phụ trách độc lập.

---

## 💻 Kiến trúc & Công nghệ (Tech Stack)
Dự án được xây dựng theo kiến trúc **API-first**, tách biệt hoàn toàn giữa Frontend SPA và Backend RESTful API:

- **Frontend (Client & Management Portal):**
  - **Core:** ReactJS 19, Vite 8
  - **Routing:** React Router DOM v7
  - **UI & Biểu đồ:** Bootstrap, Lucide React, Recharts, React Big Calendar, CKEditor 5
  - **HTTP Client:** Axios (Interceptors xử lý Bearer Token tự động)
- **Backend (RESTful API):**
  - **Framework:** Laravel 12 (PHP 8.2+)
  - **Bảo mật & Phân quyền:** Laravel Sanctum (Stateless Token Authentication), RBAC
  - **Database:** MySQL 8.0 (InnoDB, ACID Compliance)
  - **Cổng thanh toán:** SePay API (Tích hợp Webhook đối soát 24/7)
- **DevOps & Containerization:**
  - Docker & Docker Compose (Multi-container: MySQL 8.0, Laravel 12 FPM, React 19 Vite)

---

## 📂 Cấu trúc Thư mục (Project Structure)
```text
Doan_LVTN/
├── Backend/                 # Mã nguồn Laravel RESTful API
│   ├── app/                 # Controllers, Services, Models, Mail
│   ├── routes/              # api.php (Routes định tuyến cho B2C, Staff, Admin)
│   ├── Dockerfile           # Docker image PHP 8.2 + GD + Composer
│   └── .env.example         # File mẫu biến môi trường
├── Frontend/                # Mã nguồn ReactJS
│   ├── src/                 # Pages (customer, staff, admin), Components, API
│   ├── Dockerfile           # Docker image Node 20 LTS
│   └── vite.config.js       # Cấu hình Vite & Polling Hot-Reload
├── docs/images/             # Ảnh chụp màn hình giao diện thực tế
├── docker-compose.yml       # Điều phối các dịch vụ: mysql, backend, frontend
├── tourdulich.sql           # Cơ sở dữ liệu mẫu (50 tours, tài khoản test)
└── README.md
```

---

## ✨ Tính năng Nổi bật (Features)
Hệ thống được chia làm 3 phân hệ chính với các chức năng nghiệp vụ chuyên biệt:

**1. Phân hệ Khách hàng (Customer Portal):**
- **Tìm kiếm & Đặt tour (B2C):** Tìm kiếm động theo địa điểm, mức giá, thời gian khởi hành; xử lý tranh chấp dữ liệu khi đặt chỗ đồng thời.
- **Yêu cầu Tour riêng (B2B):** Form gửi yêu cầu thiết kế lịch trình chuyên biệt dành cho khách hàng doanh nghiệp.
- **Thanh toán QR tự động:** Tự động sinh mã VietQR động theo đơn hàng, webhook đối soát và kích hoạt đơn sau 1-2 giây.
- **Quản lý đơn & Hủy tour:** Khách hàng theo dõi trạng thái đơn hàng và chủ động gửi yêu cầu hủy theo chính sách hoàn tiền định sẵn.
- **Đánh giá & Bình luận:** Đánh giá số sao kèm nhận xét cho các tour đã hoàn tất, bình luận tin tức.

**2. Phân hệ Nhân viên điều hành (Staff Portal):**
- **Quản lý Tour:** Tạo và quản lý tour theo đợt và **Tour định kỳ** (Tự động nhân bản gối đầu 4 tuần kế tiếp).
- **Quản lý Đơn hàng:** Tiếp nhận đơn, kiểm tra trạng thái thanh toán, duyệt hoàn tiền và sinh mã QR hoàn tiền.
- **Xử lý luồng B2B:** Tiếp nhận yêu cầu doanh nghiệp, cô lập quyền xử lý chéo (Nhân viên A không can thiệp vào đơn của Nhân viên B).
- **Quản lý Marketing & Nội dung:** Thiết lập chương trình khuyến mãi (Vouchers), soạn thảo bài viết tin tức.
- **Lịch trình (Calendar):** Theo dõi trực quan lịch khởi hành và danh sách hành khách theo ngày.

**3. Phân hệ Quản trị viên (Admin Portal):**
- **Quản trị Nhân sự:** Tạo mới nhân viên, cấp quyền truy cập, khóa/mở khóa tài khoản.
- **Luân chuyển công việc:** Tái phân công (Reassign) tour hoặc yêu cầu B2B sang nhân viên khác khi có biến động nhân sự.
- **Kiểm duyệt nội dung:** Kiểm duyệt và ẩn các đánh giá, bình luận vi phạm tiêu chuẩn cộng đồng.
- **Báo cáo & Thống kê (Reports):** Dashboard phân tích doanh thu toàn hệ thống, tỷ lệ lấp đầy tour, và đánh giá KPI nhân viên.

**4. Xử lý ngầm (Background Jobs):**
- `orders:cancel-unpaid`: Tự động hủy đơn hàng và nhả lại số chỗ (Restore seats) nếu khách không thanh toán sau 15 phút.
- `tour:generate-clones`: Chạy định kỳ lúc 00:00 hằng ngày để tự động sinh bản sao cho các tour định kỳ.

---

## 💡 Điểm nhấn Kỹ thuật & Thách thức đã giải quyết (Technical Highlights)

Để đáp ứng được quy mô của một nền tảng OTA thực tế, hệ thống giải quyết triệt để các bài toán hóc búa về toàn vẹn dữ liệu và tự động hóa:

- **🛡️ Xử lý Tranh chấp Dữ liệu (Race Condition & Overbooking):**
  Trong kịch bản flash-sale hoặc mùa cao điểm, việc nhiều khách hàng cùng thanh toán một tour tại cùng một tích tắc có thể dẫn đến bán vượt số chỗ (overbooking). Hệ thống giải quyết triệt để vấn đề này bằng cách bọc logic đặt chỗ trong **Database Transactions** kết hợp cơ chế Pessimistic Locking (`lockForUpdate()`). Row dữ liệu của tour sẽ bị khóa tạm thời trong vài mili-giây xử lý, đảm bảo tính tuần tự (ACID) và toàn vẹn số lượng chỗ trống tuyệt đối.

- **⚡ Tự động hóa Đối soát Thanh toán (Real-time Webhook):**
  Thay vì quy trình kế toán duyệt tiền thủ công chậm chạp, hệ thống tích hợp API SePay với kiến trúc **Webhook-driven**. Ngay khi dòng tiền chuyển vào tài khoản ngân hàng, webhook sẽ trigger hệ thống tự động xác thực chữ ký điện tử (Signature Validation) và cập nhật trạng thái đơn hàng sang "Đã thanh toán" chỉ trong vòng 1-2 giây, mang lại trải nghiệm 24/7 hoàn toàn không độ trễ.

- **⚙️ Tối ưu Hóa Vận hành bằng Background Jobs:**
  Để hệ thống tự vận hành mà không phụ thuộc vào thao tác con người, **Laravel Task Scheduler** được cấu hình chặt chẽ với hệ điều hành:
  - `orders:cancel-unpaid`: Lắng nghe và tự động quét hủy các đơn hàng bị "ngâm" quá 15 phút, giải phóng chỗ ngồi trả lại kho (Seat Restoring) để tối ưu doanh thu.
  - `tour:generate-clones`: Tiến trình chạy ngầm lúc 00:00 hằng đêm, tự động tính toán và nhân bản các bản sao tour định kỳ (Rolling Window) cho 4 tuần kế tiếp.

- **🔒 Cô lập Dữ liệu & Stateless Authentication:**
  Với định hướng API-first, hệ thống bảo mật hoàn toàn thông qua **Laravel Sanctum** (Token-based). Hệ thống phân quyền RBAC (Role-Based Access Control) được tinh chỉnh ở mức Row-level Security: cô lập tuyệt đối dữ liệu nghiệp vụ B2B giữa các nhân viên điều hành, triệt tiêu rủi ro can thiệp chéo hoặc lộ lọt thông tin khách hàng doanh nghiệp.

---

## 🚀 Hướng dẫn Cài đặt & Khởi chạy (Quick Start)

### 👉 Cách 1: Khởi chạy siêu tốc bằng Docker (Khuyên dùng ⭐)
*Yêu cầu: Đã cài đặt [Docker Desktop](https://www.docker.com/products/docker-desktop) trên máy tính.*

```bash
# 1. Clone repository về máy
git clone https://github.com/Phuc1810/DoanLVTN.git
cd DoanLVTN

# 2. Khởi chạy toàn bộ hệ sinh thái (MySQL, Backend, Frontend)
docker compose up -d --build

# 3. Nạp cơ sở dữ liệu mẫu có sẵn 50 tours
docker compose cp "tourdulich.sql" mysql:/tmp/dump.sql
docker compose exec -T mysql mysql -u root -proot --default-character-set=utf8mb4 lvtn_tour -e "SOURCE /tmp/dump.sql;"
docker compose exec backend php artisan optimize:clear
```
- **Website khách hàng & quản trị:** `http://localhost:5173`
- **Backend API:** `http://localhost:8000`

---

### 👉 Cách 2: Cài đặt thủ công trên máy host (Local Development)

#### 1. Điều kiện tiên quyết
- **PHP** >= 8.2 (Cài đủ extensions: `pdo_mysql`, `mbstring`, `exif`, `pcntl`, `bcmath`, `gd`)
- **Composer** (PHP Package Manager)
- **Node.js** >= 18.x & **npm**
- **MySQL** >= 8.0 (XAMPP, Laragon hoặc MySQL Server)

#### 2. Cài đặt Backend (Laravel)
```bash
cd Backend

# Cài đặt dependencies PHP
composer install

# Tạo file cấu hình .env
cp .env.example .env

# Tạo application key
php artisan key:generate

# Tạo database 'lvtn_tour' trong MySQL, sau đó import file tourdulich.sql
# Cấu hình DB_DATABASE=lvtn_tour, DB_USERNAME, DB_PASSWORD trong file .env

# Khởi chạy server API
php artisan serve --port=8000
```

#### 3. Cài đặt Frontend (ReactJS)
```bash
cd Frontend

# Cài đặt dependencies Node.js
npm install

# Khởi chạy dev server
npm run dev
# Frontend sẽ chạy tại: http://localhost:5173
```

#### 4. Khởi chạy Cronjobs & Background Scheduler
```bash
php artisan schedule:work
```

---

## 🔑 Tài khoản Thử nghiệm (Demo Credentials)

Cơ sở dữ liệu mẫu đã được tích hợp sẵn các tài khoản thử nghiệm đầy đủ quyền hạn:

| Vai trò (Role) | Tên đăng nhập (Username / Phone) | Mật khẩu mặc định | Quyền hạn và Phạm vi truy cập |
| :--- | :--- | :---: | :--- |
| **Quản trị viên (Admin)** | `admin` | `123456` | Toàn quyền hệ thống, quản lý nhân viên, duyệt đánh giá, xem báo cáo tổng doanh thu & KPI |
| **Nhân viên điều hành (Staff)** | `nhanvien02` | `123456` | Quản lý tour, duyệt đơn hủy/hoàn tiền, tiếp nhận và xử lý yêu cầu tour doanh nghiệp B2B |
| **Khách hàng (Customer)** | `0832520843` | `123456` | Tìm kiếm, đặt tour, thanh toán VietQR động, gửi yêu cầu hủy và đánh giá tour |

---

## 💳 Tích hợp Cổng thanh toán SePay (Webhook)

Hệ thống sử dụng dịch vụ **SePay** để nhận diện biến động số dư ngân hàng và đối soát đơn hàng tự động.

### 1. Cấu hình biến môi trường trong `Backend/.env`
```ini
SEPAY_WEBHOOK_TOKEN="your_sepay_webhook_token"
SEPAY_WEBHOOK_TOKEN_OUT="your_refund_token"
```

### 2. URL Webhook tiếp nhận thanh toán
- **Endpoint:** `POST /api/sepay/webhook`
- **Mẹo kiểm thử tại Localhost:** Sử dụng [Ngrok](https://ngrok.com/) để mở cổng public:
  ```bash
  ngrok http 8000
  ```
  Sau đó sao chép URL ngrok (ví dụ: `https://xxxx.ngrok-free.app/api/sepay/webhook`) dán vào mục Cấu hình Webhook trên trang quản trị SePay.

---

## 📸 Hình ảnh Minh họa (Screenshots)

*Một số hình ảnh giao diện thực tế của hệ thống:*

<details>
  <summary><b>1. Giao diện Trang chủ & Đặt Tour (Khách hàng)</b></summary>
  
<img src="docs/images/trang_chu.PNG" width="100%" alt="Trang chủ Khách hàng">

</details>

<details>
  <summary><b>2. Giao diện Thanh toán QR Code tự động</b></summary>
  
<img src="docs/images/thanh_toan.PNG" alt="Thanh toán SePay" width="100%">

</details>

<details>
  <summary><b>3. Dashboard Quản lý & điều hành (Staff)</b></summary>
  
<img src="docs/images/nv_quanly.PNG" width="100%" alt="Dashboard Quản trị">

</details>

<details>
  <summary><b>4. Dashboard Quản trị hệ thống & Nhân sự (Admin)</b></summary>
  
<img src="docs/images/admin_quanly.PNG" width="100%" alt="Dashboard Quản trị">

</details>

---

## 🤝 Đóng góp (Contributing)
1. Fork repository.
2. Tạo nhánh tính năng (`git checkout -b feature/AmazingFeature`).
3. Commit thay đổi (`git commit -m 'Add some AmazingFeature'`).
4. Push lên nhánh (`git push origin feature/AmazingFeature`).
5. Mở một Pull Request.

---

## 📄 Bản quyền & Tác giả (License & Contact)

- **Bản quyền:** Phân phối theo giấy phép [MIT License](LICENSE).
- **Tác giả:** Phuc1810
- **Email:** [tranhoaiphuc1810@gmail.com](mailto:tranhoaiphuc1810@gmail.com)
- **LinkedIn:** [Trần Hoài Phúc](https://www.linkedin.com/in/ph%C3%BAc-tr%E1%BA%A7n-ho%C3%A0i-97807b313/)
- **Repository:** [https://github.com/Phuc1810/DoanLVTN](https://github.com/Phuc1810/DoanLVTN)
