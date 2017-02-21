<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditCount.ascx.cs" Inherits="DesktopModules_CountDownUp_EditCount" %>
<table id="Table1" style="height:449px" cellspacing="1" cellpadding="1" width="500" border="0">
		<tbody>
			<tr>
				<td><asp:label id="lblDisplayText1" runat="server" style="font-weight: 700">Display Text (During Countdown):</asp:label></td>
				<td><asp:textbox id="txtCountdownText" runat="server"  Width="186px"></asp:textbox></td>
			</tr>
			<tr>
				<td><asp:label id="lblDisplayText2" runat="server" style="font-weight: 700">Display Text (Countdown Expired):</asp:label></td>
				<td><asp:textbox id="txtExpired" runat="server" Width="186px"></asp:textbox></td>
			</tr>
			<tr>
				<td><b>Day Text:</b></td>
				<td>
                    <asp:TextBox ID="txtDay" runat="server" Width="186px"></asp:TextBox>
                </td>
			</tr>
			<tr>
				<td><b>Hour Text:</b></td>
				<td>
                    <asp:TextBox ID="txtHour" runat="server" Width="186px"></asp:TextBox>
                </td>
			</tr>
			<tr>
				<td><b>Minute Text:</b></td>
				<td>
                    <asp:TextBox ID="txtMinute" runat="server" Width="186px"></asp:TextBox>
                </td>
			</tr>
			<tr>
				<td><b>Second Text:</b></td>
				<td>
                    <asp:TextBox ID="txtSecond" runat="server" Width="186px"></asp:TextBox>
                </td>
			</tr>
			<tr>
				<td>
					<asp:Label id="lblStopTimer" runat="server" style="font-weight: 700">Stop Timer After Target Date Reached:</asp:Label></td>
				<td>
					<asp:CheckBox id="chkExpire" runat="server"></asp:CheckBox></td>
			</tr>
			<tr>
				<td><asp:label id="lblTargetDate" runat="server" 
                        style="font-weight: 700; text-decoration: underline"> Target Date</asp:label></td>
				<td></td>
			</tr>
			<tr>
				<td id="TD1"><asp:label id="lblYear" runat="server" style="font-weight: 700">Year:</asp:label></td>
				<td><asp:dropdownlist id="listYear" runat="server" Width="186px">
						<asp:ListItem Value="2009">2009</asp:ListItem>
						<asp:ListItem Value="2010">2010</asp:ListItem>
						<asp:ListItem Value="2011">2011</asp:ListItem>
						<asp:ListItem Value="2012">2012</asp:ListItem>
						<asp:ListItem Value="2013">2013</asp:ListItem>
						<asp:ListItem Value="2014">2014</asp:ListItem>
						<asp:ListItem Value="2015">2015</asp:ListItem>
						<asp:ListItem Value="2016">2016</asp:ListItem>
						<asp:ListItem Value="2017">2017</asp:ListItem>
						<asp:ListItem Value="2018">2018</asp:ListItem>
						<asp:ListItem Value="2019">2019</asp:ListItem>
						<asp:ListItem Value="2020">2020</asp:ListItem>
					</asp:dropdownlist></td>
			</tr>
			<tr>
				<td><b><asp:label id="lblMonth" runat="server"> Month:</asp:label></b>&nbsp;</td>
				<td><asp:dropdownlist id="listMonth" runat="server" Width="186px">
						<asp:ListItem Value="1">January</asp:ListItem>
						<asp:ListItem Value="2">February</asp:ListItem>
						<asp:ListItem Value="3">March</asp:ListItem>
						<asp:ListItem Value="4">April</asp:ListItem>
						<asp:ListItem Value="5">May</asp:ListItem>
						<asp:ListItem Value="6">June</asp:ListItem>
						<asp:ListItem Value="7">July</asp:ListItem>
						<asp:ListItem Value="8">August</asp:ListItem>
						<asp:ListItem Value="9">September</asp:ListItem>
						<asp:ListItem Value="10">October</asp:ListItem>
						<asp:ListItem Value="11">November</asp:ListItem>
						<asp:ListItem Value="12">December</asp:ListItem>
					</asp:dropdownlist></td>
			</tr>
			<tr>
				<td><asp:label id="lblDay" runat="server" style="font-weight: 700"> Day:</asp:label></td>
				<td><asp:dropdownlist id="listDay" runat="server" Width="186px">
						<asp:ListItem Value="1">1</asp:ListItem>
						<asp:ListItem Value="2">2</asp:ListItem>
						<asp:ListItem Value="3">3</asp:ListItem>
						<asp:ListItem Value="4">4</asp:ListItem>
						<asp:ListItem Value="5">5</asp:ListItem>
						<asp:ListItem Value="6">6</asp:ListItem>
						<asp:ListItem Value="7">7</asp:ListItem>
						<asp:ListItem Value="8">8</asp:ListItem>
						<asp:ListItem Value="9">9</asp:ListItem>
						<asp:ListItem Value="10">10</asp:ListItem>
						<asp:ListItem Value="11">11</asp:ListItem>
						<asp:ListItem Value="12">12</asp:ListItem>
						<asp:ListItem Value="13">13</asp:ListItem>
						<asp:ListItem Value="14">14</asp:ListItem>
						<asp:ListItem Value="15">15</asp:ListItem>
						<asp:ListItem Value="16">16</asp:ListItem>
						<asp:ListItem Value="17">17</asp:ListItem>
						<asp:ListItem Value="18">18</asp:ListItem>
						<asp:ListItem Value="19">19</asp:ListItem>
						<asp:ListItem Value="20">20</asp:ListItem>
						<asp:ListItem Value="21">21</asp:ListItem>
						<asp:ListItem Value="22">22</asp:ListItem>
						<asp:ListItem Value="23">23</asp:ListItem>
						<asp:ListItem Value="24">24</asp:ListItem>
						<asp:ListItem Value="25">25</asp:ListItem>
						<asp:ListItem Value="26">26</asp:ListItem>
						<asp:ListItem Value="27">27</asp:ListItem>
						<asp:ListItem Value="28">28</asp:ListItem>
						<asp:ListItem Value="29">29</asp:ListItem>
						<asp:ListItem Value="30">30</asp:ListItem>
						<asp:ListItem Value="31">31</asp:ListItem>
					</asp:dropdownlist></td>
			</tr>
			<tr>
				<td><b><asp:label id="lblHour" runat="server">Hour(s)</asp:label>&nbsp;:
					<asp:label id="lblMinute" runat="server">Minute(s):</asp:label></b></td>
				<td><asp:dropdownlist id="listHour" runat="server" Width="40px">
						<asp:ListItem Value="00">00</asp:ListItem>
						<asp:ListItem Value="01">01</asp:ListItem>
						<asp:ListItem Value="02">02</asp:ListItem>
						<asp:ListItem Value="03">03</asp:ListItem>
						<asp:ListItem Value="04">04</asp:ListItem>
						<asp:ListItem Value="05">05</asp:ListItem>
						<asp:ListItem Value="06">06</asp:ListItem>
						<asp:ListItem Value="07">07</asp:ListItem>
						<asp:ListItem Value="08">08</asp:ListItem>
						<asp:ListItem Value="09">09</asp:ListItem>
						<asp:ListItem Value="10">10</asp:ListItem>
						<asp:ListItem Value="11">11</asp:ListItem>
						<asp:ListItem Value="12">12</asp:ListItem>
						<asp:ListItem Value="13">13</asp:ListItem>
						<asp:ListItem Value="14">14</asp:ListItem>
						<asp:ListItem Value="15">15</asp:ListItem>
						<asp:ListItem Value="16">16</asp:ListItem>
						<asp:ListItem Value="17">17</asp:ListItem>
						<asp:ListItem Value="18">18</asp:ListItem>
						<asp:ListItem Value="19">19</asp:ListItem>
						<asp:ListItem Value="20">20</asp:ListItem>
						<asp:ListItem Value="21">21</asp:ListItem>
						<asp:ListItem Value="22">22</asp:ListItem>
						<asp:ListItem Value="23">23</asp:ListItem>
					</asp:dropdownlist>&nbsp;:
					<asp:dropdownlist id="listMinute" runat="server" Width="40px">
						<asp:ListItem Value="00">00</asp:ListItem>
						<asp:ListItem Value="01">01</asp:ListItem>
						<asp:ListItem Value="02">02</asp:ListItem>
						<asp:ListItem Value="03">03</asp:ListItem>
						<asp:ListItem Value="04">04</asp:ListItem>
						<asp:ListItem Value="05">05</asp:ListItem>
						<asp:ListItem Value="06">06</asp:ListItem>
						<asp:ListItem Value="07">07</asp:ListItem>
						<asp:ListItem Value="08">08</asp:ListItem>
						<asp:ListItem Value="09">09</asp:ListItem>
						<asp:ListItem Value="10">10</asp:ListItem>
						<asp:ListItem Value="11">11</asp:ListItem>
						<asp:ListItem Value="12">12</asp:ListItem>
						<asp:ListItem Value="13">13</asp:ListItem>
						<asp:ListItem Value="14">14</asp:ListItem>
						<asp:ListItem Value="15">15</asp:ListItem>
						<asp:ListItem Value="16">16</asp:ListItem>
						<asp:ListItem Value="17">17</asp:ListItem>
						<asp:ListItem Value="18">18</asp:ListItem>
						<asp:ListItem Value="19">19</asp:ListItem>
						<asp:ListItem Value="20">20</asp:ListItem>
						<asp:ListItem Value="21">21</asp:ListItem>
						<asp:ListItem Value="22">22</asp:ListItem>
						<asp:ListItem Value="23">23</asp:ListItem>
						<asp:ListItem Value="24">24</asp:ListItem>
						<asp:ListItem Value="25">25</asp:ListItem>
						<asp:ListItem Value="26">26</asp:ListItem>
						<asp:ListItem Value="27">27</asp:ListItem>
						<asp:ListItem Value="28">28</asp:ListItem>
						<asp:ListItem Value="29">29</asp:ListItem>
						<asp:ListItem Value="30">30</asp:ListItem>
						<asp:ListItem Value="31">31</asp:ListItem>
						<asp:ListItem Value="32">32</asp:ListItem>
						<asp:ListItem Value="33">33</asp:ListItem>
						<asp:ListItem Value="34">34</asp:ListItem>
						<asp:ListItem Value="35">35</asp:ListItem>
						<asp:ListItem Value="36">36</asp:ListItem>
						<asp:ListItem Value="37">37</asp:ListItem>
						<asp:ListItem Value="38">38</asp:ListItem>
						<asp:ListItem Value="39">39</asp:ListItem>
						<asp:ListItem Value="40">40</asp:ListItem>
						<asp:ListItem Value="41">41</asp:ListItem>
						<asp:ListItem Value="42">42</asp:ListItem>
						<asp:ListItem Value="43">43</asp:ListItem>
						<asp:ListItem Value="44">44</asp:ListItem>
						<asp:ListItem Value="45">45</asp:ListItem>
						<asp:ListItem Value="46">46</asp:ListItem>
						<asp:ListItem Value="47">47</asp:ListItem>
						<asp:ListItem Value="48">48</asp:ListItem>
						<asp:ListItem Value="49">49</asp:ListItem>
						<asp:ListItem Value="50">50</asp:ListItem>
						<asp:ListItem Value="51">51</asp:ListItem>
						<asp:ListItem Value="52">52</asp:ListItem>
						<asp:ListItem Value="53">53</asp:ListItem>
						<asp:ListItem Value="54">54</asp:ListItem>
						<asp:ListItem Value="55">55</asp:ListItem>
						<asp:ListItem Value="56">56</asp:ListItem>
						<asp:ListItem Value="57">57</asp:ListItem>
						<asp:ListItem Value="58">58</asp:ListItem>
						<asp:ListItem Value="59">59</asp:ListItem>
					</asp:dropdownlist></td>
			</tr>
			<tr>
				<td><asp:label id="lblTimeZone" runat="server" style="font-weight: 700">Timezone (GMT):</asp:label></td>
				<td><asp:dropdownlist id="listTimeZone" runat="server">
						<asp:ListItem Value="-12">-12</asp:ListItem>
						<asp:ListItem Value="-11">-11</asp:ListItem>
						<asp:ListItem Value="-10">-10</asp:ListItem>
						<asp:ListItem Value="-9">-9</asp:ListItem>
						<asp:ListItem Value="-8">-8</asp:ListItem>
						<asp:ListItem Value="-7">-7</asp:ListItem>
						<asp:ListItem Value="-6">-6</asp:ListItem>
						<asp:ListItem Value="-5">-5</asp:ListItem>
						<asp:ListItem Value="-4">-4</asp:ListItem>
						<asp:ListItem Value="-3">-3</asp:ListItem>
						<asp:ListItem Value="-2">-2</asp:ListItem>
						<asp:ListItem Value="-1">-1</asp:ListItem>
						<asp:ListItem Value="0">0</asp:ListItem>
						<asp:ListItem Value="+1">+1</asp:ListItem>
						<asp:ListItem Value="+2">+2</asp:ListItem>
						<asp:ListItem Value="+3">+3</asp:ListItem>
						<asp:ListItem Value="+4">+4</asp:ListItem>
						<asp:ListItem Value="+5">+5</asp:ListItem>
						<asp:ListItem Value="+6">+6</asp:ListItem>
						<asp:ListItem Value="+7">+7</asp:ListItem>
						<asp:ListItem Value="+8">+8</asp:ListItem>
						<asp:ListItem Value="+9">+9</asp:ListItem>
						<asp:ListItem Value="+10">+10</asp:ListItem>
						<asp:ListItem Value="+11">+11</asp:ListItem>
						<asp:ListItem Value="+12">+12</asp:ListItem>
						<asp:ListItem Value="+13">+13</asp:ListItem>
					</asp:dropdownlist></td>
			</tr>
			<tr>
				<td><asp:label id="lblTimeMode" runat="server" style="font-weight: 700">Server/Client Clock:</asp:label></td>
				<td><asp:radiobutton id="rbutServerSide" runat="server" Text="Server" GroupName="time" Checked="True"></asp:radiobutton></td>
			</tr>
			<tr>
				<td></td>
				<td><asp:radiobutton id="rbutClientSide" runat="server" Text="Client" GroupName="time"></asp:radiobutton></td>
			</tr>
			<tr>
				<td><asp:label id="lblImgSource" runat="server" style="font-weight: 700">Image Source:</asp:label></td>
				<td><asp:textbox id="TxtImgSrc" runat="server"  Width="186px">/images/</asp:textbox></td>
			</tr>
			<tr>
				<td><asp:label id="lblImgPrefix" runat="server" style="font-weight: 700">Image Prefix:</asp:label></td>
				<td><asp:textbox id="txtImgPrefix" runat="server"  Width="186px">CntDwn</asp:textbox></td>
			</tr>
			<tr>
				<td><asp:label id="lblImgExtension" runat="server" style="font-weight: 700">Image Extension:</asp:label></td>
				<td><asp:textbox id="txtImgExt" runat="server"  Width="186px">.gif</asp:textbox></td>
			</tr>
			<tr>
				<td><asp:label id="lblScriptSrc" runat="server" style="font-weight: 700">Script Source:</asp:label></td>
				<td><asp:textbox id="txtScriptSrc" runat="server"  Width="186px"></asp:textbox></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</tbody></table>
<p><asp:linkbutton class="CommandButton" id="cmdUpdate" runat="server" 
        Text="Update" BorderStyle="none" onclick="cmdUpdate_Click"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdCancel" runat="server" 
        Text="Cancel" BorderStyle="none" CausesValidation="False" 
        onclick="cmdCancel_Click"></asp:linkbutton></p>