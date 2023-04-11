from behave import given, when, then
import helpers


@given('Existe um professor com o nome "{name}"')
def step_impl(context, name):
    result = helpers.criar_professor(name)
    assert result["name"] == name


@given