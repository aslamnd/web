class Customer

  LIST = [
    ['Production Paradise', 'http://productionparadise.com'],
    ['El Pulgar del Panda', 'http://elpulgardelpanda.com'],
    ['I++', 'http://imesmes.com'],
    ['Justinmind', 'http://justinmind.com'],
    ['Teambox', 'http://teambox.com'],
    ['Alma Branding', 'http://www.almabranding.com/'],
    ['Alisteo Operations Consulting', 'http://www.alisteo.com/'],
    ["Tell's accuracy", 'http://tellsaccuracy.com/']
  ]

  def self.all
    LIST.sort{|a, b| a[0] <=> b[0]}
  end
end
