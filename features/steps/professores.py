from behave import given, when, then
import helpers
from time import sleep
from selenium.webdriver.common.by import By

@given('Existe um professor com o nome "{name}"')
def step_impl(context, name):
    result = helpers.criar_professor(name)
    assert result["name"] == name


@given('O professor "{professor}" está no historico de professores')
def step_impl(context, professor):
    context.browser.get("http://localhost:3001/myprofessors")
    sleep(2)
    context.browser.find_element(By.ID, 'manage-professors-select').click()
    sleep(2)
    context.browser.find_element(By.ID, professor).click()
    sleep(1)
    context.browser.find_element(By.ID, 'add-professor-button').click()
    sleep(1)
    context.browser.get("http://localhost:3001/")
    sleep(1)