# nbt_utils

Some classes for handling [Minecraft](http://minecraft.net) `.nbt` files.

See the spec (`NBT.txt` in doc directory) for more info.

## Installation

Requires Ruby 2.7 minimum.

    gem install nbt_utils

## Use

```ruby
require 'nbt_utils'

@file = NBTUtils::File.new
@tag = @file.read('some_nbt_file.nbt')
puts @tag.to_s
@file.write('some_new_path.nbt', @tag, true) # true / false to gzip automatically
```

### Copyright

Copyright Michael Dungan, mpd@jesters-court.net, released under the MIT license.

The files `NBT.txt`, `test.nbt`, `test_uncompressed.nbt`, `bigtest.nbt`, and `bigtest_uncompressed.nbt` in the doc directory are mirrored from the Minecraft website and not covered under the above license.
