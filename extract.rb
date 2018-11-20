require 'zlib'
require 'fileutils'

def extract_data(filename)
    data = File.open(filename, "rb") { |f| Marshal.load(f) }
    namelist = []
    FileUtils.mkdir_p 'extracted'
    data.each do |item|
      if item.nil?
        next
      end
      namelist << [item[1], item[0]]
      puts item[1]
      puts item[0]
      puts item.length
      puts File.write("extracted/".concat(item[1]), Zlib::Inflate.inflate(item[2]))
      File.write("extracted/.namelist", namelist)
    end
  end

extract_data('Scripts.rxdata')
