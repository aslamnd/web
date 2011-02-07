Factory.define :screenshot do |f|
  f.file File.open("spec/support/files/screenshot.png")
end
