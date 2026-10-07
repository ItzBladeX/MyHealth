from sqlmodel import SQLModel, Field, Relationship
import uuid
from datetime import datetime


class User(SQLModel, table=True):
    __tablename__ = "user"
    user_uuid: uuid.UUID = Field(
        default_factory=uuid.uuid4,
        primary_key=True,
        index=True,
        nullable=False,
    )

    fullname: str
    hashed_password: str
    phonenumber: str | None = Field(unique=True)
    user_data: list["UserData"] = Relationship(back_populates="user")


class UserData(SQLModel, table=True):
    __tablename__ = "user_data"
    id: int | None = Field(default=None, primary_key=True)
    age: int | None = None
    birthdate: datetime | None = None
    user_uuid: uuid.UUID | None = Field(foreign_key="user.user_uuid")
    user: User | None = Relationship(back_populates="user_data")


# class Allergy(SQLModel, table=True):
#     __tablename__ = "allergy"
#     id: int = Field(default=None, primary_key=True)
#     name:str
#     allergy_id: int = Field(default=None, primary_key=)
#     user_uuid: uuid.UUID | None = Field(foreign_key="user.user_uuid")

