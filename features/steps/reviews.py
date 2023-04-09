from behave import given, when, then
import helpers


@given(
    'Existe uma postagem com o conteudo "{content}", categoria "{category_name}" e professor "{professor_name}", criada pelo usuario "{username}" que tem email "{email}"'
)
def step_impl(context, content, category_name, professor_name, username, email):
    user_id = helpers.criar_usuario(username, email, "12345678", "test")["id"]
    category_id = helpers.criar_categoria(category_name)["id"]
    professor_id = helpers.criar_professor(professor_name)["id"]
    result = helpers.criar_review(content, category_id, professor_id, user_id)
    assert result["description"] == content
