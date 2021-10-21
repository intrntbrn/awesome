 --DOC_GEN_IMAGE --DOC_NO_USAGE
local module = ... --DOC_HIDE
local awful = {tag = require("awful.tag"), layout = require("awful.layout")} --DOC_HIDE
local beautiful = require("beautiful") --DOC_HIDE
require("awful.ewmh") --DOC_HIDE
screen[1]._resize {x = 0, width = 160, height = 90} --DOC_HIDE
awful.tag({ "one", "two", "three" }, screen[1], awful.layout.suit.tile) --DOC_HIDE

function awful.spawn(name, properties) --DOC_HIDE
    client.gen_fake{class = name, name = name, x = 10, y=10, width = 60, height =50, tags = properties.tags} --DOC_HIDE
end --DOC_HIDE

module.add_event("Spawn some apps", function() --DOC_HIDE
   for tag_idx = 1, 3 do
       for _ = 1, 3 do
           awful.spawn("", {tags = {screen[1].tags[tag_idx]}})
       end
   end

    client.get()[1].color = "#ff777733" --DOC_HIDE

end) --DOC_HIDE

--DOC_NEWLINE
module.display_tags() --DOC_HIDE

module.add_event("Call `:jump_to()`, which will select tag #2", function() --DOC_HIDE
   client.get()[6]:jump_to()
   client.get()[1].color = beautiful.bg_normal --DOC_HIDE
   client.get()[6].color = "#ff777733" --DOC_HIDE
end) --DOC_HIDE

module.display_tags() --DOC_HIDE

module.add_event("Call `:jump_to(true)`, which will select tag #2 and #3", function() --DOC_HIDE
   --DOC_NEWLINE
   client.get()[7]:jump_to(true)
   client.get()[6].color = beautiful.bg_normal --DOC_HIDE
   client.get()[7].color = "#ff777733" --DOC_HIDE
end) --DOC_HIDE

module.display_tags() --DOC_HIDE

module.execute { display_screen = false, display_clients     = true , --DOC_HIDE
                 display_label  = false, display_client_name = true } --DOC_HIDE
