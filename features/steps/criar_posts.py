from behave import given, when, then
from time import sleep
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC    


@given('Eu clico no botão Novo Review')
def step_impl(context):
    sleep(2)
    context.browser.find_element('id', 'create-new-post').click()


@given('Eu digito "{content}" para descrição')
def step_impl(context, content):
    context.browser.find_element("id", "new-post-input").send_keys(content)


@given('Eu seleciono a categoria "{category}"')
def step_impl(context, category):
    context.browser.find_element(By.ID, "new-post-category").click()
    sleep(1)
    context.browser.find_element(By.ID, category).click()
    sleep(1)


@given('Eu seleciono o professor "{professor}"')
def step_impl(context, professor):
    context.browser.find_element(By.ID, "new-post-professor").click()
    sleep(1)
    context.browser.find_element(By.ID, professor).click()


@when('Eu clicar no botão enviar')
def step_impl(context):
    context.browser.find_element('id', 'send-post').click()
    sleep(2)


@then('Eu devo ver o um review com a descrição "{description}" feito pelo usuario "{user}" sobre o professor "{professor}" e com a categoria "{category}"')
def step_impl(context, description, user, professor, category):
    posts = context.browser.find_elements('id', 'post-card')

    if posts:
        post = posts[0]
        desc = post.find_element(By.ID, 'post-content').text
        cat = post.find_element(By.ID, 'post-category').text
        prof = post.find_element(By.ID, 'post-professor').text
        usr = post.find_element(By.ID, 'post-user').text

        assert description == desc and user == usr and category == cat and professor == prof
    else:
        assert False, 'Não foi encontrado nenhum post'


#logica do alert -> se não funcionar, exibo um <p> com a mensagem de erro com o id='error-message'
@then('A mensagem de erro "{message}" será exibida')
def step_impl(context, message):
    alert = context.browser.switch_to.alert
    alert_text = alert.text
    assert message in alert_text
