/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */
CKEDITOR.plugins.addExternal('youtube', '/common/lib/ckeditor/plugins/youtube/');

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.extraPlugins = 'youtube';

	config.enterMode = '1';
//	config.toolbar = 'Full';
	config.uiColor = '#eaebe7';
	config.shiftEnterMode = '1';
	
	config.font_defaultLabel = 'Gulim'; 
	config.font_names = 'Gulim/Gulim;Dotum/Dotum;Batang/Batang;Gungsuh/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana'; 
	config.fontSize_defaultLabel = '12px'; 
	config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;'; 
	config.language = "en"; 
//config.toolbar = [['Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','TextColor','BGColor','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Link','Unlink','-','Find','Replace','SelectAll','RemoveFormat','-','Image','Flash','Table','SpecialChar'],'/',['Source','-','ShowBlocks','-','Font','FontSize','Undo','Redo','-','About']]; 
	//config.font_names = '±¼¸²/Gulim;Dotum/Dotum;Batang/Batang;Gungsuh/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana';
	
	//config.toolbar = [["Source","Bold","Italic","Underline","Strike","-","Subscript","Superscript"], ["NumberedList","BulletedList","-","Outdent","Indent","Blockquote"], ["JustifyLeft","JustifyCenter","JustifyRight"], ["Link","Unlink"], ["Image","Table","HorizontalRule","SpecialChar","PageBreak"], "/", ["Styles","Format","Font","FontSize"], ["TextColor","BGColor"], ["Maximize", "ShowBlocks","-","About","youtube"]]; 
	config.toolbar = [["Source","Bold","Italic","Underline","Strike","-"],  ["Link","Unlink"], ["Image"], ["Font","FontSize"], ["TextColor","BGColor"]]; 
	
	config.filebrowserBrowseUrl = '';
//    filebrowserImageBrowseUrl = '/Admin_Root/include_Files/ckfinder/ckfinder.html?type=Images';
//    filebrowserFlashBrowseUrl = '/Admin_Root/include_Files/ckfinder/ckfinder.html?type=Flash';
	//config.filebrowserUploadUrl = '/html/ckeditor/upload.asp?type=Files';
	config.filebrowserUploadUrl = '/lib/ckeditor/upload.asp?type=Files';
	config.allowedContent = true;

	config.autoGrow_onStartup = true;
	config.disallowedContent = 'img{width,height}';
};
CKEDITOR.on('instanceReady', function (ev) {
ev.editor.dataProcessor.htmlFilter.addRules(
    {
        elements:
        {
            $: function (element) {
                // Output dimensions of images as width and height
                if (element.name == 'img') {
                    var style = element.attributes.style;

                    if (style) {
                        // Get the width from the style.
                        var match = /(?:^|\s)width\s*:\s*(\d+)px/i.exec(style),
                            width = match && match[1];

                        // Get the height from the style.
                        match = /(?:^|\s)height\s*:\s*(\d+)px/i.exec(style);
                        var height = match && match[1];

                        if (width) {
                            element.attributes.style = element.attributes.style.replace(/(?:^|\s)width\s*:\s*(\d+)px;?/i, '');
                            //element.attributes.width = width;
                        }

                        if (height) {
                            element.attributes.style = element.attributes.style.replace(/(?:^|\s)height\s*:\s*(\d+)px;?/i, '');
                            //element.attributes.height = height;
                        }
                    }
					element.attributes.style = "max-width:100%";
                }



                if (!element.attributes.style)
                    delete element.attributes.style;

                return element;
            }
        }
    });
});