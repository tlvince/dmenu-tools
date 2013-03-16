$ ->
  api = 'https://api.github.com/repos/tlvince/dmenu-tools'

  # Get the readme, convert from markdown to HTML and add it to the DOM
  getReadme = ->
    $.getJSON "#{api}/readme?callback=?", (response) ->
      # In-case we haven't exceeded GitHub's rate limits
      if response.data.content
        if response.data.encoding == 'base64'
          # newlines are unsupported in atob's base64 decoding
          readme = response.data.content.replace(/\n/g, '')
          readme = window.atob(readme)

          html = new Markdown.Converter().makeHtml(readme)
          $('#main_content p').replaceWith html

  # Add each script as a list
  getScripts = ->
    $.getJSON "#{api}/contents/src?callback=?", (response) ->
      # In-case we haven't exceeded GitHub's rate limits
      if response.data
        source = $('#script-template').html()
        template = Handlebars.compile source
        scripts = script: response.data
        html = template scripts
        $('#main_content h2').first().before html

  getReadme()

  # Wait until the DOM has updated until adding the script list.
  # Has a similar effect as a debounced 'DOMNodeInserted'.
  #
  # See: http://updates.html5rocks.com/2012/02/Detect-DOM-changes-with-Mutation-Observers
  # and: https://hacks.mozilla.org/2012/05/dom-mutationobserver-reacting-to-dom-changes-without-killing-browser-performance/
  MutationObserver = window.MutationObserver || window.WebKitMutationObserver
  observer = new MutationObserver (mutations) ->
    getScripts()
    observer.disconnect()
  observer.observe $('#main_content')[0], childList: true
