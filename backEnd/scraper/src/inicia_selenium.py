from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By


class iniciaselenium:
    def inicia():

        # Definindo o navegador do drive como Chrome
        options = webdriver.ChromeOptions()
        options.add_experimental_option('excludeSwitches', ['enable-logging'])

        # Executando drive do google
        driver = webdriver.Chrome(service=Service(
            '/Users/Gabriel/drivechrome'), options=options)

        # Maximiza a tela
        driver.maximize_window()

        # ignora alguns erros do log
        options = webdriver.ChromeOptions()

        return (driver)
