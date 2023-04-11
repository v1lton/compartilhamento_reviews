from behave import given, when, then
import helpers
from time import sleep


@given('Existe um professor com o nome "{name}"')
def step_impl(context, name):
    result = helpers.criar_professor(name)
    assert result["name"] == name


@given('O professor "{professor}" está no historico de professores do aluno "{user}"')
def step_impl(context, professor, user):
    result = helpers.adicionar_prof_usuario(professor, user)
    assert result == professor
    sleep(1)
