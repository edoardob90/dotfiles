# Defined in - @ line 1
function pandoc --wraps='/usr/bin/env pandoc' --wraps=/usr/local/bin/pandoc --description 'alias pandoc=/usr/local/bin/pandoc'
  /usr/local/bin/pandoc  $argv;
end
