function showMenu(menuNumber) {
    switch (menuNumber) {
        case 1:
            // specials
            callAJAX("specials");
            break;
        case 2:
            // snacks
            callAJAX("snacks");
            break;
        case 3:
            // oysters
            callAJAX("oysters");
            break;
        case 4:
            // cheese
            callAJAX("cheese");
            break;
        case 5:
            // charcuterie
            callAJAX("charcuterie");
            break;
        case 6:
            // sweets
            callAJAX("sweets");
            break;
        case 7:
            // wine
            callAJAX("drinks");
            break;
        default:
            // specials
            callAJAX("specials");
            break;
    }
}

function callAJAX(menu){
    var menu = JSON.stringify(menu);
    $.ajax({
       type: "POST",
        url: "getMenus.php",
        data: {pmenu:menu},
        success: function(msg){
//            console.log(msg);
            document.getElementById('foodGallery').innerHTML = msg;
        }
    });
}

$(document).ready(function(){
   showMenu(1); 
});