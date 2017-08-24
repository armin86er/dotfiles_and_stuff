#!/bin/ruby

tree  = {
  :a => {
    :x => ['foo','bar'],
    :z => ['foo','bar'],
    :y => 'Bar'
  },
  :b => {
    :x => 'Baz',
    :y => 'Qux'
  }
}

puts tree[:a][:z][0]

changes = {"applications" => {
    "/application" => {
        "[@class=" => {
            "'Atom']" => {  "/size/width" => ["true", "vertical"].to_a, "/maximized" => ["true", "vertical"], "/decor" => ["no", "yes"] },
        },
        "@[name=" => {}
    }
}}

puts changes["applications"]["/application"]["[@class="]["'Atom']"]["/size/width"][0]
