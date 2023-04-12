import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC 
from selenium.webdriver.common.keys import Keys

import time

class TestAuth(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()
        self.driver.get("http://localhost:3001")
        self.driver.implicitly_wait(10)
        
    def tearDown(self):
        self.driver.quit()
    
    def test_create_user(self):
        create_account_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[3]/div/div/div/div/button[1]')))
        create_account_button.click()
        time.sleep(2)

        username_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[1]/div/div/div/div/span/input')))
        email_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[2]/div/div/div/div/span/input')))
        password_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[3]/div/div/div/div/span/input')))
        password_confirmation_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[4]/div/div/div/div/span/input')))
        name_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[5]/div/div/div/div/span/input')))
        surname_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[6]/div/div/div/div/span/input')))
        pronouns_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[7]/div/div/div/div/span/input')))
        country_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[8]/div/div/div/div/span/input')))
        send_form_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[9]/div/div/div/div/button')))

        username_field.send_keys("JRaminhos")
        email_field.send_keys("joao@gmail.com")
        password_field.send_keys("k3Y*!W0rD)")
        password_confirmation_field.send_keys("k3Y*!W0rD)")
        name_field.send_keys("João")
        surname_field.send_keys("Ramos de Oliveira")
        pronouns_field.send_keys("Elu/delu")
        country_field.send_keys("Brasil")
        send_form_button.click()

        search_button_in_home = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/div/main/div/button')))

    def test_create_user_already_registered(self):
        create_account_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[3]/div/div/div/div/button[1]')))
        create_account_button.click()
        time.sleep(2)

        username_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[1]/div/div/div/div/span/input')))
        email_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[2]/div/div/div/div/span/input')))
        password_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[3]/div/div/div/div/span/input')))
        password_confirmation_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[4]/div/div/div/div/span/input')))
        name_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[5]/div/div/div/div/span/input')))
        surname_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[6]/div/div/div/div/span/input')))
        pronouns_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[7]/div/div/div/div/span/input')))
        country_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[8]/div/div/div/div/span/input')))
        send_form_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[9]/div/div/div/div/button')))

        username_field.send_keys("JRaminhos")
        email_field.send_keys("joao@gmail.com")
        password_field.send_keys("k3Y*!W0rD)")
        password_confirmation_field.send_keys("k3Y*!W0rD)")
        name_field.send_keys("João")
        surname_field.send_keys("Ramos de Oliveira")
        pronouns_field.send_keys("Elu/delu")
        country_field.send_keys("Brasil")
        send_form_button.click()

        search_button_in_home = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[9]/div/div/div/div/button')))

    def test_update_user_email(self):
        username_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_username"]')))
        password_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_password"]')))
        signin_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_login"]')))
        username_field.send_keys("alinegomes")
        password_field.send_keys("password")
        signin_button.click()
        time.sleep(2)

        self.driver.get("http://localhost:3001/profile/edit")
        time.sleep(2)

        email_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[2]/div/div/div/div/span/input')))
        confirm_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[7]/div/div/div/div/button[2]')))
        email_field.send_keys(".br")
        confirm_button.click()

        self.driver.get("http://localhost:3001/profile/edit")
        time.sleep(2)

        new_email_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[2]/div/div/div/div/span/input')))
        value = new_email_field.get_attribute('value')
        self.assertEqual(value, "aline.gomes@example.com.br")

    def test_delete_user(self):
        username_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_username"]')))
        password_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_password"]')))
        signin_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_login"]')))
        username_field.send_keys("josemendes")
        password_field.send_keys("password")
        signin_button.click()
        time.sleep(2)

        self.driver.get("http://localhost:3001/profile/edit")
        delete_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[7]/div/div/div/div/button[1]')))
        delete_button.click()
        time.sleep(2)

        self.driver.get("http://localhost:3001/")
        time.sleep(2)
        login_username_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_username"]')))
        login_password_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_password"]')))
        login_signin_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_login"]')))
        login_username_field.send_keys("josemendes")
        login_password_field.send_keys("password")
        login_signin_button.click()
        time.sleep(2)

        error_message = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="root"]/div/div/div/div')))

if __name__ == "__main__":
    unittest.main()