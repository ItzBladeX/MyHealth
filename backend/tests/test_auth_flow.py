import os

os.environ.setdefault("DATABASE_URL", "sqlite://")
os.environ.setdefault("SECRET_KEY", "test-secret-key")
os.environ.setdefault("ALGORITHM", "HS256")

from sqlmodel import Session, SQLModel, create_engine

from app.models.user_model import User
from app.services.user_service import login_user, register_user
from app.utils.cryptography import verify_password


def test_register_and_login_user():
    engine = create_engine("sqlite://")
    SQLModel.metadata.create_all(engine)

    with Session(engine) as session:
        result = register_user(session, "Alice Johnson", "+251912345678", "secret123")

        assert result["status"] is True
        assert result["data"].phonenumber == "+251912345678"
        assert verify_password("secret123", result["data"].hashed_password) is True

        user = login_user(session, "+251912345678", "secret123")
        assert user is not None
        assert user.phonenumber == "+251912345678"


def test_create_account_rejects_invalid_fullname_and_phone_number():
    engine = create_engine("sqlite://")
    SQLModel.metadata.create_all(engine)

    with Session(engine) as session:
        invalid_name = register_user(session, "Alice", "+251912345678", "secret123")
        assert invalid_name["status"] is False
        assert invalid_name["data"] is None

        invalid_phone = register_user(session, "Alice Johnson", "+123456789", "secret123")
        assert invalid_phone["status"] is False
        assert invalid_phone["data"] is None

        valid = register_user(session, "Alice Johnson", "+251712345678", "secret123")
        assert valid["status"] is True
        assert valid["data"].phonenumber == "+251712345678"
