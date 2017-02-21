<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authorize.aspx.cs" Inherits="BizModules.FlexEvents.Authorize" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="<%=ResolveUrl("~/Portals/_default/default.css") %>" type="text/css" rel="stylesheet"/>
    <link href="<%=ResolveUrl("~/DesktopModules/FlexEvents/module.css") %>" type="text/css" rel="stylesheet"/>

</head>
<body>



<form id="form1" runat="server">
<div>
    <input type='hidden' name='x_fp_hash' value='<%= AuthorizeNet_x_fp_hash %>' />
    <input type='hidden' name='x_fp_sequence' value='<%= AuthorizeNet_x_fp_sequence %>' />
    <input type='hidden' name='x_invoice_num' value='<%= PurchaseID %>' />
    <input type='hidden' name='x_fp_timestamp' value='<%= AuthorizeNet_x_fp_timestamp %>' />
    <input type='hidden' name='x_login' value='<%= AuthorizeNet_x_login %>' />
    <input type='hidden' name='x_relay_url' value='<%= AuthorizeNet_x_relay_url %>' />
    <input type='hidden' name='x_relay_response' value='<%= AuthorizeNet_x_relay_response %>' />
    <input type='hidden' name='x_receipt_link_url' value='<%= AuthorizeNet_x_receipt_link_url %>' />
    <input type='hidden' name='x_test_request' value="<%= AuthorizeNet_x_test_request %>" />
    <input type='hidden' name='x_method' value="CC" />
    <input type='hidden' name='x_type' value="AUTH_CAPTURE" />
    <input type='hidden' name='x_first_name' value='<%= AuthorizeNet_x_first_name %>' />
    <input type='hidden' name='x_last_name' value='<%= AuthorizeNet_x_last_name %>' />
    <input type='hidden' name='x_address' value='<%= AuthorizeNet_x_address %>' />
    <input type='hidden' name='x_city' value='<%= AuthorizeNet_x_city %>' />
    <input type='hidden' name='x_state' value='<%= AuthorizeNet_x_state %>' />
    <input type='hidden' name='x_zip' value='<%= AuthorizeNet_x_zip %>' />
    <input type='hidden' name='x_country' value='<%= Booking.Country %>' />
    <input type='hidden' name='x_phone' value='<%= Booking.Phone %>' />
    <input type='hidden' name='x_email' value='<%= Booking.Email %>' />
    <input type='hidden' name='x_amount' value='<%= AuthorizeNet_x_amount %>' />
    <input type='hidden' name='x_tax' value='<%= AuthorizeNet_x_tax %>' />
</div>

<table>
            <tr>
                <td align="right">
                    Card Number:
                </td>
                <td>
                    <input type="text" id="Text1" name="x_card_num" size="28" onkeyup="SelectCC(this.value)" value="<%= CCNumber %>"/>
                    <div style="padding:0.5em 0em;">
                        <img id="visa" src="<%= RootFolder %>/DesktopModules/FlexEvents/images/cc/visa-card.png" alt="" style="vertical-align: middle;" />
                        <img id="mastercard" src="<%= RootFolder %>/DesktopModules/FlexEvents/images/cc/mastercard-card.png"
                            alt="" style="vertical-align: middle;" />
                        <img id="amex" src="<%= RootFolder %>/DesktopModules/FlexEvents/images/cc/amex-card.png" alt="" style="vertical-align: middle;" />
                        <img id="discover" src="<%= RootFolder %>/DesktopModules/FlexEvents/images/cc/discover-card.png"
                            alt="" style="vertical-align: middle;" />
                        <input type='hidden' name='x_zip' value='<%= AuthorizeNet_x_zip %>' />
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Expiration Date: (MM-YY)
                </td>
                <td>
                    <input type="text" id="Text2" name="x_exp_date" size="10" maxlength="10" value="<%= CCExp %>" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    CCV:
                </td>
                <td>
                    <input type="text" id="Text3" name="x_card_code" size="10" maxlength="5" value="<%= CCV %>" />
                </td>
            </tr>
        </table>

        
<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkPay" runat="server" Text="Pay" resourcekey="Pay" 
            CssClass="dnnPrimaryAction" /></li>
    <li class="returnlink"><asp:HyperLink ID="lnkReturn" runat="server" Target="_parent" Text="Return" resourcekey="Return" CssClass="dnnSecondaryAction" /></li>
 </ul>
</form>

        <script language="javascript" type="text/javascript">
            document.forms[0].target = "_parent";
            document.forms[0].onsubmit = function () {
                document.getElementById('<%=lnkPay.ClientID %>').disabled = true;
            };
            function SelectCC(ccnum) {
                var basePath = "<%= RootFolder %>/DesktopModules/FlexEvents/images/cc/";
                var first = ccnum.charAt(0);
                var second = ccnum.charAt(1);
                var third = ccnum.charAt(2);
                var fourth = ccnum.charAt(3);

                //reset all
                document.getElementById("mastercard").src = basePath + "mastercard-card-bw.png";
                document.getElementById("amex").src = basePath + "amex-card-bw.png";
                document.getElementById("discover").src = basePath + "discover-card-bw.png";
                document.getElementById("visa").src = basePath + "visa-card-bw.png";

                if (first == "4") {
                    //Visa
                    document.getElementById("visa").src = basePath + "visa-card.png";
                    document.getElementById("cctype").value = "1";
                }
                else if ((first == "3") && ((second == "4") || (second == "7"))) {
                    //American Express
                    document.getElementById("amex").src = basePath + "amex-card.png";
                    document.getElementById("cctype").value = "3";
                }
                else if ((first == "5")) {
                    //Mastercard
                    document.getElementById("mastercard").src = basePath + "mastercard-card.png";
                    document.getElementById("cctype").value = "2";
                }
                else if ((first == "6") && (second == "0") && (third == "1") && (fourth == "1")) {
                    //Discover
                    document.getElementById("discover").src = basePath + "discover-card.png";
                    document.getElementById("cctype").value = "4";
                }
                else {
                    //unknown
                    document.getElementById("cctype").value = "";
                }
            }
        </script>


</body>
</html>
