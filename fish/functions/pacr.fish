function pacr --wraps='sudo pacman -R' --wraps='yay -Rns' --description 'alias pacr yay -Rns'
  yay -Rns $argv
        
end
