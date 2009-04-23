module Jekyll

  module Filters
    def textilize(input)
      RedCloth.new(input).to_html
    end

    def date_to_string(date)
      date.strftime("%d %b %Y")
    end

    def date_to_long_string(date)
      date.strftime("%d %B %Y")
    end

    def date_to_xmlschema(date)
      date.xmlschema
    end

    def xml_escape(input)
      input.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;")
    end

    def number_of_words(input)
      input.split.length
    end

    def array_to_sentence_string(array)
      connector = "and"
      case array.length
      when 0
        ""
      when 1
        array[0].to_s
      when 2
        "#{array[0]} #{connector} #{array[1]}"
      else
        "#{array[0...-1].join(', ')}, #{connector} #{array[-1]}"
      end
    end
    
    #def wikilink(input)
    #  # Support simple [[bracketed]] wiki-links
    #  # via sinatra_wiki's Page::html method
    #  input.gsub(/\[\[(\w+)\]\]/,'[\1](\1)')
    #  #print input
    #  # Support plain (non-bracketed) wiki-words: .gsub(/([A-Z]+)([a-z]+)([A-Z]+)\w+/,'<a href="\0">\0</a>')
    #end

  end
end
