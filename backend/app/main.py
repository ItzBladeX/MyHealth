from fastapi import FastAPI

from app.database.database import create_db_and_tables
from app.routes.auth import router as auth_router

app = FastAPI()
app.include_router(auth_router)
create_db_and_tables()


