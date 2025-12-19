xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "EventPulse - Latest Events"
    xml.link root_url
    xml.selfLink feed_url(format: :rss), rel: "self", type: "application/rss+xml"
    xml.description "Discover and share amazing events happening around you"
    xml.language "en-us"
    xml.lastBuildDate CGI.rfc1123_date(@posts.first.published_at) if @posts.any?
    xml.ttl "60"

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description do
          xml.cdata!(strip_tags(post.body).strip)
        end
        xml.link post.url.present? ? post.url : post_url(post)
        xml.guid post_url(post)
        xml.pubDate post.published_at.to_formatted_s(:rfc822)
        xml.category "Event"
        xml.author "EventPulse"
      end
    end
  end
end
