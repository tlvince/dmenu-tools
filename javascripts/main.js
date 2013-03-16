$(function() {
  $.getJSON("https://api.github.com/repos/tlvince/dmenu-tools/readme?callback=?", function(response) {
    var readme = response.data.content.replace(/\n/g, '');
    readme = window.atob(readme);
    var html = new Markdown.Converter().makeHtml(readme);
    $('#main_content p').replaceWith(html);
  });
});
