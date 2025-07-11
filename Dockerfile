FROM python:3.11-slim

# Installer Chrome et ses dépendances
RUN apt-get update && \
    apt-get install -y wget unzip curl gnupg && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

# Vérifie que Chrome est bien installé
RUN google-chrome --version

# Installer Chromedriver correspondant
RUN LATEST=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    echo "Téléchargement de Chromedriver version : $LATEST" && \
    wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${LATEST}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip

# Vérifie que Chromedriver est bien installé
RUN chromedriver --version

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY script.py .

ENTRYPOINT ["python", "script.py", "Nba game results"]
