from fastapi import FastAPI, Response, status, HTTPException, Depends, APIRouter
from typing import Optional, List
from .. import model, schema, oauth2
from sqlalchemy.orm import Session
from sqlalchemy import func
from ..database import get_db

router = APIRouter(
    prefix="/posts",
    tags=['Posts']
)

@router.get("/", response_model=List[schema.PostOut])
async def root(db: Session = Depends(get_db), current_user= Depends(oauth2.get_current_user), limit: int = 10 , skip: int=0, search: Optional[str] = ""):
    # cursor.execute("""SELECT * FROM posts""")
    # post = cursor.fetchall()
    # post = db.query(model.Post).filter(model.Post.owner_id == current_user.id).all()
    post = db.query(model.Post).filter(model.Post.content.contains(search)).limit(limit).offset(skip).all()
    result = db.query(model.Post, func.count(model.Votes.post_id).label("votes")).join(
        model.Votes,model.Votes.post_id == model.Post.id, isouter=True).group_by(model.Post.id).filter(
            model.Post.content.contains(search)).limit(limit).offset(skip).all()
    return result

# Create post
@router.post("/", status_code=status.HTTP_201_CREATED, response_model=schema.Post)
def create_post(post: schema.PostBase, db: Session = Depends(get_db), current_user= Depends(oauth2.get_current_user)):
    # cursor.execute("""INSERT INTO posts(title, content, published) VALUES(%s, %s, %s) RETURNING *""", 
    #                (post.title, post.content, post.published))
    # new_post = cursor.fetchone()
    # conn.commit()
    print(current_user) 
    new_post = model.Post(owner_id=current_user.id, **post.model_dump())
    db.add(new_post)
    db.commit()
    db.refresh(new_post)
    return schema.Post.model_validate(new_post)

# Read post
@router.get("/{id}", response_model=schema.PostOut)
def get_post(id:int, db: Session = Depends(get_db), current_user= Depends(oauth2.get_current_user)):
    # cursor.execute("""SELECT * FROM posts WHERE id = %s""", (str(id)))
    # post = cursor.fetchone()
    
    post = db.query(model.Post, func.count(model.Votes.post_id).label("votes")).join(
        model.Votes,model.Votes.post_id == model.Post.id, isouter=True).group_by(model.Post.id).filter(model.Post.id == id).first()
    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, 
                            detail=f"posts with this {id} not found")
    return post

# Delete post
@router.delete("/{id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_post(id:int, db: Session = Depends(get_db), current_user= Depends(oauth2.get_current_user)):
    # cursor.execute("""DELETE FROM posts WHERE id= %s RETURNING *""", (str(id)))
    # deleted_post = cursor.fetchone()
    # conn.commit()
    
    post_query = db.query(model.Post).filter(model.Post.id == id)
    
    post = post_query.first()
    
    if post == None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, 
                            detail=f"post with {id} does not exist")
    
    if post.owner_id != current_user.id:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized to perform this action")
    
    post_query.delete(synchronize_session=False)
    db.commit()
    return Response(status_code=status.HTTP_204_NO_CONTENT)
 
# Update post
@router.put("/{id}", response_model=schema.Post)
def update(id:int, post: schema.PostBase, db: Session = Depends(get_db), current_user= Depends(oauth2.get_current_user)):
    # cursor.execute("""UPDATE posts SET title = %s , content = %s, published=%s WHERE id = %s RETURNING *""", 
    #                (post.title, post.content, post.published, id))
    # updated_post = cursor.fetchone()
    # conn.commit()
    
    post_query = db.query(model.Post).filter(model.Post.id == id)
    
    updated_post = post_query.first()
    
    if updated_post == None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, 
                            detail=f"post with {id} does not exist")
        
    if updated_post.owner_id != current_user.id:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized to perform this action")
    
    post_query.update(post.model_dump(),synchronize_session=False)
    db.commit()
    return schema.Post.model_validate(post_query.first())