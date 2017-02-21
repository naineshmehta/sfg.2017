//CntupClient.js script orignal from Saim Naim (I assume)
//Adjusted for DotNetNuke by Roeland Kuipers - http://www.boul.nl
//If you like the script don't hesitate to use it! it's free!
//Roeland Kuipers - www.boul.nl - 26-05-2003
//***Client Side Time Version*** for DotNetNuke CountDown Module (2.0) by Roeland Kuipers
//02-06-2003 - TimeZone Support added - Roeland Kuipers
//27-08-2003 - Change script to count-up instead of countdown - Roeland Kuipers
var nTime;

if (document.all)
{
	Tick()
	window.setInterval('Tick()', 1000);
}
else
	window.setTimeout('Tick()', 1000);

function Tick()
{
	var dNow = new Date();
	var newdNow = Math.floor(1 + dNow.getMonth()); // We have to adjust the current date because javascript date prop. starts at 0 (jan = 0)
	var newdNow2 = Math.floor(1 + dNow.getHours() + TimeZone); //We have to adjust the hours with because javascript date prop. starts at 0 (13:00 = 12:00) strange but true, also adjust with specified TimeZone
	dNow.setMonth(newdNow); //and the vb date object (server time) starts at 1
	dNow.setHours(newdNow2);
	
	nTime =  dNow.valueOf() - nTarget;
	if (nTime < 0) nTime = 0;
	nTime = Math.floor(nTime / 1000);	// seconds until target
	Display(document.cdDay2, document.cdDay1, document.cdDay0, 86400);	// seconds per day
	Display(null, document.cdHour1, document.cdHour0, 3600);	// seconds per hour
	Display(null, document.cdMinute1, document.cdMinute0, 60); // seconds per minute
	Display(null, document.cdSecond1, document.cdSecond0, 1); // seconds per second
	if (!document.all)
		window.setTimeout('Tick()', 1000)
}
	
function Display(el2, el1, el0, nDivisor)
{
	
	var nValue = (nTime - (nTime %= nDivisor)) / nDivisor	
	el0.src = ImgSrc + ImgPrefix + (nValue % 10) + ImgExt
	nValue = Math.floor(nValue / 10)
	el1.src = ImgSrc + ImgPrefix + (nValue % 10) + ImgExt
	if (el2)
	{
		nValue = Math.floor(nValue / 10)
		el2.src = ImgSrc + ImgPrefix + (nValue % 10) + ImgExt
	}

}