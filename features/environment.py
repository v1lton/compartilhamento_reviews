import steps.helpers
from selenium.webdriver import Chrome
from time import sleep

def before_scenario(context, scenario):
    context.browser = Chrome()
    steps.helpers.reset_db()

def after_scenario(context, scenario):
    context.browser.quit()
    steps.helpers.reset_db()
