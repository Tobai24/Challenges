from api.schema import  UserOut, Token
from .database import client, session
from jose import jwt
import pytest
from api.config import settings

def test_root(client):
    res = client.get("/")
    print(res.json().get("message"))
    assert res.json().get("message")  == "hello world!!"
    assert res.status_code == 200
    
def test_create_user(client):
    res = client.post("/users", json={"email": "tobs3@gmail.com", "password":"12533hd"})
    new_user = UserOut(**res.json())
    assert res.status_code == 201
    assert new_user.email == "tobs3@gmail.com"
    
def test_login_user(test_user, client):
    res = client.post(
        "/login", data={"username": test_user['email'], "password": test_user['password']})
    login_res = Token(**res.json())
    payload = jwt.decode(login_res.access_token,
                         settings.secret_key, algorithms=[settings.algorithm])
    id = payload.get("user_id")
    assert id == test_user['id']
    assert login_res.token_type == "bearer"
    assert res.status_code == 200
    
@pytest.mark.parametrize("email, password, status_code", [
    ('wrongemail@gmail.com', 'password123', 403),
    ('sanjeev@gmail.com', 'wrongpassword', 403),
    ('wrongemail@gmail.com', 'wrongpassword', 403)
])    
def test_incorrect_login(test_user, client, email, password, status_code):
    res = client.post(
        "/login", data={"username": email, "password": password})

    assert res.status_code == status_code
    # assert res.json().get('detail') == 'Invalid Credentials'

    
