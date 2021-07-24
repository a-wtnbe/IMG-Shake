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
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets



//= require effect
var src_img = null;
var dst_canvas = null;
var dst_ctx = null;

$(function(){
  setInterval(function() {
    run()
    }, 1000);
});




  function run(){
    if (document.getElementById("imgshake")) {
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
      EffectDiffusion(source,destination,10);

      // canvasへ描画
      dst_ctx.putImageData(destination,0,0);
    }

    if (document.getElementsByClassName("imgshake")) {
        const elements = document.getElementsByClassName("imgshake");
        for (let step = 0; step < elements.length; step++) {
          // 値が 0 から 4 まで計 5 回実行される
          console.log(document.getElementsByClassName("imgshake")[step].childNodes[0]);
          const element = document.getElementsByClassName("imgshake")[step].childNodes[0];
          const elements = document.getElementsByClassName("DstCanvas")
          const targetElement = elements[step].getContext("2d");


          // 元画像の描画
          elements[step].width  = element.width;
          elements[step].height = element.height;
          targetElement.drawImage(element,0,0);

          // ImageDataの生成
          const source = targetElement.getImageData(0,0,elements[step].width,elements[step].height);
          const destination = targetElement.createImageData(elements[step].width,elements[step].height);

          // エフェクトの実行
          EffectDiffusion(source,destination,10);

          // canvasへ描画
          targetElement.putImageData(destination,0,0);
        }

    }




    // // 元画像の描画
    // dst_canvas.width  = src_img.width;
    // dst_canvas.height = src_img.height;
    // dst_ctx.drawImage(src_img,0,0);

    // // ImageDataの生成
    // var source = dst_ctx.getImageData(0,0,dst_canvas.width,dst_canvas.height);

    // // エフェクトの実行
    // EffectNoise(source,100);

    // // canvasへ描画
    // dst_ctx.putImageData(source,0,0);

  }






