FROM python:3.11-slim

# Dépendances
RUN apt-get update && \
    apt-get install -y wget unzip curl gnupg libnss3 libatk1.0-0 libatk-bridge2.0-0 libx11-xcb1 libgtk-3-0 libxss1 libasound2

# Télécharger Chrome CfT version 138
RUN wget -O /tmp/chrome-linux64.zip https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/138.0.7204.100/linux64/chrome-linux64.zip && \
    unzip /tmp/chrome-linux64.zip -d /opt/ && \
    rm /tmp/chrome-linux64.zip && \
    ln -s /opt/chrome-linux64/chrome /usr/bin/google-chrome

# Télécharger Chromedriver version 138
RUN wget -O /tmp/chromedriver-linux64.zip https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/138.0.7204.100/linux64/chromedriver-linux64.zip && \
    unzip /tmp/chromedriver-linux64.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver-linux64.zip

# Vérification
RUN google-chrome --version && chromedriver --version

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY script.py .

ENTRYPOINT ["python", "script.py", "Nba game results"]
