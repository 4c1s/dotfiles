function sv-restart --wraps='sudo sv restart' --description 'alias sv-restart sudo sv restart'
  sudo sv restart $argv
        
end
