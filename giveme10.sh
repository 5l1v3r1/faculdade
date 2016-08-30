#!/bin/bash
#
# Luis Fernando
#
# pwx - jonatas fil

# CONFIG


Colors() {
Escape="\033";
  white="${Escape}[0m";
  RedF="${Escape}[31m";
  GreenF="${Escape}[32m";
  YellowF="${Escape}[33m";
  BlueF="${Escape}[34m";
  CyanF="${Escape}[36m";
Reset="${Escape}[0m";
}


#
#
# INSTALL
# 
#

/usr/bin/notify-send -t 5000 "Aguarde..."
 
# check if whois installation exists  
      clear 
      if [ -d $find ]; then
      Colors;
      echo [*][whois]:installation found!;

else

   Colors;
   echo ${RedF}[x]:[warning]:this script require whois installed to work ${Reset};
   echo ${GreenF}[!]${RedF}:${GreenF}[please wait]: Downloading from network... ${Reset};
   sleep 3
      apt-get install whois
fi
sleep 1
clear



 # check if dnsenum installation exists   
      if [ -d $find ]; then
      Colors;
      echo [*]:[dnsrecon]:installation found!;

else

   Colors;
   echo ${RedF}[x]:[warning]:this script require dnsrecon installed to work ${Reset};
   echo ${GreenF}[!]${RedF}:${GreenF}[please wait]: Downloading from network... ${Reset};
   sleep 3
      apt-get install dnsrecon
fi
sleep 1
clear

 # check if theharvester installation exists   
      if [ -d $find ]; then
      Colors;
      echo [*][theharvester]:installation found!;

else

   Colors;
   echo ${RedF}[x]:[warning]:this script require theharvester installed to work ${Reset};
   echo ${GreenF}[!]${RedF}:${GreenF}[please wait]: Downloading from network... ${Reset};
   sleep 3
      apt-get install theharvester
fi
sleep 1
clear

 # check if golismero installation exists   
      if [ -d $find ]; then
      Colors;
      echo [*]:[golismero]:installation found!;

else

   Colors;
   echo ${RedF}[x]:[warning]:this script require golismero installed to work ${Reset};
   echo ${GreenF}[!]${RedF}:${GreenF}[please wait]: Downloading from network... ${Reset};
   sleep 3
      apt-get install golismero
fi
sleep 1
clear

 # check if nikto installation exists   
      if [ -d $find ]; then
      Colors;
      echo [*]:[nikto]:installation found!;

else

   Colors;
   echo ${RedF}[x]:[warning]:this script require nikto installed to work ${Reset};
   echo ${GreenF}[!]${RedF}:${GreenF}[please wait]: Downloading from network... ${Reset};
   sleep 3
      apt-get install nikto
fi
sleep 1
clear


# MENU
Colors;
Principal () {
/usr/bin/notify-send -t 5000 "Bem vindo !"
cat <<!
     G I V E  M E  1 0
---------------------------#
1) - Verificar IP Externo  #
2) - Verificar Data/horas  #
3) - Whois em Dominio      #
4) - Analise em DNS        #
5) - Searching Emails      #
6) - Scan Vuln [golismero] #  
7) - Scan Vuln [Nikto]     #  
e) - Sair                  #
---------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
   1) sh_ext ;;
   2) sh_data ;; 
   3) sh_whois ;;
   4) sh_dns ;;	
   5) sh_email ;;
   6) sh_goli ;; 
   7) sh_nikto ;; 
   e) sh_sair ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; Principal ;;  
esac
}

# IP EXTERNO

Colors;
sh_ext () {

   Colors;
   clear
   echo [Aguarde, verificando seu ip externo...];
   sleep 3
   curl ifconfig.me
   /usr/bin/notify-send -t 5000 "verificação de ip externo [OK]"
   sleep 2
   echo -n "Deseja voltar para o menu de Opções ? (yes):"
   read yes
   clear
   sh_Principal
}

# DATA

Colors;
sh_data () {

   Colors;
   clear
   echo [Aguarde, verificando as horas e a data de hoje...];
   sleep 3
   clear
   /usr/bin/notify-send -t 5000 "verificação de Data e horario [OK]"
   echo "Data/horario de hoje: "
   date
   sleep 2
   echo -n "Deseja voltar para o menu de Opções ? (yes):"
   read yes
   clear
   sh_Principal

}

# WHOIS

Colors;
sh_whois () {

   Colors;
   clear
   echo [Aguarde, o Whois está sendo preparado...];
   sleep 3
   clear
   /usr/bin/notify-send -t 5000 "Inicialização do whois [OK]"
   echo -n "Digite o dominio :"
   read domin
   whois $domin
   sleep 2
   echo -n "Deseja voltar para o menu de Opções? (yes):"
   read yes
   clear
   sh_Principal

}

# DNS

Colors;
sh_dns () {

   Colors;
   clear
   echo [Aguarde, o dnsrecon está sendo preparado...];
   sleep 3
   clear
   /usr/bin/notify-send -t 5000 "Inicialização do dnsrecon [OK]"   
   echo -n "Digite o dominio :"
   read dominio
   echo -n "Digite o nome do arquivo output [.xml]: [output.xml]"
   read output
   dnsrecon -d $dominio --xml $output
   sleep 2
   echo "O relatorio está salvo no arquivo do output...[$output]"
   sleep 2
   echo -n "Deseja voltar para o menu de Opções? (yes):"
   read yes
   clear
   sh_Principal

}

  
# EMAIL

Colors;
sh_email () {

   Colors;
   clear
   echo [Aguarde, o theharvester está sendo preparado...];
   sleep 3
   clear
   /usr/bin/notify-send -t 5000 "Inicialização do theharvester [OK]"
   echo -n "Digite o dominio :"
   read domi
   echo -n "Digite o nome do arquivo output: [output.txt]"
   read output
   theharvester -d $domi -l 500 -b all -f $output
   sleep 2
   echo "O relatorio está salvo no arquivo do output...[$output]"
   sleep 2
   echo -n "Deseja voltar para o menu de Opções? (yes):"
   read yes
   clear
   sh_Principal

}

# golismero

Colors;
sh_goli () {

   Colors;
   clear
   echo [Aguarde, o golismero está sendo preparado...];
   sleep 3
   clear
   /usr/bin/notify-send -t 5000 "Inicialização do golismero [OK]"
   echo -n "Digite o alvo :"
   read alvo
   echo -n "Digite o nome do arquivo output: [output.txt]"
   read output
   golismero scan $alvo -o $output
   sleep 2
   echo "O relatorio está salvo no arquivo do output...[$output]"
   sleep 2
   echo -n "Deseja voltar para o menu de Opções? (yes):"
   read yes
   clear
   sh_Principal

}

# nikto

Colors;
sh_nikto () {

   Colors;
   clear
   echo [Aguarde, o nikto está sendo preparado...];
   sleep 3
   clear
   /usr/bin/notify-send -t 5000 "Inicialização do nikto [OK]"
   echo -n "Digite o alvo :"
   read alvo
   echo -n "Digite o nome do arquivo output: [output.txt]"
   read output
   nikto -h $alvo » $output
   sleep 2
   echo "O relatorio está salvo no arquivo do output...[$output]"
   sleep 2
   echo -n "Deseja voltar para o menu de Opções? (yes):"
   read yes
   clear
   sh_Principal

}

# SAIR
sh_sair () {
   clear
   echo "Saindo..."
   /usr/bin/notify-send -t 5000 "Saindo do script..."
   sleep 2
clear
exit
}
Principal
