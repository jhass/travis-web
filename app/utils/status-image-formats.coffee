`import { ccXml as ccXmlUrl, statusImage as statusImageUrl } from 'travis/utils/urls'`

urlRepo = ( (slug) ->
  "https://#{location.host}/#{slug}"
)

markdownStatusImage = ( (url, slug, branch) ->
  "[![Build Status](#{statusImageUrl(slug, branch)})](#{url})"
)

textileStatusImage = ( (url, slug, branch) ->
  "!#{statusImageUrl(slug, branch)}!:#{url}"
)

rdocStatusImage = ( (url, slug, branch) ->
  "{<img src=\"#{statusImageUrl(slug, branch)}\" alt=\"Build Status\" />}[#{url}]"
)

asciidocStatusImage = ( (url, slug, branch) ->
  "image:#{statusImageUrl(slug, branch)}[\"Build Status\", link=\"#{url}\"]"
)

rstStatusImage = ( (url, slug, branch) ->
  ".. image:: #{statusImageUrl(slug, branch)}\n    :target: #{url}"
)

podStatusImage = ( (url, slug, branch) ->
  "=for HTML <a href=\"#{url}\"><img src=\"#{statusImageUrl(slug, branch)}\"></a>"
)

ccxmlStatusUrl = ( (slug, branch) ->
  ccXmlUrl(slug, branch)
)

format = (version, slug, branch) ->
  url = urlRepo(slug)

  switch version
    when 'Image URL' then statusImageUrl(slug, branch)
    when 'Markdown' then markdownStatusImage(url, slug, branch)
    when 'Textile' then textileStatusImage(url, slug, branch)
    when 'Rdoc' then rdocStatusImage(url, slug, branch)
    when 'AsciiDoc' then asciidocStatusImage(url, slug, branch)
    when 'RST' then rstStatusImage(url, slug, branch)
    when 'Pod' then podStatusImage(url, slug, branch)
    when 'CCTray' then ccxmlStatusUrl(slug, branch)


`export default format`
