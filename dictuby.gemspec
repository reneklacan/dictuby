Gem::Specification.new do |s|
    s.name        = 'dictuby'
    s.version     = '0.0.4'
    s.date        = '2013-09-01'
    s.summary     = 'command line online dictionary'
    s.description = 'command line online dictionary'
    s.authors     = ['Rene Klacan']
    s.email       = 'rene.klacan@gmail.com'
    s.files       = [
        'lib/dictuby.rb',
        'lib/dictuby/online_dictionary.rb',
        'lib/dictuby/sources',
        'lib/dictuby/sources/slovnik_azet_sk.rb',
        'lib/dictuby/sources/slovnik_cz.rb',
        'lib/dictuby/config.rb',
        'lib/dictuby/args_parser.rb',
        'lib/dictuby/runner.rb',
    ]
    s.executables = ['dictuby']
    s.homepage    = ''
    s.license     = 'MIT'
end
