from pydantic import BaseModel, EmailStr, Field
from pydantic.types import conint
from typing_extensions import Annotated
from datetime import datetime
from typing import Optional

class PostBase(BaseModel):
    title: str
    content: str
    published: bool = True
    # rating: Optional[int] = None
    
class PostCreate(PostBase):
    pass

class UserOut(BaseModel):
    email: EmailStr
    id: int
    created_at: datetime
    
    model_config = {'from_attributes': True} 

class Post(PostBase):
    id: int
    created_at: datetime
    owner_id: int
    owner: UserOut
    
    model_config = {'from_attributes': True} 
    
class userCreate(BaseModel):
    email: EmailStr
    password: str
    
    
class UserLogin(BaseModel):
    email: EmailStr
    password: str
    
class Token(BaseModel):
    access_token: str
    token_type: str


class TokenData(BaseModel):
    id: Optional[int] = None
    
class Vote(BaseModel):
    post_id: int
    dir: Annotated[int, Field(strict=True, le=1)]
    
class PostOut(BaseModel):
    Post: Post
    votes: int

    class Config:
        orm_mode = True
    
 