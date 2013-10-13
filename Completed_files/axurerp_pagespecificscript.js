for(var i = 0; i < 13; i++) { var scriptId = 'u' + i; window[scriptId] = document.getElementById(scriptId); }

$axure.eventManager.pageLoad(
function (e) {

});
gv_vAlignTable['u3'] = 'top';gv_vAlignTable['u12'] = 'top';gv_vAlignTable['u8'] = 'center';gv_vAlignTable['u5'] = 'top';gv_vAlignTable['u1'] = 'center';gv_vAlignTable['u2'] = 'top';gv_vAlignTable['u11'] = 'center';document.getElementById('u7_img').tabIndex = 0;
HookHover('u7', false);

u7.style.cursor = 'pointer';
$axure.eventManager.click('u7', function(e) {

if (((GetWidgetText('u4')) == ('secretagentdale@fbi.com')) && ((GetWidgetText('u6')) == ('coffee'))) {

	self.location.href='#';

}
else
if (true) {

	SetPanelVisibility('u9','','none',500);

}
});
