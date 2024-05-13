# _plugins/generate_dynamic_pages.rb
module Jekyll
  require 'yaml'

  class CompanyToolsYamlPageGenerator < Generator
    safe true

    def generate(site)
      # Ensure the 'companies' data exists to prevent errors
      return unless site.data['companies']

      site.data['companies'].each do |company|
        company[1].each do |section|
            site.pages << CompanyToolsYamlPage.new(site, company, section)
        end
      end
    end
  end

  class CompanyToolsYamlPage < Page
    def initialize(site, company, section)
        @site = site
        @base = site.source
        @dir = '.'
        @name = "#{company[1]['config']['slug']}-#{section[0]}.yaml"

        self.process(@name)
        self.read_yaml(File.join(@base, '_layouts'), 'company-tools.yaml')
        self.data['company'] = company[1]
        self.data['section'] = section
    end
  end
end
