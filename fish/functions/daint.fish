# Defined in - @ line 1
function daint --wraps='ssh daint.cscs.ch' --description 'alias daint=ssh daint.cscs.ch'
  ssh daint.cscs.ch $argv;
end
