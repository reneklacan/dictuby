
module Dictuby
    class ArgsParser
        def self.parse(args)
            options = {}

            args << '--help' if args.empty?

            OptionParser.new do |o|
                o.on(
                    '-h', 
                    '--help', 
                    'Display this message'
                ) do
                    puts o; exit 
                end

                o.on(
                    '-l',
                    '--list-dicts',
                    'List available dictionaries'
                ) do |b|
                    options[:list_dicts] = b
                end

                o.on(
                    '-g',
                    '--get-dict',
                    'Display current active dictionary'
                ) do |b|
                    options[:get] = b
                end

                o.on(
                    '-s DICTIONARY',
                    '--set-dict DICTIONARY',
                    'Set active dictionary'
                ) do |d| 
                    options[:set] = d
                end

                o.on(
                    '-a',
                    '--list-sources',
                    'List available sources'
                ) do |b|
                    options[:list_sources] = b
                end

                o.on(
                    '-e SOURCE_NAME',
                    '--enable-source SOURCE_NAME',
                    'Enable source with specified name'
                ) do |s| 
                    options[:enable] = s
                end

                o.on(
                    '-d SOURCE_NAME',
                    '--disable-source SOURCE_NAME',
                    'Enable source with specified name'
                ) do |s| 
                    options[:disable] = s
                end
                o.on('QUERY') {}
                o.parse!
            end

            options
        end
    end
end
