from selenium.webdriver import Chrome

def before_all(context):
    context.browser = Chrome()
    
def after_all(context):
    context.browser.quit()