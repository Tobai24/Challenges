# Social Media App Backend using FastAPI

Welcome to the **Social Media App Backend**, a lightweight and powerful API built with FastAPI! 🎉 This API features user management, post interactions, authentication, and a voting system.

## Features: 4 Routes to Rule Them All

### 1️⃣ **Post Route**

Handles creating, deleting, updating, and checking posts. Think of it as your ultimate post manager!

### 2️⃣ **Users Route**

For creating users and finding them by their ID. Simple, secure, and user-friendly! 🙌

### 3️⃣ **Auth Route**

Manages the login system with secure authentication workflows. 🔒

### 4️⃣ **Vote Route**

Implements the upvote or back-vote system. There’s no downvote logic here—just positivity! 👍

## 🛠️ How to Run Locally

Follow these steps to get the API running on your local machine:

### Step 1: Clone the Repository

```bash
git clone https://github.com/Tobai24/Challenges.git
```

### Step 2: Navigate to the Backend Directory

```bash
cd backend/api
```

### Step 3: Set Up Your Environment

Install `pipenv` if you haven’t already:

```bash
pip install pipenv
```

Then activate the environment and install the dependencies:

```bash
pipenv install
pipenv shell
```

### Step 4: Install FastAPI

Use the following command to install FastAPI and its extras:

```bash
pip install fastapi[all]
```

### Step 5: Run the API

Start the server with:

```bash
uvicorn main:app --reload
```

The API will be available at:

```bash
http://127.0.0.1:8000/docs
```

## 🗄️ Database Setup

This API requires a PostgreSQL database. Follow these steps to set it up:

1. **Create a PostgreSQL Database**  
   Set up a database in PostgreSQL using your preferred method.

2. **Create a `.env` File**  
   Add the following environment variables to a file named `.env` in the project folder:

   ```plaintext
   DATABASE_HOSTNAME = localhost
   DATABASE_PORT = 5432
   DATABASE_PASSWORD = your_password
   DATABASE_NAME = your_database_name
   DATABASE_USERNAME = your_username
   SECRET_KEY = your_secret_key
   ALGORITHM = HS256
   ACCESS_TOKEN_EXPIRE_MINUTES = 60
   ```

   **Note:** The `SECRET_KEY` in this example is just a placeholder. Generate your own secure key for production! Refer to [FastAPI documentation](https://fastapi.tiangolo.com/) for guidance.

## 🥳 Congratulations!

You’re all set! Head over to the http://127.0.0.1:8000/docs to explore and test the API. 🚀

If you encounter any issues or have questions, feel free to contribute or reach out. Happy coding! 🎉
