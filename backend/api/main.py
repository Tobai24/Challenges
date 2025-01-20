from fastapi import FastAPI
import psycopg2
from psycopg2.extras import RealDictCursor
import time
from . import model
from .database import engine
from .routers import post, user, auth, vote
from .config import settings
from fastapi.middleware.cors import CORSMiddleware

# model.Base.metadata.create_all(bind=engine)

app = FastAPI()


origins = [
    "http://localhost:8080"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


    
def get_db_connection():
    try:
        conn = psycopg2.connect(
            host='localhost',
            database='practice',
            user='postgres',
            password='admin',
            cursor_factory=RealDictCursor
        )
        print("Connected to the database")
        return conn
    except Exception as error:
        print("Failed to connect to the database")
        print('Error: ', error)
        time.sleep(3)
        return None

# Initialize the database connection
conn = get_db_connection()
if conn:
    cursor = conn.cursor()
else:
    raise Exception("Database connection could not be established")

@app.get('/')
def root():
    return {"message": "hello world!!"}

        
app.include_router(post.router)
app.include_router(user.router)
app.include_router(auth.router)
app.include_router(vote.router)
    

