require("pg")

class PropertyTracker

  attr_accessor :address, :value, :bedrooms, :build,

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @address = options['address']
    @value = options['value']
    @bedrooms = options['bedrooms'].to_i
    @build = options['build']
  end



end
