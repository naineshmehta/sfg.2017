$(document).ready(function () {
    $('div.DnnModule-562').addClass('show-for-large-up');
    $('div.DnnModule-571,div.DnnModule-541').addClass('show-for-medium-up');

    $('div.DnnModule-646 img').css('width', 'auto').css('height', 'auto');

    if (window.location.pathname == '/')
    {
        $('div.DnnModule-645').addClass('show-for-medium-up');
        $('#dnn_ctr645_ModuleContent').find('#iframe').width('100%');
        $('.galleria-container').css('width', '100%').css('height', '100%');
		$('.searchButton').click(function(){$('#dnn_dnnSearch_txtSearch').focus();});
    }
});