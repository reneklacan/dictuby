
module Dictuby
    class SlovnikCZ < OnlineDictionary
        @name = 'slovnik.cz'
        @dicts = {
            'en-cz' => 'encz.en',
            'cz-en' => 'encz.cz',
            'ge-cz' => 'gecz.ge',
            'cz-ge' => 'gecz.cz',
            'fr-cz' => 'frcz.fr',
            'cz-fr' => 'frcz.cz',
            'it-cz' => 'itcz.it',
            'cz-it' => 'itcz.cz',
            'sp-cz' => 'spcz.sp',
            'cz-sp' => 'spcz.cz',
        }
        @url = 'http://slovnik.cz/bin/mld.fpl?vcb=%{query}&dictdir=%{dict}&lines=30&js=0'

        def self.process(page, query)
            query = I18n.transliterate(query)
            pairs = page.xpath('//div[@class="pair"]')

            pairs.inject([]) do |right, pair|
                left = pair.xpath('span[@class="l"]')[0].text
                left = I18n.transliterate(left)
                return right if left != query
                right << pair.xpath('span[@class="r"]')[0].text
            end
        end
    end
end
