xml.instruct!
xml.rss version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do

  xml.channel do
    xml.title 'NewsSiteRails'
    xml.description 'NewsSiteRails'
    xml.link root_url
    xml.language 'en'
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: '/rss'

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description(h(article.short_description))
        xml.link article_url(article)
        xml.pubDate(article.created_at.rfc2822)
        xml.guid article_url(article)
      end
    end
  end
end
