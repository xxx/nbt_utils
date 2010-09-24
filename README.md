nbt_utils
=========

Some classes for handling Minecraft .nbt files.

See http://www.minecraft.net/docs/NBT.txt for specification info, also mirred in the doc directory.

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

The files `NBT.txt`, `test.nbt`, and `bigtest.nbt` in the `doc` directory are mirred from the Minecraft website.
