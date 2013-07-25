module ApplicationHelper

	def markdown(text)
		options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]

		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
        


        if text.empty? || text.blank?
        	text = "**" + t("no information") + "**"
        else
        	text.gsub!("$","\r\n")
            if !text.nil?
              markdown.render(text).html_safe  
            else
            text = "**" + t("no information") + "**"
            end
        end


	end
end
