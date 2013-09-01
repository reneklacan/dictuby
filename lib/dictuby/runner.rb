
module Dictuby
    class Runner
        def self.execute(args)
            new(args).run
        end

        def initialize(args)
            @options = ArgsParser.parse(args)
            @config = DictubyConfig.new
            @args = args

            @sources = [SlovnikAzetSK, SlovnikCZ]

            @dicts = @sources.inject([]) {|r, p| r << p.dicts.keys}
            @dicts.flatten!.sort!
        end

        def run
            if @options[:list]
                @dicts.each {|d| puts d}
            elsif @options[:set]
                if @dicts.include?(@options[:set])
                    @config.set('dictionary', @options[:set])
                else
                    puts 'Invalid dictionary'
                end
            elsif @options[:get]
                puts @config.get('dictionary')
            else
                if @args.size == 1
                    dict, query = @config.get('dictionary'), @args[0]
                elsif @args.size == 2
                    dict, query = *@args
                end

                map = @sources.inject({}) do |r,p| 
                    p.dicts.keys.each {|d| r[d] = p}; r
                end

                puts query
                map[dict].lookup(dict, query).each do |word|
                    puts "- #{word}"
                end
            end
        end
    end
end
