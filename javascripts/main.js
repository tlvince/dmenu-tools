$(function() {
    $.getJSON("https://api.github.com/repos/tlvince/dmenu-tools/readme", function(data) {
    var readme = data.content.replace(/\n/g, '');
    readme = window.atob(readme);
    var html = new Markdown.Converter().makeHtml(readme);
    $('#main_content').replaceWith(html);
  });
});
