<link rel="stylesheet" type="text/css" href="$[ModulePath]css/jquery.lightbox-0.5.css">
<script type="text/javascript" src="$[ModulePath]js/jquery.lightbox-0.5.pack.js"></script>

<style type="text/css">
.iwebs-pic{
    float:left;
    margin:0 15px 15px 0;
    border:5px solid white;
    width:${ThumbWidth}px;
    height:${ThumbHeight}px;
}

.iwebs-pic a{
    width:${ThumbWidth}px;
    height:${ThumbHeight}px;
    text-indent:-99999px;
    display:block;
}
.iwebs-pic a:hover{
	text-decoration:none;
}
</style>
<div id="iwebs-gallery-${ModuleId}" style="width: 600px;">
  #foreach($item in $items)
        <div class="iwebs-pic " style="background: url('$item.imageresize') no-repeat scroll 50% 50% transparent;">
        <a href="$item.image" title="$item.title" target="_blank">$item.title</a>
        </div>
 #end
<div class="clear"></div>
</div>
<script type="text/javascript">
jQuery(document).ready(function(){
    jQuery('#iwebs-gallery-${ModuleId}').find('.iwebs-pic a').lightBox({
        imageLoading: '$[ModulePath]Images/loading.gif',
        imageBtnClose: '$[ModulePath]Images/close.gif',
        imageBtnPrev: '$[ModulePath]Images/prev.gif',
        imageBtnNext: '$[ModulePath]Images/next.gif'
    });
       
});
</script>