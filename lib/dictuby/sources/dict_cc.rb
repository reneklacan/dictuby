
module Dictuby
  class DictCC < OnlineDictionary
    @name = 'dict.cc'
    @dicts = {
      'en-es' => 'en-es',
      'es-en' => 'es-en',
      'en-de' => 'en-de',
      'de-en' => 'de-en',
      'en-fr' => 'en-fr',
      'fr-en' => 'fr-en',
      'en-it' => 'en-it',
      'it-en' => 'it-en',
      'en-fi' => 'en-fi',
      'fi-en' => 'fi-en',
    }
    @url = 'http://%{dict}.dict.cc/?s=%{query}'

    def self.process page, query
      page.xpath(
        '//tr[starts-with(@id, "tr")]'
      ).inject([]) do |result, tr|
        tds = tr.xpath('td[@dir="ltr"]')

        left = tds[0].xpath('a')[0].text.normalize
        right = tds[1].xpath('a')[0].text.normalize

        return result if left != query && right != query

        result << left == query ? right : left
        result
      end
    end
  end
end
