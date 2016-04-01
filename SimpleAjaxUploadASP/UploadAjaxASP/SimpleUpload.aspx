<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleUpload.aspx.cs" Inherits="UploadAjaxASP.SimpleUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="SimpleAjaxUploader.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>

</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="page-header">
          <h1>Simple Ajax Uploader</h1>
        </div>
          <div class="row" style="padding-top:10px;">
            <div class="col-xs-12">
                
            <div id="progressOuter" class="progress progress-striped active hidden">
            
                <div id="progressBar" class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
            </div>
          </div>
                
            </div>
		</div>
          
		<div class="row" style="padding-top:10px;">
			<div class="col-xs-12 text-center">
              <button id="uploadBtn" class="btn btn-large btn-primary">Examinar</button>
            </div>
        </div>
          
        <div class="row" style="padding-top:10px;">
            <div class="col-xs-12">
              <div id="msgBox"style="display:none;"  class="alert alert-success"></div>
            </div>
        </div>
      </div>
        <script>
            function escapeTags(str) {
                return String(str)
                .replace(/&/g, '&amp;')
                .replace(/"/g, '&quot;')
                .replace(/</g, '&lt;').replace(/>/g, '&gt;');
            }

            window.onload = function () {

                var idbtn = document.getElementById('uploadBtn'),
                progressBar = document.getElementById('progressBar'),
                progressOuter = document.getElementById('progressOuter'),
                msgBox = document.getElementById('msgBox');

                var uploader = new ss.SimpleUpload({
                    button: idbtn,
                    url: 'CargarArchivo.asmx/Guardar',
                    name: 'uploadfile',
                    multipart: true,
                    hoverClass: 'hover',
                    multiple: true,
                    focusClass: 'focus',

                    responseType: 'json',
                    startXHR: function () {
                        progressOuter.style.display = 'block';
                        this.setProgressBar(progressBar);
                    },

                    onSubmit: function () {
                        msgBox.innerHTML = '';
                        idbtn.innerHTML = 'Cargando...';
                    },

                    onComplete: function (filename, response) {
                        idbtn.innerHTML = 'Examinar';
                        progressOuter.style.display = 'none';

                        if (!response) {
                            msgBox.innerHTML = 'Inactiva la carga del archivo';
                            return;
                        }

                        if (response.success === true) {
                            msgBox.style.display = 'block';
                            msgBox.innerHTML = '<strong><a href="Archivos/' + escapeTags(filename) + '"> ' + escapeTags(filename) + '</a></strong> ' + 'Archivo cargado.';

                        } else {
                            if (response.msg) {
                                msgBox.innerHTML = escapeTags(response.msg);

                            } else {
                                msgBox.innerHTML = 'Hay un error en la carga del archivo.';
                            }
                        }
                    },
                    onError: function () {
                        progressOuter.style.display = 'none';
                        msgBox.innerHTML = 'Hay un error con el plugin';
                    }
                });
            };

        </script>
    </form>
</body>
</html>
