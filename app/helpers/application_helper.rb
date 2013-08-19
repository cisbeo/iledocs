module ApplicationHelper

	def nolsmarkdown(text)
		options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]

		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
        


        if text.empty? || text.blank?
        	text = "**" + t("no_information") + "**"
        else
        	text.gsub!("$","\r\n")
            if !text.nil?
              markdown.render(text).html_safe  
            else
            text = "**" + t("no_information") + "**"
            end
        end
	end

  def markdown(text)  
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode, :fenced_code_blocks, :disable_indented_code_blocks]  
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,fenced_code_blocks: true, disable_indented_code_blocks: true)
      markdown.render(text).html_safe
  end

end
