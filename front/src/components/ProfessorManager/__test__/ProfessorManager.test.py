import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC 
from selenium.webdriver.common.keys import Keys

import time

class TestProfessorListPage(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()
        self.driver.get("http://localhost:3001/")
        self.driver.implicitly_wait(10)
        username_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_username"]')))
        password_field = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_password"]')))
        signin_button = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="basic_login"]')))
        
        username_field.send_keys("anapaulafernandes")
        password_field.send_keys("password")
        signin_button.click()
        time.sleep(2)
        self.driver.get("http://localhost:3001/myprofessors")# change this TODO
        
        
    def tearDown(self):
        self.driver.quit()

    def test_add_professor(self):
        name_input = WebDriverWait(self.driver, 20).until(EC.presence_of_element_located((By.XPATH, '//input')))
        
        child = WebDriverWait(self.driver, 20).until(EC.presence_of_element_located((By.XPATH, "//span[.='Add']")))
        add_button = child.find_element(By.XPATH, "./..")
        
        name_input.send_keys("Gabriel")
        name_input.send_keys(Keys.RETURN)
        add_button.click()
        time.sleep(1)
        self.assertIn("Gabriel", self.driver.page_source)

    def test_delete_professor(self):
        professor_span = WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.XPATH, "//span[.='Gabriel']")))
        professor_div = professor_span.find_element(By.XPATH, "./../..")
        delete_button = professor_div.find_element(By.XPATH, './/button')
        delete_button.click()
        time.sleep(1)
        
        check_elm = WebDriverWait(self.driver, 20).until(EC.presence_of_element_located((By.XPATH, '//*[@id="root"]/div/div/div[2]/div[2]/div/div/div/div')))
        
        self.assertNotIn("Gabriel", check_elm.text)

if __name__ == "__main__":
    unittest.main()
