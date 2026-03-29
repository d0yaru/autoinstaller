#-------------------------------------------------------------------------------
Infon() { printf "\033[1;32m$@\033[0m"; }
Info() { Infon "\031$@\n"; }
Error() { printf "\033[1;31m$@\033[0m\n"; }
Error_n() { Error "$@"; }
Error_s() { Error "${red}=================================================================================${reset}"; }
log_s() { Info "${green}================================================================================${reset}"; }
cp_s () { Info "${green}===================================${white}BY HACKCHIK${green}==================================${reset}"; }
upd () { Info "${green}===================================${white}Information${green}==================================${reset}"; }
log_n() { Info "- - - $@"; }
log_t() { log_s; Info "      ${MAGENTA}- - - $@ ${MAGENTA}- - -"; log_s; }
RELEASE="2.3"; #release multy-tools
dark_gray="\033[90m"; RED=$(tput setaf 1); red=$(tput setaf 1); green=$(tput setaf 2); yellow=$(tput setaf 3); white=$(tput setaf 7); reset=$(tput sgr0); toend=$(tput hpa $(tput cols))$(tput cub 6); YELLOW=$(tput setaf 3); BLUE=$(tput setaf 4); MAGENTA=$(tput setaf 5); LIME_YELLOW=$(tput setaf 190); CYAN=$(tput setaf 6); #colors
VER=`cat /etc/issue.net | awk '{print $1$3}'`; #Debian9
check_sudo=/etc/init.d/sudo; checkdir_nginx=/etc/nginx; checkdir_apache2=/etc/apache2; check_apache2=/run/apache2/apache2.pid; check_nginx=/run/nginx.pid; check_php=/etc/php; check_phpmyadmin=/etc/phpmyadmin;
IP_SERV=$(echo "${SSH_CONNECTION}" | awk '{print $3}');
filename=''`date +%Y_%m_%d_%H`'.sql';
status="https://resource.hackchik.ru/multytools/config.php";
URL_web54="http://resource.hackchik.ru/multytools/hostinpl/5.4/web54.zip"; STATUS_hostinpl_54menu="0";
URL_web55="http://resource.hackchik.ru/multytools/hostinpl/5.5/web55.zip"; STATUS_hostinpl_55menu="0";
URL_cp="http://resource.hackchik.ru/multytools/hostinpl/cp.zip";
URL_web55pro="https://resource.hackchik.ru/multytools/hostinpl/5.5pro/web55pro.zip"; STATUS_hostinpl_55promenu="1";
URL_cp55pro="http://resource.hackchik.ru/multytools/hostinpl/5.5pro/cp55pro.zip";
URL_web56="https://resource.hackchik.ru/multytools/hostinpl/5.6/web56.zip"; STATUS_hostinpl_56menu="1";
URL_cp56="https://resource.hackchik.ru/multytools/hostinpl/5.6/cp56.zip";
if test -f /root/passwd; then MYPASS=`cat /root/passwd` SAVEMYPASS="1"; else SAVEMYPASS="0"; fi #save mysql pass
testing()
{
if [ "$(whoami)" != "root" ]; then
SUDO=sudo
fi
if [ $(check_status "mailutils" 2> /dev/null) == 1  ]; then
echo "установлен"
else
echo "Нет пакета"
fi
}
check_status()
{
I=`dpkg -s $1 | grep "Status" `
if [ -n "$I" ]; then
echo 1
else
echo 0
fi
}
install_server() # id type dir name zip status
{
check=`curl -H 'Cache-Control: no-cache, no-store' "$status?id=$6&status" 2> /dev/null`;
if [ "$check" = "1" ]; then
Info "${YELLOW}Мастер установки мода ${green}$4"
read -p "${white}Введите ваш НИК (например Jack_Sweech):${reset}" NICKNAME
if [ "$SAVEMYPASS" = "0" ]; then
read -p "${white}Укажите пароль от базы данных(admin):${reset}" MYPASS
fi
read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm -Rfv /home/$2/$3  > /dev/null 2>&1
mkdir -p /home/$2/$3  > /dev/null 2>&1
cd /home/$2/$3 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Пересоздание директории ${green}$2/$3! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Пересоздание директории ${green}$2/$3! ${white}• ${red}[fail]"
tput sgr0
exit
fi
wget https://resource.hackchik.ru/multytools/server/$2/$5 -O $5 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка ${green}$4! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка ${green}$4! ${white}• ${red}[fail]"
tput sgr0
exit
fi
unzip -o $5 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Распаковка архива ${green}$4! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Распаковка архива ${green}$4! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm $5 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Удаление архива ${green}$4! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаление архива ${green}$4! ${white}• ${red}[fail]"
tput sgr0
exit
fi
case $1 in
1) # virginia rp - samp
mysql -uadmin -p$MYPASS -D "$2_$3" -e "DROP DATABASE $2_$3" > /dev/null 2>&1
mkdir /var/lib/mysql/"$2_$3" > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
chown -R mysql:mysql /var/lib/mysql/"$2_$3" > /dev/null 2>&1
sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Добавляем ник в FullDostup • ${green}[OK]"
tput sgr0
else
echo "• Добавляем ник в FullDostup • ${red}[fail]"
tput sgr0
exit
fi
mysql -u admin -p$MYPASS "$2_$3" < /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы данных ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы данных ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /home/$2/$3/base.sql > /dev/null 2>&1
sed -i "s/dbname/$2_$3/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
sed -i "s/parol/${MYPASS}/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/DIRTYPE/$2/g" /home/$2/$3/samp.sh > /dev/null 2>&1
sed -i "s/DIRNAME/$3/g" /home/$2/$3/samp.sh > /dev/null 2>&1
sed -i "s/SERVNAME/$4/g" /home/$2/$3/samp.sh > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка меню для запуска • ${green}[OK]"
tput sgr0
else
echo "• Настройка меню для запуска • ${red}[fail]"
tput sgr0
exit
fi
chmod 777 /home/$2/$3/samp.sh > /dev/null 2>&1
chmod 777 /home/$2/$3/samp03svr > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Выдача прав для запуска мода • ${green}[OK]"
tput sgr0
else
echo "• Выдача прав для запуска мода • ${red}[fail]"
tput sgr0
exit
fi ;;
2) # arizona rp(florence) - samp
mysql -uadmin -p$MYPASS -D "$2_$3" -e "DROP DATABASE $2_$3" > /dev/null 2>&1
mkdir /var/lib/mysql/"$2_$3" > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
chown -R mysql:mysql /var/lib/mysql/"$2_$3" > /dev/null 2>&1
sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Добавляем ник в FullDostup • ${green}[OK]"
tput sgr0
else
echo "• Добавляем ник в FullDostup • ${red}[fail]"
tput sgr0
exit
fi
mysql -u admin -p$MYPASS "$2_$3" < /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы данных ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы данных ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /home/$2/$3/base.sql > /dev/null 2>&1
sed -i "s/dbname/$2_$3/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
sed -i "s/parol/${MYPASS}/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/DIRTYPE/$2/g" /home/$2/$3/samp.sh > /dev/null 2>&1
sed -i "s/DIRNAME/$3/g" /home/$2/$3/samp.sh > /dev/null 2>&1
sed -i "s/SERVNAME/$4/g" /home/$2/$3/samp.sh > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка меню для запуска • ${green}[OK]"
tput sgr0
else
echo "• Настройка меню для запуска • ${red}[fail]"
tput sgr0
exit
fi
chmod 777 /home/$2/$3/samp.sh > /dev/null 2>&1
chmod 777 /home/$2/$3/samp03svr > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Выдача прав для запуска мода • ${green}[OK]"
tput sgr0
else
echo "• Выдача прав для запуска мода • ${red}[fail]"
tput sgr0
exit
fi ;;
3) # absolute rp - samp
mysql -uadmin -p$MYPASS -D "$2_$3" -e "DROP DATABASE $2_$3" > /dev/null 2>&1
mkdir /var/lib/mysql/"$2_$3" > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
chown -R mysql:mysql /var/lib/mysql/"$2_$3" > /dev/null 2>&1
sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Добавляем ник в FullDostup • ${green}[OK]"
tput sgr0
else
echo "• Добавляем ник в FullDostup • ${red}[fail]"
tput sgr0
exit
fi
mysql -u admin -p$MYPASS "$2_$3" < /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы данных ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы данных ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /home/$2/$3/base.sql > /dev/null 2>&1
sed -i "s/dbname/$2_$3/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
sed -i "s/parol/${MYPASS}/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/DIRTYPE/$2/g" /home/$2/$3/samp.sh > /dev/null 2>&1
sed -i "s/DIRNAME/$3/g" /home/$2/$3/samp.sh > /dev/null 2>&1
sed -i "s/SERVNAME/$4/g" /home/$2/$3/samp.sh > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка меню для запуска • ${green}[OK]"
tput sgr0
else
echo "• Настройка меню для запуска • ${red}[fail]"
tput sgr0
exit
fi
chmod 777 /home/$2/$3/samp.sh > /dev/null 2>&1
chmod 777 /home/$2/$3/samp03svr > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Выдача прав для запуска мода • ${green}[OK]"
tput sgr0
else
echo "• Выдача прав для запуска мода • ${red}[fail]"
tput sgr0
exit
fi ;;
4) # radmir rp - crmp
mysql -uadmin -p$MYPASS -D "$2_$3" -e "DROP DATABASE $2_$3" > /dev/null 2>&1
mkdir /var/lib/mysql/"$2_$3" > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
chown -R mysql:mysql /var/lib/mysql/"$2_$3" > /dev/null 2>&1
sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Добавляем ник в FullDostup • ${green}[OK]"
tput sgr0
else
echo "• Добавляем ник в FullDostup • ${red}[fail]"
tput sgr0
exit
fi
mysql -u admin -p$MYPASS "$2_$3" < /home/$2/$3/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы данных ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы данных ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /home/$2/$3/base.sql > /dev/null 2>&1
sed -i "s/dbname/$2_$3/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
sed -i "s/parol/${MYPASS}/g" /home/$2/$3/scriptfiles/mysql_settings.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/DIRTYPE/$2/g" /home/$2/$3/$2.sh > /dev/null 2>&1
sed -i "s/DIRNAME/$3/g" /home/$2/$3/$2.sh > /dev/null 2>&1
sed -i "s/SERVNAME/$4/g" /home/$2/$3/$2.sh > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка меню для запуска • ${green}[OK]"
tput sgr0
else
echo "• Настройка меню для запуска • ${red}[fail]"
tput sgr0
exit
fi
chmod 777 /home/$2/$3/$2.sh > /dev/null 2>&1
chmod 777 /home/$2/$3/samp03svr > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Выдача прав для запуска мода • ${green}[OK]"
tput sgr0
else
echo "• Выдача прав для запуска мода • ${red}[fail]"
tput sgr0
exit
fi ;;
*) ;;
esac
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
log_s
log_n "${white}Установка мода ${MAGENTA}$4${white} успешно завершена!"
log_n ""
log_n "${white}Путь до мода: /home/$2/$3"
log_n "${white}Ваш аккаунт готов к администрированию: $NICKNAME пароль: 123q123"
log_n "${white}Запустить сервер: cd /home/$2/$3 && ./$2.sh"
log_n ""
log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
log_n ""
cp_s
else
exit
fi
else
Info
log_t "${white}В данный момент установка $4 - ЗАПРЕЩЕНА!"
Info
fi
}
install_site() # id name zip status
{
check=`curl -H 'Cache-Control: no-cache, no-store' "$status?id=$4&status" 2> /dev/null`
if [ "$check" = "1" ]; then
Info "${YELLOW}Мастер установки сайта ${green}$2"
read -p "${white}Укажите ваш домен:${reset}" HDOM
DOMAIN=`echo ${HDOM} | sed -e 's|^[^/]*//||' -e 's|/.*$||'`
read -p "${white}Укажите название базы данных:${reset}" DATABASE
if [ "$SAVEMYPASS" = "0" ]; then
read -p "${white}Укажите пароль от базы данных(admin):${reset}" MYPASS
fi
read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
mkdir -p /var/www/${DOMAIN}/ > /dev/null 2>&1
cd /var/www/${DOMAIN} > /dev/null 2>&1
wget https://resource.hackchik.ru/multytools/site/$3 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка ${green}$2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка ${green}$2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
unzip -o $3 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Распаковка ${green}$2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Распаковка ${green}$2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm $3
if [ $? -eq 0 ]; then
echo "• Удаление архива ${green}$2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаление архива ${green}$2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
WEBStatusApache2=`systemctl status apache2 | awk '/Active/ {print $2}'`; #failed
if [ "$WEBStatusApache2" = "active" ]; then
a2dissite 000-default > /dev/null 2>&1
mv /var/www/${DOMAIN}/apache2 /etc/apache2/sites-available/${DOMAIN}.conf > /dev/null 2>&1
rm nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/domain/${DOMAIN}/g" /etc/apache2/sites-available/${DOMAIN}.conf
cd
a2ensite ${DOMAIN} > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Настройка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезагрузка ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезагрузка ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
else
mv /var/www/${DOMAIN}/nginx /etc/nginx/sites-available/${DOMAIN} > /dev/null 2>&1
rm apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка параметров для ${green}Nginx! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка параметров для ${green}Nginx! ${white}• ${red}[fail]"
tput sgr0
exit
fi
VERPHP=`php -v | awk '/^PHP/ {print substr($2,0,3)}'`; #7.0 || #5.6
sed -i "s/SERT/80/g" /etc/nginx/sites-available/${DOMAIN}
sed -i "s/domain/${DOMAIN}/g" /etc/nginx/sites-available/${DOMAIN}
sed -i "s/VERSIONSPHP/${VERPHP}/g" /etc/nginx/sites-available/${DOMAIN}
if [ $? -eq 0 ]; then
echo "• Настройка параметров для ${green}Nginx! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Настройка параметров для ${green}Nginx! ${white}• ${red}[fail]"
tput sgr0
exit
fi
cd
rm /etc/nginx/sites-enabled/${DOMAIN} > /dev/null 2>&1
sudo ln -s /etc/nginx/sites-available/${DOMAIN} /etc/nginx/sites-enabled/${DOMAIN} > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание виртуального хоста для ${green}Nginx! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание виртуального хоста для ${green}Nginx! ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезагрузка ${green}Nginx! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезагрузка ${green}Nginx! ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
case $1 in
1) #config arizona ucp 2022
mysql -u admin -p$MYPASS -D $DATABASE -e "DROP TABLE commends, news, payment, rating, servers, shop"  > /dev/null 2>&1
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/core/config.php
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/core/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
2) #config virginia ucp
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE site_news"  > /dev/null 2>&1
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/core/config/configsite.php
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/core/config/configsite.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
3) #config arizona ucp old
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE site_news"  > /dev/null 2>&1
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/core/config/configsite.php
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/core/config/configsite.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
4) #config empire ucp
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE ucp_admin" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE ucp_category_roulette" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE ucp_drop_roulette" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE ucp_item_roulette" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE ucp_news" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE ucp_settings" > /dev/null 2>&1
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/config/database.php
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/config/database.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
5) #config energy
sed -i "s/nameproject/Name Project/g" /var/www/${DOMAIN}/includes/config.php
sed -i "s/siteurl/${DOMAIN}/g" /var/www/${DOMAIN}/includes/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Заполнение данных • ${green}[OK]"
tput sgr0
else
echo "• Заполнение данных • ${red}[fail]"
tput sgr0
exit
fi ;;
6) #config luxe ucp
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE session" > /dev/null 2>&1
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/config.php
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
7) #config grand ucp
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE session" > /dev/null 2>&1
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/config.php
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
8) ;;
9) #config unionlogs
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/includes/con_logs.php
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/includes/con_logs.php
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/includes/constants.php
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/includes/constants.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
10) #config forum io dark
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/src/config.php
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/src/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
1337) #config canberra ucp
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE news" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE freekassa_payments" > /dev/null 2>&1
mysql -u admin -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/${DOMAIN}/base.sql
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/config.php
sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi ;;
*) #ошибка если такого id нет
echo "• Ошибка номера сайта • ${red}[fail]"
exit ;;
esac
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
log_s
log_n "${white}Установка сайта ${green}$2 ${white}успешно завершена!"
log_n ""
log_n "${white}Ссылка на сайт: http://$DOMAIN"
log_n "${white}Путь до файлов сайта: /var/www/${DOMAIN}"
log_n ""
log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
log_n ""
cp_s
else
exit
fi
else
Info
log_t "${white}В данный момент установка $2 - ЗАПРЕЩЕНА!"
Info
fi
}
install_swap()
{
clear
read -p "${white}Введите размер файла подкачки (в GB. Например: 1):${reset}" GB
fallocate -l ${GB}G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile    none    swap    sw    0    0" >> /etc/fstab
log_n "Файл подкачки размером в ${GB}GB успешно подключен!"
}
install_location_56()
{
Info "${YELLOW}Мастер установки локации для HPL 5.6"
if [ $VER = "Debian10" ] || [ $VER = "Debian11" ] || [ $VER = "Debian12" ]; then
export DEBIAN_FRONTEND=noninteractive > /dev/null 2>&1
echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/90-disable-ipv6.conf > /dev/null 2>&1
echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.d/90-disable-ipv6.conf > /dev/null 2>&1
echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.d/90-disable-ipv6.conf > /dev/null 2>&1
sysctl -p -f /etc/sysctl.d/90-disable-ipv6.conf > /dev/null 2>&1
echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections > /dev/null 2>&1
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections > /dev/null 2>&1
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections > /dev/null 2>&1
fi
# groupdel gameservers
groupadd gameservers > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Первоначальная ${green}настройка! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Первоначальная ${green}настройка! ${white}• ${red}[fail]"
tput sgr0
exit
fi
echo "127.0.0.1 $(hostname) " >> /etc/hosts
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
install_php;
install_phpmyadmin;
a2enmod rewrite > /dev/null 2>&1
systemctl restart apache2 > /dev/null 2>&1
service mysql restart > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}Apache2 и MySQL ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}Apache2 и MySQL ${white}• ${red}[fail]"
tput sgr0
exit
fi
service apache2 stop > /dev/null 2>&1
apt-get install -y nginx > /dev/null 2>&1
mkdir -p /var/nginx > /dev/null 2>&1
rm /etc/nginx/nginx.conf > /dev/null 2>&1
cd /etc/nginx > /dev/null 2>&1
wget http://resource.hackchik.ru/multytools/hostinpl/5.6/nginx.conf > /dev/null 2>&1
VERPHP=`php -v | awk '/^PHP/ {print substr($2,0,3)}'`; #7.0 || #5.6
sed -i "s/VERSIONSPHP/${VERPHP}/g" /etc/nginx/nginx.conf
service nginx restart > /dev/null 2>&1
service apache2 start
if [ $? -eq 0 ]; then
echo "${white}• Установка и настройка ${green}Nginx ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка и настройка ${green}Nginx ${white}• ${red}[fail]"
tput sgr0
exit
fi
mkdir /home > /dev/null 2>&1
cd /home/ > /dev/null 2>&1
wget $URL_cp56 > /dev/null 2>&1
unzip -o cp56.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Загрузка и распаковка игр • ${green}[OK]"
tput sgr0
else
echo "${white}• Загрузка и распаковка игр • ${red}[fail]"
tput sgr0
exit
fi
rm cp56.zip > /dev/null 2>&1
cd > /dev/null 2>&1
chown -R root /home/ > /dev/null 2>&1
chmod -R 755 /home/ > /dev/null 2>&1
chmod 700 /home/cp/backups > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Выдача нужных прав • ${green}[OK]"
tput sgr0
else
echo "${white}• Выдача нужных прав • ${red}[fail]"
tput sgr0
exit
fi
apt-get install -y iptables-persistent pure-ftpd > /dev/null 2>&1
systemctl enable netfilter-persistent.service > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}FTP ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка ${green}FTP ${white}• ${red}[fail]"
tput sgr0
exit
fi
sh -c "echo '' >> /etc/ssh/sshd_config" > /dev/null 2>&1
sh -c "echo 'DenyGroups gameservers' >> /etc/ssh/sshd_config" > /dev/null 2>&1
service ssh restart  > /dev/null 2>&1
service sshd restart > /dev/null 2>&1
echo "yes" > /etc/pure-ftpd/conf/CreateHomeDir
echo "yes" > /etc/pure-ftpd/conf/NoAnonymous
echo "yes" > /etc/pure-ftpd/conf/ChrootEveryone
echo "yes" > /etc/pure-ftpd/conf/VerboseLog
echo "yes" > /etc/pure-ftpd/conf/IPV4Only
echo "100" > /etc/pure-ftpd/conf/MaxClientsNumber
echo "8" > /etc/pure-ftpd/conf/MaxClientsPerIP
echo "no" > /etc/pure-ftpd/conf/DisplayDotFiles
echo "15" > /etc/pure-ftpd/conf/MaxIdleTime
echo "16" > /etc/pure-ftpd/conf/MaxLoad
echo "50000 50300" > /etc/pure-ftpd/conf/PassivePortRange
service pure-ftpd restart > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}FTP ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}FTP ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get -qq update && apt-get -y upgrade > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get install -y gnupg-agent > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}Docker'a ${white}• ${green}[1/5]"
tput sgr0
else
echo "${white}• Установка ${green}Docker'a ${white}• ${red}[1/5]"
tput sgr0
exit
fi
apt-get -qq update > /dev/null 2>&1
curl -fsSL "https://download.docker.com/linux/debian/gpg" | apt-key add > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}Docker'a ${white}• ${green}[2/5]"
tput sgr0
else
echo "${white}• Установка ${green}Docker'a ${white}• ${red}[2/5]"
tput sgr0
exit
fi
sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d > /dev/null 2>&1
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -sc) stable" >> /etc/apt/sources.list
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}Docker'a ${white}• ${green}[3/5]"
tput sgr0
else
echo "${white}• Установка ${green}Docker'a ${white}• ${red}[3/5]"
tput sgr0
exit
fi
apt-get -qq update && apt-get -y upgrade > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}Docker'a ${white}• ${green}[4/5]"
tput sgr0
else
echo "${white}• Установка ${green}Docker'a ${white}• ${red}[4/5]"
tput sgr0
exit
fi
apt-get install docker-ce docker-ce-cli -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}Docker'a ${white}• ${green}[5/5]"
tput sgr0
else
echo "${white}• Установка ${green}Docker'a ${white}• ${red}[5/5]"
tput sgr0
exit
fi
wget https://resource.hackchik.ru/multytools/hostinpl/5.6/Dockerfile > /dev/null 2>&1
docker build -t hostinpl:games . > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}Docker'a ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}Docker'a ${white}• ${red}[fail]"
tput sgr0
exit
fi
cd /root > /dev/null 2>&1
mkdir steamcmd > /dev/null 2>&1
cd steamcmd > /dev/null 2>&1
wget http://media.steampowered.com/client/steamcmd_linux.tar.gz > /dev/null 2>&1
tar xvfz steamcmd_linux.tar.gz > /dev/null 2>&1
rm steamcmd_linux.tar.gz > /dev/null 2>&1
cd > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}SteamCMD ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка ${green}SteamCMD ${white}• ${red}[fail]"
tput sgr0
exit
fi
echo -e "Настройка игровой локации прошла успешно\nСсылка на phpmyadmin: http://$IP_SERV:8080/phpmyadmin\nДанные от PHPMyAdmin: логин: admin ; пароль: $MYPASS\n\nАвтор: AndreyChikaev ( vk.com/winchikplay )\nYouTube: HackChik ( catcut.net/ZKaL )\nВ случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infolocation.txt
log_s
log_n "${white}Настройка игровой локации прошла успешно!"
log_n ""
log_n "${white}Пользователь от ${red} PHPMyAdmin${white}: admin"
log_n "${white}Root пароль от ${red} PHPMyAdmin${white}: $MYPASS"
log_n "${white}Ссылка на ${red} phpmyadmin${white}: http://$IP_SERV:8080/phpmyadmin"
log_n ""
log_n "${white}Данные скрипт успешно скопировал в фаил! Путь к файлу: /root/infolocation.txt"
log_n ""
log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
log_n ""
cp_s
}
backup_cron()
{
clear
Info
Info "-  ${white}* ${red}* ${green}* ${MAGENTA}* ${YELLOW}* ${CYAN}выполняемая команда"
Info "-  ${white}- ${red}- ${green}- ${MAGENTA}- ${YELLOW}-"
Info "-  ${white}| ${red}| ${green}| ${MAGENTA}| ${YELLOW}|"
Info "-  ${white}| ${red}| ${green}| ${MAGENTA}| ${YELLOW}----- ${CYAN}день недели (0-7) (воскресенье = 0 или 7)"
Info "-  ${white}| ${red}| ${green}| ${MAGENTA}------- ${CYAN}месяц (1-12)"
Info "-  ${white}| ${red}| ${green}--------- ${CYAN}день (1-31)"
Info "-  ${white}| ${red}----------- ${CYAN}час (0-23)"
Info "-  ${white}------------- ${CYAN}минута (0-59)"
Info "-  ${white}Пример: ${MAGENTA}30 * * * 0 apt-get update"
Info "-  ${white}Каждые 30минут в каждое воскресение будет выполнятся команда"
Info "-  ${white}Вместо пустоты обязательно использовать ${red}*"
Info
read -p "${white}Укажите время минуты/часы/дни/месяца/дни недели(00 07 * * 1-5):" TIME
read -p "${white}Укажите команду для выполнения(apt-get update или /root/install.sh):" CMD
crontab -l > mycron
echo "${TIME} ${CMD}" >> mycron
crontab mycron
rm mycron &2>/dev/null
service cron reload > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создано правило:  ${green}${TIME} ${CMD} • ${green}[OK]"
tput sgr0
else
echo "• Создано правило: ${red}${TIME} ${CMD} • ${red}[fail]"
tput sgr0
exit
fi
}
backup_allsql()
{
read -p "${white}Введите пароль от базы данных(admin):" MYPASS
mkdir -p /backup/mysql > /dev/null 2>&1
if [ $? -eq 0 ]; then
mysqldump -uadmin -p$MYPASS --all-databases > /backup/mysql/$filename 2> /dev/null
echo "• Создание ${green}дампа! • ${green}[OK]"
echo "${white}• База сохранена в ${CYAN}/backup/mysql/${filename}"
tput sgr0
else
echo "• Создание ${green}дампа! • ${red}[fail]"
tput sgr0
exit
fi
}
backup_onesql()
{
read -p "${white}Введите название базы данных:" DATABASE
read -p "${white}Введите пароль от базы данных(admin):" MYPASS
mkdir -p /backup/mysql/ > /dev/null 2>&1
if [ $? -eq 0 ]; then
mysqldump -uadmin -p$MYPASS $DATABASE > /backup/mysql/$filename 2> /dev/null
echo "• Создание ${green}дампа! • ${green}[OK]"
echo "${white}• База сохранена в ${CYAN}/backup/mysql/${filename}"
tput sgr0
else
echo "• Создание ${green}дампа! • ${red}[fail]"
tput sgr0
exit
fi
}
websystem()
{
Info "${YELLOW}Мастер настройки Apache2/Nginx"
read -p "${white}Что ставим?( 1 - Apache2 | 2 - Nginx ):${reset}" WEBSYSTEMS
sudo apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ "$WEBSYSTEMS" = "1" ]; then
systemctl stop nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Остановка ${green}nginx ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Остановка ${green}nginx ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl start apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Запуск ${green}apache2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Запуск ${green}apache2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
if [ "$WEBSYSTEMS" = "2" ]; then
systemctl stop apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Остановка ${green}apache2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Остановка ${green}apache2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl start nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Запуск ${green}nginx ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Запуск ${green}nginx ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
}
install_php() #id
{
if [ $VER = "Debian9" ]; then
sudo apt-get install -y libapache2-mod-php7.0 php7.0 php7.0-fpm php7.0-gd php7.0-mysql php7.0-curl > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}php7.0 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}php7.0 ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php7.0 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php7.0 ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ -f "$check_nginx" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/fpm/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.0/fpm/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.0/fpm/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php7.0-fpm ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php7.0-fpm ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart php7.0-fpm > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}php7.0-fmp ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}php7.0-fmp ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
elif [ $VER = "Debian10" ] || [ $VER = "Debian11" ] || [ $VER = "Debian12" ] || [ $VER = "Debian13" ]; then
CASE=$1;
if [ -z "$CASE" ]; then
Info "- ${YELLOW}1${green} - ${white}PHP 5.6"
Info "- ${YELLOW}2${green} - ${white}PHP 7.2"
Info "- ${YELLOW}3${green} - ${white}PHP 7.4 ${white}(рекомендую)"
Info "- ${YELLOW}4${green} - ${white}PHP 8.1"
Info "- ${YELLOW}5${green} - ${white}PHP 8.2"
read -p "${white}Выберите желаемую версию PHP:${reset}" CASE
fi
sudo apt-get install -y software-properties-common ca-certificates lsb-release apt-transport-https > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}сертификатов ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка ${green}сертификатов ${white}• ${red}[fail]"
tput sgr0
exit
fi
echo "deb https://ftp.mpi-inf.mpg.de/mirrors/linux/mirror/deb.sury.org/repositories/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
sudo apt-get install -y gnupg > /dev/null 2>&1
wget -O /etc/apt/trusted.gpg.d/php.gpg https://ftp.mpi-inf.mpg.de/mirrors/linux/mirror/deb.sury.org/repositories/php/apt.gpg > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Получение ${green}ключа ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Получение ${green}ключа ${white}• ${red}[fail]"
tput sgr0
exit
fi
sudo apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}пакетов ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}пакетов ${white}• ${red}[fail]"
tput sgr0
exit
fi
case $CASE in
1) sudo apt-get install -y php5.6 php5.6-ssh2 php5.6-fpm libapache2-mod-php5.6 php5.6-cgi php5.6-curl php5.6-mysqli php5.6-mbstring php5.6-common > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}php5.6 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}php5.6 ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/5.6/apache2/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/5.6/apache2/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/5.6/apache2/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php5.6 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php5.6 ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ -f "$check_nginx" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/5.6/fpm/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/5.6/fpm/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/5.6/fpm/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php5.6-fpm ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php5.6-fpm ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart php5.6-fpm > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}php5.6-fmp ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}php5.6-fmp ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi ;;
2) sudo apt-get install -y php7.2 php7.2-ssh2 php7.2-fpm php7.2-curl libapache2-mod-php7.2 php7.2-cgi php7.2-mysqli php7.2-mbstring php7.2-common > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}php7.2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}php7.2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.2/apache2/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.2/apache2/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.2/apache2/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php7.2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php7.2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ -f "$check_nginx" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.2/fpm/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.2/fpm/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.2/fpm/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php7.2-fpm ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php7.2-fpm ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart php7.2-fpm > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}php7.2-fmp ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}php7.2-fmp ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi ;;
3) sudo apt-get install -y php7.4 php7.4-ssh2 php7.4-gd php7.4-fpm php7.4-curl libapache2-mod-php7.4 php7.4-cgi php7.4-mysqli php7.4-mbstring php7.4-common > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}php7.4 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}php7.4 ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.4/apache2/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.4/apache2/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.4/apache2/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php7.4 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php7.4 ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ -f "$check_nginx" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.4/fpm/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.4/fpm/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.4/fpm/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php7.4-fpm ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php7.4-fpm ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart php7.4-fpm > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}php7.4-fmp ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}php7.4-fmp ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi ;;
4) sudo apt-get install -y php8.1 php8.1-ssh2 php8.1-gd php8.1-fpm php8.1-curl libapache2-mod-php8.1 php8.1-cgi php8.1-mysqli php8.1-mbstring php8.1-common > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}php8.1 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}php8.1 ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/8.1/apache2/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/8.1/apache2/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/8.1/apache2/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php8.1 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php8.1 ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ -f "$check_nginx" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/8.1/fpm/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/8.1/fpm/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/8.1/fpm/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php8.1-fpm ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php8.1-fpm ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart php8.1-fpm > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}php8.1-fmp ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}php8.1-fmp ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi ;;
5) sudo apt-get install -y php8.2 php8.2-ssh2 php8.2-gd php8.2-fpm php8.2-curl libapache2-mod-php8.2 php8.2-cgi php8.2-mysqli php8.2-mbstring php8.2-common > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}php8.2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}php8.2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/8.2/apache2/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/8.2/apache2/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/8.2/apache2/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php8.2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php8.2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ -f "$check_nginx" ]; then
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/8.2/fpm/php.ini > /dev/null 2>&1
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/8.2/fpm/php.ini > /dev/null 2>&1
sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/8.2/fpm/php.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка пакетов ${green}php8.2-fpm ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка пакетов ${green}php8.2-fpm ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart php8.2-fpm > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}php8.2-fmp ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}php8.2-fmp ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi ;;
*) exit;;
esac
fi
}
install_phpmyadmin()
{
sudo apt-get install -y mariadb-server > /dev/null 2>&1
if [ "$SAVEMYPASS" = "0" ]; then
MYPASS=$(pwgen -cns -1 16) > /dev/null 2>&1
fi
mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '$MYPASS' WITH GRANT OPTION" > /dev/null 2>&1
mysql -e "FLUSH PRIVILEGES" > /dev/null 2>&1
mysql -e "SET GLOBAL sql_mode=''" > /dev/null 2>&1
echo "$MYPASS" > passwd
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}mariadb-server ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}mariadb-server ${white}• ${red}[fail]"
tput sgr0
exit
fi
echo "Europe/Moscow" > /etc/timezone
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
sed -i 's/#max_connections        = 100/max_connections        = 1000/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
systemctl restart mysql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}mariadb ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}mariadb ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ $VER = "Debian9" ]; then
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections > /dev/null 2>&1
echo "phpmyadmin phpmyadmin/mysql/admin-user string admin" | debconf-set-selections > /dev/null 2>&1
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYPASS" | debconf-set-selections > /dev/null 2>&1
echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYPASS" |debconf-set-selections > /dev/null 2>&1
echo "phpmyadmin phpmyadmin/app-password-confirm password $MYPASS" | debconf-set-selections > /dev/null 2>&1
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections > /dev/null 2>&1
sudo apt-get install -y phpmyadmin > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}phpmyadmin ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка ${green}phpmyadmin ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf 2> /dev/null
sudo a2enconf phpmyadmin.conf > /dev/null 2>&1
systemctl restart apache2 > /dev/null 2>&1
fi
if [ -f "$check_nginx" ]; then
VERPHP=`php -v | awk '/^PHP/ {print substr($2,0,3)}'`;
wget https://resource.hackchik.ru/multytools/nginx -O nginx 2> /dev/null
mv /root/nginx /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/SERT/80/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/DOMAIN/${IP_SERV}/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/VERSIONSPHP/${VERPHP}/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default > /dev/null 2>&1
systemctl restart nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}nginx${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}nginx${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
elif [ $VER = "Debian10" ] || [ $VER = "Debian11" ] || [ $VER = "Debian12" ] || [ $VER = "Debian13" ]; then
MYPMAPASS=$(pwgen -cns -1 16) > /dev/null 2>&1
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY '$MYPMAPASS'" > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Создание пользователя ${green}pma ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Создание пользователя ${green}pma ${white}• ${red}[fail]"
tput sgr0
exit
fi
wget https://resource.hackchik.ru/multytools/phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
unzip phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
rm phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
rm -Rfv /usr/share/phpmyadmin > /dev/null 2>&1
mv phpMyAdmin-5.2.0-all-languages /usr/share/phpmyadmin > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Загрузка ${green}phpmyadmin ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Загрузка ${green}phpmyadmin ${white}• ${red}[fail]"
tput sgr0
exit
fi
mkdir -p /var/lib/phpmyadmin/tmp > /dev/null 2>&1
sudo chown -R www-data:www-data /var/lib/phpmyadmin > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Создание директории ${green}phpmyadmin/tmp ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Создание директории ${green}phpmyadmin/tmp ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/NEWSECRET/$(pwgen -cns -1 32)/g" /usr/share/phpmyadmin/config.inc.php > /dev/null 2>&1
sed -i "s/PMAPASS/${MYPMAPASS}/g" /usr/share/phpmyadmin/config.inc.php > /dev/null 2>&1
sudo mariadb < /usr/share/phpmyadmin/sql/create_tables.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Загрузка данных ${green}phpmyadmin ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Загрузка данных ${green}phpmyadmin ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f "$check_apache2" ]; then
mv /root/phpmyadmin.conf /etc/apache2/conf-available/phpmyadmin.conf 2> /dev/null
sudo a2enconf phpmyadmin.conf > /dev/null 2>&1
systemctl restart apache2 > /dev/null 2>&1
else
rm /root/phpmyadmin.conf
fi
if [ $? -eq 0 ]; then
echo "${white}• Перезагрузка ${green}apache2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Перезагрузка ${green}apache2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
}
install_lamp()
{
if [ -f "$check_apache2" ]; then
Info "${YELLOW}У вас уже установлен LAMP"
else
Info "${YELLOW}Мастер настройки LAMP"
sudo apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sudo apt-get install -y apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка пакетов ${green}apache2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка пакетов ${green}apache2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
install_php;
install_phpmyadmin;
a2enmod rewrite > /dev/null 2>&1
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Подключение ${green}rewrite ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Подключение ${green}rewrite ${white}• ${red}[fail]"
tput sgr0
exit
fi
echo -e "Установка веб сервера APACHE2 завершена BY HACKCHIK!\nСсылка на сайт: http://$IP_SERV\nСсылка на PHPMyAdmin: http://$IP_SERV/phpmyadmin\nДанные от PHPMyAdmin: логин: admin ; пароль: $MYPASS\n\nАвтор: AndreyChikaev ( vk.com/winchikplay )\nYouTube: HackChik ( catcut.net/ZKaL )\nВ случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > info.txt
log_s
log_n "${white}Установка веб сервера APACHE2 завершена!"
log_n ""
log_n "${white}Ссылка на сайт: http://$IP_SERV"
log_n "${white}Ссылка на ${red}PHPMyAdmin ${white}: http://$IP_SERV/phpmyadmin"
log_n "${white}Данные от ${red}PHPMyAdmin ${white}: логин: admin ; пароль: $MYPASS"
log_n ""
log_n "${white}Данные скрипт успешно скопировал в фаил! Путь к файлу: /root/info.txt"
log_n ""
log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
log_n ""
cp_s
fi
}
#-------------------------------------------------------------------------------
virginiaproject()
{
check=`curl -H 'Cache-Control: no-cache, no-store' "$status?id=1&status" 2> /dev/null`
if [ "$check" = "1" ]; then
Info "${YELLOW}Мастер установки проекта Virginia Role Play"
read -p "${white}Укажите ваш домен:${reset}" HDOM
DOMAIN=`echo ${HDOM} | sed -e 's|^[^/]*//||' -e 's|/.*$||'`
read -p "${white}Введите ваш НИК (например Jack_Sweech):${reset}" NICKNAME
read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
install_php "3";
install_phpmyadmin;
a2dissite 000-default > /dev/null 2>&1
a2enmod rewrite > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Запуск ${green}rewrite! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Запуск ${green}rewrite! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm -Rfv /var/www/html > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Удаляем директорию ${green}html ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаляем директорию ${green}html ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезагрузка ${green}apache! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезагрузка ${green}apache! ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списока пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списока пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sudo apt-get install -y lib32stdc++6 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка ${green}lib32stdc++6 ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка ${green}lib32stdc++6 ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm -Rfv /home/samp/virginia > /dev/null 2>&1
mkdir -p /home/samp/virginia > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание папки ${green}samp! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание папки ${green}samp! ${white}• ${red}[fail]"
tput sgr0
exit
fi
cd /home/samp/virginia
wget https://resource.hackchik.ru/multytools/server/samp/VirginiaRP.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка ${green}Virginia RP! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка ${green}Virginia RP! ${white}• ${red}[fail]"
tput sgr0
exit
fi
unzip -o VirginiaRP.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Распаковка архива ${green}Virginia RP! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Распаковка архива ${green}Virginia RP! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm VirginiaRP.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Удаление архива ${green}Virginia RP! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаление архива ${green}Virginia RP! ${white}• ${red}[fail]"
tput sgr0
exit
fi
cd
mysql -uadmin -p$MYPASS -D samp_virginia -e "DROP DATABASE samp_virginia" > /dev/null 2>&1
mkdir /var/lib/mysql/samp_virginia > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание базы ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание базы ${white}• ${red}[fail]"
tput sgr0
exit
fi
chown -R mysql:mysql /var/lib/mysql/samp_virginia > /dev/null 2>&1
sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/samp/virginia/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Добавляем ник в FullDostup • ${green}[OK]"
tput sgr0
else
echo "• Добавляем ник в FullDostup • ${red}[fail]"
tput sgr0
exit
fi
mysql -u admin -p$MYPASS samp_virginia < /home/samp/virginia/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка базы данных ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка базы данных ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /home/samp/virginia/base.sql > /dev/null 2>&1
sed -i "s/dbname/samp_virginia/g" /home/samp/virginia/scriptfiles/mysql_settings.ini > /dev/null 2>&1
sed -i "s/parol/${MYPASS}/g" /home/samp/virginia/scriptfiles/mysql_settings.ini > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/DIRTYPE/samp/g" /home/samp/virginia/samp.sh > /dev/null 2>&1
sed -i "s/DIRNAME/virginia/g" /home/samp/virginia/samp.sh > /dev/null 2>&1
sed -i "s/SERVNAME/Virginia RP/g" /home/samp/virginia/samp.sh > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка меню для запуска • ${green}[OK]"
tput sgr0
else
echo "• Настройка меню для запуска • ${red}[fail]"
tput sgr0
exit
fi
chmod 777 /home/samp/virginia/samp.sh > /dev/null 2>&1
chmod 777 /home/samp/virginia/samp03svr > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Выдача прав для запуска мода • ${green}[OK]"
tput sgr0
else
echo "• Выдача прав для запуска мода • ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
cd /var/www/${DOMAIN}/ > /dev/null 2>&1
wget https://resource.hackchik.ru/multytools/site/VirginiaUCP.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка ${green}Virginia UCP! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка ${green}Virginia UCP! ${white}• ${red}[fail]"
tput sgr0
exit
fi
unzip -o VirginiaUCP.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Распаковка ${green}Virginia UCP! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Распаковка ${green}Virginia UCP! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm VirginiaUCP.zip
if [ $? -eq 0 ]; then
echo "• Удаление архива ${green}Virginia UCP! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаление архива ${green}Virginia UCP! ${white}• ${red}[fail]"
tput sgr0
exit
fi
mv /var/www/${DOMAIN}/apache2 /etc/apache2/sites-available/${DOMAIN}.conf > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/domain/${DOMAIN}/g" /etc/apache2/sites-available/${DOMAIN}.conf
cd
a2ensite ${DOMAIN} > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Настройка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезагрузка ${green}apache! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезагрузка ${green}apache! ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/core/config/configsite.php
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/core/config/config1.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
mkdir -p /var/www/logs.${DOMAIN} > /dev/null 2>&1
cd /var/www/logs.${DOMAIN} > /dev/null 2>&1
wget https://resource.hackchik.ru/multytools/site/UnionLogs.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка ${green}UnionLogs! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка ${green}UnionLogs! ${white}• ${red}[fail]"
tput sgr0
exit
fi
unzip -o UnionLogs.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Распаковка ${green}UnionLogs! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Распаковка ${green}UnionLogs! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm UnionLogs.zip
if [ $? -eq 0 ]; then
echo "• Удаление архива ${green}UnionLogs! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаление архива ${green}UnionLogs! ${white}• ${red}[fail]"
tput sgr0
exit
fi
mv /var/www/logs.${DOMAIN}/apache2 /etc/apache2/sites-available/logs.${DOMAIN}.conf > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/domain/logs.${DOMAIN}/g" /etc/apache2/sites-available/logs.${DOMAIN}.conf
cd
a2ensite logs.${DOMAIN} > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Настройка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезагрузка ${green}apache! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезагрузка ${green}apache! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/parol/${MYPASS}/g" /var/www/logs.${DOMAIN}/includes/con_logs.php
sed -i "s/parol/${MYPASS}/g" /var/www/logs.${DOMAIN}/includes/constants.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
mkdir -p /var/www/forum.${DOMAIN}
cd /var/www/forum.${DOMAIN}
wget https://resource.hackchik.ru/multytools/site/ForumIODark.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка ${green}Forum IO Dark! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка ${green}Forum IO Dark! ${white}• ${red}[fail]"
tput sgr0
exit
fi
unzip -o ForumIODark.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Распаковка ${green}Forum IO Dark! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Распаковка ${green}Forum IO DarkP! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm ForumIODark.zip
if [ $? -eq 0 ]; then
echo "• Удаление архива ${green}Forum IO Dark! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаление архива ${green}Forum IO Dark! ${white}• ${red}[fail]"
tput sgr0
exit
fi
cd
mkdir /var/lib/mysql/forum > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Создание папки ${green}/var/lib/mysql/forum! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Создание папки ${green}/var/lib/mysql/forum! ${white}• ${green}[Папка существует]"
tput sgr0
fi
chown -R mysql:mysql /var/lib/mysql/forum
mysql -u admin -p$MYPASS forum < /var/www/forum.${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка ${green}base.sql! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка ${green}base.sql! ${white}• ${red}[fail]"
tput sgr0
exit
fi
rm /var/www/forum.${DOMAIN}/base.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Удаление ${green}base.sql! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Удаление ${green}base.sql! ${white}• ${red}[fail]"
tput sgr0
exit
fi
mv /var/www/forum.${DOMAIN}/apache2 /etc/apache2/sites-available/forum.${DOMAIN}.conf > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/domain/forum.${DOMAIN}/g" /etc/apache2/sites-available/forum.${DOMAIN}.conf
cd
a2ensite forum.${DOMAIN} > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Настройка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезагрузка ${green}apache! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезагрузка ${green}apache! ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/parol/${MYPASS}/g" /var/www/forum.${DOMAIN}/src/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Подключаем базу данных • ${green}[OK]"
tput sgr0
else
echo "• Подключаем базу данных • ${red}[fail]"
tput sgr0
exit
fi
echo -e "Установка проекта Virginia завершена BY HACKCHIK!\nСсылка на сайт: http://$DOMAIN\nСсылка на логи: http://logs.$DOMAIN\nСсылка на форум: http://forum.$DOMAIN\nСсылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin\nДанные от PHPMyAdmin: логин: admin ; пароль: $MYPASS\nПуть до мода: /home/samp\nВаш аккаунт готов к администрированию: $NICKNAME пароль: 123q123\nЗапустить сервер 2 команды: 1)cd /home/samp  2)./samp.sh\n\n\nАвтор: AndreyChikaev ( vk.com/winchikplay )\nYouTube: HackChik ( catcut.net/ZKaL )\nВ случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > info.txt
log_s
log_n "${white}Установка проекта ${MAGENTA}Virginia(Last Update)${white} успешно завершена!"
log_n ""
log_n "${white}Ссылка на сайт: http://$DOMAIN"
log_n "${white}Ссылка на форум: http://forum.$DOMAIN"
log_n "${white}Ссылка на логи: http://logs.$DOMAIN"
log_n "${white}Ссылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin"
log_n "${white}Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS"
log_n ""
log_n "${white}Путь до мода: /home/samp"
log_n "${white}Ваш аккаунт готов к администрированию: $NICKNAME пароль: 123q123"
log_n "${white}Запустить сервер 2 команды: 1)cd /home/samp  2)./samp.sh"
log_n "${white}Данные сохранены в фаил: /root/info.txt"
log_n ""
log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
log_n ""
cp_s
else
exit
fi
else
Info
log_t "${white}В данный момент установка Virginia Project - ЗАПРЕЩЕНА!"
Info
fi
}
#-------------------------------------------------------------------------------
hostinpl_56()
{
Info "${YELLOW}Мастер установки HOSTINPL v5.6"
read -p "${white}Укажите ваш домен:${reset}" HDOM
DOMAIN=`echo ${HDOM} | sed -e 's|^[^/]*//||' -e 's|/.*$||'`
if [ "$SAVEMYPASS" = "0" ]; then
read -p "${white}Укажите пароль от базы данных(admin):${reset}" MYPASS
fi
read -p "${white}Введите название вашего хостинга:${reset}" NAME
read -p "${white}Введите reCaptchav2(ключ сайта) - (получить тут: clck.ru/9aEgx):${reset}" KEY_KAPT
read -p "${white}Введите reCaptchav2(секретный ключ) - (получить тут: clck.ru/9aEgx):${reset}" SEKRET_RAPT
read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
a2dissite 000-default > /dev/null 2>&1
rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
mkdir -p /var/www/${DOMAIN}/
cd /var/www/${DOMAIN}/
wget $URL_web56 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка ${green}HOSTINPL 5.6 • ${green}[OK]"
tput sgr0
else
echo "• Загрузка ${green}HOSTINPL 5.6 • ${red}[fail]"
tput sgr0
exit
fi
unzip -o web56.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Распаковка ${green}HOSTINPL 5.6 • ${green}[OK]"
tput sgr0
else
echo "• Распаковка ${green}HOSTINPL 5.6 • ${red}[fail]"
tput sgr0
exit
fi
rm web56.zip > /dev/null 2>&1
mv /var/www/${DOMAIN}/site.conf /etc/apache2/sites-available/${DOMAIN}.conf > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Загрузка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sed -i "s/domain/${DOMAIN}/g" /etc/apache2/sites-available/${DOMAIN}.conf
cd
a2ensite ${DOMAIN} > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Настройка параметров для ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Настройка параметров для ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}Apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}Apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ -f /root/infohostin.txt ]; then
crontab -r > /dev/null 2>&1
echo "${white}• Очистка ${green}crontab ${white}• ${green}[OK]"
fi
(crontab -l ; echo "0 0 * * * bash -c 'php /var/www/$DOMAIN/cron.php index'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "*/1 * * * * bash -c 'php /var/www/$DOMAIN/cron.php gameServers'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "*/1 * * * * bash -c 'php /var/www/$DOMAIN/cron.php tasks'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "*/10 * * * * bash -c 'php /var/www/$DOMAIN/cron.php serverReloader'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "*/30 * * * * bash -c 'php /var/www/$DOMAIN/cron.php stopServers'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "*/30 * * * * bash -c 'php /var/www/$DOMAIN/cron.php stopServersQuery'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "*/60 * * * * bash -c 'php /var/www/$DOMAIN/cron.php updateStats'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "*/60 * * * * bash -c 'php /var/www/$DOMAIN/cron.php updateStatsLocations'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "0 * */7 * * bash -c 'php /var/www/$DOMAIN/cron.php clearLogs'") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
service cron restart > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка и настройка ${green}crontab ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка и настройка ${green}crontab ${white}• ${red}[fail]"
tput sgr0
exit
fi
cd > /dev/null 2>&1
sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
sed -i "s/domen.ru/${DOMAIN}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
sed -i "s/iOJrgfYx604G/${KEY_KAPT}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
sed -i "s/dWglhblfESXr/${SEKRET_RAPT}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
sed -i "s/SiteName/${NAME}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка конфига • ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка конфига • ${red}[fail]"
tput sgr0
exit
fi
mysql -uadmin -p$MYPASS -e "SET @@GLOBAL.sql_mode= '';" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -e "SET @@SESSION.sql_mode= '';" > /dev/null 2>&1
mysql -uadmin -p$MYPASS -D hostin -e "DROP DATABASE hostin" > /dev/null 2>&1
mkdir /var/lib/mysql/hostin > /dev/null 2>&1
chown -R mysql:mysql /var/lib/mysql/hostin > /dev/null 2>&1
cd / > /dev/null 2>&1
mysql hostin < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
rm base.sql > /dev/null 2>&1
cd > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Создание и установка ${green}базы данных ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Создание и установка ${green}базы данных ${white}• ${red}[fail]"
tput sgr0
exit
fi
chown -R www-data:www-data /var/www
chmod -R 770 /var/www
chmod 777 /var/www/${DOMAIN}/tmp
chmod 777 /var/www/${DOMAIN}/tmp/avatar
chmod 777 /var/www/${DOMAIN}/tmp/tickets_img
if [ $? -eq 0 ]; then
echo "${white}• Выдача нужных прав • ${green}[OK]"
tput sgr0
else
echo "${white}• Выдача нужных прав • ${red}[fail]"
tput sgr0
exit
fi
echo -e "Установка HOSTINPL v5.6 завершена BY HACKCHIK!\nСсылка на сайт: http://$DOMAIN\nСсылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin\nДанные от PHPMyAdmin: логин: admin ; пароль: $MYPASS\n\nАвтор: AndreyChikaev ( vk.com/winchikplay )\nYouTube: HackChik ( catcut.net/ZKaL )\nВ случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infohostin.txt
log_s
log_n "${white}Панель управления ${MAGENTA}HOSTINPL v5.6 ${white} установлена и настроена!"
log_n ""
log_n "${white}Ссылка на сайт: http://$DOMAIN"
log_n "${white}Пользователь от ${red}PHPMyAdmin${white}: admin"
log_n "${white}Пароль от ${red}PHPMyAdmin${white}: $MYPASS"
log_n "${white}Ссылка на ${red}PHPMyAdmin${white}: http://$DOMAIN/phpmyadmin"
log_n ""
log_n "${white}Данные скрипт успешно скопировал в фаил! Путь к файлу: /root/infohostin.txt"
log_n ""
log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
log_n ""
cp_s
else
exit
fi
}
install_hostinpl()
{
check=`curl -H 'Cache-Control: no-cache, no-store' "$status?id=$5&status" 2> /dev/null`
if [ "$check" = "1" ]; then
clear
Info
log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}$2"
if [ -f "$check_apache2" ] || [ -f "$check_nginx" ]; then
Info "- ${YELLOW}1${green} - ${white}Настроить веб-часть"
else
Info "- ${dark_gray}1 - Настроить веб-часть"
fi
Info "- ${YELLOW}2${green} - ${white}Настроить игровую локацию"
Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
cp_s
Info
read -p "Пожалуйста, введите пункт меню: " case
case $case in
1)
if [ -f "$check_apache2" ] || [ -f "$check_nginx" ]; then
$3
else
Info "${YELLOW}Для начала настройте веб сервер!"
fi ;;
2) $4;;
0) menu;;
esac
else
Info
log_t "${white}В данный момент установка $2 - ЗАПРЕЩЕНА!"
Info
fi
}
menu()
{
INFORMATION=`curl -H 'Cache-Control: no-cache, no-store' "$status?update" 2> /dev/null`;
curl -H 'Cache-Control: no-cache, no-store' "https://resource.hackchik.ru/multytools/config.php?views=${IP_SERV}" > /dev/null 2>&1
check=`curl -H 'Cache-Control: no-cache, no-store' "$status?work" 2> /dev/null`
if [ "$check" = "1" ]; then
clear
Info
log_t "${white}Добро пожаловать в меню ${green}MULTY-TOOLS${white} by ${YELLOW}HackChik ツ${white}"
Info "- ${YELLOW}1${green} - ${white}Установить и настроить ${MAGENTA}ВЕБ СЕРВЕР${white}(для установки сайтов)"
Info "- ${YELLOW}2${green} - ${white}Установить библиотеки для ${MAGENTA}Samp/Minecraft${white}(для установки серверов)"
if [ -f "$check_apache2" ] || [ -f "$check_nginx" ]; then
Info "- ${YELLOW}3${green} - ${white}Установить сервер ${YELLOW}SAMP/CRMP/MINECRAFT/CS/CSS/CSGO"
Info "- ${YELLOW}4${green} - ${white}Установить скрипт ${YELLOW}САЙТА"
else
Info "- ${dark_gray}3 - Установить сервер SAMP/CRMP/MINECRAFT/CS/CSS/CSGO"
Info "- ${dark_gray}4 - Установить скрипт САЙТА"
fi
Info "- ${YELLOW}5${green} - ${white}Установка игрового хостинга ${YELLOW}HOSTINPL ツ"
Info "- ${YELLOW}6${green} - ${white}Установить ${CYAN}ВСЕ ${white}в один клик (мод/сайт/логи/форум)"
Info "- ${YELLOW}7${green} - ${white}Меню управления ${CYAN}CRON/BACKUP ツ"
Info "- ${YELLOW}0${green} - ${white}Выход"
upd
Info "${white}$INFORMATION" 2> /dev/null
cp_s
Info
read -p "${white}Пожалуйста, введите пункт меню:" case
case $case in
1) #install web server
clear
Info
log_t "${white}Добро пожаловать в меню ${green}MULTY-TOOLS${white} by ${YELLOW}HackChik ツ${white}"
Info "- ${YELLOW}1${green} - ${white}Установить ${CYAN}LAMP ${white}(рекомендую)"
Info "- ${YELLOW}2${green} - ${white}Установить ${green}APACHE2"
Info "- ${YELLOW}3${green} - ${white}Установить ${YELLOW}NGINX"
Info "- ${YELLOW}4${green} - ${white}Установить ${RED}PHPMYADMIN"
Info ""
Info "- ${YELLOW}5${green} - ${white}Изменить ${YELLOW}NGINX/APACHE2"
Info "- ${YELLOW}6${green} - ${white}Изменить пароль от ${RED}PHPMYADMIN"
Info "- ${YELLOW}7${green} - ${white}Изменить ${MAGENTA}PHP ${white}версию"
Info ""
Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
cp_s
Info
read -p "Пожалуйста, введите пункт меню: " case
case $case in
1) install_lamp;;
2) #install apache2
if [ -f "$checkdir_apache2" ]; then
Info "${YELLOW}У вас уже установлен apache2"
else
if [ -f "$check_nginx" ]; then
systemctl stop nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Остановка ${green}nginx! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Остановка ${green}nginx! ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get install -y apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}apache2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка ${green}apache2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
install_php
a2enmod rewrite > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}apache2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}apache2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списока пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списока пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Перезагрузка ${green}apache2 ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Перезагрузка ${green}apache2 ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi ;;
3) #install nginx
if [ -f "$checkdir_nginx" ]; then
Info "${YELLOW}У вас уже установлен nginx"
else
if [ -f "$check_apache2" ]; then
systemctl stop apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Остановка ${green}apache2! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Остановка ${green}apache2! ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
sudo apt-get -o DPkg::options::=--force-confmiss --reinstall -y install nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Установка ${green}nginx ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Установка ${green}nginx ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списока пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списока пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
install_php
wget https://resource.hackchik.ru/multytools/nginx -O nginx 2> /dev/null
mv /root/nginx /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/SERT/80/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/DOMAIN/${IP_SERV}/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/VERSIONSPHP/${VERPHP}/g" /etc/nginx/sites-available/default > /dev/null 2>&1
systemctl restart nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}nginx${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}nginx${white}• ${red}[fail]"
tput sgr0
exit
fi
fi ;;
4) #phpmyadmin install
if [ -d "$check_phpmyadmin" ]; then
Info "${YELLOW}У вас уже установлен phpmyadmin"
else
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
install_phpmyadmin;
if [ -d "$check_nginx" ]; then
VERPHP=`php -v | awk '/^PHP/ {print substr($2,0,3)}'`; #7.0 || #5.6
wget https://resource.hackchik.ru/multytools/nginx -O nginx 2> /dev/null
mv /root/nginx /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/SERT/80/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/domain/${IP_SERV}/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sed -i "s/VERSIONSPHP/${VERPHP}/g" /etc/nginx/sites-available/default > /dev/null 2>&1
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default > /dev/null 2>&1
systemctl restart nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}nginx${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}nginx${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ -f "$check_apache2" ]; then
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf > /dev/null 2>&1
sudo a2enconf phpmyadmin.conf > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Настройка ${green}apache2${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Настройка ${green}apache2${white}• ${red}[fail]"
tput sgr0
exit
fi
sudo systemctl restart apache2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Перезагрузка ${green}apache2${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Перезагрузка ${green}apache2${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
Info
log_n "${white}Пользователь от ${red}PHPMyAdmin${white}: admin"
log_n "${white}Пароль от ${red}PHPMyAdmin${white}: $MYPASS"
log_t "${white}Так же пароль сохранён в /root/passwd"
Info
fi ;;
5)
if [ -d "$checkdir_nginx" ] && [ -d "$checkdir_apache2" ]; then
websystem
else
log_n "${white}Установите оба веб сервера (nginx и apache2)"
fi ;;
6)
read -p "${white}Укажите новый пароль для phpmyadmin:${reset}" NEWDBPASS
mysql -e "UPDATE mysql.user SET Password=PASSWORD('$NEWDBPASS') WHERE User='admin'" > /dev/null 2>&1
mysql -e "FLUSH PRIVILEGES" > /dev/null 2>&1
mysql -e "SET GLOBAL sql_mode=''" > /dev/null 2>&1
echo "$MYPASS" > passwd
if [ $? -eq 0 ]; then
echo "• Обновление пароля для ${green}ADMIN ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление пароля для ${green}ADMIN ${white}• ${red}[fail]"
tput sgr0
fi
echo "$NEWDBPASS" > passwd
if [ $? -eq 0 ]; then
echo "• Сохранение пароля ${green}passwd ${white}• ${green}[OK]"
tput sgr0
else
echo "• Сохранение пароля ${green}passwd ${white}• ${red}[fail]"
tput sgr0
fi
systemctl restart mysql > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Перезапуск ${green}mysql ${white}• ${green}[OK]"
tput sgr0
else
echo "• Перезапуск ${green}mysql ${white}• ${red}[fail]"
tput sgr0
fi ;;
7) Info "${YELLOW}В разработке..."
exit ;;
0) menu;;
esac ;;
2) #install game lib
Info "${YELLOW}Мастер установки библиотек для игровых серверов"
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списока пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списока пакетов! ${white}• ${red}[fail]"
tput sgr0
fi
sudo apt-get install -y lib32stdc++6 > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка ${green}lib32stdc++6 ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка ${green}lib32stdc++6 ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get install -y default-jdk > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка ${green}java-jdk! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Установка ${green}java-jdk! ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Обновление ${green}списока пакетов! ${white}• ${green}[OK]"
tput sgr0
else
echo "• Обновление ${green}списока пакетов! ${white}• ${red}[fail]"
tput sgr0
exit
fi
log_s
log_n "${white}Настройка VDS/VPS под Samp/Minecraft server успешно завершена!"
log_n ""
log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
log_n ""
cp_s ;;
3) #menu game servers
if [ -f "$check_apache2" ] || [ -f "$check_nginx" ]; then
clear
Info
log_t "${white}Выберите сервер который хотите установить"
Info "- ${YELLOW}1${green} - ${white}SAMP${green} - ${MAGENTA}Virginia RP ${green}ツ${white}"
Info "- ${YELLOW}2${green} - ${white}SAMP${green} - ${green}Arizona RP Florence ${green}ツ${white}"
Info "- ${YELLOW}3${green} - ${white}SAMP${green} - ${YELLOW}Absolute RP ${green}ツ${white}"
Info "- ${YELLOW}4${green} - ${white}CRMP${green} - ${MAGENTA}Radmir RP ${green}ツ${white}"
Info ""
Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
cp_s
Info
read -p "${white}Пожалуйста, введите пункт меню:" case
case $case in
1) install_server "$case" "samp" "virginia" "Virginia RP" "VirginiaRP.zip" "12";;
2) install_server "$case" "samp" "arizona" "Arizona RP Florense" "ArizonaRP.zip" "13";;
3) install_server "$case" "samp" "absolute" "Absolute RP" "AbsoluteRP.zip" "14";;
4) install_server "$case" "crmp" "radmir" "Radmir RP" "RadmirRP.zip" "15";;
0) menu;;
esac
else
Info "${YELLOW}Для начала настройте веб сервер!"
fi ;;
4)      #menu scripts site
if [ -f "$check_apache2" ] || [ -f "$check_nginx" ]; then
clear
Info
log_t "${white}Выберите сайт который хотите установить"
Info "- ${YELLOW}1${green} - ${white}SITE${green} - ${green}Arizona UCP 2022 ${green}ツ${white}"
Info "- ${YELLOW}2${green} - ${white}SITE${green} - ${MAGENTA}Virginia UCP ${green}ツ${white}"
Info "- ${YELLOW}3${green} - ${white}SITE${green} - ${green}Arizona UCP ${green}ツ${white}"
Info "- ${YELLOW}4${green} - ${white}SITE${green} - ${BLUE}Empire UCP ${green}ツ${white}"
Info "- ${YELLOW}5${green} - ${white}SITE${green} - ${YELLOW}Energy RP ${green}ツ${white}"
Info "- ${YELLOW}6${green} - ${white}SITE${green} - ${CYAN}Luxe UCP$ ${green}ツ${white}"
Info "- ${YELLOW}7${green} - ${white}SITE${green} - ${red}Grand UCP ${green}ツ${white}"
Info "- ${YELLOW}8${green} - ${white}SITE${green} - ${RED}Aurora(шаблон) ${green}ツ${white}"
Info "- ${YELLOW}9${green} - ${white}OTHER${green} - ${red}UnionLogs  ${green}ツ${white}"
Info "- ${YELLOW}10${green} - ${white}FORUM${green} - ${red}IO Dark  ${green}ツ${white}"
Info ""
Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
cp_s
Info
read -p "${white}ѕожалуйста, введите пункт меню:" case
case $case in
1) install_site "$case" "Arizona UCP 2022" "ARZ_2022.zip" "2";;
2) install_site "$case" "Virginia UCP" "VirginiaUCP.zip" "3";;
3) install_site "$case" "Arizona UCP" "ArizonaUCP.zip" "4";;
4) install_site "$case" "Empire UCP" "EmpireUCP.zip" "5";;
5) install_site "$case" "Energy" "EnergySite.zip" "6";;
6) install_site "$case" "Luxe UCP" "LuxeUCP.zip" "7";;
7) install_site "$case" "Grand UCP" "GrandUCP.zip" "8";;
8) install_site "$case" "Aurora" "Aurora.zip" "9";;
9) install_site "$case" "UnionLogs" "UnionLogs.zip" "10";;
10) install_site "$case" "Forum IO Dark" "ForumIODark.zip" "11";;
228) install_site "$case" "Arizona UCP 2022" "ARZ_2022.zip" "${STATUS_site_arizona_2022}";;
0) menu;;
esac
else
Info "${YELLOW}Для начала настройте веб сервер!"
fi ;;
5) #menu hostinpl
if [ $VER = "Debian10" ] || [ $VER = "Debian11" ] || [ $VER = "Debian12" ] || [ $VER = "Debian13" ]; then
clear
Info
log_t "${white}Выберите игровую панель которую хотите установить"
Info "- ${YELLOW}1${green} - ${YELLOW}HostinPanel v5.6 ${CYAN}ツ${white}"
Info "- ${YELLOW}2${green} - ${white}Подключить файл подкачки  ${green}ツ${white}"
Info ""
Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
cp_s
Info
read -p "${white}Пожалуйста, введите пункт меню:" case
case $case in
1) install_hostinpl "$case" "HOSTINPL 5.6" "hostinpl_56" "install_location_56" "17";;
2) install_swap;;
0) menu;;
esac
else
Info
log_t "${white}Установка HOSTINPL доступна только для Debian 10,11"
Info
fi;;
6) if [ $VER = "Debian9" ] || [ $VER = "Debian10" ] || [ $VER = "Debian11" ] || [ $VER = "Debian12" ]; then
virginiaproject;
else
Info
log_t "${white}Установка Virginia Project доступна только для Debian 9"
Info
fi ;;
7) #menu backup and crontab
clear
Info
log_t "${white}Выберите нужное вам меню"
Info "- ${YELLOW}1${green} - ${white}Сделать резерв ${YELLOW}одной базы ${green}ツ${white}"
Info "- ${YELLOW}2${green} - ${white}Сделать резерв ${MAGENTA}всей базы ${green}ツ${white}"
Info "- ${YELLOW}3${green} - ${white}Сделать резерв ${green}директории ${green}ツ${white}"
Info "- ${YELLOW}4${green} - ${white}Создать правило для ${green}crontab ${green}ツ${white}"
Info ""
Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
cp_s
Info
read -p "${white}Пожалуйста, введите пункт меню:" case
case $case in
1)      backup_onesql;;
3) backup_allsql;;
4) backup_cron;;
0) menu;;
esac ;;
228) testing;;
0) exit;;
esac
else
Info
log_t "${white}В данный момент Multy-Tools - ОТКЛЮЧЕН"
Info
fi
}
if [ $VER = "Debian9" ] || [ $VER = "Debian10" ] || [ $VER = "Debian11" ] || [ $VER = "Debian12" ] || [ $VER = "Debian13" ]; then
if [ $(check_status "sudo" 2> /dev/null) == 1  ] && [ $(check_status "curl" 2> /dev/null) == 1  ] && [ $(check_status "unzip" 2> /dev/null) == 1  ] && [ $(check_status "pwgen" 2> /dev/null) == 1  ] && [ $(check_status "screen" 2> /dev/null) == 1  ] && [ $(check_status "htop" 2> /dev/null) == 1  ]; then
VERMT=`curl -H 'Cache-Control: no-cache, no-store' "$status?version" 2> /dev/null`;
if [ "$RELEASE" = "$VERMT" ]; then
menu
else
Info "${YELLOW}Обновление..."
bash <(wget -qO- https://resource.hackchik.ru/install)
menu
fi
else
Info "${YELLOW}Идёт настройка машины под использование Multy-Tools"
apt-get update > /dev/null 2>&1
apt-get install -y sudo curl htop screen pwgen unzip > /dev/null 2>&1
if [ $VER = "Debian9" ]; then
echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get upgrade -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ $VER = "Debian10" ]; then
echo "deb http://deb.debian.org/debian/ buster main" > /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ buster main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian-security/ buster/updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian-security/ buster/updates main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ buster-updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ buster-updates main" >> /etc/apt/sources.list
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get upgrade -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ $VER = "Debian11" ]; then
echo "deb http://deb.debian.org/debian bullseye main" > /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bullseye main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian-security/ bullseye-security main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian-security/ bullseye-security main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get upgrade -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ $VER = "Debian12" ]; then
echo "deb http://deb.debian.org/debian bookworm main" > /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bookworm main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian-security/ bookworm-security main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian-security/ bookworm-security main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bookworm-updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bookworm-updates main" >> /etc/apt/sources.list
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get upgrade -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
elif [ $VER = "Debian13" ]; then
echo "deb http://deb.debian.org/debian trixie main" > /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian trixie main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian-security/ trixie-security main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian-security/ trixie-security main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian trixie-updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian trixie-updates main" >> /etc/apt/sources.list
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get upgrade -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
if [ $(check_status "cron" 2> /dev/null) == 1 ]; then
echo "• Проверка наличия CRON • ${green}[OK]"
tput sgr0
else
sudo  apt-get install cron > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "• Установка CRON • ${green}[OK]"
tput sgr0
else
echo "• Установка CRON • ${red}[fail]"
tput sgr0
exit
fi
fi
else
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}пакетов ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}пакетов ${white}• ${red}[fail]"
tput sgr0
exit
fi
apt-get upgrade -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "${white}• Обновление ${green}репозиторий ${white}• ${green}[OK]"
tput sgr0
else
echo "${white}• Обновление ${green}репозиторий ${white}• ${red}[fail]"
tput sgr0
exit
fi
fi
menu
fi
else
Info
log_t "${white}Автоустановщик доступен только для Debian 9,10,11,12,13"
Info
fi
#-------------------------------------------------------------------------------
