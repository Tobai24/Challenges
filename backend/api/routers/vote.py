from fastapi import FastAPI, Response, status, HTTPException, Depends, APIRouter
from .. import  schema, model, utils, oauth2
from sqlalchemy.orm import Session
from ..database import get_db

router = APIRouter(prefix="/vote", tags=["vote"])

@router.post("/", status_code=status.HTTP_201_CREATED)
def vote(vote: schema.Vote, db: Session = Depends(get_db), current_user: int= Depends(oauth2.get_current_user)):
    found_vote = db.query(model.Votes).filter(model.Votes.post_id == vote.post_id, model.Votes.user_id == current_user.id)
    
    post = db.query(model.Post).filter(model.Post.id == vote.post_id).first()
    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Post with {vote.post_id} does not exist")
     
    if (vote.dir == 1):
        if found_vote:
            raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail=f"user {current_user.id} has already voted on post {vote.post_id}")
        new_vote = model.Votes(post_id= vote.post_id, user_id=current_user.id)
        db.add(new_vote)
        db.commit()
        return {"message": "Added vote"}
    else:
        if not found_vote:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="vote not found")
        
        found_vote.delete(synchronize_session=False)
        db.commit()
        return {"message": "Delete vote"}