require 'zlib'
require 'json'

def compress_data(filename)
    flist = JSON.parse(File.read('extracted/.namelist'))
    data = []
    for item in flist
      puts item[0]
      data << [item[1], item[0], Zlib::Deflate.deflate(File.read("extracted/".concat(item[0])))]
    end
    File.write(filename, Marshal.dump(data))
  end

compress_data('Scripts1.rxdata')
