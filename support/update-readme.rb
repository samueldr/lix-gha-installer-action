#!/usr/bin/env nix-shell
#!nix-shell -p ruby
#!nix-shell -i ruby

require "yaml"

CHECK = ARGV.include?("--check")

def marker(which, direction)
  "<!-- ACTION.YML #{which.upcase} #{direction.upcase} -->"
end

def replace_markers(str, which, content)
  str.gsub(
    %r{#{marker(which, "start")}.*#{marker(which, "end")}}m,
    [
      marker(which, "start"),
      "",
      content,
      "",
      marker(which, "end"),
    ].join("\n")
  )
end

TOP = File.join(__dir__(), "..")
README = File.join(TOP, "README.md")
ACTION = File.join(TOP, "action.yml")

action_data = YAML.load(File.read(ACTION))
formatted_inputs = action_data["inputs"].map do |key, data|
  [
    "### `#{key}`",
    if data["default"] then [
        "",
        "*Default: `#{data["default"]}`*",
    ] else [] end,
    "",
    data["description"]
  ].flatten().join("\n")
end.join("\n\n")

readme = File.read(README)
new_contents = replace_markers(readme, "inputs", formatted_inputs)

unless readme == new_contents
  if CHECK
    message = [
      "NOTE: generated README sections differ from current README.",
      "      run support/update-readme.rb to update, and then make a new commit.",
    ].join("\n")
    $stderr.puts ""
    $stderr.puts %Q{::error title="Documentation is not up-to-date!"::#{message.gsub("\n", "%0A")}}
    $stderr.puts ""
    $stderr.puts message
    exit 1
  else
    File.write(README, new_contents)
  end
end


#vim ft=ruby
