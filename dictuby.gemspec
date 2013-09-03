Gem::Specification.new do |s|
    s.name        = 'dictuby'
    s.version     = '0.0.9'
    s.date        = '2013-09-03'
    s.summary     = 'Command line dictionary'
    s.description = 'Command line online dictionary tool written in Ruby'
    s.authors     = ['Rene Klacan']
    s.email       = 'rene.klacan@gmail.com'
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
    s.homepage    = 'https://github.com/simpliplant/dictuby'
    s.license     = 'MIT'
end
