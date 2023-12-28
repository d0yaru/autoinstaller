#!/bin/sh
# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
Infon() {
	printf "\033[1;32m$@\033[0m"
}
Info()
{
	Infon "\031$@\n"
}
Error()
{
	printf "\033[1;31m$@\033[0m\n"
}
Error_n()
{
	Error "$@"
}
Error_s()
{
	Error "${red}=================================================================================${reset}"
}
log_s()
{
	Info "${green}================================================================================${reset}"
}
cp_s ()
{
	Info "${green}===================================${white}BY HACKCHIK${green}==================================${reset}"
}
log_n()
{
	Info "- - - $@"
}
log_t()
{
	log_s
	Info "      ${MAGENTA}- - - $@ ${MAGENTA}- - -"
	log_s
}
RED=$(tput setaf 1)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
white=$(tput setaf 7)
reset=$(tput sgr0)
toend=$(tput hpa $(tput cols))$(tput cub 6)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
LIME_YELLOW=$(tput setaf 190)
CYAN=$(tput setaf 6)
VER=`cat /etc/issue.net | awk '{print $1$3}'`
#OS=$(lsb_release -s -i -c -r | xargs echo |sed 's; ;-;g' | grep Ubuntu)
IP_SERV=$(echo "${SSH_CONNECTION}" | awk '{print $3}')

filename=''`date +%Y_%m_%d_%H`'.sql'


#Load Debian 8
Debian_8="0"
#Load Debian 9
Debian_9="1"
#virginia_project
STATUS_virginiaproject="1"
#servermenu by hackchik
URL_VirginiaRP="https://resource.hackchik.ru/multytools/server/samp/VirginiaRP.zip" STATUS_server_virginia="1"
URL_ArizonaRP="https://resource.hackchik.ru/multytools/server/samp/ArizonaRP.zip" STATUS_server_florence="1"
URL_AbsoluteRP="https://resource.hackchik.ru/multytools/server/samp/AbsoluteRP.zip" STATUS_server_absolute="1"
URL_RadmirRP="https://resource.hackchik.ru/multytools/server/crmp/RadmirRP.zip" STATUS_server_absolute="1"

#sitemenu by hackchik
URL_VirginiaUCP="https://resource.hackchik.ru/multytools/site/VirginiaUCP.zip" STATUS_site_virginia="1"
URL_ArizonaUCP="https://resource.hackchik.ru/multytools/site/ArizonaUCP.zip" STATUS_site_arizona="1"
URL_EmpireUCP="https://resource.hackchik.ru/multytools/site/EmpireUCP.zip" STATUS_site_empire="1"
URL_LuxeUCP="https://resource.hackchik.ru/multytools/site/LuxeUCP.zip" STATUS_site_luxe="1"
URL_GrandUCP="https://resource.hackchik.ru/multytools/site/GrandUCP.zip" STATUS_site_grand="1"
URL_CanberraUCP="https://resource.hackchik.ru/multytools/site/CanberraUCP.zip" STATUS_site_canberra="1"
URL_EnergySite="https://resource.hackchik.ru/multytools/site/EnergySite.zip" STATUS_site_energy="1"
URL_AndreasUCP="https://resource.hackchik.ru/multytools/site/AndreasUCP.zip" STATUS_site_andreas="1"
URL_Aurora="https://resource.hackchik.ru/multytools/site/Aurora.zip" STATUS_site_aurora="1"
URL_LOGI="https://resource.hackchik.ru/multytools/site/UnionLogs.zip" STATUS_site_unionlogs="1"
URL_FORUM="https://resource.hackchik.ru/multytools/site/ForumIODark.zip" STATUS_site_iodarkforum="1"

#hostinmenu by hackchik
URL_web54="http://resource.hackchik.ru/multytools/hostinpl/5.4/web54.zip" STATUS_hostinpl_54menu="0"
URL_web55="http://resource.hackchik.ru/multytools/hostinpl/5.5/web55.zip" STATUS_hostinpl_55menu="0"
URL_cp="http://resource.hackchik.ru/multytools/hostinpl/cp.zip"
URL_web55pro="https://resource.hackchik.ru/multytools/hostinpl/5.5pro/web55pro.zip" STATUS_hostinpl_55promenu="1"
URL_cp55pro="http://resource.hackchik.ru/multytools/hostinpl/5.5pro/cp55pro.zip"
URL_web56="https://resource.hackchik.ru/multytools/hostinpl/5.6/web56.zip" STATUS_hostinpl_56menu="1"
URL_cp56="http://resource.hackchik.ru/multytools/hostinpl/5.6/cp56.zip"

hostinmenu()
{
	clear
	Info
	log_t "${white}Выберите игровую панель которую хотите установить"
	Info "- ${YELLOW}1${green} - ${reset}${YELLOW}HostinPanel v5.4${white}(upd 00.00.0000) ${red}ツ${white}"
	Info "- ${YELLOW}2${green} - ${reset}${YELLOW}HostinPanel v5.5${white}(upd 00.00.0000) ${red}ツ${white}"
	Info "- ${YELLOW}3${green} - ${YELLOW}HostinPanel v5.5 PRO${white}(05.12.2020) ${CYAN}ツ${white}"
	Info "- ${YELLOW}4${green} - ${YELLOW}HostinPanel v5.6${white}(upd 05.12.2020) ${CYAN}ツ${white}"
	Info "- ${YELLOW}5${green} - ${white}Подключить файл подкачки  ${green}ツ${white}"
	Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
	cp_s
	Info
	read -p "${white}Пожалуйста, введите пункт меню:" case
	case $case in
		1) hostinpl_54menu;;
		2) hostinpl_55menu;;
		3) hostinpl_55promenu;;
		4) hostinpl_56menu;;
		5) install_swap;;
		0) menu;;
	esac
}
hostinpl_54menu()
{
	if [ "$STATUS_hostinpl_54menu" = "1" ]; then
		I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
		if [ -n "$I" ] 
		then
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.4"
			Info "- ${YELLOW}1${green} - ${white}Настроить веб-часть"
			Info "- ${YELLOW}2${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in
				1) hostinpl_54_test;;     
				2) install_location_55;;
				0) hostinmenu;;
			esac
		else
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.4"
			Info "- ${YELLOW}1${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in
				1) install_location_55;;
				0) hostinmenu;;
			esac
		fi
	else
		Info
		log_t "${white}В данный момент установка HostinPanel 5.4 - ЗАПРЕЩЕНА!"
		Info
	fi
}
hostinpl_55menu()
{
	if [ "$STATUS_hostinpl_55menu" = "1" ]; then
		I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
		if [ -n "$I" ] 
		then
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.5"
			Info "- ${YELLOW}1${green} - ${white}Настроить веб-часть"
			Info "- ${YELLOW}2${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in
				1) hostinpl_55;;     
				2) install_location_55;;
				0) hostinmenu;;
			esac
		else
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.5"
			Info "- ${YELLOW}1${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in
				1) install_location_55;;
				0) hostinmenu;;
			esac
		fi
	else
		Info
		log_t "${white}В данный момент установка HostinPanel 5.5 - ЗАПРЕЩЕНА!"
		Info
	fi
}
hostinpl_55promenu()
{
	if [ "$STATUS_hostinpl_55promenu" = "1" ]; then
		I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
		if [ -n "$I" ] 
		then
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.5PRO"
			Info "- ${YELLOW}1${green} - ${white}Настроить веб-часть"
			Info "- ${YELLOW}2${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in
				1) hostinpl_55pro;;     
				2) install_location_55pro;;
				0) hostinmenu;;
			esac
		else
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.5PRO"
			Info "- ${YELLOW}1${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in
				1) install_location_55pro;;
				0) hostinmenu;;
			esac
		fi
	else
		Info
		log_t "${white}В данный момент установка HostinPanel 5.5PRO - ЗАПРЕЩЕНА!"
		Info
	fi
}
hostinpl_56menu()
{
	if [ "$STATUS_hostinpl_56menu" = "1" ]; then
		I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
		if [ -n "$I" ] 
		then
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.6"
			Info "- ${YELLOW}1${green} - ${white}Настроить веб-часть"
			Info "- ${YELLOW}2${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in
				1) hostinpl_56;;     
				2) install_location_56;;
				0) hostinmenu;;
			esac
		else
			clear
			Info
			log_t "${white}Добро пожаловать в установочное меню ${MAGENTA}HOSTINPL 5.6"
			Info "- ${YELLOW}1${green} - ${white}Настроить игровую локацию"
			Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
			cp_s
			Info
			read -p "Пожалуйста, введите пункт меню: " case
			case $case in 
				1) install_location_56;;
				0) hostinmenu;;
			esac
		fi
	else
		Info
		log_t "${white}В данный момент установка HostinPanel 5.6 - ЗАПРЕЩЕНА!"
		Info
	fi
}
install_location_55()
{
	mkdir -p /home/ > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Создание папки ${green}/home! • ${green}[OK]"
		tput sgr0
	else
		echo "• Создание папки ${green}/home! • ${green}[Папка существует]"
		tput sgr0
	fi
	groupadd gameservers > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Создание группы ${green}gameservers! • ${green}[OK]"
		tput sgr0
	else
		echo "• Создание группы ${green}gameservers! • ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
		tput sgr0
	else
		echo "• Обновление ${green}списка пакетов! • ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y zip unzip openssh-server python3 screen > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Установка ${green}zip unzip openssh-server python3 screen! • ${green}[OK]"
		tput sgr0
	else
		echo "• Установка ${green}zip unzip openssh-server python3 screen! • ${red}[fail]"
		tput sgr0
		exit
	fi
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
		tput sgr0
	else
		echo "• Обновление ${green}списка пакетов! • ${red}[fail]"
		tput sgr0
		exit
	fi
	cd /home/
	wget $URL_cp > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Загрузка ${green}игр! • ${green}[OK]"
		tput sgr0
	else
		echo "• Загрузка ${green}игр! • ${red}[fail]"
		tput sgr0
		exit
	fi
	unzip -o cp.zip > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Распаковка ${green}игр! • ${green}[OK]"
		tput sgr0
	else
		echo "• Распаковка ${green}игр! • ${red}[fail]"
		tput sgr0
		exit
	fi
		rm cp.zip
		chown -R root /home/ > /dev/null 2>&1
	    chmod -R 755 /home/ > /dev/null 2>&1
		cd
		cd /home/cp/ > /dev/null 2>&1
		chmod -R 700 /home/cp/gameservers.py > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Выдача прав ${green}на папки и файлы! • ${green}[OK]"
		tput sgr0
	else
		echo "• Выдача прав ${green}на папки и файлы! •${red}[fail]"
		tput sgr0
	exit
	fi
	cd			
	sudo dpkg --add-architecture i386 > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Добавление пакетов ${green}x32! • ${green}[OK]"
		tput sgr0
	else
		echo "• Добавление пакетов ${green}x32! • ${red}[fail]"
		tput sgr0
		exit
	fi
		apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
		tput sgr0
	else
		echo "• Обновление ${green}списка пакетов! • ${red}[fail]"
		tput sgr0
		exit
	fi
    sudo apt-get install -y libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Установка ${green}libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386! • ${green}[OK]"
		tput sgr0
	else
		echo "• Установка ${green}libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386! • ${red}[fail]"
		tput sgr0
		exit
	fi
    echo 'DenyGroups gameservers' » /etc/ssh/sshd_config	 > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Ограничение доступа к ssh группе ${green}gameservers! • ${green}[OK]"
		tput sgr0
	else
		echo "• Ограничение доступа к ssh группе ${green}gameservers! • ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
		tput sgr0
	else
		echo "• Обновление ${green}списка пакетов! • ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y pure-ftpd > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Установка ${green}pure-ftpd! • ${green}[OK]"
		tput sgr0
	else
		echo "• Установка ${green}pure-ftpd! • ${red}[fail]"
		tput sgr0
		exit
	fi
	echo "yes" > /etc/pure-ftpd/conf/ChrootEveryone
	echo "yes" > /etc/pure-ftpd/conf/CreateHomeDir
	echo "yes" > /etc/pure-ftpd/conf/DontResolve 
	/etc/init.d/pure-ftpd restart > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Перезагрузка ${green}pure-ftpd! • ${green}[OK]"
		tput sgr0
	else
		echo "• Перезагрузка ${green}pure-ftpd! • ${red}[fail]"
		tput sgr0
		exit
	fi
	log_s
	log_n "${white} Серверная часть успешно установлена!"
	log_n ""
	log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
	log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
	log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
	log_n ""
	cp_s
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
	echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
	echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
	echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
	echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
	echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
	echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
	if [ $? -eq 0 ]; then
		echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	groupadd gameservers > /dev/null 2>&1
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y curl pwgen unzip openssh-server apache2 php7.0 mariadb-server gnupg > /dev/null 2>&1
	MYPASS=$(pwgen -cns -1 16) > /dev/null 2>&1
	mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '$MYPASS' WITH GRANT OPTION" > /dev/null 2>&1
	mysql -e "FLUSH PRIVILEGES" > /dev/null 2>&1
	if [ $? -eq 0 ]; then
			echo "${white}• Установка пакетов ${green}apache2,php7.0,curl,mariadb-server ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Установка пакетов ${green}apache2,php7.0,curl,mariadb-server ${white}• ${red}[fail]"
			tput sgr0
			exit
	fi
	echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/admin-user string admin" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYPASS" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYPASS" |debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/app-password-confirm password $MYPASS" | debconf-set-selections > /dev/null 2>&1
	echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections > /dev/null 2>&1
	apt-get install -y phpmyadmin > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}phpMyAdmin ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка ${green}phpMyAdmin ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	cd /etc/apache2/sites-available/
	touch phpmyadmin.conf
	FILE='phpmyadmin.conf'
		echo "<VirtualHost *:80>">>$FILE
		echo "ServerAdmin hackchik@mail.ru">>$FILE
		echo "ServerName $IP_SERV">>$FILE
		echo "DocumentRoot /usr/share/phpmyadmin">>$FILE
		echo "<Directory /usr/share/phpmyadmin/>">>$FILE
		echo "Options Indexes FollowSymLinks">>$FILE
		echo "AllowOverride All">>$FILE
		echo "Require all granted">>$FILE
		echo "</Directory>">>$FILE
		echo "ErrorLog ${APACHE_LOG_DIR}/error.log">>$FILE
		echo "CustomLog ${APACHE_LOG_DIR}/access.log combined">>$FILE
		echo "</VirtualHost>">>$FILE
	cd 
	a2ensite phpmyadmin > /dev/null 2>&1
	a2dissite 000-default > /dev/null 2>&1
	a2enmod rewrite > /dev/null 2>&1
	echo "Europe/Moscow" > /etc/timezone > /dev/null 2>&1
	sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
	sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
	sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
	sed -i 's/#max_connections        = 100/max_connections        = 1000/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
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
	wget http://resource.hackchik.ru/multytools/hostinpl/5.6/ngixn.conf > /dev/null 2>&1
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
	echo "Europe/Moscow" > /etc/timezone > /dev/null 2>&1
	sudo sh -c "echo '' >> /etc/ssh/sshd_config" > /dev/null 2>&1
	sudo sh -c "echo 'DenyGroups gameservers' >> /etc/ssh/sshd_config" > /dev/null 2>&1
	service ssh restart > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Настройка ${green}SSH ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Настройка ${green}SSH ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y proftpd > /dev/null 2>&1
	sudo sh -c "echo 'DefaultRoot ~' >> /etc/proftpd/proftpd.conf" > /dev/null 2>&1
	sudo sh -c "echo 'RequireValidShell off' >> /etc/proftpd/proftpd.conf" > /dev/null 2>&1
	service proftpd restart > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка и настройка ${green}FTP Servera ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка и настройка ${green}FTP Servera ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y htop > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}HTOP ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка ${green}HTOP ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y apt-transport-https ca-certificates > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[1/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[1/5]"
		tput sgr0
		exit
	fi
	curl -fsSL "https://download.docker.com/linux/debian/gpg" | apt-key add > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[2/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[2/5]"
		tput sgr0
		exit
	fi
	echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" > /etc/apt/sources.list.d/docker.list
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[3/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[3/5]"
		tput sgr0
		exit
	fi
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[4/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[4/5]"
		tput sgr0
		exit
	fi
	apt-get install -y docker-ce > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[5/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[5/5]"
		tput sgr0
		exit
	fi
	wget https://resource.hackchik.ru/multytools/hostinpl/5.6/Dockerfile > /dev/null 2>&1
	docker build -t debian:stretch . > /dev/null 2>&1
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
	echo "Настройка игровой локации прошла успешно \n Ссылка на phpmyadmin: http://$IP_SERV \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infolocation.txt
	log_s
	log_n "${white}Настройка игровой локации прошла успешно!"
	log_n ""
	log_n "${white}Пользователь от ${red} PHPMyAdmin${white}: admin"
	log_n "${white}Root пароль от ${red} PHPMyAdmin${white}: $MYPASS"
	log_n "${white}Ссылка на ${red} phpmyadmin${white}: http://$IP_SERV"
	log_n ""
	log_n "${white}Данные скрипт успешно скопировал в фаил! Путь к файлу: /root/infolocation.txt"
	log_n ""
	log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
	log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
	log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
	log_n ""
	cp_s
}
install_location_55pro()
{
	Info "${YELLOW}Мастер установки локации для HPL 5.5PRO"
	echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
	echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
	echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
	echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
	echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
	echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
	if [ $? -eq 0 ]; then
		echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	groupadd gameservers > /dev/null 2>&1
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y curl pwgen sudo unzip openssh-server apache2 php7.0 mariadb-server > /dev/null 2>&1
	MYPASS=$(pwgen -cns -1 16) > /dev/null 2>&1
	mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '$MYPASS' WITH GRANT OPTION" > /dev/null 2>&1
	mysql -e "FLUSH PRIVILEGES" > /dev/null 2>&1
	if [ $? -eq 0 ]; then
			echo "${white}• Установка пакетов ${green}apache2,php7.0,curl,mariadb-server ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Установка пакетов ${green}apache2,php7.0,curl,mariadb-server ${white}• ${red}[fail]"
			tput sgr0
			exit
	fi
	echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/admin-user string admin" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYPASS" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYPASS" |debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/app-password-confirm password $MYPASS" | debconf-set-selections > /dev/null 2>&1
	echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections > /dev/null 2>&1
	apt-get install -y phpmyadmin > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}phpMyAdmin ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка ${green}phpMyAdmin ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	cd /etc/apache2/sites-available/
	touch phpmyadmin.conf
	FILE='phpmyadmin.conf'
		echo "<VirtualHost *:80>">>$FILE
		echo "ServerAdmin hackchik@mail.ru">>$FILE
		echo "ServerName $IP_SERV">>$FILE
		echo "DocumentRoot /usr/share/phpmyadmin">>$FILE
		echo "<Directory /usr/share/phpmyadmin/>">>$FILE
		echo "Options Indexes FollowSymLinks">>$FILE
		echo "AllowOverride All">>$FILE
		echo "Require all granted">>$FILE
		echo "</Directory>">>$FILE
		echo "ErrorLog ${APACHE_LOG_DIR}/error.log">>$FILE
		echo "CustomLog ${APACHE_LOG_DIR}/access.log combined">>$FILE
		echo "</VirtualHost>">>$FILE
	cd 
	a2ensite phpmyadmin > /dev/null 2>&1
	a2dissite 000-default > /dev/null 2>&1
	a2enmod rewrite > /dev/null 2>&1
	echo "Europe/Moscow" > /etc/timezone > /dev/null 2>&1
	sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
	sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
	sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
	sed -i 's/#max_connections        = 100/max_connections        = 1000/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
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
	mkdir /home > /dev/null 2>&1
	cd /home/ > /dev/null 2>&1
	wget $URL_cp55pro > /dev/null 2>&1
	unzip -o cp55pro.zip > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Загрузка и распаковка игр • ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Загрузка и распаковка игр • ${red}[fail]"
		tput sgr0
		exit
	fi
	rm cp55pro.zip > /dev/null 2>&1
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
	echo "Europe/Moscow" > /etc/timezone > /dev/null 2>&1
	sudo sh -c "echo '' >> /etc/ssh/sshd_config" > /dev/null 2>&1
	sudo sh -c "echo 'DenyGroups gameservers' >> /etc/ssh/sshd_config" > /dev/null 2>&1
	service ssh restart > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Настройка ${green}SSH ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Настройка ${green}SSH ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y proftpd > /dev/null 2>&1
	sudo sh -c "echo 'DefaultRoot ~' >> /etc/proftpd/proftpd.conf" > /dev/null 2>&1
	sudo sh -c "echo 'RequireValidShell off' >> /etc/proftpd/proftpd.conf" > /dev/null 2>&1
	service proftpd restart > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка и настройка ${green}FTP Servera ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка и настройка ${green}FTP Servera ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y htop > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}HTOP ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка ${green}HTOP ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y apt-transport-https ca-certificates > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[1/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[1/5]"
		tput sgr0
		exit
	fi
	curl -fsSL "https://download.docker.com/linux/debian/gpg" | apt-key add > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[2/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[2/5]"
		tput sgr0
		exit
	fi
	echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" > /etc/apt/sources.list.d/docker.list
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[3/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[3/5]"
		tput sgr0
		exit
	fi
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[4/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[4/5]"
		tput sgr0
		exit
	fi
	apt-get install -y docker-ce > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}Docker'a ${white}• ${green}[5/5]"
		tput sgr0
	else
		echo "${white}• Установка ${green}Docker'a ${white}• ${red}[5/5]"
		tput sgr0
		exit
	fi
	wget https://resource.hackchik.ru/multytools/hostinpl/5.6/Dockerfile > /dev/null 2>&1
	docker build -t debian:stretch . > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Настройка ${green}Doker'a ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Настройка ${green}Doker'a ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	echo "Настройка игровой локации прошла успешно \n Ссылка на phpmyadmin: http://$IP_SERV \n Данные от MySQL: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infolocation.txt
	log_s
	log_n "${white}Настройка игровой локации прошла успешно!"
	log_n ""
	log_n "${white}Пользователь от ${red} MySQL${white}: admin"
	log_n "${white}Root пароль от ${red} MySQL${white}: $MYPASS"
	log_n "${white}Ссылка на ${red} phpmyadmin${white}: http://$IP_SERV"
	log_n ""
	log_n "${white}Данные скрипт успешно скопировал в фаил! Путь к файлу: /root/infolocation.txt"
	log_n ""
	log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
	log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
	log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
	log_n ""
	cp_s
}
hostinpl_55pro()
{
	Info "${YELLOW}Мастер установки HOSTINPL v5.5ЗPRO"
	read -p "${white}Пожалуйста, введите домен или IP:${reset}" DOMAIN
	read -p "${white}Пожалуйста, введите пароль от phpmyadmin( admin ):${reset}" MYPASS
	read -p "${white}Введите название вашего хостинга:${reset}" NAME
	read -p "${white}Введите reCaptchav2(ключ сайта) - (получить тут: clck.ru/9aEgx):${reset}" KEY_KAPT
	read -p "${white}Введите reCaptchav2(секретный ключ) - (получить тут: clck.ru/9aEgx):${reset}" SEKRET_RAPT
	read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
	if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
		echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
		echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		if [ $? -eq 0 ]; then
			echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
			tput sgr0
			exit
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
		apt install -y pwgen apache2 php7.0 php7.0-gd php7.0-mysql php7.0-ssh2 mariadb-server unzip > /dev/null 2>&1
		CRONTOKE=$(pwgen -cns -1 14) > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		a2dissite 000-default > /dev/null 2>&1
		rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
		mkdir -p /var/www/${DOMAIN}/
		cd /var/www/${DOMAIN}/
		wget $URL_web55pro > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}HOSTINPL 5.5PRO • ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}HOSTINPL 5.5PRO • ${red}[fail]"
			tput sgr0
			exit
		fi
		unzip -o web55pro.zip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Распаковка ${green}HOSTINPL 5.5PRO • ${green}[OK]"
			tput sgr0
		else
			echo "• Распаковка ${green}HOSTINPL 5.5PRO • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm web55pro.zip > /dev/null 2>&1
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
		(crontab -l ; echo "0 0 * * * curl http://$DOMAIN/main/cron/index?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/1 * * * * curl http://$DOMAIN/main/cron/gameServers?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/5 * * * * curl http://$DOMAIN/main/cron/updateSystemLoad?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/5 * * * * curl http://$DOMAIN/main/cron/gamelocationstatsupd?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */10 * * * curl http://$DOMAIN/main/cron/serverReloader?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/30 * * * * curl http://$DOMAIN/main/cron/updateStats?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/30 * * * * curl http://$DOMAIN/main/cron/stopServers?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/30 * * * * curl http://$DOMAIN/main/cron/stopServersQuery?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 * */7 * * curl http://$DOMAIN/main/cron/clearLogs?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
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
		sed -i "s/xtwcklwhw222a/${CRONTOKE}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/SiteName/${NAME}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Настройка конфига • ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Настройка конфига • ${red}[fail]"
			tput sgr0
			exit
		fi
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
		chown -R www-data:www-data /var/www/${DOMAIN}/
		chmod -R 770 /var/www/${DOMAIN}/
		chmod 777 /var/www/${DOMAIN}/tmp
		chmod 777 /var/www/${DOMAIN}/tmp/avatar
		chmod 777 /var/www/${DOMAIN}/tmp/mods
		chmod 777 /var/www/${DOMAIN}/tmp/tickets_img
		if [ $? -eq 0 ]; then
			echo "${white}• Выдача нужных прав • ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Выдача нужных прав • ${red}[fail]"
			tput sgr0
			exit
		fi
		echo "Установка HOSTINPL v5.5PRO завершена BY HACKCHIK! \n Ссылка на сайт: http://$DOMAIN \n Ссылка на phpmyadmin: http://$DOMAIN/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infohostin.txt
		log_s
		log_n "${white}Панель управления ${MAGENTA}HOSTINPL v5.5PRO ${white} установлена и настроена!"
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
hostinpl_56()
{
	Info "${YELLOW}Мастер установки HOSTINPL v5.6"
	read -p "${white}Пожалуйста, введите домен или IP:${reset}" DOMAIN
	read -p "${white}Пожалуйста, введите пароль от phpmyadmin( admin ):${reset}" MYPASS
	read -p "${white}Введите название вашего хостинга:${reset}" NAME
	read -p "${white}Введите reCaptchav2(ключ сайта) - (получить тут: clck.ru/9aEgx):${reset}" KEY_KAPT
	read -p "${white}Введите reCaptchav2(секретный ключ) - (получить тут: clck.ru/9aEgx):${reset}" SEKRET_RAPT
	read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
	if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
		echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
		echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		if [ $? -eq 0 ]; then
			echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
			tput sgr0
			exit
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
		apt install -y pwgen apache2 php7.0 php7.0-gd php7.0-mysql php7.0-ssh2 mariadb-server unzip > /dev/null 2>&1
		CRONTOKE=$(pwgen -cns -1 14) > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${red}[fail]"
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
		(crontab -l ; echo "0 0 * * * curl http://$DOMAIN/main/cron/index?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/1 * * * * curl http://$DOMAIN/main/cron/gameServers?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/1 * * * * curl http://$DOMAIN/main/cron/tasks?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */10 * * * curl http://$DOMAIN/main/cron/serverReloader?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/30 * * * * curl http://$DOMAIN/main/cron/stopServers?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/30 * * * * curl http://$DOMAIN/main/cron/stopServersQuery?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "* */1 * * * curl http://$DOMAIN/main/cron/updateStats?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "* */1 * * * curl http://$DOMAIN/main/cron/updateStatsLocations?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 * */7 * * curl http://$DOMAIN/main/cron/clearLogs?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
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
		sed -i "s/xtwcklwhw222a/${CRONTOKE}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/SiteName/${NAME}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Настройка конфига • ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Настройка конфига • ${red}[fail]"
			tput sgr0
			exit
		fi
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
		chmod 777 /var/www/${DOMAIN}/tmp/mods
		chmod 777 /var/www/${DOMAIN}/tmp/tickets_img
		if [ $? -eq 0 ]; then
			echo "${white}• Выдача нужных прав • ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Выдача нужных прав • ${red}[fail]"
			tput sgr0
			exit
		fi
		echo "Установка HOSTINPL v5.6 завершена BY HACKCHIK! \n Ссылка на сайт: http://$DOMAIN \n Ссылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infohostin.txt
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
hostinpl_55()
{
	Info "${YELLOW}Мастер установки HOSTINPL v5.5"
	read -p "${white}Введите домен или IP:${reset}" DOMAIN
	read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
	read -p "${white}Введите название вашего хостинга:${reset}" NAME
	read -p "${white}Введите код reCaptcha v2(получить тут: clck.ru/9aEgx):${reset}" KEY_KAPT
	read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
	if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
		apt-get update > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
			tput sgr0
		else
			echo "• Обновление ${green}списка пакетов! •  ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y dialog > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}dialog! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}dialog! • ${red}[fail]"
			tput sgr0
			exit
		fi
		# if [ "$OS" = "" ]; then
		# 	echo "deb http://packages.dotdeb.org wheezy-php55 all">"/etc/apt/sources.list.d/dotdeb.list"
		# 	echo "deb-src http://packages.dotdeb.org wheezy-php55 all">>"/etc/apt/sources.list.d/dotdeb.list"
		# 	wget http://www.dotdeb.org/dotdeb.gpg > /dev/null 2>&1
		# fi
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}Dotdeb! • ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}Dotdeb! • ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-key add dotdeb.gpg > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Активация ${green}Dotdeb! • ${green}[OK]"
			tput sgr0
		else
			echo "• Активация ${green}Dotdeb! • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm dotdeb.gpg
		apt-get update > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
			tput sgr0
		else
			echo "• Обновление ${green}списка пакетов! • ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get -f install > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Проверка наличие необходимых ${green}пакетов • ${green}[OK]"
			tput sgr0
		else
			echo "• Проверка наличие необходимых ${green}пакетов • ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y cron fail2ban mysql-workbench > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green}cron fail2ban mysql-workbench! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green}cron fail2ban mysql-workbench! • ${red}[fail]"
			tput sgr0
			exit
		fi
		cd /root
		wget http://ftp.us.debian.org/debian/pool/main/p/php-ssh2/php5-ssh2_0.12-3+deb8u1_amd64.deb > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}php-ssh2! • ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}php-ssh2! • ${red}[fail]"
			tput sgr0
			exit
		fi
		dpkg -i /root/php5-ssh2_0.12-3+deb8u1_amd64.deb > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}php5-ssh2! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}php5-ssh2! • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm php5-ssh2_0.12-3+deb8u1_amd64.deb
		systemctl restart apache2 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Перезагрузка ${green}apache! • ${green}[OK]"
			tput sgr0
		else
			echo "• Перезагрузка ${green}apache! • ${red}[fail]"
			tput sgr0
			exit
		fi
		CRONTOKE=$(pwgen -cns -1 14) > /dev/null 2>&1
		(crontab -l ; echo "0 12 * * * curl http://$DOMAIN/main/cron/index?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/1 * * * * curl http://$DOMAIN/main/cron/updateSystemLoad?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */1 * * * curl http://$DOMAIN/main/cron/updateStats?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */10 * * * curl http://$DOMAIN/main/cron/serverReloader?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 12 * * * curl http://$DOMAIN/main/cron/gamelocationstatsupd?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 * 7 * * curl http://$DOMAIN/main/cron/clearLogs?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		apt-get install -y zip unzip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}zip unzip! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}zip unzip! • ${red}[fail]"
			tput sgr0
			exit
		fi
		a2dissite 000-default > /dev/null 2>&1
		rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
		mkdir -p /var/www/${DOMAIN}/
		cd /var/www/${DOMAIN}/
		wget $URL_web55 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}HOSTINPL 5.5 • ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}HOSTINPL 5.5 • ${red}[fail]"
			tput sgr0
			exit
		fi
		unzip -o web55.zip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Распаковка ${green}HOSTINPL 5.5 • ${green}[OK]"
			tput sgr0
		else
			echo "• Распаковка ${green}HOSTINPL 5.5 • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm web55.zip > /dev/null 2>&1
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
		sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/domain/${DOMAIN}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/iOJrgfYx604G/${KEY_KAPT}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/crontoken/${CRONTOKE}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/SiteName/${NAME}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		chmod -R 755 /var/www/${DOMAIN}/
		cd
		mysql -uadmin -p$MYPASS -D hostin -e "DROP DATABASE hostin" > /dev/null 2>&1
		mkdir /var/lib/mysql/hostin > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Создание папки ${green}/var/lib/mysql/hostin! • ${green}[OK]"
			tput sgr0
		else
			echo "• Создание папки ${green}/var/lib/mysql/hostin! • ${green}[Папка существует]"
			tput sgr0
		fi
		chown -R mysql:mysql /var/lib/mysql/hostin
		cd
		mysql -u admin -p$MYPASS hostin < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка базы данных! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка базы данных! • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Удаление дампа базы данных! • ${green}[OK]"
			tput sgr0
		else
			echo "• Удаление дампа базы данных! • ${red}[fail]"
			tput sgr0
			exit
		fi
		sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/my.cnf > /dev/null 2>&1
		service mysql restart > /dev/null 2>&1
		systemctl restart apache2 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Настройка mysql для внешних подключений • ${green}[OK]"
			tput sgr0
		else
			echo "• Настройка mysql для внешних подключений • ${red}[fail]"
			tput sgr0
			exit
		fi
		chown -R www-data:www-data /var/www/${DOMAIN}/
		chmod -R 755 /var/www/${DOMAIN}/
		echo "Установка HOSTINPL v5.5 завершена BY HACKCHIK! \n Ссылка на сайт: http://$DOMAIN \n Ссылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infohostin.txt
		log_s
		log_n "${white}Панель управления ${YELLOW}HOSTINPL v5.5 ${white}установлена и настроена!"
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
hostinpl_54_test()
{
	Info "${YELLOW}Мастер установки HOSTINPL v5.4"
	read -p "${white}Пожалуйста, введите домен или IP:${reset}" DOMAIN
	read -p "${white}Пожалуйста, введите пароль от phpmyadmin( admin ):${reset}" MYPASS
	read -p "${white}Введите название вашего хостинга:${reset}" NAME
	read -p "${white}Введите reCaptchav2(ключ сайта) - (получить тут: clck.ru/9aEgx):${reset}" KEY_KAPT
	read -p "${white}Введите reCaptchav2(секретный ключ) - (получить тут: clck.ru/9aEgx):${reset}" SEKRET_RAPT
	read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
	if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
		echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
		echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		if [ $? -eq 0 ]; then
			echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
			tput sgr0
			exit
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
		apt install -y php7.0-ssh2 unzip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Установка пакетов ${green}php7.0-ssh2,unzip ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Установка пакетов ${green}php7.0-ssh2,unzip ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		a2dissite 000-default > /dev/null 2>&1
		rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
		mkdir -p /var/www/${DOMAIN}/
		cd /var/www/${DOMAIN}/
		wget $URL_web54 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}HOSTINPL 5.4 • ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}HOSTINPL 5.4 • ${red}[fail]"
			tput sgr0
			exit
		fi
		unzip -o web54.zip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Распаковка ${green}HOSTINPL 5.4 • ${green}[OK]"
			tput sgr0
		else
			echo "• Распаковка ${green}HOSTINPL 5.4 • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm web54.zip > /dev/null 2>&1
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
		CRONTOKE=$(pwgen -cns -1 14) > /dev/null 2>&1
		(crontab -l ; echo "0 12 * * * curl http://$DOMAIN/main/cron/index?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/1 * * * * curl http://$DOMAIN/main/cron/updateSystemLoad?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */1 * * * curl http://$DOMAIN/main/cron/updateStats?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */10 * * * curl http://$DOMAIN/main/cron/serverReloader?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 12 * * * curl http://$DOMAIN/main/cron/gamelocationstatsupd?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 * 7 * * curl http://$DOMAIN/main/cron/clearLogs?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
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
		sed -i "s/xtwcklwhw222a/${CRONTOKE}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/SiteName/${NAME}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Настройка конфига • ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Настройка конфига • ${red}[fail]"
			tput sgr0
			exit
		fi
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
		chown -R www-data:www-data /var/www/${DOMAIN}/
		chmod -R 755 /var/www/${DOMAIN}/
		if [ $? -eq 0 ]; then
			echo "${white}• Выдача нужных прав • ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Выдача нужных прав • ${red}[fail]"
			tput sgr0
			exit
		fi
		echo "Установка HOSTINPL v5.5 завершена BY HACKCHIK! \n Ссылка на сайт: http://$DOMAIN \n Ссылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infohostin.txt
		log_s
		log_n "${white}Панель управления ${MAGENTA}HOSTINPL v5.5 ${white} установлена и настроена!"
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
hostinpl_54()
{
	Info "${YELLOW}Мастер установки HOSTINPL v5.4"
	read -p "${white}Введите домен или IP:${reset}" DOMAIN
	read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
	read -p "${white}Введите название вашего хостинга:${reset}" NAME
	read -p "${white}Введите код reCaptcha v2(получить тут: clck.ru/9aEgx):${reset}" KEY_KAPT
	read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
	if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
		apt-get update > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
			tput sgr0
		else
			echo "• Обновление ${green}списка пакетов! •  ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y dialog php7.0-ssh2 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}dialog, php7.0-ssh2 • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}dialog, php7.0-ssh2 • ${red}[fail]"
			tput sgr0
			exit
		fi
		# if [ "$OS" = "" ]; then
		# 	echo "deb http://packages.dotdeb.org wheezy-php55 all">"/etc/apt/sources.list.d/dotdeb.list"
		# 	echo "deb-src http://packages.dotdeb.org wheezy-php55 all">>"/etc/apt/sources.list.d/dotdeb.list"
		# 	wget http://www.dotdeb.org/dotdeb.gpg > /dev/null 2>&1
		# fi
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}Dotdeb! • ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}Dotdeb! • ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-key add dotdeb.gpg > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Активация ${green}Dotdeb! • ${green}[OK]"
			tput sgr0
		else
			echo "• Активация ${green}Dotdeb! • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm dotdeb.gpg
		apt-get update > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Обновление ${green}списка пакетов! • ${green}[OK]"
			tput sgr0
		else
			echo "• Обновление ${green}списка пакетов! • ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get -f install > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Проверка наличие необходимых ${green}пакетов • ${green}[OK]"
			tput sgr0
		else
			echo "• Проверка наличие необходимых ${green}пакетов • ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y cron fail2ban mysql-workbench > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green}cron fail2ban mysql-workbench! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green}cron fail2ban mysql-workbench! • ${red}[fail]"
			tput sgr0
			exit
		fi
		CRONTOKE=$(pwgen -cns -1 14) > /dev/null 2>&1
		(crontab -l ; echo "0 12 * * * curl http://$DOMAIN/main/cron/index?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "*/1 * * * * curl http://$DOMAIN/main/cron/updateSystemLoad?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */1 * * * curl http://$DOMAIN/main/cron/updateStats?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 */10 * * * curl http://$DOMAIN/main/cron/serverReloader?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 12 * * * curl http://$DOMAIN/main/cron/gamelocationstatsupd?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		(crontab -l ; echo "0 * 7 * * curl http://$DOMAIN/main/cron/clearLogs?token=$CRONTOKE") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
		service cron reload > /dev/null 2>&1
		apt-get install -y zip unzip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}zip unzip! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}zip unzip! • ${red}[fail]"
			tput sgr0
			exit
		fi
		a2dissite 000-default > /dev/null 2>&1
		rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
		mkdir -p /var/www/${DOMAIN}/
		cd /var/www/${DOMAIN}/
		wget $URL_web54 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}HOSTINPL 5.4 • ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}HOSTINPL 5.4 • ${red}[fail]"
			tput sgr0
			exit
		fi
		unzip -o web54.zip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Распаковка ${green}HOSTINPL 5.4 • ${green}[OK]"
			tput sgr0
		else
			echo "• Распаковка ${green}HOSTINPL 5.4 • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm web54.zip > /dev/null 2>&1
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
		sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/domain/${DOMAIN}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/iOJrgfYx604G/${KEY_KAPT}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/crontoken/${CRONTOKE}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		sed -i "s/SiteName/${NAME}/g" /var/www/${DOMAIN}/application/config.php > /dev/null 2>&1
		chmod -R 755 /var/www/${DOMAIN}/
		cd
		mysql -uadmin -p$MYPASS -D hostin -e "DROP DATABASE hostin" > /dev/null 2>&1
		mkdir /var/lib/mysql/hostin > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Создание папки ${green}/var/lib/mysql/hostin! • ${green}[OK]"
			tput sgr0
		else
			echo "• Создание папки ${green}/var/lib/mysql/hostin! • ${green}[Папка существует]"
			tput sgr0
		fi
		chown -R mysql:mysql /var/lib/mysql/hostin
		cd
		mysql -u admin -p$MYPASS hostin < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка базы данных! • ${green}[OK]"
			tput sgr0
		else
			echo "• Установка базы данных! • ${red}[fail]"
			tput sgr0
			exit
		fi
		rm /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Удаление дампа базы данных! • ${green}[OK]"
			tput sgr0
		else
			echo "• Удаление дампа базы данных! • ${red}[fail]"
			tput sgr0
			exit
		fi
		chown -R www-data:www-data /var/www/${DOMAIN}/
		chmod -R 755 /var/www/${DOMAIN}/
		echo "Установка HOSTINPL 5.4 завершена BY HACKCHIK! \n Ссылка на сайт: http://$DOMAIN \n Ссылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > infohostin.txt
		log_s
		log_n "${white}Панель управления ${YELLOW}HOSTINPL v5.4 ${white}установлена и настроена!"
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
backupmenu()
{
	clear
	Info
	log_t "${white}Выберите нужное вам меню"
	Info "- ${YELLOW}1${green} - ${white}Сделать резерв ${YELLOW}одной базы ${green}ツ${white}"
	Info "- ${YELLOW}2${green} - ${white}Сделать резерв ${MAGENTA}всей базы ${green}ツ${white}"
	Info "- ${YELLOW}3${green} - ${white}Сделать резерв ${green}директории ${green}ツ${white}"
	Info "- ${YELLOW}4${green} - ${white}Создать правило для ${green}crontab ${green}ツ${white}"
	Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
	cp_s
	Info
	read -p "${white}Пожалуйста, введите пункт меню:" case
	case $case in
		1)	backup_onesql;;
		3) backup_allsql;;
		4) backup_cron;;
		0) menu;;
	esac
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
	read -p "${white}Введите пароль от базы данных:" MYPASS
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
	read -p "${white}Введите пароль от базы данных:" MYPASS
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
sitemenu()
{
	clear
	Info
	log_t "${white}Выберите сайт который хотите установить"
	Info "- ${YELLOW}1${green} - ${MAGENTA}Virginia UCP${white}(Last Update) ${green}ツ${white}"
	Info "- ${YELLOW}2${green} - ${green}Arizona UCP${white}(upd 24.10.2020) ${green}ツ${white}"
	Info "- ${YELLOW}3${green} - ${BLUE}Empire UCP${white}(upd 24.10.2020) ${green}ツ${white}"
	Info "- ${YELLOW}4${green} - ${YELLOW}Energy RP${white}(upd 24.10.2020) ${green}ツ${white}"
	Info "- ${YELLOW}5${green} - ${CYAN}Luxe UCP${white}(upd 24.10.2020) ${green}ツ${white}"
	Info "- ${YELLOW}6${green} - ${red}Grand UCP${white}(upd 24.10.2020) ${green}ツ${white}"
	Info "- ${YELLOW}7${green} - ${YELLOW}Canberra UCP${white}(upd 31.10.2020) ${green}ツ${white}"
	Info "- ${YELLOW}8${green} - ${LIME_YELLOW}Andreas UCP${white}(upd 24.11.2020) ${green}ツ${white}"
	Info "- ${YELLOW}9${green} - ${RED}Aurora(шаблон)${white}(upd 24.11.2020) ${green}ツ${white}"
	Info "- ${YELLOW}10${green} - ${white}Логи ${red}UnionLogs  ${green}ツ${white}"
	Info "- ${YELLOW}11${green} - ${white}Форум ${red}IO Dark  ${green}ツ${white}"
	Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
	cp_s
	Info
	read -p "${white}ѕожалуйста, введите пункт меню:" case
	case $case in
		1) site_virginia;;
		2) site_arizona;;
		3) site_empire;;
		4) site_energy;;
		5) site_luxe;;
		6) site_grand;;
		7) site_canberra;;
		8) site_andreas;;
		9) site_aurora;;
		10) site_unionlogs;;
		11) site_iodarkforum;;
		0) menu;;
	esac
}
site_aurora()
{
	if [ "$STATUS_site_aurora" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта ${RED}Aurora"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Удаляем директорию ${green}${DOMAIN} ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаляем директорию ${green}${DOMAIN} ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mkdir -p /var/www/${DOMAIN}/
			cd /var/www/${DOMAIN}/
			wget $URL_Aurora > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Andreas UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Andreas UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o Aurora.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Aurora! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Aurora! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm Aurora.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Aurora! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Aurora! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			log_s
			log_n "${white}Установка сайта ${RED}Aurora ${white}успешно завершена!"
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
		log_t "${white}В данный момент установка Aurora - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_andreas()
{
	if [ "$STATUS_site_andreas" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта ${LIME_YELLOW}Andreas UCP"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название базы данных:${reset}" DATABASE
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Удаляем директорию ${green}${DOMAIN} ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаляем директорию ${green}${DOMAIN} ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mkdir -p /var/www/${DOMAIN}/
			cd /var/www/${DOMAIN}/
			wget $URL_AndreasUCP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Andreas UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Andreas UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o AndreasUCP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Andreas UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Andreas UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm AndreasUCP.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Andreas UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Andreas UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE admin" > /dev/null 2>&1
			mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE bansite" > /dev/null 2>&1
			mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE logienter" > /dev/null 2>&1
			mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE news" > /dev/null 2>&1
			mysql -uadmin -p$MYPASS -D $DATABASE -e "DROP TABLE raiting" > /dev/null 2>&1
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
			sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/admin/config.php
			sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/config.php > /dev/null 2>&1
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
			log_s
			log_n "${white}Установка сайта ${LIME_YELLOW}Andreas UCP ${white}успешно завершена!"
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
		log_t "${white}В данный момент установка Andreas UCP - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_canberra()
{
	if [ "$STATUS_site_canberra" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта Canberra UCP"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название базы данных:${reset}" DATABASE
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
			cd /var/www/${DOMAIN}/ > /dev/null 2>&1
			wget $URL_CanberraUCP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Canberra UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Canberra UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o CanberraUCP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Canberra UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Canberra UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm CanberraUCP.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Canberra UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Canberra UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
			# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
			# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
			# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			log_s
			log_n "${white}Установка сайта ${YELLOW}Canberra UCP ${white}успешно завершена!"
			log_n ""
			log_n "${white}Ссылка на сайт: http://$DOMAIN"
			log_n "${white}Ќастройки базы в файле: /var/www/${DOMAIN}/engine/config.php"
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
		log_t "${white}В данный момент установка Canberra UCP - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_grand()
{
	if [ "$STATUS_site_grand" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта ${red}Grand UCP"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название базы данных:${reset}" DATABASE
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			rm -Rfv /var/www/${DOMAIN}  > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
			cd /var/www/${DOMAIN}/ > /dev/null 2>&1
			wget $URL_GrandUCP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Grand UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Grand UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o GrandUCP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Grand UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Grand UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm GrandUCP.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Grand UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Grand UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			log_s
			log_n "${white}Установка сайта ${red}Grand UCP ${white}успешно завершена!"
			log_n ""
			log_n "${white}Ссылка на сайт: http://$DOMAIN"
			log_n "${white}Настройки базы в файле: /var/www/${DOMAIN}/engine/config.php"
			log_n "${white}Обязательно добавить таблицу token в базе с аккаунтами(VARCHAR 64)"
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
		log_t "${white}В данный момент установка Grand UCP - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_luxe()
{
	if [ "$STATUS_site_luxe" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта ${CYAN}Luxe UCP"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название базы данных:${reset}" DATABASE
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		read -p "${white}Укажите название проекта(пример: Virginia Role Play):${reset}" NAMEPROJECT
		read -p "${white}Укажите ID группы В онтакте(пример: club67908356 или winchikplay):${reset}" VK_GROUP
		read -p "${white}Укажите IP сервера(пример: 185.139.70.154:7777):${reset}" IP_SERVER
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
			cd /var/www/${DOMAIN}/ > /dev/null 2>&1
			wget $URL_LuxeUCP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Luxe UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Luxe UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o LuxeUCP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Luxe UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Luxe UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm LuxeUCP.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Luxe UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Luxe UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			fi
			sed -i "s/nameproject/${NAMEPROJECT}/g" /var/www/${DOMAIN}/engine/config.php
			sed -i "s/siteurl/${DOMAIN}/g" /var/www/${DOMAIN}/engine/config.php
			sed -i "s/IDGROUP/${VK_GROUP}/g" /var/www/${DOMAIN}/engine/config.php
			sed -i "s/ipserv/${IP_SERVER}/g" /var/www/${DOMAIN}/engine/config.php > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Заполнение данных • ${green}[OK]"
				tput sgr0
			else
				echo "• Заполнение данных • ${red}[fail]"
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
			log_s
			log_n "${white}Установка сайта ${CYAN}Luxe UCP ${white}успешно завершена!"
			log_n ""
			log_n "${white}Ссылка на сайт: http://$DOMAIN"
			log_n "${white}Настройки базы в файле: /var/www/${DOMAIN}/engine/config.php"
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
		log_t "${white}В данный момент установка Luxe UCP - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_energy()
{
	if [ "$STATUS_site_energy" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта Energy"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название проекта(пример: Virginia Role Play):${reset}" NAMEPROJECT
		read -p "${white}Укажите ID группы В онтакте(пример: club67908356 или winchikplay):${reset}" VK_GROUP
		read -p "${white}Укажите IP сервера(пример: 185.139.70.154:7777):${reset}" IP_SERVER
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
			cd /var/www/${DOMAIN} > /dev/null 2>&1
			wget $URL_EnergySite > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Energy RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Energy RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o EnergySite.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Energy RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Energy RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm EnergySite.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Energy RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Energy RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
			systemctl restart apache2 > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Перезагрузка ${green}apache! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Перезагрузка ${green}apache! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			sed -i "s/nameproject/${NAMEPROJECT}/g" /var/www/${DOMAIN}/includes/config.php
			sed -i "s/siteurl/${DOMAIN}/g" /var/www/${DOMAIN}/includes/config.php
			sed -i "s/IDGROUP/${VK_GROUP}/g" /var/www/${DOMAIN}/includes/config.php
			sed -i "s/ipserv/${IP_SERVER}/g" /var/www/${DOMAIN}/includes/config.php > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Заполнение данных • ${green}[OK]"
				tput sgr0
			else
				echo "• Заполнение данных • ${red}[fail]"
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
			log_s
			log_n "${white}Установка сайта ${YELLOW}Enegry ${white}успешно завершена!"
			log_n ""
			log_n "${white}Ссылка на сайт: http://$DOMAIN"
			log_n "${white}Фаил конфигурации: /var/www/${DOMAIN}/includes/config.php"
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
		log_t "${white}В данный момент установка Energy - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_empire()
{
	if [ "$STATUS_site_empire" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта ${BLUE}Empire UCP"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название базы данных:${reset}" DATABASE
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
			cd /var/www/${DOMAIN} > /dev/null 2>&1
			wget $URL_EmpireUCP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Empire UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Empire UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o EmpireUCP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Empire UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Empire UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm EmpireUCP.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Empire UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Empire UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			log_s
			log_n "${white}Установка сайта ${BLUE}Empire UCP ${white}успешно завершена!"
			log_n ""
			log_n "${white}Ссылка на сайт: http://$DOMAIN"
			log_n "${white}Вход в Админку(сайта): http://$DOMAIN/admin/login"
			log_n "${white}Админка(сайта): Логин: Admin | ѕароль: 123q123  (меняем в базе ucp_admin)"
			log_n "${white}Настройки базы в файле: /var/www/${DOMAIN}/engine/config/table.php"
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
		log_t "${white}В данный момент установка Empire UCP - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_arizona()
{
	if [ "$STATUS_site_arizona" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта ${green}Arizona UCP"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название базы данных:${reset}" DATABASE
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}ѕродолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN}/ > /dev/null 2>&1
			cd /var/www/${DOMAIN} > /dev/null 2>&1
			wget $URL_ArizonaUCP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Arizona UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Arizona UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o ArizonaUCP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка ${green}Arizona UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка ${green}Arizona UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm ArizonaUCP.zip
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Arizona UCP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Arizona UCP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			mysql -u gs1 -p$MYPASS -D $DATABASE -e "DROP TABLE site_news"  > /dev/null 2>&1
			mysql -u gs1 -p$MYPASS $DATABASE < /var/www/${DOMAIN}/base.sql > /dev/null 2>&1
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
			sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/engine/core/config/configsite.php
			sed -i "s/database/${DATABASE}/g" /var/www/${DOMAIN}/engine/core/config/config1.php
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
			log_s
			log_n "${white}Установка сайта ${green}Arizona UCP ${white}успешно завершена!"
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
		log_t "${white}В данный момент установка Arizona UCP - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_virginia()
{
	if [ "$STATUS_site_virginia" = "1" ]; then
		Info "${YELLOW}Мастер установки сайта ${MAGENTA}Virginia UCP"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите название базы данных:${reset}" DATABASE
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		read -p "${YELLOW}ѕроверьте правильность данных! ${white}продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
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
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN}/
			cd /var/www/${DOMAIN}/
			if [ $? -eq 0 ]; then
				echo "• Удаляем директорию ${green}${DOMAIN} ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаляем директорию ${green}${DOMAIN} ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			wget $URL_VirginiaUCP > /dev/null 2>&1
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
	# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
	# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
	# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
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
			log_s
			log_n "${white}Установка сайта ${MAGENTA}Virginia UCP ${white}успешно завершена!"
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
		log_t "${white}В данный момент установка Virginia UCP - ЗАПРЕЩЕНА!"
		Info
	fi
}
servermenu()
{
	clear
	Info
	log_t "${white}Выберите нужную вам игру"
	Info "- ${YELLOW}1${green} - ${MAGENTA}SAMP${white}(v0.3.7-R2) ${green}ツ${white}"
	Info "- ${YELLOW}2${green} - ${green}CRMP${white}(v0.3.7-R2) ${green}ツ${white}"
	Info "- ${YELLOW}3${green} - ${reset}Minecraft(1.5.2-1.16.3)(В разработке... ${red}ツ${white})"
	Info "- ${YELLOW}4${green} - ${reset}Counter Strike: 1.6(В разработке... ${red}ツ${white})"
	Info "- ${YELLOW}5${green} - ${reset}Counter Strike: Sourse(В разработке... ${red}ツ${white})"
	Info "- ${YELLOW}6${green} - ${reset}Counter-Strike: Global Offensive(В разработке... ${red}ツ${white})"
	Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
	cp_s
	Info
	read -p "${white}Пожалуйста, введите пункт меню:" case
	case $case in
		1) sampmenu;;
		2) crmpmenu;;
		3) exit;;
		4) exit;;
		5) exit;;
		6) exit;;
		0) menu;;
	esac
}
crmpmenu()
{
	clear
	Info
	log_t "${white}Выберите сервер CRMP который хотите установить"
	Info "- ${YELLOW}1${green} - ${MAGENTA}Radmir RP${white}(upd 24.10.2020) ${CYAN}ツ${white}"
	Info "- ${YELLOW}2${green} - ${reset}No Name${white}(upd 2020) ${red}ツ${white}"
	Info "- ${YELLOW}3${green} - ${reset}No Name${white}(upd 2020) ${red}ツ${white}"
	Info "- ${YELLOW}4${green} - ${reset}No Name${white}(upd 2020) ${red}ツ${white}"
	Info "- ${YELLOW}5${green} - ${reset}No Name${white}(upd 2020) ${red}ツ${white}"
	Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
	cp_s
	Info
	read -p "${white}Пожалуйста, введите пункт меню:" case
	case $case in
		1) server_radmir;;
		2) exit;;
		3) exit;;
		4) exit;;
		5) exit;;
		0) servermenu;;
	esac
}
server_radmir()
{
	if [ "$STATUS_server_radmir" = "1" ]; then
		Info "${YELLOW}Мастер установки мода ${MAGENTA}Radmir RP"
		read -p "${white}Введите ваш НИК (например Jack_Sweech):${reset}" NICKNAME
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
		apt-get update > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y zip unzip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}zip unzip! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}zip unzip! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		mkdir -p /home/crmp/ > /dev/null 2>&1
		rm -rf /home/crmp/* > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Создание и очистка папки ${green}crmp! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Создание и очистка ${green}crmp! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		cd /home/crmp/
		wget $URL_RadmirRP > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Загрузка ${green}Radmir RP! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Загрузка ${green}Radmir RP! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		unzip -o RadmirRP.zip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Распаковка архива ${green}Radmir RP! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Распаковка архива ${green}Radmir RP! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		rm RadmirRP.zip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Удаление архива ${green}Radmir RP! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Удаление архива ${green}Radmir RP! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		mysql -uadmin -p$MYPASS -D radmir -e "DROP DATABASE radmir" > /dev/null 2>&1
		mkdir /var/lib/mysql/radmir > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Создание базы  ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Создание базы ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		chown -R mysql:mysql /var/lib/mysql/radmir
		sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/crmp/radmir.sql > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Добавляем ник в FullDostup • ${green}[OK]"
			tput sgr0
		else
			echo "• Добавляем ник в FullDostup • ${red}[fail]"
			tput sgr0
			exit
		fi
		mysql -u admin -p$MYPASS radmir < /home/crmp/radmir.sql > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка базы данных ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка базы данных ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		rm /home/crmp/radmir.sql
		sed -i "s/parol/${MYPASS}/g" /home/crmp/scriptfiles/mysql_settings.ini > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Подключаем базу данных • ${green}[OK]"
			tput sgr0
		else
			echo "• Подключаем базу данных • ${red}[fail]"
			tput sgr0
			exit
		fi
		chmod -R 777 /home/crmp > /dev/null 2>&1
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
		log_s
		log_n "${white}Установка мода ${MAGENTA}Radmir RP ${white}успешно завершена!"
		log_n ""
		log_n "${white}Путь до мода: /home/crmp"
		log_n "${white}Запустить сервер 2 команды: 1)cd /home/crmp  2)./crmp.sh"
		log_n ""
		log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
		log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
		log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
		log_n ""
		cp_s
	else
		Info
		log_t "${white}В данный момент установка Radmir RP - ЗАПРЕЩЕНА!"
		Info
	fi
}
sampmenu()
{
	clear
	Info
	log_t "${white}Выберите сервер который хотите установить"
	Info "- ${YELLOW}1${green} - ${MAGENTA}Virginia RP${white}(Last Update) ${green}ツ${white}"
	Info "- ${YELLOW}2${green} - ${green}Arizona RP Florence${white}(upd 24.10.2020 by Danilyuk) ${green}ツ${white}"
	Info "- ${YELLOW}3${green} - ${YELLOW}Absolute RP${white}(upd 23.10.2020) ${green}ツ${white}"
	Info "- ${YELLOW}4${green} - ${reset}Diamond RP${white}(upd 00.00.0000) ${red}ツ${white}"
	Info "- ${YELLOW}5${green} - ${reset}Samp RP${white}(upd 00.00.0000) ${red}ツ${white}"
	Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
	cp_s
	Info
	read -p "${white}Пожалуйста, введите пункт меню:" case
	case $case in
		1) server_virginia;;
		2) server_florence;;
		3) server_absolute;;
		4) exit;;
		5) exit;;
		0) servermenu;;
	esac
}
server_virginia()
{
	if [ "$STATUS_server_virginia" = "1" ]; then
		Info "${YELLOW}Мастер установки мода ${MAGENTA}Virginia RP"
		read -p "${white}Введите ваш НИК (например Jack_Sweech):${reset}" NICKNAME
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
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
			apt-get install -y zip unzip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка пакета ${green}zip unzip! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка пакета ${green}zip unzip! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mkdir -p /home/samp/ > /dev/null 2>&1
			rm -rf /home/samp/* > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание и очистка папки ${green}samp! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание и очистка ${green}samp! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			cd /home/samp
			wget $URL_VirginiaRP > /dev/null 2>&1
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
			mysql -uadmin -p$MYPASS -D virginia -e "DROP DATABASE virginia" > /dev/null 2>&1
			mkdir /var/lib/mysql/virginia > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание базы  ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание базы ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			chown -R mysql:mysql /var/lib/mysql/virginia
			sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/samp/virginia.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Добавляем ник в FullDostup • ${green}[OK]"
				tput sgr0
			else
				echo "• Добавляем ник в FullDostup • ${red}[fail]"
				tput sgr0
				exit
			fi
			mysql -u admin -p$MYPASS virginia < /home/samp/virginia.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка базы данных ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка базы данных ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm /home/samp/virginia.sql
			sed -i "s/parol/${MYPASS}/g" /home/samp/scriptfiles/mysql_settings.ini > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Подключаем базу данных • ${green}[OK]"
				tput sgr0
			else
				echo "• Подключаем базу данных • ${red}[fail]"
				tput sgr0
				exit
			fi
			chmod -R 777 /home/samp > /dev/null 2>&1
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
			log_s
			log_n "${white}Установка мода ${MAGENTA}Virginia RP${white} успешно завершена!"
			log_n ""
			log_n "${white}Путь до мода: /home/samp"
			log_n "${white}Ваш аккаунт готов к администрированию: $NICKNAME пароль: 123q123"
			log_n "${white}Запустить сервер 2 команды: 1)cd /home/samp  2)./samp.sh"
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
		log_t "${white}В данный момент установка Virginia RP - ЗАПРЕЩЕНА!"
		Info
	fi
}
server_absolute()
{
	if [ "$STATUS_server_absolute" = "1" ]; then
		Info "${YELLOW}Мастер установки мода Absolute RP"
		read -p "${white}Введите ваш НИК (например Jack_Sweech):${reset}" NICKNAME
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
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
			apt-get install -y zip unzip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка пакета ${green}zip unzip! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка пакета ${green}zip unzip! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mkdir -p /home/samp/ > /dev/null 2>&1
			rm -rf /home/samp/* > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание и очистка папки ${green}samp! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание и очистка ${green}samp! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			cd /home/samp
			wget $URL_AbsoluteRP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Absolute RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Absolute RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o AbsoluteRP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка архива ${green}Absolute RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка архива ${green}Absolute RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm AbsoluteRP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Absolute RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Absolute RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mysql -uadmin -p$MYPASS -D absolute -e "DROP DATABASE absolute" > /dev/null 2>&1
			mkdir /var/lib/mysql/absolute > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание базы  ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание базы ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			chown -R mysql:mysql /var/lib/mysql/absolute
			sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/samp/absolute.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Добавляем ник в базу • ${green}[OK]"
				tput sgr0
			else
				echo "• Добавляем ник в базу • ${red}[fail]"
				tput sgr0
				exit
			fi
			mysql -u admin -p$MYPASS absolute < /home/samp/absolute.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка базы данных ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка базы данных ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm /home/samp/absolute.sql
			sed -i "s/parol/${MYPASS}/g" /home/samp/scriptfiles/mysql_settings.ini > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Подключаем базу данных • ${green}[OK]"
				tput sgr0
			else
				echo "• Подключаем базу данных • ${red}[fail]"
				tput sgr0
				exit
			fi
			chmod -R 777 /home/samp > /dev/null 2>&1
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
			log_s
			log_n "${white}Установка мода ${YELLOW}Absolute RP ${white}успешно завершена!"
			log_n ""
			log_n "${white}Путь до мода: /home/samp"
			log_n "${white}Ваш аккаунт готов к администрированию: $NICKNAME пароль: 123q123"
			log_n "${white}Запустить сервер 2 команды: 1)cd /home/samp  2)./samp.sh"
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
		log_t "${white}В данный момент установка Absolute RP - ЗАПРЕЩЕНА!"
		Info
	fi
}
server_florence()
{
	if [ "$STATUS_server_florence" = "1" ]; then
		Info "${YELLOW}Мастер установки мода ${green}Arizona RP Florence"
		read -p "${white}Введите ваш НИК (например Jack_Sweech):${reset}" NICKNAME
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
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
			apt-get install -y zip unzip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка пакета ${green}zip unzip! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка пакета ${green}zip unzip! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mkdir -p /home/samp/ > /dev/null 2>&1
			rm -rf /home/samp/* > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание и очистка папки ${green}samp! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание и очистка ${green}samp! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			cd /home/samp
			wget $URL_ArizonaRP > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Загрузка ${green}Arizona RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Загрузка ${green}Arizona RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			unzip -o ArizonaRP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Распаковка архива ${green}Arizona RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Распаковка архива ${green}Arizona RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm ArizonaRP.zip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Удаление архива ${green}Arizona RP! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление архива ${green}Arizona RP! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mysql -uadmin -p$MYPASS -D arizona -e "DROP DATABASE arizona" > /dev/null 2>&1
			mkdir /var/lib/mysql/arizona > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание базы  ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание базы ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			chown -R mysql:mysql /var/lib/mysql/arizona
			sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/samp/arizona.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Добавляем ник в базу • ${green}[OK]"
				tput sgr0
			else
				echo "• Добавляем ник в базу • ${red}[fail]"
				tput sgr0
				exit
			fi
			mysql -u admin -p$MYPASS arizona < /home/samp/arizona.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка базы данных ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка базы данных ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm /home/samp/arizona.sql
			sed -i "s/parol/${MYPASS}/g" /home/samp/scriptfiles/mysql_settings.ini > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Подключаем базу данных • ${green}[OK]"
				tput sgr0
			else
				echo "• Подключаем базу данных • ${red}[fail]"
				tput sgr0
				exit
			fi
			chmod -R 777 /home/samp > /dev/null 2>&1
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
			log_s
			log_n "${white}Установка мода ${green}Arizona RP Florence ${white}успешно завершена!"
			log_n ""
			log_n "${white}Путь до мода: /home/samp"
			log_n "${white}Ваш аккаунт готов к администрированию: $NICKNAME пароль: 123q123"
			log_n "${white}Запустить сервер 2 команды: 1)cd /home/samp  2)./samp.sh"
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
		log_t "${white}В данный момент установка Arizona RP | Florence - ЗАПРЕЩЕНА!"
		Info
	fi
}
webservermenu()
{
	clear
	Info
	log_t "${white}Что будем настраивать?"
	Info "- ${YELLOW}1${green} - ${white}Изменить web server ${YELLOW}(Apache2/Nginx) ${green}ツ${white}"
	Info "- ${YELLOW}2${green} - ${white}Изменить ${YELLOW}PHP ${green}ツ${white}"
	Info "- ${YELLOW}0${green} - ${white}Вернуться в меню"
	cp_s
	Info
	read -p "${white}Пожалуйста, введите пункт меню:" case
	case $case in
		1)	websistem;;
		2) phpversion;;
		0) menu;;
	esac
}
websistem()
{
	Info "${YELLOW}Мастер настройки Apache2/Nginx"
	read -p "${white}Что ставим?( 1 - Apache2 | 2 - Nginx )[1]:${reset}" WEBSISTEMS
	WEBSISTEMS="${WEBSISTEMS:-1}"
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	if [ $VER = "Debian9" ]; then
		if [ "$WEBSISTEMS" = "1" ]; then
			systemctl stop nginx > /dev/null 2>&1
			apt-get install -y apache2 > /dev/null 2>&1
			systemctl start apache2 > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка пакетов ${green}Apache2 ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка пакетов ${green}Apache2 ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			a2enmod rewrite > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Настройка ${green}Apache2 ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Настройка ${green}Apache2 ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
		fi
		if [ "$WEBSISTEMS" = "2" ]; then
			systemctl stop apache2 > /dev/null 2>&1
			apt-get install -y nginx > /dev/null 2>&1
			systemctl start nginx > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка пакетов ${green}Nginx ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка пакетов ${green}Nginx ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			apt-get install -y php-fpm > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка пакетов ${green}php-fpm ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка пакетов ${green}php-fpm ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
		fi
	elif [ $VER = "Debian8" ]; then
		if [ "$WEBSISTEMS" = "1" ]; then
			service stop nginx > /dev/null 2>&1
			apt-get install -y apache2 > /dev/null 2>&1
			service start apache2 > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка пакетов ${green}Apache2 ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка пакетов ${green}Apache2 ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			a2enmod rewrite > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Настройка ${green}Apache2 ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Настройка ${green}Apache2 ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
		fi
		if [ "$WEBSISTEMS" = "2" ]; then
			service stop apache2 > /dev/null 2>&1
			apt-get install -y nginx > /dev/null 2>&1
			service start nginx > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка пакетов ${green}Nginx ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка пакетов ${green}Nginx ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			apt-get install -y php-fpm > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка пакетов ${green}php-fpm ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка пакетов ${green}php-fpm ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
		fi
	else
		Info
		log_t "${white}Автоустановщик доступен только для Debian 8,9"
		Info
	fi
}
phpversion()
{
	Info "${YELLOW}Мастер настройки PHP"
	read -p "${white}Какую версию PHP?( 1 - v5.6 | 2 - v7.0 )[1]:${reset}" PHPVERSIONS
	PHPVERSIONS="${PHPVERSIONS:-1}"
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y apt-transport-https lsb-release ca-certificates > /dev/null 2>&1
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg > /dev/null 2>&1
	curl -fsSL https://packages.sury.org/php/apt.gpg | apt-key add > /dev/null 2>&1
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
	echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
	echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
	echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
	echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
	echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
	echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
	sudo apt update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	if [ "$PHPVERSIONS" = "1" ]; then
		apt-get install -y php5.6  > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green}php5.6 ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green}php5.6 ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		a2dismod php7.0 > /dev/null 2>&1
		a2enmod php5.6 > /dev/null 2>&1
		sudo update-alternatives --set php /usr/bin/php5.6 > /dev/null 2>&1
		sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/5.6/apache2/php.ini > /dev/null 2>&1
		sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/5.6/apache2/php.ini > /dev/null 2>&1
		sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/5.6/apache2/php.ini > /dev/null 2>&1
		systemctl restart apache2 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Настройка ${green}php5.6 ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Настройка ${green}php5.6 ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
	fi
	if [ "$PHPVERSIONS" = "2" ]; then
		apt-get install -y php7.0 php7.0-gd php7.0-mysql  > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green}php7.0 ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green}php7.0 ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		a2enmod php7.0 > /dev/null 2>&1
		a2dismod php5.6 > /dev/null 2>&1
		sudo update-alternatives --set php /usr/bin/php7.0 > /dev/null 2>&1
		sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
		sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
		sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
		systemctl restart apache2 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Настройка ${green}php7.0 ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Настройка ${green}php7.0 ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
	fi
}
mysqlmenu()
{	
	apt-get update > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "• Обновление ${green}пакетов ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "• Обновление ${green}пакетов ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y pwgen > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка пакетов ${green}pwgen ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка пакетов ${green}pwgen ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	apt-get install -y mariadb-server > /dev/null 2>&1
	MYPASS=$(pwgen -cns -1 16) > /dev/null 2>&1
	mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '$MYPASS' WITH GRANT OPTION" > /dev/null 2>&1
	mysql -e "FLUSH PRIVILEGES" > /dev/null 2>&1
	mysql -uadmin -p$MYPASS -e "SET GLOBAL sql_mode=''" > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка пакетов ${green}mariadb-server ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка пакетов ${green}mariadb-server ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/admin-user string admin" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYPASS" | debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYPASS" |debconf-set-selections > /dev/null 2>&1
	echo "phpmyadmin phpmyadmin/app-password-confirm password $MYPASS" | debconf-set-selections > /dev/null 2>&1
	echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections > /dev/null 2>&1
	apt-get install -y phpmyadmin > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Установка ${green}phpMyAdmin ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Установка ${green}phpMyAdmin ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
	sed -i 's/#max_connections        = 100/max_connections        = 1000/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
	sed -i "12 a character_set_server=cp1251" /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
	sed -i "12 a character_set_client=cp1251" /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
	service mysql restart > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "${white}• Настройка ${green}MySQL ${white}• ${green}[OK]"
		tput sgr0
	else
		echo "${white}• Настройка ${green}MySQL ${white}• ${red}[fail]"
		tput sgr0
		exit
	fi
	echo "Ссылка на сайт: http://$IP_SERV \n Ссылка на MySQL: http://$IP_SERV/phpmyadmin \n Данные от MySQL: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > info.txt
	echo "$MYPASS" > passwd.txt
	log_s
	log_n "${white}Установка MariabDB завершена!"
	log_n ""
	log_n "${white}Ссылка на ${red} PHPMyAdmin${white}: http://$IP_SERV/phpmyadmin"
	log_n "${white}Данные от ${red} PHPMyAdmin${white}: логин: admin ; пароль: $MYPASS"
	log_n ""
	log_n "${white}Данные скрипт успешно скопировал в фаил! Путь к файлу: /root/info.txt"
	log_n ""
	log_n "${white}Автор: ${red}AndreyChikaev ${white}( vk.com/winchikplay )!"
	log_n "${white}YouTube: ${red}HackChik ${white}( catcut.net/ZKaL )!"
	log_n "${white}В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!"
	log_n ""
	cp_s
}
webserverall()
{
if [ $VER = "Debian9" ]; then
	I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
	if [ -n "$I" ] 
	then
	   webservermenu
	else
		Info "${YELLOW}Мастер настройки Web Servera"
		echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
		echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
		echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
		if [ $? -eq 0 ]; then
			echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
			tput sgr0
			exit
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
		apt install -y pwgen apache2 php7.0 php7.0-gd php7.0-mysql mariadb-server unzip > /dev/null 2>&1
		MYPASS=$(pwgen -cns -1 16) > /dev/null 2>&1
		mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '$MYPASS' WITH GRANT OPTION" > /dev/null 2>&1
		mysql -e "FLUSH PRIVILEGES" > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections > /dev/null 2>&1
		echo "phpmyadmin phpmyadmin/mysql/admin-user string admin" | debconf-set-selections > /dev/null 2>&1
		echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYPASS" | debconf-set-selections > /dev/null 2>&1
		echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYPASS" |debconf-set-selections > /dev/null 2>&1
		echo "phpmyadmin phpmyadmin/app-password-confirm password $MYPASS" | debconf-set-selections > /dev/null 2>&1
		echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections > /dev/null 2>&1
		apt-get install -y phpmyadmin > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Установка ${green}phpMyAdmin ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Установка ${green}phpMyAdmin ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		a2enmod rewrite > /dev/null 2>&1
		echo "Europe/Moscow" > /etc/timezone > /dev/null 2>&1
		sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
		sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
		sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
		sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
		sed -i 's/#max_connections        = 100/max_connections        = 1000/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
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
		echo "Установка WEB Server'a завершена BY HACKCHIK! \n Ссылка на сайт: http://$IP_SERV \n Ссылка на PHPMyAdmin: http://$IP_SERV/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > info.txt
		echo "$MYPASS" > passwd.txt
		log_s
		log_n "${white}Установка WEB Server'a завершена!"
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
elif [ $VER = "Debian8" ]; then
	I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
	if [ -n "$I" ] 
	then
	   webservermenu
	else
		Info "${YELLOW}Мастер настройки Web Servera"
		apt-get update > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "${white}• Обновление ${green}списка пакетов! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "${white}• Обновление ${green}списка пакетов! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get upgrade -y > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Обновление ${green}пакетов ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Обновление ${green}пакетов ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		MYPASS=$(pwgen -cns -1 16)
		echo mysql-server mysql-server/root_password select "$MYPASS" | debconf-set-selections > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пароля на ${green}mysql! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пароля на ${green}mysql! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		echo mysql-server mysql-server/root_password_again select "$MYPASS" | debconf-set-selections > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Повторная установка пароля на ${green}mysql! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Повторная установка пароля на ${green}mysql! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get -f install > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Проверка наличие необходимых ${green}пакетов ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Проверка наличие необходимых ${green}пакетов ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y apache2 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green}apache2 ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green}apache2 ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y php5 php5-dev curl php5-curl php5-gd php5-mcrypt libapache2-mod-php5  > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green} php5 ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green} php5 ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y mysql-server > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green}mysql-server ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green}mysql-server ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y build-essential > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакетов ${green}build-essential ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакетов ${green}build-essential ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
		echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections
		echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYPASS" | debconf-set-selections
		echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYPASS" |debconf-set-selections
		echo "phpmyadmin phpmyadmin/app-password-confirm password $MYPASS" | debconf-set-selections
		echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
		apt-get install -y phpmyadmin > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}phpmyadmin! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}phpmyadmin! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		sed -i "31 a character_set_server=cp1251" /etc/mysql/my.cnf
		sed -i "31 a character_set_client=cp1251" /etc/mysql/my.cnf > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Обновление ${green}сравнения для mysql ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Обновление ${green}сравнения для mysql ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		service mysql restart > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Перезагрузка ${green}mysql ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Перезагрузка ${green}mysql ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		a2enmod rewrite > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Запуск ${green}rewrite! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Запуск ${green}rewrite! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		a2enmod php5 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Запуск ${green}php5! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Запуск ${green}php5! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php5/apache2/php.ini	> /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Запуск ${green}short_open_tab! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Запуск ${green}short_open_tab! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		service apache2 restart > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Перезагрузка ${green}apache! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Перезагрузка ${green}apache! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		apt-get install -y zip unzip > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "• Установка пакета ${green}zip unzip! ${white}• ${green}[OK]"
			tput sgr0
		else
			echo "• Установка пакета ${green}zip unzip! ${white}• ${red}[fail]"
			tput sgr0
			exit
		fi
		echo "Установка WEB Server'a завершена BY HACKCHIK! \n Ссылка на сайт: http://$IP_SERV \n Ссылка на PHPMyAdmin: http://$IP_SERV/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > info.txt
		echo "$MYPASS" > passwd.txt
		log_s
		log_n "${white}Установка WEB Server'a завершена!"
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
else
	Info
	log_t "${white}Автоустановщик доступен только для Debian 8,9"
	Info
fi
}
site_unionlogs()
{
	if [ "$STATUS_site_unionlogs" = "1" ]; then
		Info "${YELLOW}Мастер установки UnionLogs(Last Update)"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru ; logs.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
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
			apt-get install -y zip unzip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка пакета ${green}zip unzip! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка пакета ${green}zip unzip! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
			cd /var/www/${DOMAIN}/ > /dev/null 2>&1
			wget $URL_LOGI > /dev/null 2>&1
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
			sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/includes/con_logs.php
			sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/includes/constants.php > /dev/null 2>&1
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
			log_s
			log_n "${white}Установка UnionLogs успешно завершена!"
			log_n ""
			log_n "${white}Ссылка на сайт с логами: http://$DOMAIN"
			log_n "${white}Путь до файлов логов: /var/www/${DOMAIN}"
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
		log_t "${white}В данный момент установка UnionLogs - ЗАПРЕЩЕНА!"
		Info
	fi
}
site_iodarkforum()
{
	if [ "$STATUS_site_iodarkforum" = "1" ]; then
		Info "${YELLOW}Мастер установки IO Dark(Last Update)"
		read -p "${white}Укажите ваш домен(пример: forum.virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Укажите пароль от базы данных:${reset}" MYPASS
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
			apt-get install -y zip unzip > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка пакета ${green}zip unzip! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка пакета ${green}zip unzip! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			a2dissite 000-default > /dev/null 2>&1
			rm -Rfv /var/www/${DOMAIN} > /dev/null 2>&1
			mkdir -p /var/www/${DOMAIN} > /dev/null 2>&1
			cd /var/www/${DOMAIN}/ > /dev/null 2>&1
			wget $URL_FORUM > /dev/null 2>&1
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
			mysql -u admin -p$MYPASS forum < /var/www/${DOMAIN}/forum.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка ${green}forum.sql! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка ${green}forum.sql! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm /var/www/${DOMAIN}/forum.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Удаление ${green}forum.sql! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление ${green}forum.sql! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
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
			sed -i "s/parol/${MYPASS}/g" /var/www/${DOMAIN}/src/config.php > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Подключаем базу данных • ${green}[OK]"
				tput sgr0
			else
				echo "• Подключаем базу данных • ${red}[fail]"
				tput sgr0
				exit
			fi
			chmod -R 777 /var/www/${DOMAIN}
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
			log_n "${white}Установка сайта Virginia UCP успешно завершена!"
			log_n ""
			log_n "${white}Ссылка на форум: http://$DOMAIN"
			log_n "${white}Путь до файлов форума: /var/www/${DOMAIN}"
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
		log_t "${white}В данный момент установка IO Dark Forum - ЗАПРЕЩЕНА!"
		Info
	fi
}
virginiaproject()
{
	if [ "$STATUS_virginiaproject" = "1" ]; then
		Info "${YELLOW}Мастер установки проекта Virginia Role Play"
		read -p "${white}Укажите ваш домен(пример: virginia-rp.ru):${reset}" DOMAIN
		read -p "${white}Введите ваш НИК (например Jack_Sweech):${reset}" NICKNAME
		read -p "${YELLOW}Проверьте правильность данных! ${white}Продолжить установку ${white}(${green}y${white}/${red}n${white})?:${reset}" CONT
		if [ "$CONT" = "y" ] || [ "$CONT" = "Y" ] || [ "$CONT" = "yes" ] || [ "$CONT" = "Yes" ]; then
			echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
			echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
			echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
			echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
			echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
			echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
			if [ $? -eq 0 ]; then
				echo "${white}• Добавление ${green}репозиторий ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Добавление ${green}репозиторий ${white}• ${red}[fail]"
				tput sgr0
				exit
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
			apt install -y pwgen apache2 php7.0 php7.0-gd php7.0-mysql mariadb-server unzip > /dev/null 2>&1
			MYPASS=$(pwgen -cns -1 16) > /dev/null 2>&1
			mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '$MYPASS' WITH GRANT OPTION" > /dev/null 2>&1
			mysql -e "FLUSH PRIVILEGES" > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка пакетов ${green}apache2,php7.0,mariadb-server ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections > /dev/null 2>&1
			echo "phpmyadmin phpmyadmin/mysql/admin-user string admin" | debconf-set-selections > /dev/null 2>&1
			echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYPASS" | debconf-set-selections > /dev/null 2>&1
			echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYPASS" |debconf-set-selections > /dev/null 2>&1
			echo "phpmyadmin phpmyadmin/app-password-confirm password $MYPASS" | debconf-set-selections > /dev/null 2>&1
			echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections > /dev/null 2>&1
			apt-get install -y phpmyadmin > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "${white}• Установка ${green}phpMyAdmin ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "${white}• Установка ${green}phpMyAdmin ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			echo "Europe/Moscow" > /etc/timezone > /dev/null 2>&1
			sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 90M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
			sed -i "s/post_max_size = 8M/post_max_size = 360M/g" /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
			sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
			sed -i 's/#max_connections        = 100/max_connections        = 1000/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1
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
			# MULTY-TOOLS BY HACKCHIK (Andrey Chikaev)
			# ССЫЛКА НА YOUTUBE - https://clck.ru/RQkG2
			# ССЫЛКА НА ВК  - https://clck.ru/RQkJi
			fi
			sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/apache2/php.ini > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Запуск ${green}short_open_tab! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Запуск ${green}short_open_tab! ${white}• ${red}[fail]"
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
			apt-get install -y zip unzip screen > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка ${green}zip unzip screen! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка ${green}zip unzip screen! ${white}• ${red}[fail]"
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
			mkdir -p /home/samp/ > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание папки ${green}samp! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание папки ${green}samp! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			cd /home/samp
			wget $URL_VirginiaRP > /dev/null 2>&1
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
			mkdir /var/lib/mysql/virginia > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Создание папки ${green}/var/lib/mysql/virginia! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Создание папки ${green}/var/lib/mysql/virginia! ${white}• ${green}[Папка существует]"
				tput sgr0
			fi
			chown -R mysql:mysql /var/lib/mysql/virginia
			sed -i "s/Jack_Sweech/${NICKNAME}/g" /home/samp/virginia.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Добавляем ник в FullDostup • ${green}[OK]"
				tput sgr0
			else
				echo "• Добавляем ник в FullDostup • ${red}[fail]"
				tput sgr0
				exit
			fi
			cd
			mysql -u admin -p$MYPASS virginia < /home/samp/virginia.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка ${green}базы данных! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка ${green}базы данных! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm /home/samp/virginia.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Удаление ${green}базы данных! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление ${green}базы данных! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			sed -i "s/parol/${MYPASS}/g" /home/samp/scriptfiles/mysql_settings.ini > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Подключаем базу данных • ${green}[OK]"
				tput sgr0
			else
				echo "• Подключаем базу данных • ${red}[fail]"
				tput sgr0
				exit
			fi
			chmod -R 777 /home/samp > /dev/null 2>&1
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
			wget $URL_VirginiaUCP > /dev/null 2>&1
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
			wget $URL_LOGI > /dev/null 2>&1
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
			mv /var/www/logs.${DOMAIN}/site.conf /etc/apache2/sites-available/logs.${DOMAIN}.conf > /dev/null 2>&1
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
			wget $URL_FORUM > /dev/null 2>&1
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
			mysql -u admin -p$MYPASS forum < /var/www/forum.${DOMAIN}/forum.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Установка ${green}forum.sql! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Установка ${green}forum.sql! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			rm /var/www/forum.${DOMAIN}/forum.sql > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "• Удаление ${green}forum.sql! ${white}• ${green}[OK]"
				tput sgr0
			else
				echo "• Удаление ${green}forum.sql! ${white}• ${red}[fail]"
				tput sgr0
				exit
			fi
			mv /var/www/forum.${DOMAIN}/site.conf /etc/apache2/sites-available/forum.${DOMAIN}.conf > /dev/null 2>&1
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
			echo "Установка проекта Virginia завершена BY HACKCHIK! \n Ссылка на сайт: http://$DOMAIN \n Ссылка на логи: http://logs.$DOMAIN \n Ссылка на форум: http://forum.$DOMAIN \n Ссылка на PHPMyAdmin: http://$DOMAIN/phpmyadmin \n Данные от PHPMyAdmin: логин: admin ; пароль: $MYPASS \n Путь до мода: /home/samp \n Ваш аккаунт готов к администрированию: $NICKNAME пароль: 123q123 \n Запустить сервер 2 команды: 1)cd /home/samp  2)./samp.sh \n\n\n Автор: AndreyChikaev ( vk.com/winchikplay ) \n YouTube: HackChik ( catcut.net/ZKaL ) \n В случае ошибок писать в ЛС! Спасибо за использование автоустановщика!" > info.txt
			echo "$MYPASS" > passwd.txt
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
gameserver()
{
	Info "${YELLOW}Мастер настройки VDS/VPS под игровые сервера" 
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
	cp_s
}
menu()
{
if [ $VER = "Debian9" ]; then
	if [ "$Debian_9" = "1" ]; then
		I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
		if [ -n "$I" ] 
		then
			clear
			Info
			log_t "${white}Добро пожаловать в меню ${green}MULTY-TOOLS${white} by ${YELLOW}HackChik ツ${white}"
			Info "- ${YELLOW}1${green} - ${white}Настроить VDS/VPS под ${MAGENTA}WEB Server${white}(для установки сайтов)"
			Info "- ${YELLOW}2${green} - ${white}Настроить VDS/VPS под ${MAGENTA}Samp/Minecraft${white}(для установки серверов)"
			Info "- ${YELLOW}3${green} - ${white}Установить сервер ${YELLOW}SAMP/CRMP/MINECRAFT/CS/CSS/CSGO${white}(upd 24.10.2020)"
			Info "- ${YELLOW}4${green} - ${white}Выбрать скрипта ${YELLOW}САЙТА${white}(upd 25.11.2020)"
			Info "- ${YELLOW}5${green} - ${white}Установить ${CYAN}ВСЕ ${white}в один клик (мод/сайт/логи/форум)"
			Info "- ${YELLOW}6${green} - ${white}Меню управления ${YELLOW}CRON/BACKUP ツ"
			Info "- ${YELLOW}7${green} - ${white}Установка игрового хостинга ${YELLOW}HOSTINPL ツ"
			Info "- ${YELLOW}0${green} - ${white}Выход"
			cp_s
			Info
			read -p "${white}Пожалуйста, введите пункт меню:" case
			case $case in
				1) webserverall;;
				2) gameserver;;
				3) servermenu;;
				4)	sitemenu;;
				5) virginiaproject;;
				6) backupmenu;;
				7) hostinmenu;;
				0) exit;;
			esac
		else
			clear
			Info
			log_t "${white}Добро пожаловать в меню ${green}MULTY-TOOLS${white} by ${YELLOW}HackChik ツ${white}"
			Info "- ${YELLOW}1${green} - ${white}Настроить VDS/VPS под ${MAGENTA}WEB Server${white}(для установки сайтов)"
			Info "- ${YELLOW}2${green} - ${white}Настроить VDS/VPS под ${MAGENTA}Samp/Minecraft${white}(для установки серверов)"
			Info "- ${YELLOW}3${green} - ${white}Установить ${CYAN}ВСЕ ${white}в один клик (мод/сайт/логи/форум)"
			Info "- ${YELLOW}4${green} - ${white}Меню управления ${YELLOW}CRON/BACKUP ツ"
			Info "- ${YELLOW}5${green} - ${white}Установка игрового хостинга ${YELLOW}HOSTINPL ツ"
			Info "- ${YELLOW}0${green} - ${white}Выход"
			cp_s
			Info
			read -p "${white}Пожалуйста, введите пункт меню:" case
			case $case in
				1) webserverall;;
				2) gameserver;;
				3) virginiaproject;;
				4) backupmenu;;
				5) hostinmenu;;
				0) exit;;
			esac
		fi
	else
		Info
		log_t "${white}В данный момент Multy-Tools на Debian 9 - ОТКЛЮЧЕН"
		Info
	fi
elif [ $VER = "Debian8" ]; then
	if [ "$Debian_8" = "1" ]; then
		I=`dpkg -s apache2 | grep "Status" ` > /dev/null 2>&1
		if [ -n "$I" ] 
		then
			clear
			Info
			log_t "${white}Добро пожаловать в меню ${green}MULTY-TOOLS${white} by ${YELLOW}HackChik ツ${white}"
			Info "- ${YELLOW}1${green} - ${white}Изменить ${MAGENTA}Web Server${white}(для установки сайтов)"
			Info "- ${YELLOW}2${green} - ${white}Настройка под сервера ${MAGENTA}Samp/Minecraft${white}(для установки серверов)"
			# Info "- ${YELLOW}3${green} - ${white}Установить сервер ${YELLOW}SAMP/CRMP/MINECRAFT/CS/CSS/CSGO${white}(upd 24.10.2020)"
			# Info "- ${YELLOW}4${green} - ${white}Выбрать скрипта ${YELLOW}САЙТА${white}(upd 25.11.2020)"
			# Info "- ${YELLOW}5${green} - ${white}Установить ${CYAN}ВСЕ ${white}в один клик (мод/сайт/логи/форум)"
			# Info "- ${YELLOW}6${green} - ${white}Меню управления ${YELLOW}CRON/BACKUP ツ"
			# Info "- ${YELLOW}7${green} - ${white}Установка игрового хостинга ${YELLOW}HOSTINPL ツ"
			Info "- ${YELLOW}0${green} - ${white}Выход"
			cp_s
			Info
			read -p "${white}Пожалуйста, введите пункт меню:" case
			case $case in
				1) webserverall;;
				2) gameserver;;
				# 3) servermenu;;
				# 4)	sitemenu;;
				# 5) virginiaproject;;
				# 6) backupmenu;;
				# 7) hostinmenu;;
				0) exit;;
			esac
		else
			clear
			Info
			log_t "${white}Добро пожаловать в меню ${green}MULTY-TOOLS${white} by ${YELLOW}HackChik ツ${white}"
			Info "- ${YELLOW}1${green} - ${white}Установить ${MAGENTA}Web Server${white}(для установки сайтов)"
			Info "- ${YELLOW}2${green} - ${white}Настройка под сервера ${MAGENTA}Samp/Minecraft${white}(для установки серверов)"
			# Info "- ${YELLOW}3${green} - ${white}Установить ${CYAN}ВСЕ ${white}в один клик (мод/сайт/логи/форум)"
			# Info "- ${YELLOW}4${green} - ${white}Меню управления ${YELLOW}CRON/BACKUP ツ"
			# Info "- ${YELLOW}5${green} - ${white}Установка игрового хостинга ${YELLOW}HOSTINPL ツ"
			Info "- ${YELLOW}0${green} - ${white}Выход"
			cp_s
			Info
			read -p "${white}Пожалуйста, введите пункт меню:" case
			case $case in
				1) webserverall;;
				2) gameserver;;
				# 3) virginiaproject;;
				# 4) backupmenu;;
				# 5) hostinmenu;;
				0) exit;;
			esac
		fi
	else
		Info
		log_t "${white}В данный момент Multy-Tools на Debian 8 - ОТКЛЮЧЕН"
		Info
	fi
else
	Info
	log_t "${white}Автоустановщик доступен только для Debian 8,9"
	Info
fi
}
if [ $VER = "Debian9" ] || [ $VER = "Debian8" ]; then
	I=`dpkg -s sudo | grep "Status" ` > /dev/null 2>&1
	if [ -n "$I" ] 
	then
		menu
	else
		Info "${YELLOW}Идёт настройка машины под использование Multy-Tools"
		apt-get update > /dev/null 2>&1
		apt-get install -y sudo curl htop screen > /dev/null 2>&1
		menu
	fi
else
	Info
	log_t "${white}Автоустановщик доступен только для Debian 8,9"
	Info
fi
