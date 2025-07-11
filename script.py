from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import sys
import time

# Fonction pour convertir la liste d'arguments en une seule chaîne
def convert(s):
    return " ".join(s)

# Récupère la chaîne de recherche depuis les arguments de la ligne de commande
search_string = convert(sys.argv[1:])
# Remplace les espaces par + pour l'URL Google
search_string = search_string.replace(' ', '+')

# Configure Chrome en mode headless pour ne pas ouvrir de fenêtre graphique
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# EN LOCAL: Indique à Selenium où trouver chromedriver.exe
#service = Service(executable_path="C:/Jouneid/0.Python/chromedriver-win64/chromedriver.exe")
#browser = webdriver.Chrome(service=service, options=chrome_options)

# Dans Docker, pas de chemin Windows — laisse Selenium trouver le chromedriver installé
browser = webdriver.Chrome(options=chrome_options)

# Ouvre l'URL Google Search avec le mot-clé donné
url = f"https://www.google.com/search?q={search_string}"
browser.get(url)

print(f"Recherche Google pour : {search_string}")

# Attendre 2 secondes pour être sûr que la page est chargée
time.sleep(2)

# Sélectionne tous les éléments <h3> qui contiennent les titres des résultats
titles = browser.find_elements(By.TAG_NAME, "h3")

print("\nRésultats trouvés :")
# Parcourt et affiche chaque titre de résultat
for index, title in enumerate(titles, start=1):
    print(f"{index}. {title.text}")

# Ferme le navigateur proprement
browser.quit()
