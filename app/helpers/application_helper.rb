#require 'pygmentize'

module ApplicationHelper

  # class HTMLwithPygments < Redcarpet::Render::HTML
  #   # def block_code(code, language)
  #   #   Pygments.highlight(code, lexer:language)
  #   # end
  # end


	def nolsmarkdown(text)
		options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]

		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,fenced_code_blocks: true, disable_indented_code_blocks: true)
        


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
    options = {
      :hard_wrap => true, :filter_html => true, :autolink => true, :no_intraemphasis => true,
      :fenced_code => true, :gh_blockcode => true, :fenced_code_blocks => true,
      :disable_indented_code_blocks => true, with_toc_data: true
      }  
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,options)
      markdown.render(text).html_safe

    # renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    # options = {
    #   autolink: true,
    #   no_intra_emphasis: true,
    #   fenced_code_blocks: true,
    #   lax_html_blocks: true,
    #   strikethrough: true,
    #   superscript: true,
    #   disable_indented_code_blocks: true,
    #   with_toc_data: true,
    # }
    # Redcarpet::Markdown.new(renderer, options).render(text).html_safe

  end

  def nolsdescription(text)
    text.gsub!("*","")
    nolsmarkdown(text)
  end
end
