nbt_utils
=========

Some classes for handling [Minecraft](http://minecraft.net) .nbt files.

See the spec (NBT.txt in doc directory) for more info.

Installation
============

Requires ruby 1.9 minimum. Tested with 1.9.2+

    gem install nbt_utils

No sudo. You *are* using [rvm](http://rvm.beginrescueend.com/), right?

Use
===

    require 'nbt_utils'

    @file = NBTUtils::File.new
    @tag = @file.read('some_nbt_file.nbt')
    puts @tag.to_s
    @file.write('some_path.nbt', @tag, <compress? true/false>)

Copyright
=========

Copyright (c) 2010-2015 Michael Dungan, mpd@jesters-court.net, released under the MIT license.

The files `NBT.txt`, `test.nbt`, `test_uncompressed.nbt`, `bigtest.nbt`, and `bigtest_uncompressed.nbt` in the doc directory are mirrored from the Minecraft website and not covered under the above license.
