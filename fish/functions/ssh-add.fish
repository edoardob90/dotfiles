# Defined in - @ line 1
function ssh-add --wraps=/usr/bin/ssh-add --description 'alias ssh-add=/usr/bin/ssh-add'
  /usr/bin/ssh-add  $argv;
end
