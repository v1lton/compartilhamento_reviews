from behave import given, when, then
from time import sleep


@given('Eu preencho o campo de busca com "{category}"')
def step_impl(context, category):
    context.browser.find_element("id", "search-input").send_keys(category)


@when("Eu clico no botão buscar")
def step_impl(context):
    context.browser.find_element("id", "search-button").click()
    sleep(1)


@then('Eu devo ver uma postagem com o conteúdo "{content}" e categoria "{category}"')
def step_impl(context, content, category):
    assert context.browser.find_element("id", "post-content").text == content
    assert context.browser.find_element("id", "post-category").text == category
