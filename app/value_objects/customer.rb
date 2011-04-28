class Customer

  LIST = [
    ['Production Paradise', 'http://productionparadise.com'],
    ['El Pulgar del Panda', 'http://elpulgardelpanda.com'],
    ['i++', 'http://imesmes.com'],
    ['Justinmind', 'http://justinmind.com'],
    ['Teambox', 'http://teambox.com'],
    ['Alma Branding', 'http://www.almabranding.com/'],
    ['Alisteo Operations Consulting', 'http://www.alisteo.com/'],
    ["Tell's accuracy", 'http://tellsaccuracy.com/'],
    ["Compartir", 'http://compartir.org/'],
    ["CDL", 'http://cdl.cat/'],
    ["Usolab", 'http://usolab.com/']
  ]

  def self.all
    LIST.sort{|a, b| a[0].downcase <=> b[0].downcase}
  end
end
