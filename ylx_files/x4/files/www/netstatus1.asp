#!/usr/bin/haserl
<%
eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login1.asp" -t $(uci get gargoyle.global.session_timeout) -b "$COOKIE_browser_time"  )
#echo ""
lang=`uci get gargoyle.global.lang`
. /www/data/lang/$lang/netstatus.po
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Main page</title>
<script type="text/javascript" src="/jjs/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/form.css" />
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/table.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script type="text/javascript">

function reloadmodem(){
  $.ajax({
       url: "/cgi-bin/reloadmodem.sh",
       type: "POST",
       cache: false,
       //data: form,
       processData:false,
       contentType:false,
       success: function(json) {
           window.location.reload();
         }
       });
}

function myrefresh() 
{ 

       window.location.reload();
} 

</script>

</head>
<body>
<div class="current"><%= $location%></div>
<div class="wrap-main" style="position: relative;min-height: 100%">
		<div class="wrap">
				<div class="title"><%= $wan_status%></div>
				<div class="wrap-table">
						<table border="0" cellspacing="0" cellpadding="0" >
									<tr>
												<td ><%= $wan_if%></td>
												<td><%= $ip_addr%></td>
												<td ><%= $run_time%></td>
									</tr>
									<tr>
												<td >WAN</td>
												<td><%= `ubus call network.interface.wan status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "` %></td>
												<td><%= `ubus call network.interface.wan status |grep "uptime" |cut -d: -f2 |tr -d "\"\, "` %></td>
										</tr>
                    <%
                    if [ "`ifconfig wlan00 |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                    echo "<tr>"
										echo "<td >WWANA</td>"
										echo "<td>"
                    ubus call network.interface.wwanA status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td><td>"
                    ubus call network.interface.wwanA status |grep "uptime" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td></tr>"
                    fi
                    %>
                    <%
                    if [ "`ifconfig wlan11 |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                    echo "<tr>"
										echo "<td >WWANB</td>"
										echo "<td>"
                    ubus call network.interface.wwanB status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td><td>"
                    ubus call network.interface.wwanB status |grep "uptime" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td></tr>"
                    fi
                    %>
                    <%
                    if [ "`ifconfig pptp-pptp |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                    echo "<tr>"
                    echo "<td >PPTP</td>"
                    echo "<td>"
                    ubus call network.interface.pptp status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td><td>"
                    ubus call network.interface.pptp status |grep "uptime" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td></tr>"
                    fi
                    %>
                    <%
                    if [ "`ifconfig tun0 |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                    echo "<tr>"
                    echo "<td >TUN0</td>"
                    echo "<td>"
                    ifconfig tun0 |grep inet |cut -d: -f2 |cut -d" " -f1
                    echo "</td><td>"
                    echo "unkown"
                    echo "</td></tr>"
                    fi
                    %>
								</table>
					<div class="title"><%= $modem_info%></div>
						<div class="wrap-table">
						<table border="0" cellspacing="0" cellpadding="0" >
              <%
             
              sim1=$(uci get /tmp/lte_info.card1.sim_status)
              sim2=$(uci get /tmp/lte_info.card2.sim_status)
              sim3=$(uci get /tmp/lte_info.card3.sim_status)
              sim4=$(uci get /tmp/lte_info.card4.sim_status)

              operator1=$(uci get /tmp/lte_info.card1.operater)
              operator2=$(uci get /tmp/lte_info.card2.operater)
              operator3=$(uci get /tmp/lte_info.card3.operater)
              operator4=$(uci get /tmp/lte_info.card4.operater)

               
              if uci get /tmp/lte_info.card1.signal |grep '^[[:digit:]]*$' > /dev/null;then
                sig1=$((`uci get /tmp/lte_info.card1.signal` * 100/31))
                  if [ $sig1 -gt 100  ];then
                  sig1=ERROR
                  else
                  sig1=$sig1%
                  fi
                else
                sig1=
              fi
              if uci get /tmp/lte_info.card2.signal |grep '^[[:digit:]]*$' > /dev/null;then
                sig2=$((`uci get /tmp/lte_info.card2.signal` * 100/31))
                  if [ $sig2 -gt 100  ];then
                  sig2=ERROR
                  else
                  sig2=$sig2%
                  fi
                else
                sig2=
              fi
              if uci get /tmp/lte_info.card3.signal |grep '^[[:digit:]]*$' > /dev/null;then
                sig3=$((`uci get /tmp/lte_info.card3.signal` * 100/31))
                  if [ $sig3 -gt 100  ];then
                  sig3=ERROR
                  else
                  sig3=$sig3%
                  fi
                else
                sig3=
              fi
              if uci get /tmp/lte_info.card4.signal |grep '^[[:digit:]]*$' > /dev/null;then
                sig4=$((`uci get /tmp/lte_info.card4.signal` * 100/31))
                  if [ $sig4 -gt 100  ];then
                  sig4=ERROR
                  else
                  sig4=$sig4%
                  fi
                else
                sig4=
              fi

              get_ip(){
              if [ "`ubus call network.interface.$1 status |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
              echo `ubus call network.interface.$1 status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "`
              else
              echo "Not connect!"
              fi
              }
              ip1=`get_ip lte1`
              ip2=`get_ip lte2`
              ip3=`get_ip lte3`
              ip4=`get_ip lte4`
              used(){
                rx=$(cat /sys/class/net/$1/statistics/rx_bytes)
                tx=$(cat /sys/class/net/$1/statistics/tx_bytes)
                total=$(($rx + $tx))
                if [ $total -ge 1000000 ];then
                 rx=`awk -v x=$total  'BEGIN{printf "%.1fMB",x/1000000}'`
                 echo $rx
                elif [ $total -ge 1000 ]; then
                 rx=`awk -v x=$total  'BEGIN{printf "%dKB",x/1000}'`
                 echo $rx
                else
                 rx=`awk -v x=$total   'BEGIN{printf "%dKB",x/1000}'`
                 echo $rx
                fi
              }
                 used1=`used $(uci get network.lte1.device)`
                 used2=`used $(uci get network.lte2.device)`
                 used3=`used $(uci get network.lte3.device)`
                 used4=`used $(uci get network.lte4.device)`
                 
                 model1=`uci get /tmp/lte_info.card1.manu`
                 model2=`uci get /tmp/lte_info.card2.manu`
                 model3=`uci get /tmp/lte_info.card3.manu`
                 model4=`uci get /tmp/lte_info.card4.manu`

                 imei1=`uci get /tmp/lte_info.card1.imei`
                 imei2=`uci get /tmp/lte_info.card2.imei`
                 imei3=`uci get /tmp/lte_info.card3.imei`
                 imei4=`uci get /tmp/lte_info.card4.imei`

                 imsi1=`uci get /tmp/lte_info.card1.imsi`
                 imsi2=`uci get /tmp/lte_info.card2.imsi`
                 imsi3=`uci get /tmp/lte_info.card3.imsi`
                 imsi4=`uci get /tmp/lte_info.card4.imsi`

                 iccid1=`uci get /tmp/lte_info.card1.iccid`
                 iccid2=`uci get /tmp/lte_info.card2.iccid`
                 iccid3=`uci get /tmp/lte_info.card3.iccid`
                 iccid4=`uci get /tmp/lte_info.card4.iccid`

                 . /sbin/band.sh
              %>
              <tr>
                  <td  width="10%" ></td>
                  <td>Modem 1</td>
                  <td>Modem 2</td>
                  <td>Modem 3</td>
                  <td>Modem 4</td>
              </tr>
										<tr>
												<td >SIM</td>
                        <td><%= $sim1 %></td>
                        <td><%= $sim2 %></td>
                        <td><%= $sim3 %></td>
                        <td><%= $sim4 %></td>
                    </tr>
                    <tr>
                      <td >Operator</td>
                      <td><%= $operator1 %></td>
                      <td><%= $operator2 %></td>
                      <td><%= $operator3 %></td>
                      <td><%= $operator4 %></td>
                  </tr>
                  <tr>
                    <td >Net Type</td>
                    <td><% uci -q get /tmp/lte_info.card1.net_type %></td>
                    <td><% uci -q get /tmp/lte_info.card2.net_type %></td>
                    <td><% uci -q get /tmp/lte_info.card3.net_type %></td>
                    <td><% uci -q get /tmp/lte_info.card4.net_type %></td>
                </tr>
										<tr>
												<td ><%= $sig%></td>
                        <td><%= $sig1 %></td>
                        <td><%= $sig2 %></td>
                        <td><%= $sig3 %></td>
                      <td><%= $sig4 %></td>
                    </tr>
										<tr>
												<td >IP</td>
                        <td><%= $ip1 %></td>
                        <td><%= $ip2 %></td>
                        <td><%= $ip3 %></td>
                      <td><%= $ip4 %></td>
                    </tr>
										<tr>
                      <td >Used</td>
                      <td><%= $used1 %></td>
                      <td><%= $used2 %></td>
                      <td><%= $used3 %></td>
                    <td><%= $used4 %></td>
                  </tr>
                  <tr></tr>
										<tr>
                      <td>Model</td>
                      <td><%= $model1 %></td>
                      <td><%= $model2 %></td>
                      <td><%= $model3 %></td>
                      <td><%= $model4 %></td>
                  </tr>
                  <tr>
                    <td>IMEI</td>
                    <td><%= $imei1 %></td>
                    <td><%= $imei2 %></td>
                    <td><%= $imei3 %></td>
                    <td><%= $imei4 %></td>
                </tr>
                  <tr>
                    <td>IMSI</td>
                    <td><%= $imsi1 %></td>
                    <td><%= $imsi2 %></td>
                    <td><%= $imsi3 %></td>
                    <td><%= $imsi4 %></td>
                </tr>
                <tr>
                  <td>ICCID</td>
                  <td><%= $iccid1 %></td>
                  <td><%= $iccid2 %></td>
                  <td><%= $iccid3 %></td>
                  <td><%= $iccid4 %></td>
              </tr>
              <tr>
                <td>BAND</td>
                <td><%= $band1 %></td>
                <td><%= $band2 %></td>
                <td><%= $band3 %></td>
                <td><%= $band4 %></td>
            </tr>
										<!-- <tr>
												<td ><%= $used_byte%></td>
												<td id="used_byte"  colspan="2"><%= `uci get 4g.modem.4g_byte 2>/dev/null` %></td>
                        </tr> -->
							</table>
              <br />
              <div ><p style="display:inline;color:#e81717;font-size:large;margin-left: 100px;" id="status"></p></div>
              <div class="btn-wrap">
              <div class="save-btn fr"><a href="javascript:myrefresh()"><%= $refresh%></a></div>
              <div class="save-btn fr"><a href="javascript:reloadmodem()">Reload Modems</a></div>
            </div>
						</div>
				</div>
		</div>
</div>
</body>
</html>

