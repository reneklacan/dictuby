
module Dictuby
    class OnlineDictionary
        @name = ''
        @url = ''
        @dicts = {}

        def self.lookup(dict, query)
            url = @url % {
                :dict => @dicts[dict],
                :query => query,
            }

            page = Nokogiri::HTML(open(url))

            self.process(page, query)
        end

        def self.name
            @name
        end

        def self.dicts
            @dicts
        end
    end
end
