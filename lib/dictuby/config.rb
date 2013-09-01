
module Dictuby
    class DictubyConfig
        def initialize
            @default_dict = 'en-sk'
            @config_path = File.expand_path('~') + '/.dictuby'
            @settings = nil

            if File.exists?(@config_path)
                File.open(@config_path, 'r') do |content|
                    @settings = YAML.load(content)
                end
            end

            if !@settings
                @settings = {}
                set('dictionary', @default_dict)
            end
        end

        def get(key)
            @settings[key]
        end

        def set(key, value)
            @settings[key] = value
            save
        end

        def save
            f = File.new(@config_path, 'w')
            f.write(YAML.dump(@settings))
            f.close
        end
    end
end
