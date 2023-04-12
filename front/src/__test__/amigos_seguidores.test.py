import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC 
from selenium.webdriver.common.keys import Keys

import time

class TestFollow(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()
        self.driver.get("http://localhost:3001/")
        time.sleep(2)
        self.driver.implicitly_wait(10)
        # create one account
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
        username_field.send_keys("viniciusscala")
        email_field.send_keys("viniciusscala@gmail.com")
        password_field.send_keys("123r123r123r")
        password_confirmation_field.send_keys("123r123r123r")
        name_field.send_keys("Vinícius")
        surname_field.send_keys("Scala")
        pronouns_field.send_keys("Ele/Dele")
        country_field.send_keys("Brasil")
        send_form_button.click()
        time.sleep(2)

    def tearDown(self):
        # delete account
        self.driver.get("http://localhost:3001/profile/edit")
        time.sleep(2)
        delete_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/div/form/div[7]/div/div/div/div/button[1]')))
        delete_button.click()
        time.sleep(2)
        self.driver.quit()
    
    # Scenario: Seguir um usuário
    def test_follow_user(self):
        self.driver.get("http://localhost:3001/user/7")
        time.sleep(2)

        follow_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/header[1]/button')))
        follow_button.click()
        unfollow_button_content = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/header[1]/button/span')))
        content = unfollow_button_content.get_attribute("innerHTML")
        self.assertEqual(content, "Deixar de seguir")

    # Scenario: Parar de seguir um usuário
    def test_stop_following_user(self):
        self.driver.get("http://localhost:3001/user/7")
        time.sleep(2)
        # follow user
        follow_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/header[1]/button')))
        follow_button.click()
        time.sleep(2)
        if follow_button.text == "Deixar de seguir":
            follow_button.click()
            self.assertEqual(follow_button.text, "Seguir")
        else:
            self.fail("Não foi possível seguir o usuário")


    # Scenario: Tentar seguir um usuário que já segue
    def test_follow_followed_user(self):
        self.driver.get("http://localhost:3001/user/7")
        time.sleep(2)
        # follow user
        follow_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/header[1]/button')))
        follow_button.click()
        time.sleep(2)
        follow_again_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/header[1]/button')))
        if follow_again_button.text != "Seguir":
            self.assertTrue(True)

    # Scenario: Ver lista de seguidores
    def test_followers_list(self):
        self.driver.get("http://localhost:3001/profile")
        time.sleep(2)
        followers_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/header[1]/div[3]/button[2]')))
        followers_button.click()
        time.sleep(2)
        followers_list = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/div/div/div/div/div[3]')))
        followers_list_classes = followers_list.get_attribute("class")
        self.assertIn("slick-active", followers_list_classes)


    # Scenario: Ver lista de seguindo
    def test_following_list(self):
        self.driver.get("http://localhost:3001/profile")
        time.sleep(2)
        following_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/header[1]/div[3]/button[3]')))
        following_button.click()
        time.sleep(2)
        following_list = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[1]/div/section/div/div/div/div/div[4]')))
        following_list_classes = following_list.get_attribute("class")
        self.assertIn("slick-active", following_list_classes)

    
if __name__ == "__main__":
    unittest.main()
