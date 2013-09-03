
module Dictuby
    class SlovnikSK < OnlineDictionary
        @name = 'slovnik.sk'
        @dicts = {
            'en-sk' => 'anglicko-slovensky',
            'sk-en' => 'slovensko-anglicky',
            'de-sk' => 'nemecko-slovensky',
            'sk-de' => 'slovensko-nemecky',
            'fr-sk' => 'francuzsko-slovensky',
            'sk-fr' => 'slovensko-francuzsky',
            'es-sk' => 'spanielsko-slovensky',
            'sk-es' => 'slovensko-spanielsky',
            'hu-sk' => 'madarsko-slovensky',
            'sk-hu' => 'slovensko-madarsky',
            'it-sk' => 'taliansko-slovensky',
            'sk-it' => 'slovensko-taliansky',
            'ru-sk' => 'rusko-slovensky',
            'sk-ru' => 'slovensko-rusky',
        }
        @url = 'http://slovnik.azet.sk/preklad/%{dict}/?q=%{query}'

        def self.process(page, query)
            query = query.normalize
            left = page.xpath('//table[1]//span')[0].text rescue nil
            left.normalize! unless left.nil?
            return [] unless left == query

            page.xpath(
                '//table[1]//tr/td[@class="do"]/span'
            ).inject([]) {
                |r, e| r << e.text
            }
        end
    end
end
