~/bin/SandS.sh
export LANG=ja_JP.UTF-8
guake &
xcompmgr &
urxvtd -q -f -o &
xscreensaver -no-splash &
echo ${echo `LANG=C nmcli -t -f active,ssid dev wifi | grep yes | cut -d "'" -f 2`} >> hoheha.dat
case ${echo `LANG=C nmcli -t -f active,ssid dev wifi | grep yes | cut -d "'" -f 2`} in
    UECWireless,MMA*);
	export http_proxy=http://proxy.uec.ac.jp:8080
	export https_proxy=http://proxy.uec.ac.jp:8080
	export ftp_proxy=http://proxy.uec.ac.jp:8080
	export HTTP_PROXY=http://proxy.uec.ac.jp:8080
	export HTTPS_PROXY=http://proxy.uec.ac.jp:8080
	export FTP_PROXY=http://proxy.uec.ac.jp:8080
	;;
esac

exec awesome
