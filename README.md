# 📰 News Articles REST API

A simple RESTful API built with Python (or your preferred language) to manage a collection of news articles.  
This API allows clients to retrieve and create articles, but not modify or delete them, ensuring immutability of published content.

## 📌 Overview

This project implements a backend for managing news articles with the following fields:

- `id` (Integer): Unique identifier for the article
- `title` (String): Title of the article (max 40 characters)
- `content` (String): Full content of the article
- `author` (String): Author's name
- `category` (String): Article category
- `published_at` (Date): Date the article was published

All fields are **required**.

## 📖 API Endpoints

### `GET /articles`

- **Description**: Retrieve all articles.
- **Response**: JSON array of articles, ordered by `published_at` (newest first)

---

### `POST /articles`

- **Description**: Create a new article.
- **Request Body** (JSON):
  ```json
  {
    "title": "Sample Article",
    "content": "This is the content of the article.",
    "author": "John Doe",
    "category": "Tech",
    "published_at": "2025-07-01"
  }

GET /articles/<id>
Description: Retrieve a single article by its ID

Response: JSON object of the article or 404 Not Found if the ID doesn't exist

PUT /articles/<id>
PATCH /articles/<id>
DELETE /articles/<id>
Response: 405 Method Not Allowed
This public API does not allow editing or deleting articles.
