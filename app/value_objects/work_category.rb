require 'ostruct'

module WorkCategory
  @@categories = %w(client products open-source)

  class << self
    delegate :first, :each, :last, :sample, to: :names

    def [](id)
      id.to_s.split('-').map(&:capitalize).join(' ')
    end

    def names
      @@categories
    end

    def all
      names.map do |category|
        OpenStruct.new({ name: self[category], id: category })
      end
    end
  end

end
