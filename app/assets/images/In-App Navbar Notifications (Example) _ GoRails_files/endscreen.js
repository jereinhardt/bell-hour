(function(g){var window=this;var n4=function(a,b,c){var d=b.ua();g.L(a.element,"ytp-suggestion-set",!!d.videoId);var e=b.getPlaylistId();c=b.zc(c?c:"mqdefault.jpg");var f=b instanceof g.XA&&b.lengthSeconds?g.QK(b.lengthSeconds):null,k=!!e;e=k&&"RD"==(new g.TD(e.substr(0,2),e.substr(2))).type;var l=b instanceof g.XA?b.sa:null;d={title:b.title,author:b.author,author_and_views:d.shortViewCount?b.author+" \u2022 "+d.shortViewCount:b.author,aria_label:b.Yi||g.AL("Watch $TITLE",{TITLE:b.title}),duration:f,url:b.Vh(),is_live:l,is_list:k,
is_mix:e,background:c?"background-image: url("+c+")":""};b instanceof g.VD&&(d.playlist_length=b.getLength());a.update(d)},o4=function(a,b){g.RC.call(this,{B:"div",
U:["html5-endscreen","ytp-player-content",b||"base-endscreen"]});this.player=a;this.created=!1},p4=function(a){g.V.call(this,{B:"div",
U:["ytp-upnext","ytp-player-content"],L:{"aria-label":"{{aria_label}}"},J:[{B:"div",G:"ytp-cued-thumbnail-overlay-image",L:{style:"{{background}}"}},{B:"span",G:"ytp-upnext-top",J:[{B:"span",G:"ytp-upnext-header",T:"Up Next"},{B:"span",G:"ytp-upnext-title",T:"{{title}}"},{B:"span",G:"ytp-upnext-author",T:"{{author}}"}]},{B:"a",G:"ytp-upnext-autoplay-icon",L:{role:"button",href:"{{url}}","aria-label":"Play next video"},J:[{B:"svg",L:{height:"100%",version:"1.1",viewBox:"0 0 72 72",width:"100%"},J:[{B:"circle",
G:"ytp-svg-autoplay-circle",L:{cx:"36",cy:"36",fill:"#fff","fill-opacity":"0.3",r:"31.5"}},{B:"circle",G:"ytp-svg-autoplay-ring",L:{cx:"-36",cy:"36","fill-opacity":"0",r:"33.5",stroke:"#FFFFFF","stroke-dasharray":"211","stroke-dashoffset":"-211","stroke-width":"4",transform:"rotate(-90)"}},{B:"path",G:"ytp-svg-fill",L:{d:"M 24,48 41,36 24,24 V 48 z M 44,24 v 24 h 4 V 24 h -4 z"}}]}]},{B:"span",G:"ytp-upnext-bottom",J:[{B:"span",G:"ytp-upnext-cancel"},{B:"span",G:"ytp-upnext-paused",T:"Autoplay is paused"}]}]});
this.A=null;var b=this.i["ytp-upnext-cancel"];this.A=new g.V({B:"button",U:["ytp-upnext-cancel-button","ytp-button"],L:{tabindex:"0","aria-label":"Cancel autoplay"},T:"Cancel"});g.I(this,this.A);this.A.ca("click",this.pI,this);this.A.g(b);this.l=a;this.I=this.i["ytp-svg-autoplay-ring"];this.D=this.C=this.o=this.u=null;this.F=new g.J(this.Ml,5E3,this);g.I(this,this.F);this.H=0;this.K(this.i["ytp-upnext-autoplay-icon"],"click",this.cK);this.Dy();this.K(a,"autonavvisibility",this.Dy);this.K(a,"mdxnowautoplaying",
this.wJ);this.K(a,"mdxautoplaycanceled",this.xJ);this.K(a,"mdxautoplayupnext",this.TA);3==this.l.getPresentingPlayerType()&&(a=(a=g.rK(g.lK(this.l)))?a.gD():null)&&this.TA(a)},q4=function(a,b){if(!a.o){g.jp("a11y-announce","Up Next "+a.u.title);
a.H=(0,g.er)();a.o=new g.J((0,g.x)(a.To,a,b),25);a.To(b);var c=b||g.R(g.W(a.l).experiments,"autoplay_time")||1E4;a.l.ka("onAutonavCoundownStarted",c)}g.Gn(a.element,"ytp-upnext-autoplay-paused")},s4=function(a){r4(a);
a.H=(0,g.er)();a.To();g.K(a.element,"ytp-upnext-autoplay-paused")},r4=function(a){a.o&&(a.o.dispose(),a.o=null)},t4=function(a,b){b=void 0===b?!1:b;
if(g.O(g.W(a.l).experiments,"autonav_notifications")&&b&&window.Notification&&document.hasFocus){var c=Notification.permission;"default"==c?Notification.requestPermission():"granted"!=c||document.hasFocus()||(c=a.u.ua(),a.Ml(),a.C=new Notification("Up Next",{body:c.title,icon:c.zc()}),a.D=a.K(a.C,"click",a.UJ),a.F.start())}r4(a);a.l.nextVideo(!1,b)},u4=function(a){o4.call(this,a,"subscribecard-endscreen");
var b=a.getVideoData();this.l=new g.V({B:"div",G:"ytp-subscribe-card",J:[{B:"img",G:"ytp-author-image",L:{src:b.Sd}},{B:"div",G:"ytp-subscribe-card-right",J:[{B:"div",G:"ytp-author-name",T:b.author},{B:"div",G:"html5-subscribe-button-container"}]}]});g.I(this,this.l);this.l.g(this.element);this.o=new g.KP("Subscribe",null,"Unsubscribe",null,!0,!1,b.Nf,b.subscribed,"trailer-endscreen",null,null,a);g.I(this,this.o);this.o.g(this.l.i["html5-subscribe-button-container"]);this.hide()},v4=function(a){var b=
g.W(a),c=g.Yw||g.dg?{style:"will-change: opacity"}:void 0,d=b.i,e=["ytp-videowall-still"];
b.g&&e.push("ytp-videowall-show-text");g.V.call(this,{B:"a",U:e,L:{href:"{{url}}",target:d?b.u:"","aria-label":"{{aria_label}}","data-is-live":"{{is_live}}","data-is-list":"{{is_list}}","data-is-mix":"{{is_mix}}"},J:[{B:"div",G:"ytp-videowall-still-image",L:{style:"{{background}}"}},{B:"span",G:"ytp-videowall-still-info",J:[{B:"span",G:"ytp-videowall-still-info-bg",J:[{B:"span",G:"ytp-videowall-still-info-content",L:c,J:[{B:"span",G:"ytp-videowall-still-info-title",T:"{{title}}"},{B:"span",G:"ytp-videowall-still-info-author",
T:"{{author_and_views}}"},{B:"span",G:"ytp-videowall-still-info-live",T:"Live"},{B:"span",G:"ytp-videowall-still-info-duration",T:"{{duration}}"}]}]}]},{B:"span",U:["ytp-videowall-still-listlabel-regular","ytp-videowall-still-listlabel"],J:[{B:"span",G:"ytp-videowall-still-listlabel-icon"},"Playlist",{B:"span",G:"ytp-videowall-still-listlabel-length",J:[" (",{B:"span",T:"{{playlist_length}}"},")"]}]},{B:"span",U:["ytp-videowall-still-listlabel-mix","ytp-videowall-still-listlabel"],J:[{B:"span",G:"ytp-videowall-still-listlabel-mix-icon"},
"Mix",{B:"span",G:"ytp-videowall-still-listlabel-length",T:" (50+)"}]}]});this.A=d;this.l=a;this.o=null;this.u=new g.is(this);g.I(this,this.u);this.ca("click",this.D);this.ca("keypress",this.F);this.u.K(a,"videodatachange",this.C);g.W(a).D&&g.fR(a.app.aa,this.element,this);this.C()},w4=function(a){g.HK(a.l,a.element);
var b=a.o.ua().videoId,c=a.o.getPlaylistId();g.ZR(a.l.app,b,a.o.Db,c,void 0,void 0)},x4=function(a){o4.call(this,a,"videowall-endscreen");
this.C=a;this.A=0;this.o=[];this.D=this.O=this.u=null;this.F=this.P=!1;this.M=null;this.ba=new g.is(this);g.I(this,this.ba);this.H=new g.J(g.Ra(g.K,this.element,"ytp-show-tiles"),0);g.I(this,this.H);var b=new g.V({B:"button",U:["ytp-button","ytp-endscreen-previous"],L:{"aria-label":"Previous"},J:[g.YK()]});g.I(this,b);b.g(this.element);b.ca("click",this.FF,this);this.I=new g.MC({B:"div",G:"ytp-endscreen-content"});g.I(this,this.I);this.I.g(this.element);b=new g.V({B:"button",U:["ytp-button","ytp-endscreen-next"],
L:{"aria-label":"Next"},J:[g.ZK()]});g.I(this,b);b.g(this.element);b.ca("click",this.EF,this);this.l=new p4(a);g.I(this,this.l);g.EK(this.player,this.l.element,4);this.hide()},y4=function(a){return g.FK(a.player)&&a.nu()&&!a.D},z4=function(a,b){return(0,g.A)(b.suggestions,function(c){c=g.BL(g.W(a.C),c);
g.I(a,c);return c})},A4=function(a){var b=a.Me();
b!=a.P&&(a.P=b,a.player.N("autonavvisibility"))},C4=function(a){g.FO.call(this,a);
this.g=null;this.i=new g.is(this);g.I(this,this.i);this.l=g.W(a);B4(a)?this.g=new x4(this.player):this.l.Pa?this.g=new u4(this.player):this.g=new o4(this.player);g.I(this,this.g);g.EK(this.player,this.g.element,4);this.Xz();this.i.K(a,"videodatachange",this.Xz,this);this.i.K(a,g.SD("endscreen"),this.TE,this);this.i.K(a,"crx_endscreen",this.UE,this)},B4=function(a){a=g.W(a);
return a.Na&&!a.Pa};
g.r(o4,g.RC);o4.prototype.create=function(){this.created=!0};
o4.prototype.destroy=function(){this.created=!1};
o4.prototype.nu=function(){return!1};
o4.prototype.Me=function(){return!1};g.r(p4,g.V);g.h=p4.prototype;g.h.Ml=function(){this.C&&(this.F.stop(),this.Qa(this.D),this.D=null,this.C.close(),this.C=null)};
g.h.Dy=function(){g.QC(this,this.l.Me())};
g.h.UJ=function(){window.focus();this.Ml()};
g.h.hide=function(){g.V.prototype.hide.call(this)};
g.h.To=function(a){a=a||g.R(g.W(this.l).experiments,"autoplay_time")||1E4;var b=Math.min((0,g.er)()-this.H,a);a=Math.min(b/a,1);this.I.setAttribute("stroke-dashoffset",-211*(a+1));1<=a&&3!=this.l.getPresentingPlayerType()?t4(this,!0):this.o&&this.o.start()};
g.h.cK=function(a){!g.$d(this.A.element,g.ur(a))&&g.IL(a,this.l)&&t4(this)};
g.h.pI=function(){g.nK(this.l,!0)};
g.h.wJ=function(a){this.l.getPresentingPlayerType();this.show();q4(this,a)};
g.h.TA=function(a){this.l.getPresentingPlayerType();this.u&&this.u.ua().videoId==a.ua().videoId||(this.u=a,n4(this,a,"hqdefault.jpg"))};
g.h.xJ=function(){this.l.getPresentingPlayerType();r4(this);this.hide()};
g.h.V=function(){r4(this);this.Ml();g.V.prototype.V.call(this)};g.r(u4,o4);g.r(v4,g.V);v4.prototype.D=function(a){g.IL(a,this.l,this.A,this.o.Db||void 0)&&w4(this)};
v4.prototype.F=function(a){switch(a.keyCode){case 13:case 32:g.zr(a)||(w4(this),g.yr(a))}};
v4.prototype.C=function(){var a=this.l.getVideoData(),b=g.W(this.l);this.A=a.Yb?!1:b.i};g.r(x4,o4);g.h=x4.prototype;g.h.create=function(){o4.prototype.create.call(this);var a=this.player.getVideoData();a&&(this.u=z4(this,a),this.O=a);this.Hf();this.ba.K(this.player,"appresize",this.Hf);this.ba.K(this.player,"onVideoAreaChange",this.Hf);this.ba.K(this.player,"videodatachange",this.GF);this.ba.K(this.player,"autonavchange",this.dr);this.ba.K(this.player,"autonavcancel",this.DF);a=this.O.autonavState;a!=this.M&&this.dr(a);this.ba.K(this.element,"transitionend",this.sL)};
g.h.destroy=function(){g.ks(this.ba);g.Ei(this.o);this.o=[];this.u=null;o4.prototype.destroy.call(this);g.Gn(this.element,"ytp-show-tiles");this.H.stop();this.M=this.O.autonavState};
g.h.nu=function(){return 1!=this.O.autonavState};
g.h.show=function(){o4.prototype.show.call(this);g.Gn(this.element,"ytp-show-tiles");g.W(this.player).g?g.yn(this.H):this.H.start();(this.F||this.D&&this.D!=this.O.clientPlaybackNonce)&&g.nK(this.player,!1);y4(this)?(A4(this),2==this.O.autonavState?g.O(g.W(this.player).experiments,"fast_autonav_in_background")&&3==this.player.getVisibilityState()?t4(this.l,!0):q4(this.l):3==this.O.autonavState&&s4(this.l)):(g.nK(this.player,!0),A4(this))};
g.h.hide=function(){o4.prototype.hide.call(this);s4(this.l);A4(this)};
g.h.sL=function(a){g.ur(a)==this.element&&this.Hf()};
g.h.Hf=function(){if(this.u&&this.u.length){g.K(this.element,"ytp-endscreen-paginate");var a=g.vK(this.C,!0,this.C.isFullscreen()),b=g.gD(this.C);b&&(b=b.Xb()?48:32,a.width-=2*b);var c=a.width/a.height,d=96/54,e=b=2,f=Math.max(a.width/96,2),k=Math.max(a.height/54,2),l=this.u.length,m=Math.pow(2,2);var n=l*m+(Math.pow(2,2)-m);n+=Math.pow(2,2)-m;for(n-=m;0<n&&(b<f||e<k);){var q=b/2,t=e/2,w=b<=f-2&&n>=t*m,z=e<=k-2&&n>=q*m;if((q+1)/t*d/c>c/(q/(t+1)*d)&&z)n-=q*m,e+=2;else if(w)n-=t*m,b+=2;else if(z)n-=
q*m,e+=2;else break}d=!1;n>=3*m&&6>=l*m-n&&(4<=e||4<=b)&&(d=!0);m=96*b;n=54*e;c=m/n<c?a.height/n:a.width/m;c=Math.min(c,2);m*=c;n*=c;m*=g.nd(a.width/m||1,1,1.21);n*=g.nd(a.height/n||1,1,1.21);m=Math.floor(Math.min(a.width,m));n=Math.floor(Math.min(a.height,n));a=this.I.element;g.tg(a,m,n);g.ag(a,{marginLeft:m/-2+"px",marginTop:n/-2+"px"});c=this.l;f=this.u[0];c.u=f;n4(c,f,"hqdefault.jpg");g.L(this.element,"ytp-endscreen-takeover",y4(this));A4(this);m+=4;n+=4;for(f=c=0;f<b;f++)for(k=0;k<e;k++)if(q=
c,t=0,d&&f>=b-2&&k>=e-2?t=1:0==k%2&&0==f%2&&(2>k&&2>f?0==k&&0==f&&(t=2):t=2),q=g.pd(q+this.A,l),0!=t){w=this.o[c];w||(w=new v4(this.player),this.o[c]=w,a.appendChild(w.element));z=Math.floor(n*k/e);var C=Math.floor(m*f/b),E=Math.floor(n*(k+t)/e)-z-4,G=Math.floor(m*(f+t)/b)-C-4;g.ig(w.element,C,z);g.tg(w.element,G,E);g.ag(w.element,"transitionDelay",(k+f)/20+"s");g.L(w.element,"ytp-videowall-still-mini",1==t);g.L(w.element,"ytp-videowall-still-large",2<t);t=w;q=this.u[q];t.o!=q&&(t.o=q,n4(t,q,g.En(t.element,
"ytp-videowall-still-large")?"hqdefault.jpg":"mqdefault.jpg"),q=(q=q.Db)&&q.itct)&&(w=t.l,g.W(w).D&&g.hR(w.app.aa,t.element,q));c++}g.L(this.element,"ytp-endscreen-paginate",c<l);for(b=this.o.length-1;b>=c;b--)e=this.o[b],g.Wd(e.element),g.Di(e);this.o.length=c}};
g.h.GF=function(){var a=this.player.getVideoData();this.O!=a&&(this.A=0,this.u=z4(this,a),this.O=a,this.Hf())};
g.h.EF=function(){this.A+=this.o.length;this.Hf()};
g.h.FF=function(){this.A-=this.o.length;this.Hf()};
g.h.kE=function(){return!!this.l.o};
g.h.dr=function(a){1==a?(this.F=!1,this.D=this.O.clientPlaybackNonce,r4(this.l),this.Fa()&&this.Hf()):(this.F=!0,this.Fa()&&y4(this)&&(2==a?q4(this.l):3==a&&s4(this.l)))};
g.h.DF=function(a){if(a){for(a=0;a<this.o.length;a++)g.IK(this.C,this.o[a].element,!0);this.dr(1)}else this.D=null,this.F=!1;this.Hf()};
g.h.Me=function(){return this.Fa()&&y4(this)};g.r(C4,g.FO);g.h=C4.prototype;g.h.Fk=function(){var a=this.player.getVideoData(),b=!!(a&&a.suggestions&&a.suggestions.length);b=!B4(this.player)||b;a=a.Oc||g.Py(a.La);var c=g.vR(this.player.app);return b&&!a&&!c};
g.h.Me=function(){return this.g.Me()};
g.h.dE=function(){return this.Me()?this.g.kE():!1};
g.h.V=function(){g.AK(this.player,"endscreen");g.FO.prototype.V.call(this)};
g.h.load=function(){g.FO.prototype.load.call(this);this.g.show()};
g.h.unload=function(){g.FO.prototype.unload.call(this);this.g.hide();this.g.destroy()};
g.h.TE=function(a){this.Fk()&&(this.g.created||this.g.create(),"load"==a.getId()&&this.load())};
g.h.UE=function(a){"load"==a.getId()&&this.loaded&&this.unload()};
g.h.Xz=function(){g.AK(this.player,"endscreen");var a=this.player.getVideoData();a=new g.PD(Math.max(1E3*(a.lengthSeconds-10),0),0x8000000000000,{id:"preload",namespace:"endscreen"});g.I(this,a);var b=new g.PD(0x8000000000000,0x8000000000000,{id:"load",priority:6,namespace:"endscreen"});g.I(this,b);g.xK(this.player,[a,b])};g.NO.endscreen=C4;})(_yt_player);