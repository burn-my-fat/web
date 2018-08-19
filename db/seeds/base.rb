# frozen_string_literal: true

module Seeds
  class Base
    attr_reader :repo, :collection

    def initialize(repo)
      @repo = repo
      @repo.clear

      @collection = {}
    end

    def call(items)
      items.each do |item|
        @collection[parameterize(item).to_sym] = repo.create(name: item)
      end

      self
    end

    def [](key)
      @collection[key]
    end

    protected

    def parameterize(value)
      value.gsub(/\s+/, '_').downcase
    end
  end
end
