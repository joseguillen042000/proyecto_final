import os ##El sistema operativo libreria

location = "F:/User/Documents/CERTUS/Proyecto_Parcial_2/python/dataset"


## Validamos que las carpetas existan

if not os.path.exists(location):
    #En caso mi carpeta no exista, voy a crear una nueva
    os.mkdir(location)
else:
    #Si la carpeta ya existe, entonces borramos el contenido
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root, name)) #Elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root, name)) #rmdir-> remove directory/ elimino todas mis carpetas

from kaggle.api.kaggle_api_extended import KaggleApi
## No olvidar depositar el archivo kaggle.json

api = KaggleApi()

api.authenticate()

# print(api.dataset_list(search="henryshan"))

api.dataset_download_file('henryshan/apple-stock-price', 'AAPL.csv', path=location, quiet=False )