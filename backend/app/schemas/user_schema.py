import re

from pydantic import field_validator
from sqlmodel import SQLModel


class LoginRequest(SQLModel):
    phonenumber: str | None = None
    myhealth_id: str | None = None
    password: str


class CreateAccountRequest(SQLModel):
    fullname: str
    phonenumber: str
    password: str

    @field_validator("fullname")
    @classmethod
    def validate_fullname(cls, value: str) -> str:
        normalized = value.strip()
        if not re.fullmatch(r"[A-Za-z]+ [A-Za-z]+", normalized):
            raise ValueError("Full name must be in the format: <first name> <second name>")
        return normalized

    @field_validator("phonenumber")
    @classmethod
    def validate_phonenumber(cls, value: str) -> str:
        normalized = value.strip()
        if not re.fullmatch(r"\+251[79]\d{8}", normalized):
            raise ValueError("Phone number must be in the format +2519xxxxxxxx or +2517xxxxxxxx")
        return normalized
