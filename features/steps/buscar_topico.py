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
    contents = map(
        lambda x: x.text, context.browser.find_elements("id", "post-content")
    )
    categories = map(
        lambda x: x.text, context.browser.find_elements("id", "post-category")
    )

    assert content in contents
    assert category in categories


@then(
    'Eu não devo ver uma postagem com o conteúdo "{content}" e categoria "{category}"'
)
def step_impl(context, content, category):
    contents = map(
        lambda x: x.text, context.browser.find_elements("id", "post-content")
    )
    categories = map(
        lambda x: x.text, context.browser.find_elements("id", "post-category")
    )

    assert content not in contents
    assert category not in categories


@then('Eu devo ver uma mensagem de erro "{message}"')
def step_impl(context, message):
    error_message = context.browser.find_element("id", "search-error").text

    assert error_message == message
