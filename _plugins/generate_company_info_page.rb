# _plugins/generate_dynamic_pages.rb
module Jekyll
  require 'yaml'

  class CompanyInfoPageGenerator < Generator
    safe true

    def generate(site)
      # Ensure the 'companies' data exists to prevent errors
      return unless site.data['companies']

      site.data['companies'].each do |company|
        site.pages << CompanyInfoPage.new(site, company)
      end
    end
  end

  class CompanyInfoPage < Page
    def initialize(site, company)
        @site = site
        @base = site.source
        @dir = '.'
        @name = "#{company[1]['config']['slug']}.html"

        self.process(@name)
        self.read_yaml(File.join(@base, '_layouts'), 'company-info.html')
        self.data['company'] = company[1]
    end
  end
end
