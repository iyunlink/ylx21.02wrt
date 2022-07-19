#!/bin/sh
set +e

ttydev1="`uci get 4g.modem1.device`"
ttydev2="`uci get 4g.modem2.device`"

pid1="`uci get 4g.modem1.device`"
pid2="`uci get 4g.modem2.device`"


vidpid1="`uci get 4g.modem1.vidpid`"
vidpid2="`uci get 4g.modem2.vidpid`"

setmodem1info(){
  uci set 4g.modem1.sim_status=`at_tool "AT+CPIN?" -d $ttydev1|grep "CPIN:"|cut -d" " -f2|tr -d ' \r\n'`
  uci set 4g.modem1.rssi=`at_tool "AT+CSQ" -d $ttydev1|grep  "^+CSQ"|cut -d, -f1|cut -d" " -f2|tr -d ' \r\n'`
  case $vidpid1 in
    V12d1P1506|V2eccP3010)
      uci set 4g.modem1.iccid=`at_tool "AT^ICCID?" -d $ttydev1|grep -E "[0-9A-Fa-f]{20}"|cut -d" " -f2|tr -d "\r\n"`
      uci set 4g.modem1.imei=`at_tool "AT+CGSN" -d $ttydev1|grep -E "^[0-9A-Fa-f]{15}"|cut -d "\"" -f2|tr -d "\r\n"`
      uci set 4g.modem1.imsi=`at_tool "AT+CIMI" -d $ttydev1|grep -E "^[0-9A-Fa-f]{15}"|tr -d "\r\n"`
      ;;
    V19d2P0199)
      uci set 4g.modem1.iccid=`at_tool "AT+ZICCID?" -d $ttydev1|grep -E "[0-9A-Fa-f]{20}"|awk '{print $2}'`
      uci set 4g.modem1.imsi=`at_tool "AT+CIMI" -d $ttydev1|grep -E "[0-9A-Fa-f]{15}"|awk '{print $2}'`
      uci set 4g.modem1.imei=`at_tool "AT+CGSN" -d $ttydev1|grep -E "[0-9A-Fa-f]{15}"|awk '{print $2}'`
      ;;
    *)
      uci set 4g.modem1.iccid=`at_tool "AT+ICCID" -d $ttydev1|grep -E "[0-9A-Fa-f]{20}"|cut -d" " -f2|tr -d "\r\n"`
      uci set 4g.modem1.imei=`at_tool "AT+CGSN" -d $ttydev1|grep -E "^[0-9A-Fa-f]{15}"|cut -d "\"" -f2|tr -d "\r\n"`
      uci set 4g.modem1.imsi=`at_tool "AT+CIMI" -d $ttydev1|grep -E "^[0-9A-Fa-f]{15}"|tr -d "\r\n"`
    ;;
  esac
}

setmodem2info(){
  uci set 4g.modem2.sim_status=`at_tool "AT+CPIN?" -d $ttydev2|grep "CPIN:"|cut -d" " -f2|tr -d ' \r\n'`
  uci set 4g.modem2.rssi=`at_tool "AT+CSQ" -d $ttydev2|grep  "^+CSQ"|cut -d, -f1|cut -d" " -f2|tr -d ' \r\n'`
   case $vidpid2 in
    V12d1P1506|V2eccP3010)
      uci set 4g.modem2.iccid=`at_tool "AT^ICCID?" -d $ttydev2|grep -E "[0-9A-Fa-f]{20}"|cut -d" " -f2|tr -d "\r\n"`
      uci set 4g.modem2.imei=`at_tool "AT+CGSN" -d $ttydev2|grep -E "^[0-9A-Fa-f]{15}"|cut -d "\"" -f2|tr -d "\r\n"`
      uci set 4g.modem2.imsi=`at_tool "AT+CIMI" -d $ttydev2|grep -E "^[0-9A-Fa-f]{15}"|tr -d "\r\n"`
      ;;
    V19d2P0199)
      uci set 4g.modem2.iccid=`at_tool "AT+ZICCID?" -d $ttydev2|grep -E "[0-9A-Fa-f]{20}"|awk '{print $2}'`
      uci set 4g.modem2.imsi=`at_tool "AT+CIMI" -d $ttydev2|grep -E "[0-9A-Fa-f]{15}"|awk '{print $2}'`
      uci set 4g.modem2.imei=`at_tool "AT+CGSN" -d $ttydev2|grep -E "[0-9A-Fa-f]{15}"|awk '{print $2}'`
      ;;
    *)
      uci set 4g.modem2.iccid=`at_tool "AT+ICCID" -d $ttydev2|grep -E "[0-9A-Fa-f]{20}"|cut -d" " -f2|tr -d "\r\n"`
      uci set 4g.modem2.imei=`at_tool "AT+CGSN" -d $ttydev2|grep -E "^[0-9A-Fa-f]{15}"|cut -d "\"" -f2|tr -d "\r\n"`
      uci set 4g.modem2.imsi=`at_tool "AT+CIMI" -d $ttydev2|grep -E "^[0-9A-Fa-f]{15}"|tr -d "\r\n"`
    ;;
  esac
}

setmodem1info
setmodem2info
uci commit 4g
