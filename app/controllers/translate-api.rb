require 'net/http'
require 'uri'
require 'json'

def translate(lyrics)
  local = lyrics
  local.split("").each do |i|
    if i == " "
      local.sub!(i, '%20')
    elsif i == 'ù'
      local.sub!(i, '%0249')
    elsif i == 'Ù'
      local.sub!(i, '%0217')
    elsif i == 'À'
      local.sub!(i, '%0192')
    elsif i == 'à'
      local.sub!(i, '%0224')
    elsif i == 'è'
      local.sub!(i, '%0232')
    elsif i == 'È'
      local.sub!(i, '%0200')
    elsif i == 'ò'
      local.sub!(i, '%0242')
    elsif i == "\'"
      local.sub!(i, '%27')
    elsif i == 'ì'
      local.sub!(i, '%0236')
    elsif i == 'Ì'
      local.sub!(i, '%0204')
    end
  end
  trans = translations(local)
  trans
end

def translations(lyrics)
  key = 'trnsl.1.1.20170502T140240Z.e335e8f283001e99.9b5c9ad87ddb4e729013b79f9009d8a6b993602f'

  url = 'https://translate.yandex.net/api/v1.5/tr.json/'

  translate = URI(url + 'translate?&key=' + key + '&lang=en&text=' + lyrics + '&options=1')

  get_trans = Net::HTTP.get(translate)

  t = JSON.parse(get_trans)

  translation = ''

  t.each do |key, value|
    if key == 'text'
      translation = value[0]
    end
  end

  translation
end
