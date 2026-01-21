En el cron, añado esta linea:

Terminal:
crontab -e

Añadis esto en la ultima linea

* * * * * /usr/bin/python3 /var/www/html/004-escribe.py

Y luego
Control + O = Guardar
Control + X = Salir
