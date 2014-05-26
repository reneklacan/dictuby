Gem::Specification.new do |s|
    s.name        = 'dictuby'
    s.version     = '0.1.0'
    s.date        = '2014-05-26'
    s.summary     = 'Command line dictionary'
    s.description = 'Command line online dictionary tool written in Ruby'
    s.authors     = ['Rene Klacan']
    s.email       = 'rene@klacan.sk'
    s.files       = [
        'lib/dictuby.rb',
        'lib/dictuby/string.rb',
        'lib/dictuby/online_dictionary.rb',
        'lib/dictuby/sources',
        'lib/dictuby/sources/slovnik_sk.rb',
        'lib/dictuby/sources/slovnik_cz.rb',
        'lib/dictuby/sources/dict_cc.rb',
        'lib/dictuby/config.rb',
        'lib/dictuby/args_parser.rb',
        'lib/dictuby/runner.rb',
    ]
    s.executables = ['dictuby']
    s.homepage    = 'https://github.com/reneklacan/dictuby'
    s.license     = 'MIT'
end
