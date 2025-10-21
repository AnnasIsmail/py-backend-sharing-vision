import os
from dotenv import load_dotenv

load_dotenv()


class Config:
    """Configuration class for Flask application"""
    
    DATABASE_URL = os.getenv('DATABASE_URL')
    
    if DATABASE_URL:
        SQLALCHEMY_DATABASE_URI = DATABASE_URL
    else:
        DB_HOST = os.getenv('DATABASE_HOST', 'localhost')
        DB_PORT = os.getenv('DATABASE_PORT', '3306')
        DB_USER = os.getenv('DATABASE_USER', 'root')
        DB_PASSWORD = os.getenv('DATABASE_PASSWORD', '')
        DB_NAME = os.getenv('DATABASE_NAME', 'article')
        SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret-key-change-in-production')
    JSON_SORT_KEYS = False
    
    CORS_ORIGINS = os.getenv('CORS_ORIGINS', 'http://localhost:3000,http://127.0.0.1:3000').split(',')
    CORS_ENABLED = os.getenv('CORS_ENABLED', 'true').lower() == 'true'
    CORS_METHODS = os.getenv('CORS_METHODS', 'GET,POST,PUT,DELETE,OPTIONS').split(',')
    CORS_HEADERS = os.getenv('CORS_HEADERS', 'Content-Type,Authorization').split(',')