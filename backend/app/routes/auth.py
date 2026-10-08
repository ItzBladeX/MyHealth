from typing import Annotated

from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlmodel import Session

from app.database.database import get_session
from app.schemas.user_schema import CreateAccountRequest
from app.security.security import create_token
from app.services.user_service import login_user, register_user

router = APIRouter(prefix="/auth", tags=["Authentication"])


@router.post("/login")
def login(
    payload: Annotated[OAuth2PasswordRequestForm, Depends()],
    session: Session = Depends(get_session),
):
    user_data = login_user(session, payload.username, payload.password)
    if not user_data:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    token = create_token({"sub": payload.username})
    return {"access_token": token, "token_type": "bearer", "user_data": user_data}


@router.post("/create_account")
def create_account(payload: CreateAccountRequest, session: Session = Depends(get_session)):
    new_user = register_user(session, payload.fullname, payload.phonenumber, payload.password)
    if not new_user["status"]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=new_user["error_code"] or "Unable to create account",
        )
    
    token = create_token({"sub": payload.phonenumber})
    return {"access_token": token, "token_type": "bearer", "user_data": new_user['data']}

