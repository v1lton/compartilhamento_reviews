import requests

BACKEND = "http://localhost:3000"


def criar_usuario(
    username, email, password, name, surnames=None, pronouns=None, country=None
):
    payload = {
        "user": {
            "username": username,
            "email": email,
            "password": password,
            "password_confirmation": password,
            "name": name,
            "surnames": surnames,
            "pronouns": pronouns,
            "country": country,
        }
    }
    response = requests.post(f"{BACKEND}/test/users", json=payload)
    return response.json()


def criar_professor(name):
    response = requests.post(f"{BACKEND}/test/professors", json={"name": name})
    return response.json()["professor"]


def criar_categoria(name):
    response = requests.post(f"{BACKEND}/test/categories", json={"name": name})
    return response.json()["category"]


def criar_review(description, category_id, professor_id, user_id):
    payload = {
        "user_id": user_id,
        "description": description,
        "category_id": category_id,
        "professor_id": professor_id,
    }
    response = requests.post(f"{BACKEND}/test/reviews", json=payload)
    return response.json()["review"]


def reset_db():
    requests.get(f"{BACKEND}/test/categories/reset")
    requests.get(f"{BACKEND}/test/professors/reset")
    requests.get(f"{BACKEND}/test/reviews/reset")
    requests.get(f"{BACKEND}/test/users/reset")

criar_usuario("aa", "test@aa.com", "12345678", "aa")