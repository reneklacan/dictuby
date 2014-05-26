module Dictuby
  class SlovnikCZ < OnlineDictionary
    @name = 'slovnik.cz'
    @dicts = {
      'en-cz' => 'encz.en',
      'cz-en' => 'encz.cz',
      'de-cz' => 'gecz.ge',
      'cz-de' => 'gecz.cz',
      'fr-cz' => 'frcz.fr',
      'cz-fr' => 'frcz.cz',
      'it-cz' => 'itcz.it',
      'cz-it' => 'itcz.cz',
      'es-cz' => 'spcz.sp',
      'cz-es' => 'spcz.cz',
    }
    @url = 'http://slovnik.cz/bin/mld.fpl?vcb=%{query}&dictdir=%{dict}&lines=30&js=0'

    def self.process page, query
      query = query.normalize
      pairs = page.xpath('//div[@class="pair"]')

      pairs.inject([]) do |right, pair|
        left = pair.xpath('span[@class="l"]')[0].text.normalize
        return right if left != query
        right << pair.xpath('span[@class="r"]')[0].text
      end
    end
  end
end
