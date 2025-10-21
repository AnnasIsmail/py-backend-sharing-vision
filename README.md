# Sharing Vision 2023 - Backend API

## 🚀 Quick Start Guide

### 📋 Prerequisites
- Python 3.8+
- MySQL Database

---

## 🔧 Backend Setup

### 1. Install Dependencies
```bash
pip install -r requirements.txt
```

### 2. Setup Database
```bash
mysql -u root -p < create_database.sql
```

### 3. Configure Environment
```bash
.env.example

DATABASE_URL=mysql+pymysql://root:password@localhost:3306/article
```

### 4. Run Backend
```bash
python app.py
```

**Backend URL:** `http://localhost:5000`

---

## 🔗 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/article/` | Create new article |
| `GET` | `/article/<limit>/<offset>` | Get all articles (pagination) |
| `GET` | `/article/<id>` | Get article by ID |
| `PUT` | `/article/<id>` | Update article |
| `DELETE` | `/article/<id>` | Delete article |
| `GET` | `/article/status/<status>/<limit>/<offset>` | Get articles by status |

---

## 📊 Sample Data

The database comes with 20 sample articles:
- **Published:** 15 articles
- **Drafts:** 4 articles
- **Trashed:** 1 article

---

## 🛠️ Troubleshooting

### Backend Issues
- Check MySQL connection in `.env`
- Ensure database `article` exists
- Verify all dependencies installed

### CORS Issues
- Backend CORS is configured for `http://localhost:3000`
- Check if both services are running on correct ports

---

## 🎯 Testing

Use the provided Postman collection to test all API endpoints:
- Import `Sharing_Vision_Article_API.postman_collection.json`
- Test all 5 required endpoints
- Verify validation rules

---

## 📝 Development Notes

- **Backend:** Flask with SQLAlchemy ORM
- **Database:** MySQL
- **Validation:** Marshmallow schemas
- **Pagination:** Limit/Offset based

---

**Backend API Ready! 🚀**