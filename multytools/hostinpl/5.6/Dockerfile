# ------------------------------------------------------------------------------
FROM debian:bullseye
# ------------------------------------------------------------------------------
RUN echo "deb http://deb.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list \
	&& echo "deb-src http://deb.debian.org/debian bullseye main contrib non-free" >> /etc/apt/sources.list \
	&& echo "deb http://deb.debian.org/debian-security/ bullseye-security main contrib non-free" >> /etc/apt/sources.list \
	&& echo "deb-src http://deb.debian.org/debian-security/ bullseye-security main contrib non-free" >> /etc/apt/sources.list \
	&& echo "deb http://deb.debian.org/debian bullseye-updates main contrib non-free" >> /etc/apt/sources.list \
	&& echo "deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free" >> /etc/apt/sources.list
RUN dpkg --add-architecture i386
# ------------------------------------------------------------------------------
# libstdc++6:i386 -> libstdc++6-i386-cross [Debian9 -> Debian11]
RUN apt-get update && apt-get install -y libstdc++6-i386-cross libgcc1:i386 zlib1g:i386 libncurses5:i386 default-jdk
# ------------------------------------------------------------------------------
# libreadline5 -> readline-common [Debian9 -> Debian11]
RUN apt-get install -y libbabeltrace1 libc6-dbg libdw1 lib32stdc++6 readline-common gdb-minimal
# ------------------------------------------------------------------------------
RUN apt-get update && apt-get install -y gnupg screen apt-transport-https curl
# ------------------------------------------------------------------------------
# Нужно было для Debian9
# RUN echo 'deb https://deb.nodesource.com/node_14.x stretch main' > /etc/apt/sources.list.d/nodesource.list \
# 	&& echo 'deb-src https://deb.nodesource.com/node_14.x stretch main' >> /etc/apt/sources.list.d/nodesource.list \
# 	&& curl -sLf -o /dev/null 'https://deb.nodesource.com/node_14.x/dists/stretch/Release' \ 
# 	&& curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
# 	&& curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
# 	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# ------------------------------------------------------------------------------
# RUN curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
RUN apt install -y curl software-properties-common gnupg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -


# RUN curl -o- -L https://yarnpkg.com/install.sh | bash
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# ------------------------------------------------------------------------------
RUN apt-get update
RUN apt-get install -y gcc g++ make nodejs yarn
# nodejs 25.8.2
# yarn 1.22.22
# ------------------------------------------------------------------------------
# Удалить неиспользуемые объекты Docker — # docker system prune -a
# Удалить неиспользуемые образы — # docker image prune
# 3. Очистить тома — # docker volume prune
# 4. Посмотреть логи: /var/lib/docker/containers
# ------------------------------------------------------------------------------
