# Instalação do MySQL
+ Instale o MySQL<br>
sudo apt-get install mysql-client-5.7 mysql-server-5.7<br>

+ Altere a senha do usuário root:<br>
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"
