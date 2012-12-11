# ruby-simplepp - simple pretty print

+ [github project] (https://github.com/geronime/ruby-simplepp)

ruby-simplepp is a module to simple string pretty print of hash/array structures.

## Usage:

    require 'ruby-simplepp'
    pretty = SimplePP.pp(struct, indent_level=0, indent_str='  ')

+ `indent_level` specifies starting indentation level (internally used
  for recursion as well)
+ indentation string can be redefined with `indent_str` (defaults to two spaces)

## Example:

    irb> puts SimplePP.pp struct
    {
      "resource" => "anywhere",
      "q"        => "Some query",
      "search"   => "fulltext",
      "limit"    => 20,
      "details"  => false,
      "foo"      => nil,
      "bar"      => "baz",
      "result"   => {
        "search_time" => 0.532,
        "item_count"  => 1,
        "items"       => [
          {
            "name" => "Item name",
            "url"  => "http://foo.bar.baz"
          }
        ]
      }
    }

## Changelog:

+ __0.0.2__: symbols displayed as symbols, empty hashes/arrays are not newlined
+ __0.0.1__: first revision of simple pretty print

## License:

ruby-simplepp is copyright (c)2012 Jiri Nemecek, and released under the terms
of the MIT license. See the LICENSE file for the gory details.

