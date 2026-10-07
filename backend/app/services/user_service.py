import re

from sqlmodel import Session, select

from app.models.user_model import User
from app.utils.cryptography import hash_password, verify_password


def validate_fullname(fullname: str) -> str:
    normalized = fullname.strip()
    if not re.fullmatch(r"[A-Za-z]+ [A-Za-z]+", normalized):
        raise ValueError("Full name must be in the format: <first name> <second name>")
    return normalized


def validate_phonenumber(phonenumber: str) -> str:
    normalized = phonenumber.strip()
    if not re.fullmatch(r"\+251[79]\d{8}", normalized):
        raise ValueError("Phone number must be in the format +2519xxxxxxxx or +2517xxxxxxxx")
    return normalized


def login_user(s: Session, phonenumber: str, password: str):
    try:
        statement = select(User).where(User.phonenumber == phonenumber)
        user_data = s.exec(statement).first()

        if user_data is None or not verify_password(password, user_data.hashed_password):
            raise ValueError("Invalid credentials")

        return user_data

    except Exception:
        return None


def register_user(s: Session, fullname: str, phonenumber: str, password: str):
    try:
        valid_fullname = validate_fullname(fullname)
        valid_phonenumber = validate_phonenumber(phonenumber)

        statement = select(User).where(User.phonenumber == valid_phonenumber)
        user_data = s.exec(statement).first()
        if user_data:
            raise ValueError("User already exists")

        new_user = User(
            fullname=valid_fullname,
            phonenumber=valid_phonenumber,
            hashed_password=hash_password(password),
        )
        s.add(new_user)
        s.commit()
        s.refresh(new_user)
        return {"status": True, "error_code": None, "data": new_user}

    except Exception as e:
        return {"status": False, "error_code": str(e), "data": None}

    