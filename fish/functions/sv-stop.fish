function sv-stop --wraps='sudo sv stop' --description 'alias sv-stop sudo sv stop'
  sudo sv stop $argv
        
end
