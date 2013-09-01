
module Dictuby
    class ArgsParser
        def self.parse(args)

            options = {}

            OptionParser.new do |o|
                o.on('-h')            { puts o; exit }
                o.on('-l')            { |b| options[:list] = b }
                o.on('-s DICTIONARY') { |d| options[:set] = d }
                o.on('QUERY')         { }
                o.parse!
            end

            options
        end
    end
end
