import steps.helpers
from selenium.webdriver import Chrome


def before_scenario(context, scenario):
    context.browser = Chrome()
    steps.helpers.reset_db()


def after_scenario(context, scenario):
    context.browser.quit()
