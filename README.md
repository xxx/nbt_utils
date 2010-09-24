nbt_utils
=========

Some classes for handling [Minecraft](http://minecraft.net) .nbt files.

See [the spec](http://www.minecraft.net/docs/NBT.txt) for more info, also mirred in the doc directory in a file named `NBT.txt`.

Installation
============

Requires ruby 1.9 minimum. Tested with 1.9.2.

    gem install nbt_utils

Use
===

    require 'nbt_utils'

    @tag = NBTUtils::File.new.read('some_nbt_file.nbt')
    puts @tag.to_s

Copyright
=========

Copyright (c) 2010 Michael Dungan, mpd@jesters-court.net, released under the MIT license.

The files `NBT.txt`, `test.nbt`, and `bigtest.nbt` in the doc directory are mirrored from the Minecraft website and not covered under the above license.
