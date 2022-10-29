#!/usr/bin/env lua
-- Create a release with a incremented tag
-- run it from the master branch only
local handle = io.popen("git describe --tags --abbrev=0")
local output = handle:read("*a")
handle:close()

-- Company specific git versioning workflow
local tag = output:sub(2) + 1
local cmd = "gh release create v" .. tag .. " --generate-notes"

print(cmd)
os.execute(cmd)
