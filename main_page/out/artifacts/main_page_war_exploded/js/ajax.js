function obj2str(user) {
    /*
    {"username":""
    "userpwd":""
    "t":"123213213"
    */
    // user.t=(new Date().getTime());
    var res=[];
    for(var key in user)
    {
        res.push(encodeURIComponent(key)+"="+encodeURIComponent(user[key]));
    }
    return res.join("&");
}
function ajax(type,url,user,timeout,success,error) {
    var xmlhttp;
    var timer;
    var str=obj2str(user);
    if(window.XMLHttpRequest)
    {
        xmlhttp=new XMLHttpRequest();
    }
    else {
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    if(type==="GET")
    {
        xmlhttp.open("GET", url+"?"+str,true);
        xmlhttp.send();
    }
    else
    {
        xmlhttp.open("POST", url,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send(str);
    }
    xmlhttp.onreadystatechange = function (ev2) {
        if (xmlhttp.readyState == 4) {
            clearInterval(timer);
            if (xmlhttp.status >= 200 && xmlhttp.status < 300 || xmlhttp.status == 304)
            {
                success(xmlhttp);
            }
            else
            {
                error(xmlhttp);
            }
        }
    }
    if(timeout)
    {
        timer=setInterval(function () {
            alert("404");
            xmlhttp.abort();
            clearInterval(timer);
        },timeout);
    }
}