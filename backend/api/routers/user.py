from fastapi import  Response, status, HTTPException, Depends, APIRouter
from .. import model, schema, utils
from sqlalchemy.orm import Session
from ..database import get_db

router = APIRouter(
    prefix="/users",
    tags=['Users']
)

@router.post("/", status_code=status.HTTP_201_CREATED, response_model=schema.UserOut)
def create_user(user:schema.userCreate , db: Session = Depends(get_db)):
    hashed_password = utils.hash(user.password)
    user.password=hashed_password
    new_user = model.User(**user.model_dump())
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return schema.UserOut.model_validate(new_user)

@router.get("/{id}")
def details(id:int, db: Session = Depends(get_db)):
    user = db.query(model.User).filter(model.User.id == id).first()
    
    if user == None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"user with {id} not found")
    
    return schema.UserOut.model_validate(user)