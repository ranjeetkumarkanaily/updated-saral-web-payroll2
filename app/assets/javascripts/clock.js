var imageclock=new Object()
//Enter path to clock digit images here, in order of 0-9, then "am/pm", then colon image:
imageclock.digits=["/assets/c0.gif", "/assets/c1.gif", "/assets/c2.gif", "/assets/c3.gif", "/assets/c4.gif", "/assets/c5.gif", "/assets/c6.gif", "/assets/c7.gif", "/assets/c8.gif", "/assets/c9.gif","/assets/colon.gif"]
imageclock.instances=0
var preloadimages=[]
for (var i=0; i<imageclock.digits.length; i++){ //preload images
    preloadimages[i]=new Image()
    preloadimages[i].src=imageclock.digits[i]
}

imageclock.imageHTML=function(timestring){ //return timestring (ie: 1:56:38) into string of images instead
    var sections=timestring.split(":")
    if (sections[0]=="0") //If hour field is 0 (aka 12 AM)
        sections[0]="12"

    for (var i=0; i<sections.length; i++){
        if (sections[i].length==1)
            sections[i]='<img src="'+imageclock.digits[0]+'" />'+' <img src="'+imageclock.digits[parseInt(sections[i])]+'" />'
        else
            sections[i]='<img src="'+imageclock.digits[parseInt(sections[i].charAt(0))]+'" />'+' <img src="'+imageclock.digits[parseInt(sections[i].charAt(1))]+'" />'
    }
    return sections[0]+' <img src="'+imageclock.digits[10]+'" /> '+sections[1]+' <img src="'+imageclock.digits[10]+'" /> '+sections[2]
}

imageclock.display=function(){
    var clockinstance=this
    this.spanid="clockspan"+(imageclock.instances++)
    document.write('<span id="'+this.spanid+'"></span>')
    this.update()
    setInterval(function(){clockinstance.update()}, 1000)
}

imageclock.display.prototype.update=function(){
    var dateobj=new Date()
    var currenttime=dateobj.getHours()+":"+dateobj.getMinutes()+":"+dateobj.getSeconds() //create time string
    var currenttimeHTML=imageclock.imageHTML(currenttime)
    document.getElementById(this.spanid).innerHTML=currenttimeHTML

}
