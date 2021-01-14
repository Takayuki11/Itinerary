// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


document.addEventListener("turbolinks:load", function() {
    // ヘッダー画像
    $('.set-view').hover(function(){
        $(this).css("background-color","#333333",);
        $(this).find('p').css("display", "block");
        $(".view").css("opacity","0.3");
    }, function() {
        $(this).find('p').css("display", "none");
        $(".view").css("opacity","1");
    });
    
    // プロフィール画像
    $('.set-user-image').hover(function(){
        $(this).css("background-color", "#333333",);
        $(this).find('p').css("display", "block");
        $(".user-image").css("opacity","0.3");
    }, function() {
        $(this).find('p').css("display", "none");
        $(".user-image").css("opacity","1");
    });
});
