Dictuby
=======

Command line online dictionary tool written in ruby

Synopsis

    Usage: dictuby [options] [QUERY]...
    -h, --help                       Display this message
    -l, --list-dicts                 List available dictionaries
    -g, --get-dict                   Display current active dictionary
    -s, --set-dict DICTIONARY        Set active dictionary

Examples
--------
    
List available dictionaries

    dictuby -l

Set desired dictionary

    dictuby -s en-sk

Translate

    dictuby oblivion
