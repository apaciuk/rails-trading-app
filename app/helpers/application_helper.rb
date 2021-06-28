module ApplicationHelper
   def gravatar_for(user, oprions = { size: 200 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: use.name, class: "border-radius-50")
    end
    def markdown_tohtml(text)
        Kramdown::Document.new(text, input: "GFM").to_html
    end

    def trade_author(trade)
     user_signed_in? && current_user.id == trade.user_id
    end
end
