function sv-add
  sudo ln -s /etc/runit/sv/$argv[1] /run/runit/service/
end
