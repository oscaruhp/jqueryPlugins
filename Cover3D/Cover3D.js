/*
 * jQuery 3DCover
 * @author dimit28@gmail.com - http://develoteca.com
 * @version 1.0
 * @date Julio 31, 2015
 * @category jQuery plugin
 * @copyright (c) 2015 dimit28@gmail.com (http://develoteca.com)
 * @license CC Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0) - http://creativecommons.org/licenses/by-nc-sa/3.0/
 */
jQuery.fn.extend({CoverTresD: function(opciones) {
          var CoverTresD=this;
		  var id="#"+$(CoverTresD).attr('id');
		  var color;
		  defaults = {color:"#333"}
		  var opciones = $.extend({}, defaults, opciones);
		  color=opciones.color;
		  $(id+' img').attr('src');
          urlImg=$(id+' img').attr('src');
          $(id).html('');
		 CONTENIDOHTML='<style>';
		 CONTENIDOHTML=CONTENIDOHTML+""+id+" .Cover3D div.front,"+id+" .Cover3D div.back ,"+id+" .Cover3D div.left{border-top: solid 5px "+color+";border-bottom: solid 5px "+color+";}";
         CONTENIDOHTML=CONTENIDOHTML+""+id+" .Cover3D div.front{border-right: solid 5px "+color+";}";
         CONTENIDOHTML=CONTENIDOHTML+""+id+" .Cover3D div.back {border-left: solid 5px "+color+";}";
		 CONTENIDOHTML=CONTENIDOHTML+"</style>";
         CONTENIDOHTML=CONTENIDOHTML+"<style>"+id+" .Cover3D div{ background-image: url('"+urlImg+"');}</style>";
         CONTENIDOHTML=CONTENIDOHTML+'<section class="Cover3D-container"><div class="Cover3D">';
		 CONTENIDOHTML=CONTENIDOHTML+'<div class="front"></div><div class="back"></div>';
		 CONTENIDOHTML=CONTENIDOHTML+'<div class="left"></div><div class="right"></div>';
		 CONTENIDOHTML=CONTENIDOHTML+'<div class="top"></div><div class="bottom"></div>';
		 CONTENIDOHTML=CONTENIDOHTML+'</div></section>';
		 $(id).html(CONTENIDOHTML);
          
	}
});