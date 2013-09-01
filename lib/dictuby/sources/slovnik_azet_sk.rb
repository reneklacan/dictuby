
module Dictuby
    class SlovnikAzetSK < OnlineDictionary
        @name = 'slovnik.azet.sk'
        @dicts = {
            'en-sk' => 'anglicko-slovensky',
            'sk-en' => 'slovensko-anglicky',
            'ge-sk' => 'nemecko-slovensky',
            'sk-ge' => 'slovensko-nemecky',
            'fr-sk' => 'francuzsko-slovensky',
            'sk-fr' => 'slovensko-francuzsky',
            'sp-sk' => 'spanielsko-slovensky',
            'sk-sp' => 'slovensko-spanielsky',
            'hu-sk' => 'madarsko-slovensky',
            'sk-hu' => 'slovensko-madarsky',
            'it-sk' => 'taliansko-slovensky',
            'sk-it' => 'slovensko-taliansky',
            'ru-sk' => 'rusko-slovensky',
            'sk-ru' => 'slovensko-rusky',
        }
        @url = "http://slovnik.azet.sk/preklad/%{dict}/?q=%{query}"

        def self.process(page, query)
            left = page.xpath('//table[1]//span')[0].text rescue nil
            return [] unless left == query
            right = page.xpath(
                '//table[1]//tr/td[@class="do"]/span'
            ).inject([]) {
                |r, e| r << e.text
            }

            right
        end
    end
end
