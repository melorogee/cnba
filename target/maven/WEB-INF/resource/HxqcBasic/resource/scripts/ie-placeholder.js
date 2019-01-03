/*
 * jQuery placeholder, fix for IE6,7,8,9
 * @author JENA
 * @since 20131115.1504
 * @website ishere.cn
 */
var JPlaceHolder = {
	//检测
	_check : function(){
		return 'placeholder' in document.createElement('input');
	},
	//初始化
	init : function(){
		if(!this._check()){
			this.fix();
		}
	},
	//修复
	fix : function(){
		jQuery(':input[placeholder]').each(function(index, element) {
            var self = $(this), txt = self.attr('placeholder');
			self.wrap($('<div></div>').css({position:'relative', border:'none', zoom:'1', background:'none', padding:'none', margin:'none'}));
			var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left');
			var holder = $('<span class="pHolder"></span>').text(txt).css({position:'absolute', left:pos.left, top:pos.top, height:h, lienHeight:h, paddingLeft:paddingleft, color:'#b8b5b5'}).appendTo(self.parent());
			self.focusin(function(e) {
                holder.hide();
            }).focusout(function(e) {
                if(!self.val()){
					holder.show();
				}
            });
			holder.click(function(e) {
                holder.hide();
				self.focus();
            });
        });
	}
};
//执行
jQuery(function(){
	JPlaceHolder.init();
		
});
