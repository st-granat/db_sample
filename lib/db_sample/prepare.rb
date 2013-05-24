# coding: utf-8
module DbSample
  module Prepare
    def self.markdown_to_html(text, interpitator=nil)
      interpitator = 'kramdown' if interpitator.nil?
      case interpitator
        when "maruku"
          Maruku.new(text).to_html
        when "rdiscount"
          RDiscount.new(text, :smart, :filter_html).to_html
        when "kramdown"
          Kramdown::Document.new(text, :auto_ids => false).to_html
        when "html"
          text
      end
    end
  end
end
