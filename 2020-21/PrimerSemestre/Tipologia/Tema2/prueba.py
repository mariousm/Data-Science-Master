import requests
from bs4 import BeautifulSoup
import csv
import os

# Se pdría mejorar para modificar la cabecera HTTP
page = requests.get("https://spotifycharts.com/regional")
soup = BeautifulSoup(page.content)

# Lista de listas en las que se va almacenar la información
dataset = []

for eTr in soup.select('tbody > tr'):
    # Lista con la información de cada fila
    row = []

    for eTd, i in zip(eTr.find_all('td'), range(0, len(eTr.contents))):
        # Es la imagen    
        if (i == 0):
            row.append(eTd.find('a').get('href'))

        # Es el ranking
        if (i == 1):
            row.append(eTd.text)

        # El título y artista
        if (i == 3):
            row.append(eTd.strong.text)
            row.append(eTd.span.text.replace("by ", ""))

        # Reproducciones
        if (i == 4):
            row.append(eTd.text.replace(",", "."))

    # Añadimos la fila al dataset
    dataset.append(row)

currentDir = os.path.dirname(__file__)
filename = "spotify_dataset.csv"
filePath = os.path.join(currentDir, "data", filename)

# Escribimos en un archivos CSV
with open(filePath, mode='w+') as spotify_file:

    employee_writer = csv.writer(spotify_file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    employee_writer.writerow(['Link', 'Rank', 'Title', 'Artist/s', 'Streams'])
    
    for row in dataset:
        employee_writer.writerow([row[0], row[1], row[2], row[3], row[4]])