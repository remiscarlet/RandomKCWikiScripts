var page = require('webpage').create();

page.onConsoleMessage = function(msg) {
    console.log(msg);
};
var postBody = 'api_token=761b259324763cba91eca1874522800551aa8fe8&api_verno=1';
page.open("http://125.6.187.253/kcsapi/api_start2", 'POST', postBody, function(status) {
    if ( status === "success" ) {
        console.log(page.content);
        phantom.ext();
    }
    phantom.exit();
});

//api_token=7684fdca55ac52d20693b6bc42c3ec4646f505c0&api_starttime=1437330972810