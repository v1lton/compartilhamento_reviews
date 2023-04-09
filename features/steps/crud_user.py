from behave import given, when, then
from time import sleep


@given('Eu estou autenticado com o usuário "{username}" e senha "{password}"')
def step_impl(context, username, password):
    context.browser.get("http://localhost:3001/")
    context.browser.find_element("id", "basic_username").send_keys(username)
    context.browser.find_element("id", "basic_password").send_keys(password)
    context.browser.find_element("id", "basic_login").click()
    sleep(1)

    
