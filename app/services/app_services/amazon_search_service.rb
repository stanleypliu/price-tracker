module AppServices
  class AmazonSearchService
    def initialize(name:)
      # Perform case insensitive search
      @name = name.downcase

      @agent = Mechanize.new
      @page = agent.get('https://www.amazon.co.uk')
    end

    def call
      # Find the search bar
      search_form = @page.forms.find { |f| f.name == 'site-search' } 
      search_input = search_form.fields[0]
      
      # Fill out the input with the product name
      search_input.value = @name

      # Submit the form
      @page = @agent.submit(search_form, search_form.buttons.first)

      # Find the relevant links via a Regex text match
      relevant_links = @page.links.filter { |link| link.text.match?(/(#{@name})/i) }

      relevant_links.each do |link| 
        link.text.squish!
      end
      # 42
    end
  end
end