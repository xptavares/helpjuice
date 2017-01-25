var ready = function() {
  var $q = $('#q');
  var $articlesThumnail = $('#articles_thumnail');
  var keyup = function(e) {
    var jqxhr = $.getJSON( "search.json",{
      q: $q.val()
    });
    jqxhr.done(function(data) {
      var theHTML = [];
      theHTML.push('<div class="row">');
      $.each( data, function( key, val ) {
        theHTML.push('<div class="col-sm-6 col-md-4">',
                     '<div class="thumbnail">',
                     '<div class="caption">',
                     '<h3>' + val.title + '</h3>',
                     '<p>' + val.body + '</p>',
                     '<p>',
                     '<a class="btn btn-primary btn-xs" href="/articles/' + val.slug + '"><span class="translation_missing" title="translation missing: en.helpers.links.show">Show</span></a>',
                     '<a class="btn btn-default btn-xs" href="/articles/' + val.slug + '/edit"><span class="translation_missing" title="translation missing: en.helpers.links.edit">Edit</span></a>',
                     '<a data-confirm="Are you sure?" class="btn btn-xs btn-danger" rel="nofollow" data-method="delete" href="/articles/' + val.slug + '"><span class="translation_missing" title="translation missing: en.helpers.links.destroy">Destroy</span></a>',
                     '</p>',
                     '</div>',
                     '</div>',
                     '</div>');
      });
      theHTML.push('</div>');
      $articlesThumnail.html(theHTML.join(''));
    });
  }
  $q.on('keyup', keyup);
};

$(document).ready(ready);
$(window).on('load', ready);
