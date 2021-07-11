// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets



//= require effect
var src_img = null;
var dst_canvas = null;
var dst_ctx = null;

$(function(){
  run();
});


  function run(){

  src_img = document.getElementById("imgshake").childNodes[0];
  dst_canvas = document.getElementById("DstCanvas");
  dst_ctx = dst_canvas.getContext("2d");


    // 元画像の描画
    dst_canvas.width  = src_img.width;
    dst_canvas.height = src_img.height;
    dst_ctx.drawImage(src_img,0,0);

    // ImageDataの生成
    var source = dst_ctx.getImageData(0,0,dst_canvas.width,dst_canvas.height);
    var destination = dst_ctx.createImageData(dst_canvas.width,dst_canvas.height);

    // エフェクトの実行
    EffectDiffusion(source,destination,7);

    // canvasへ描画
    dst_ctx.putImageData(destination,0,0);
  }




