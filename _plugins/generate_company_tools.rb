# _plugins/generate_dynamic_pages.rb
module Jekyll
  require 'yaml'

  class CompanyToolsPageGenerator < Generator
    safe true

    def generate(site)
      # Ensure the 'companies' data exists to prevent errors
      return unless site.data['companies']

      site.data['companies'].each do |company|
        company[1].each do |section|
            site.pages << CompanyToolsPage.new(site, company, section)
        end
      end
    end
  end

  class CompanyToolsPage < Page
    def initialize(site, company, section)
        @site = site
        @base = site.source
        @dir = '.'
        @name = "#{company[1]['config']['slug']}-#{section[0]}.html"

        self.process(@name)
        self.read_yaml(File.join(@base, '_layouts'), 'company-tools.html')
        self.data['company'] = company[1]
        self.data['section'] = section
    end
  end
end
