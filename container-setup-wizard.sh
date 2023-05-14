#!/bin/bash

function main {

echo  "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) Olá Usuario, serei seu assistente para te ajudar em tudo que for necessario nessa instalação!;"
sleep 2
    echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Selecione uma opção:"
    sleep 1
    echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) 1 - Exibir data e hora do sistema;"
    echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) 2 - Iniciar instalação de programas essenciais;"
    echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) 3 - Informações sobre o assistente de instalação."
read opcao

case $opcao in
        "1")
            data=$(date +"%T, %d/%m/%y, %A")
            echo "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) $data"
            sleep 2
            echo "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) Deseja retornar para menu de opção anterior (S/N)?;"
            read escolha
                if [ \"$escolha\" == \"S\" ]
                then
                main
                else
                final
                fi
            ;;
        "2")
            clear
            sleep 1
            echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7) Informe o seu nome:"
            read nome;
            sleep 2
            clear
            echo "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) Bem-vindo ao mundo do shell script, $nome!"
            sleep 2
            echo "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) $nome é muito importante que você configure o IPV4 da sua instancia toda vez que iniciar ela no Azure!"
            sleep 5
            clear
            validacao_java
        ;;
        "3")
            echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7) Informe o seu nome:"
            read nome;
            sleep 2
            echo "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) Bem-vindo ao mundo do shell script, $nome!"
            sleep 2
            echo "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) Espero não te deixar com dúvidas apos a seguinte explicação;"
            sleep 2
            echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Bom $nome, essa aplicação permite que o usuário interaja com algumas etapas (níveis), faça escolhas (configurações) em cada uma delas e na etapa final tem seu objeto montado ou uma funcionalidade executada. Este tipo de aplicação é muito utilizada em vários tipos de sistemas, além de ter uma grande variedade de formas para implementação. É comum vermos assistentes para instalação de algum programa, configuração de alguma funcionalidade de uma aplicação, importação de arquivos de entrada, sites de compras online, entre outros...;"
            sleep 2
            echo "$(tput setaf 3)[Bot assistant]:$(tput setaf 7) Deseja retornar para menu de opção anterior (S/N)?;"
            read escolha
                if [ \"$escolha\" == \"S\" ]
                then
                main
                else
                final
                fi
        ;;
    esac
}

function validacao_java {
echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Estou atualizando o sistema, aguarde um pouquinho;"
sleep 3

sudo apt upgrade -y
clear
sudo apt update -y
clear

echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Instalação JAVA versão 11"
echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7) Confirme para mim se realmente deseja instalar o Java (S/N)?"
read inst
if [ \"$inst\" == \"S\" ]
    then
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Ok! Você escolheu instalar o Java ;D"
        sleep 2
        sudo apt install openjdk-11-jre-headless
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Atualizando! Quase lá."
        sleep 2
        clear                
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Java instalado com sucesso!"
        validacao_mysql
    else 	
        echo "$(tput setaf 9)[Bot assistant]:$(tput setaf 7) Você optou por não instalar o Java por enquanto, até a próxima então!"
        validacao_mysql
fi

}

function validacao_mysql {
    clear
    echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Agora vou verificar se você tem instalado o programa MySQL Server."
    mysql=$(sudo dpkg -l | grep mysql)
    sleep 2

    if [[ -z $mysql ]]
    then
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei o MySQL Server instalado, mas sem problemas, irei resolver isso agora!"
        echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o MySQL Server (S/N)?"
        read quest

        if [ \"$quest\" == \"S\" ]
            then
                echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Preparando para instalar o MySQL Server."
                echo y | sudo apt install mysql-server
                clear
                echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) MySQL Server instalado com sucesso!"
                validacao_python3
            else 	
            echo "$(tput setaf 9)[Bot assistant]:$(tput setaf 7) Você optou por não instalar o MySQL por enquanto, até a próxima então!"
            validacao_python3
        fi
    else
        clear
        echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Que otimo, você já tem o MySQL Server instalado!!!"
        sleep 3
        validacao_python3
    fi
}

function validacao_python3 {
    clear
    echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Estou verificando se você tem o programa Python3 instalado."
    python=$(sudo dpkg -l | grep python)
    sleep 3
    if [[ -z $python ]]
    then
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei o Python3 instalado, mas sem problemas, irei resolver isso agora!"
        echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Python3 (S/N)?"
        read quest2
        if [ \"$quest2\" == \"S\" ]
            then
                echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Preparando para instalar o Python3."
                echo y | sudo apt install python3
                clear
                echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Python3 instalado com sucesso!"
                validacao_pip3
            else
            clear
            echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Você optou por não instalar o Python3 por enquanto, até a próxima então!"
            sleep 3
            validacao_pip3
        fi
    else
        clear
        echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Opa, você já tem o Python3 instalado!!"
        sleep 3
        validacao_pip3
    fi
}

function validacao_pip3 {
    clear
    echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Estou aqui verificando tudo para você, vou verificar agora se você tem o programa pip3."
    pip=$(sudo dpkg -l | grep pip)
    sleep 3
    if [[ -z $pip ]]
    then
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei o Pip3 instalado, mas sem problemas, irei resolver isso agora!"
        echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Pip3 (S/N)?"
        read quest3
        if [ \"$quest3\" == \"S\" ]
            then
                echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Preparando para instalar o Pip3."
                sudo apt install python3-pip -y
                clear
                echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Pip3 instalado com sucesso!"
                validacao_driver
            else
            clear	
            echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Pip3 por enquanto, até a próxima então!"
            sleep 3
            validacao_driver
        fi
        
    else
        clear
        echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Ótimo, você já tem o pip3 instalado!!!"
        sleep 3
        validacao_driver
    fi
}

function validacao_driver {
    echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Vou instalar o driver ODBC..."
    if ! [[ "18.04 20.04 22.04" == *"$(lsb_release -rs)"* ]]
    then
        echo "Ubuntu $(lsb_release -rs) não é suportado."
        exit
    fi

    sudo curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
    sudo curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list
    
    clear
    sudo apt-get update
    clear
    sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
    sudo apt-get install -y unixodbc-dev
    clear
    pip install pyodbc
    pip install mysql-connector-python
    clear
    echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Driver instalado com sucesso!"
    sleep 2
    validacao_docker
}


function validacao_docker {
    clear
    echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Agora, para finalizar as verificações, vou verificar se você tem instalado o programa docker."
    docker=$(sudo dpkg -l | grep docker)
    sleep 3
    
    if [[ -z $docker ]]
    then
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Opa! Não identifiquei o Docker instalado, mas sem problemas, irei resolver isso agora!"
        sleep 2
        echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7) Confirme para mim se realmente deseja instalar o Docker (S/N)?"
        read opcao
        
        if [ \"$opcao\" == \"S\" ]
            then
                echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Preparando para instalar o Docker."
                echo y | sudo apt update
                clear
                echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Aguarde mais um pouco, estou instalando o Docker."
                echo y | sudo apt install docker.io
                clear
                echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Docker instalado com sucesso!"
                docker --version
                echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Agora vamos utilizar o gerenciador de processos do Linux, o systemctl para iniciar o docker."
                echo y | sudo systemctl start docker
                clear
                echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Aguarde mais um pouco, ja estou acabando de parametrizar o sistema."
                echo y | sudo systemctl enable docker
                clear
                echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Parametrização feita com sucesso e a instalação foi finalizada."
                get_project
            else
            clear
            echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Docker por enquanto, até a próxima então!"
            sleep 3
            final
        fi
        
    else
        echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Que bom, você já tem o Docker instalado!!!"
        docker --version
        sleep 2
        clear
        get_project
    fi
}

function get_project {
    
    echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Agora chegou o momento de decidir se quer ou não pegar o projeto que esta no repositorio remoto."
    echo "$(tput setaf 4)[Bot assistant]:$(tput setaf 7)  Diga para mim qual tipo de arquitetura deseja instalar o projeto nessa instancia (1/2)?"
    echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) 1 - Arquitetura B - 2 Containers em Docker - 1 dedicado para o MySQL e o 2º dedicado para API Crawler Python, o 2º envia dados para o SQL Server e consulta/persiste dados no MySQL Local;"
    echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) 2 - Arquitetura C - 1 Container em Docker - 1 container dedicado para o MySQL e uma aplicação fora do container que opera enviando dados para o SQL Server e consulta/persiste dados no MySQL Local;"
    echo  "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) 3 - Arquitetura D - 3 Containers em Docker - 1 container dedicado para o MySQL, o 2º dedicado para API Crawler Python e o 3º para o APP Kotlin, ambas APIs envia dados para o SQL Server e consulta/persiste dados no MySQL Local."
 
    read opcao
x
    case $opcao in
    "1")
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Preparando para instalar o Projeto."
        docker --version
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Baixando imagem de Maquina - MySQL 8.0."
        sudo docker pull mysql:8.0 
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Criando container com a imagem MySQL 8.0"
        sudo docker run -d -p 3305:3306 --name ContainerBDMySQL -e "MYSQL_ROOT_PASSWORD=root" mysql:8.0
        sleep 9
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Baixando imagem de Maquina - API Crawler Python"
        sudo docker pull gogoncalves/api-crawler-sql-mysql:latest
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Criando container com a imagem API Crawler Python"
        sudo docker run -dp 3000:3000 --name ContainerApiPython gogoncalves/api-crawler-sql-mysql:latest
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Detalhamento dos Containers:"
        sudo docker images
        sudo docker ps -a
        sleep 3
        clear
        echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Projeto Arquitetura B - 3 Containers em Docker - instalado com sucesso!"
        final
        ;;
    "2")
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Preparando para instalar o Projeto - Arquitetura C."
        sudo docker --version
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Baixando imagem de Maquina - MySQL 8.0."
        sudo docker pull mysql:8.0 
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Imagens instaladas:"
        sudo docker images
        sleep 3
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Criando container com a imagem MySQL 8.0"
        sudo docker run -d -p 3305:3306 --name ContainerBDMySQL -e "MYSQL_ROOT_PASSWORD=root" mysql:8.0
        sleep 9
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Aguarde mais um pouco!"
        sleep 9
        clear
        echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Projeto Arquitetura C - 1 Container em Docker - instalado com sucesso!"
        cd /home/ubuntu/Desktop
        mkdir sprint-3
        cd sprint-3
        mkdir api-kotlin
        cd api-kotlin
        git clone --branch apiKotlin https://github.com/GOGoncalves/dash-project-python-kotlin.git
        clear
        cd ..
        mkdir api-python
        cd api-python
        git clone --branch app-crawler https://github.com/GOGoncalves/dash-project-python-kotlin.git
        clear
        cd dash-project-python-kotlin
        python3 app_crawler_tab.py
        sleep 10
        cd ..
        cd api-kotlin
        cd dash-project-python-kotlin
        cd apiKotlin
        cd target
        java -jar consoleApp-1.0-SNAPSHOT-jar-with-dependencies.jar
    ;;
    "3")
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Preparando para instalar o Projeto - Arquitetura D."
        sudo docker --version
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Criando rede privada dedicada para containers."
        sudo docker network create employee-mysql
        sudo docker network ls
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Baixando imagem de Maquina - MySQL 8.0."
        sudo docker pull mysql:8.0 
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Criando container com a imagem MySQL 8.0"
        sudo docker container run --name mysqldb --network employee-mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:8.0
        sleep 9
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Baixando imagem de Maquina - API Crawler Python"
        sudo docker pull gogoncalves/api-crawler-sql-mysql:update
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Criando container com a imagem API Crawler Python"
        sudo docker run --network employee-mysql --name employee-python-container gogoncalves/api-crawler-sql-mysql:update
        clear
        sleep 12
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Baixando imagem de Maquina - API Kotlin"
        sudo docker pull gogoncalves/api-kotlin-looca-oshi:update
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Criando container com a imagem API Crawler Python"
        sudo docker run --network employee-mysql --name employee-kotlin-container gogoncalves/api-kotlin-looca-oshi:update
        clear
        echo "$(tput setaf 14)[Bot assistant]:$(tput setaf 7) Detalhamento dos Containers:"
        sudo docker images
        sleep 2
        sudo docker ps -a
        sleep 3
        clear
    ;;
esac
}

function final {

echo "$(tput setaf 8)[Bot assistant]:$(tput setaf 7) Programa finalizado!"

}

main
