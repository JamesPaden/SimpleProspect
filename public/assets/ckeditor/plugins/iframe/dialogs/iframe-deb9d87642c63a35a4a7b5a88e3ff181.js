/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){function e(e){var t=this instanceof CKEDITOR.ui.dialog.checkbox;e.hasAttribute(this.id)&&(e=e.getAttribute(this.id),t?this.setValue(n[this.id]["true"]==e.toLowerCase()):this.setValue(e))}function t(e){var t=""===this.getValue(),a=this instanceof CKEDITOR.ui.dialog.checkbox,i=this.getValue();t?e.removeAttribute(this.att||this.id):a?e.setAttribute(this.id,n[this.id][i]):e.setAttribute(this.att||this.id,i)}var n={scrolling:{"true":"yes","false":"no"},frameborder:{"true":"1","false":"0"}};CKEDITOR.dialog.add("iframe",function(n){var a=n.lang.iframe,i=n.lang.common,o=n.plugins.dialogadvtab;return{title:a.title,minWidth:350,minHeight:260,onShow:function(){this.fakeImage=this.iframeNode=null;var e=this.getSelectedElement();e&&e.data("cke-real-element-type")&&"iframe"==e.data("cke-real-element-type")&&(this.fakeImage=e,this.iframeNode=e=n.restoreRealElement(e),this.setupContent(e))},onOk:function(){var e;e=this.fakeImage?this.iframeNode:new CKEDITOR.dom.element("iframe");var t={},a={};this.commitContent(e,t,a),e=n.createFakeElement(e,"cke_iframe","iframe",!0),e.setAttributes(a),e.setStyles(t),this.fakeImage?(e.replace(this.fakeImage),n.getSelection().selectElement(e)):n.insertElement(e)},contents:[{id:"info",label:i.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{id:"src",type:"text",label:i.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(a.noUrl),setup:e,commit:t}]},{type:"hbox",children:[{id:"width",type:"text",requiredContent:"iframe[width]",style:"width:100%",labelLayout:"vertical",label:i.width,validate:CKEDITOR.dialog.validate.htmlLength(i.invalidHtmlLength.replace("%1",i.width)),setup:e,commit:t},{id:"height",type:"text",requiredContent:"iframe[height]",style:"width:100%",labelLayout:"vertical",label:i.height,validate:CKEDITOR.dialog.validate.htmlLength(i.invalidHtmlLength.replace("%1",i.height)),setup:e,commit:t},{id:"align",type:"select",requiredContent:"iframe[align]","default":"",items:[[i.notSet,""],[i.alignLeft,"left"],[i.alignRight,"right"],[i.alignTop,"top"],[i.alignMiddle,"middle"],[i.alignBottom,"bottom"]],style:"width:100%",labelLayout:"vertical",label:i.align,setup:function(t,n){if(e.apply(this,arguments),n){var a=n.getAttribute("align");this.setValue(a&&a.toLowerCase()||"")}},commit:function(e,n,a){t.apply(this,arguments),this.getValue()&&(a.align=this.getValue())}}]},{type:"hbox",widths:["50%","50%"],children:[{id:"scrolling",type:"checkbox",requiredContent:"iframe[scrolling]",label:a.scrolling,setup:e,commit:t},{id:"frameborder",type:"checkbox",requiredContent:"iframe[frameborder]",label:a.border,setup:e,commit:t}]},{type:"hbox",widths:["50%","50%"],children:[{id:"name",type:"text",requiredContent:"iframe[name]",label:i.name,setup:e,commit:t},{id:"title",type:"text",requiredContent:"iframe[title]",label:i.advisoryTitle,setup:e,commit:t}]},{id:"longdesc",type:"text",requiredContent:"iframe[longdesc]",label:i.longDescr,setup:e,commit:t}]},o&&o.createAdvancedTab(n,{id:1,classes:1,styles:1},"iframe")]}})})();