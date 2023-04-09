from behave import given, when, then
import helpers


@given('Existe uma categoria com o nome "{name}"')
def step_impl(context, name):
    result = helpers.criar_categoria(name)
    assert result["name"] == name
