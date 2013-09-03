Dictuby
=======

Command line online dictionary tool written in Ruby

Synopsis

    Usage: dictuby [options] [QUERY]...
    -h, --help                       Display this message
    -l, --list-dicts                 List available dictionaries
    -g, --get-dict                   Display current active dictionary
    -s, --set-dict DICTIONARY        Set active dictionary
    -a, --list-sources               List available sources
    -e, --enable-source SOURCE_NAME  Enable source with specified name
    -d, --disable-source SOURCE_NAME Enable source with specified name


Installation
------------

    gem install dictuby

or

    git clone https://github.com/simpliplant/dictuby.git
    cd dictuby
    gem build dictuby.gemspec
    gem install dictuby-0.0.9.gem


Examples
--------
    
List available dictionaries

    dictuby -l

Set desired dictionary

    dictuby -s en-es

Translate

    dictuby car

Optionally you can tide up and you can disable some unwanted sources so useless disctionaries won't come up on "dictuby -l" command

At first list all dictionary sources

    dictuby -a

And disable unwanted sources

    dictuby -d slovnik.sk
    dictuby -d slovnik.cz

Sources can be also enabled again
    
    dictuby -e slovnik.sk
