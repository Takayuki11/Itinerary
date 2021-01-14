// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

const getTop = () => {
    $(function() {
        if ($(".left-side").length) {
            var nav = $(".left-side");
            //navの位置
            var navTop = nav.offset().top;
            //スクロールするたびに実行
            $(window).scroll(function () {
                var winTop = $(this).scrollTop();
                //スクロール位置がnavの位置より下だったらクラスfixedを追加
                if (winTop >= navTop) {
                    nav.addClass('fixed');
                } else if (winTop <= navTop) {
                    nav.removeClass('fixed');
                }
            });
        }
    });
    
};

$(window).on("load", getTop);

// ページネーションしたときにgetTopが機能するようにするため
// 画像を読み込んだ後に要素の位置を取得するため
$(window).on("load", function(){
    $(document).on('turbolinks:load', getTop);    
});


