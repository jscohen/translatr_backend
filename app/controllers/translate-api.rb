require 'net/http'
require 'uri'
require 'json'

key = 'trnsl.1.1.20170502T140240Z.e335e8f283001e99.9b5c9ad87ddb4e729013b79f9009d8a6b993602f'

url = 'https://translate.yandex.net/api/v1.5/tr.json/'

def translations(lyrics)
  translate = URI(url + 'translate?lang=it-en&key=' + key + '&text=cosa')

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
