---
layout: page
---
{% include JB/setup %}

<section class="body about">
  <p>
    <img class="left" title="Es cēsu maratonā" src="https://s3-eu-west-1.amazonaws.com/gachaidlv/pages/index/me_small.png" />
    Čau, strādāju par Ruby web programmētāju uzņēmumā <a href="http://www.tieto.lv/" target="_blank">Tieto Latvia</a> un brīvajā laikā
    uzlādējos braucot ar velo pa mežu vai šoseju, šada tad nopeldu kādu kilometru. Un tas vēl nav viss :)
  </p>
  <p>
    <a href="/parmani.html">Te, mazliet vairāk pats par sevi...</a>
  </p>
</section>
<section class="column flickr">
  <div class="content">Lādējam Flickr...</div>
  <p>Attēli no <a href="http://www.flickr.com/photos/gacha_lv">flickr</a></p>
</section>
<script>
  // get flickr
  $.getJSON("http://pipes.yahoo.com/pipes/pipe.run?_id=a7b56cd683115e7832be65f8f916c0a1&_render=json&_callback=?", function(data){
    var content = $('section.flickr .content');
    content.html("");
    $.each(data.value.items, function(idx,item) {
      var a = $('<a href="'+item.big+'" rel="flickr" title="'+item.title+'">')
      var img = $('<img src="'+item.thumb+'" alt="">');
      a.append(img);
      content.append(a);
    });
    // add colorbox
    $("section.flickr .content a").colorbox({rel:'flickr'});
    // multiline title hack
    $(document).bind('cbox_complete', function(){
      $("#cboxTitle").hide(); 
      $("<p>"+$("#cboxTitle").html()+"</p>").css({color: $("#cboxTitle").css('color')}).insertBefore(".cboxPhoto"); 
      $.fn.colorbox.resize(); 
    });
  });
</script>
