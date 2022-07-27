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
function get4ginfo(){
$.ajax({
       url: "/cgi-bin/get4ginfo.sh",
       type: "POST",
       cache: false,
       //data: form,
       processData:false,
       contentType:false,
       success: function(json) {
         //$("#used_byte").html("0");
         }
       });
}

$(window).on('load', function () {
  get4ginfo();
        });
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
                    if [ "`ifconfig wlan0 |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                    echo "<tr>"
										echo "<td >WWAN</td>"
										echo "<td>"
                    ubus call network.interface.wwan status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td><td>"
                    ubus call network.interface.wwan status |grep "uptime" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td></tr>"
                    fi
                    %>
                    <%
                    if [ "`ubus call network.interface.4g status |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                    echo "<tr>"
										echo "<td >4G</td>"
										echo "<td>"
                    ubus call network.interface.4g status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td><td>"
                    ubus call network.interface.4g status |grep "uptime" |cut -d: -f2 |tr -d "\"\, "
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
                    if [ "`ifconfig l2tp-l2tp |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                    echo "<tr>"
                    echo "<td >L2TP</td>"
                    echo "<td>"
                    ubus call network.interface.l2tp status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "
                    echo "</td><td>"
                    ubus call network.interface.l2tp status |grep "uptime" |cut -d: -f2 |tr -d "\"\, "
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
               
                sim1=$(uci get 4g.modem1.sim_status)
                sim2=$(uci get 4g.modem2.sim_status)
  
                sig1=$(uci get 4g.modem1.rssi)
                sig2=$(uci get 4g.modem2.rssi)
                
  
                get_ip(){
                if [ "`ubus call network.interface.$1 status |grep -E  '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`" ];then
                echo `ubus call network.interface.$1 status |grep "\"address\":" |cut -d: -f2 |tr -d "\"\, "`
                else
                echo "Not connect!"
                fi
                }
                ip1=`get_ip lte1`
                ip2=`get_ip lte2`
                
                model1=`uci get 4g.modem1.model`
                model2=`uci get 4g.modem2.model`
  
                imei1=`uci get 4g.modem1.imei`
                imei2=`uci get 4g.modem2.imei`

                imsi1=`uci get 4g.modem1.imsi`
                imsi2=`uci get 4g.modem2.imsi`
  
                iccid1=`uci get 4g.modem1.iccid`
                iccid2=`uci get 4g.modem2.iccid`
                get_traffic(){
                  device=`uci get network.$1.device`
                  rx_byte=`cat /proc/net/dev|grep  $device|awk '{print $2}'`
                  tx_byte=`cat /proc/net/dev|grep  $device|awk '{print $10}'`
                  echo $(($rx_byte + $tx_byte))
                }
                %>
                <tr>
                    <td  width="10%" ></td>
                    <td>Modem 1</td>
                    <td>Modem 2</td>
                </tr>
                      <tr>
                          <td >SIM</td>
                          <td><%= $sim1 %></td>
                          <td><%= $sim2 %></td>
                      </tr>
                      <tr>
                          <td ><%= $sig%></td>
                          <td><%= $sig1 %></td>
                          <td><%= $sig2 %></td>
                      </tr>
                      <tr>
                          <td >IP</td>
                          <td><%= $ip1 %></td>
                          <td><%= $ip2 %></td>
                      </tr>
                    <tr></tr>
                      <tr>
                        <td>Model</td>
                        <td><%= $model1 %></td>
                        <td><%= $model2 %></td>
                    </tr>
                    <tr>
                      <td>IMEI</td>
                      <td><%= $imei1 %></td>
                      <td><%= $imei2 %></td>
                  </tr>
                    <tr>
                      <td>IMSI</td>
                      <td><%= $imsi1 %></td>
                      <td><%= $imsi2 %></td>
                  </tr>
                  <tr>
                    <td>ICCID</td>
                    <td><%= $iccid1 %></td>
                    <td><%= $iccid2 %></td>
                </tr>
                      <tr>
                          <td ><%= $used_byte%></td>
                          <td id="used_byte" ><%= `get_traffic lte1 2>/dev/null` %></td>
                          <td id="used_byte" ><%= `get_traffic lte2 2>/dev/null` %></td>
                        </tr>
                </table>
						</div>
				</div>
		</div>
</div>
</body>
</html>

