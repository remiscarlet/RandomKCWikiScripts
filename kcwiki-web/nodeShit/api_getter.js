// Run as nodejs
// $ node api_getter.js
//
// Will print out api link to console.

// Requires nightmare
// npm install nightmare
// Modify node_modules/nightmare/runner.js
// Add the following two lines
//   app.commandLine.appendSwitch('ppapi-flash-path', '/Applications/Google Chrome.app/Contents/Versions/47.0.2526.106/Google Chrome Framework.framework/Internet Plug-Ins/PepperFlash/PepperFlashPlayer.plugin');
//   app.commandLine.appendSwitch('ppapi-flash-version', '20.0.0.228');
// as per https://github.com/atom/electron/blob/master/docs/tutorial/using-pepper-flash-plugin.md

// Requires q
// npm install q

// Requires needle
// npm install needle



var Nightmare = require('nightmare');
var Promise = require('q').Promise;
var fs = require('fs');
var needle = require("needle");

// Set some default values for needle's requests
needle.defaults({
  open_timeout: 60000,
  user_agent: 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36',
  parse_response: false });

// Contains dmm login information.
var settings = require("./settings.js")



var options = {
    'width': 1280,
    'height': 780,
    'plugin':true,
    'show':true,
    'webPreferences': {
        'plugins': true,
    }
};
var kc = new Nightmare(options)

// Will go to login page, login,
// set to Japanese website,
// and set region cookies  
function site1(data){

  Promise.resolve(kc
    .goto("https://www.dmm.com/en/my/-/login/=/path=SgReFg__/")
    .wait(1000)
    .type("#login_id",settings.dmmLoginEmail)
    .type("#password",settings.dmmLoginPassword)
    .click("input[type='submit']")
    .wait(2000)
    .cookies.set({
      name:"ckcy",
      value: 1,
      expires: "Sun, 09 Feb 2019 09:00:09 GMT",
      domain: "www.dmm.com",
      path:"/"
    })
    .click("[href='http://www.dmm.com/']")
    .wait(1000)
    .run(function (err, nightmare) {
      if (err) return console.log(err);
      console.log('Login, region and cookie settings successful. Moving onto game url.');
      site2();
    })
    )
};


var iframeUrl;
// Will load the game url and then grab the iframe's url
// Must load iframe endpoint at osapi.dmm.com because of
// cross-domain security checks
function site2(data){
  Promise.resolve(kc
      .goto("http://www.dmm.com/netgame/social/-/gadgets/=/app_id=854854/")
      .wait(5000)
      .evaluate(function(){
        return document.getElementById("game_frame").src;
      })
    ).then(function(url){
    site3(url);
  })
};

var osapiUrl;
// Will load the inner osapi.dmm page
// and get the api link from here.
function site3(url){
  osapiUrl = url;
  console.log("osapi.dmm.com link (inner iframe url)");
  console.log(url);
  var api;
  Promise.resolve(kc
    .goto(url)
    .wait(5000)
    .evaluate(function(){
      return document.getElementById("externalswf").src;
    })
  ).then(function(api){
    console.log("");
    console.log("API LINK");
    console.log(api);
    site4(api);
  });
}

// Given the api link, will regex it
// and then send a request to the api_start2 endpoint
// and dump the response json into dump.json
function site4(url){
  console.log("");
  var re = /api_token=(\w+)/;

  var token = re.exec(url)[1];
  re = /http:[\/0-9.]+/;
  var serverHost = re.exec(url)[0];
  console.log(token);
  console.log(serverHost);

  var url = serverHost+"kcsapi/api_start2/";
  console.log(url);
  
  var payload = {
    api_verno:1,
    api_token:token
  };
  var headerOpts = {
    headers: { 
      "Accept-Encoding":"gzip,deflate,sdch",
      'Accept-Language':'en-US,en;q=0.8,ja;q=0.6',
      'Connection':'keep-alive',
      "Referer":"http://osapi.dmm.com/gadgets/ifr?synd=dmm&container=dmm&owner=23655389&viewer=23655389&aid=854854&mid=60462386&country=jp&lang=ja&view=canvas&parent=http%3A%2F%2Fwww.dmm.com%2Fnetgame%2Fsocial%2F&url=http%3A%2F%2F203.104.209.7%2Fgadget.xml&st=dqmIXTtchTHmbtUUdwtT9CkPBePKV%2FMlvvaOuJoxxjUY3VqNa9ts0%2BvX1o5qtr9B3mUQ%2FJpfVr9lN3oyWaAQHI6WkJnLezphLJtOSpo76zObPV%2BPbZJfa76a0GB96zGNx2P7u3cSFIsJDM%2Fss5WCSvkZ34UoleiCZDOU5b6VWH7%2FpaWIY7YMHQiRmaXJp6rpGcn%2FamKmyyoyMTfevjeGcoqnu58%3D",
      "X-Requested-With": "ShockwaveFlash/20.0.0.228",
    }
  }
  needle.post(url, payload, headerOpts, function(err, resp){
    console.log(err);
    console.log(resp.statusCode)
    fs.writeFile("./dump.json", resp.body, function(err) {
        if(err) {
            return console.log(err);
        }
        console.log("The file was saved!");
    }); 
  });
}

site1();


