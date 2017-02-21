//SERVER TIME

var nTime;
var nTimer; 
var newdNow2 = Math.floor(1 + TimeZone + dNow.getHours());
	dNow.setHours(newdNow2)
nTimer = nTarget - dNow.valueOf();	// milliseconds until target

if (document.all)
{
	Tick()
	window.setInterval('Tick()', 1000);
	
}
else
	window.setTimeout('Tick()', 1000);


function Tick()
{		
	if (nTime < 0) nTime = 0;
	nTime = Math.floor(nTimer / 1000);	// seconds until target
	Display(document.cdDay2, document.cdDay1, document.cdDay0, 86400);	// seconds per day
	Display(null, document.cdHour1, document.cdHour0, 3600);	// seconds per hour
	Display(null, document.cdMinute1, document.cdMinute0, 60); // seconds per minute
	Display(null, document.cdSecond1, document.cdSecond0, 1); // seconds per second
	nTimer = Math.floor(nTimer - 1000)
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