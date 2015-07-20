var url = "http://google.com";


var page = require('webpage').create();
page.open(url, function(status) {
  console.log("fdsa");
  if (status === "success") {
    console.log("B");
    page.includeJs('http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js', function () {
        console.log("Solve Captcha");
        page.evaluate(function(){
            window._finishedCall = false;
            $.ajax({
                url: 'http://localhost/captcha.php',
                data: { filename: 'C:\\wamp\\www\\images\\0.png' },
                type: 'post',
                success: function (output) {
                    console.log('Solved');
                    window._finishedCall = true;
                },
            });
        });
  }
  phantom.exit();
});