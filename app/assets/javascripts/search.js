$(document).on("turbolinks:load", function () {
  // var result = $('#result')
  // var appendArtistInfo = function(response){
  // var html = `HTML`
  // results.append(html);
  // }

  $('#search-form').on('submit', function (e) {
    var input = $('#query').val();
    console.log(input);
    e.preventDefault();

    $.ajax({
      url: "/songs/search",
      // headers: {'Authorization': 'Bearer ' + gon.token},
      data: { keyword: input },
      dataType: 'json'
    })

    // .done(function (response) {
    //   console.log(response);
    // })
    // .fail(function () {
    //   console.log('fail');
    // });
  })
});


