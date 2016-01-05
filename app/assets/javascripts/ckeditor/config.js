// CKEDITOR.config.autoParagraph = false;
// CKEDITOR.editorConfig = function (config) {
//     ...
//     config.extraPlugins = 'imgur';
//     // Get your client-id from https://api.imgur.com/oauth2/addclient
//     config.imgurClientID = '55d8ba08326ec75';
//     ...
// };
CKEDITOR.editorConfig = function( config )
{
    config.toolbar_Toolbar =
    [
        { name: 'basicstyles', items : [ 'Bold','Italic','Strike','Underline','-','RemoveFormat'] },
        { name: 'justify', items : [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
        { name: 'styles', items : [ 'Format' ] },       
        { name: 'insert', items : [ 'Image','SpecialChar','Insert','Tools'] },
        '/',
        { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },        
        { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-'] },
        { name: 'links', items : [ 'Link','Unlink','Anchor', 'Source' ] }
    ];
    config.toolbar = 'Toolbar';
    config.allowedContent = true;


     /* Filebrowser routes */
    // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
    config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
    config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

    // The location of a script that handles file uploads in the Flash dialog.
    config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
    config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
    config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

    // The location of a script that handles file uploads in the Image dialog.
    config.filebrowserImageUploadUrl = "/ckeditor/pictures";

    // The location of a script that handles file uploads.
    config.filebrowserUploadUrl = "/ckeditor/attachment_files";

    // Rails CSRF token
    config.filebrowserParams = function(){
        var csrf_token, csrf_param, meta,
            metas = document.getElementsByTagName('meta'),
            params = new Object();

        for ( var i = 0 ; i < metas.length ; i++ ){
            meta = metas[i];

            switch(meta.name) {
                case "csrf-token":
                    csrf_token = meta.content;
                    break;
                case "csrf-param":
                    csrf_param = meta.content;
                    break;
                default:
                    continue;
            }
        }

        if (csrf_param !== undefined && csrf_token !== undefined) {
            params[csrf_param] = csrf_token;
        }

        return params;
    };

    config.addQueryString = function( url, params ){
        var queryString = [];

        if ( !params ) {
            return url;
        } else {
            for ( var i in params )
                queryString.push( i + "=" + encodeURIComponent( params[ i ] ) );
        }

        return url + ( ( url.indexOf( "?" ) != -1 ) ? "&" : "?" ) + queryString.join( "&" );
    };

    // Integrate Rails CSRF token into file upload dialogs (link, image, attachment and flash)
    CKEDITOR.on( 'dialogDefinition', function( ev ){
        // Take the dialog name and its definition from the event data.
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
        var content, upload;

        if (CKEDITOR.tools.indexOf(['link', 'image', 'attachment', 'flash'], dialogName) > -1) {
            content = (dialogDefinition.getContents('Upload') || dialogDefinition.getContents('upload'));
            upload = (content == null ? null : content.get('upload'));

            if (upload && upload.filebrowser && upload.filebrowser['params'] === undefined) {
                upload.filebrowser['params'] = config.filebrowserParams();
                upload.action = config.addQueryString(upload.action, upload.filebrowser['params']);
            }
        }
    });
}
CKEDITOR.replace('ckeditor', {
  filebrowserUploadUrl: '/path/to/upload.php',
  extraPlugins: 'attach', // attachment plugin
  toolbar: this.customToolbar, //use custom toolbar
  autoCloseUpload: true, //autoClose attachment container on attachment upload
  validateSize: 100, //100mb size limit
  on: {
    onAttachmentUpload: function(response) {
      /*
       the following code just utilizes the attachment upload response to generate 
       ticket-attachment on your page
      */
      attachment_id = $(response).attr('data-id');
      if (attachment_id) {
        attachment = $(response).html();
        $closeButton = $('<span class="attachment-close">').text('x').on('click', closeButtonEvent)
        $('.ticket-attachment-container').show()
          .append($('<div>', { class: 'ticket-attachment' }).html(attachment).append($closeButton))
          .append($('<input>', { type: 'hidden', name: 'attachment_ids[]' }).val(attachment_id)
          );
        }
      }
    }
  }
});