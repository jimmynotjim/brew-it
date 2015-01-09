BREW_IT="$HOME/.brew_it"

function check_for_homebrew() {
  echo "Checking usr/local for Homebrew"
  test -e /usr/local/Library/brew.rb
  return $?
}

function install_homebrew() {
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function check_for_brewfile() {
  echo "Searching for existing .brewrc"
  test -e $HOME/.brewrc
  return $?
}

function backup_brewfile() {
  cp $HOME/.brewrc $HOME/.brewrc.bak
  echo "Your original .brewrc has been backed up to .brewrc.bak"
}

function create_brewfile() {
  cp $HOME/.brew_it/template/brewrc.template.bash $HOME/.brewrc
  echo "Created new .brewrc"
}

function load_all() {
  for src in $BREW_IT/formulas/*;
  do
    cat ${src} >> $HOME/.brewrc
    echo $'\n' >> $HOME/.brewrc
  done
}

function load_some() {
  for src in $BREW_IT/formulas/*;
  do
    while true
    do
      read -p "Would you like to enable the ${src##/*/} formulas? [Y/N] " RESP
      case $RESP in
      [yY])
        cat ${src} >> $HOME/.brewrc
        echo $'\n' >> $HOME/.brewrc
        break
        ;;
      [nN])
        break
        ;;
      *)
        echo "Please choose Y or N."
        ;;
      esac
    done
  done
}

function write_brewfile {
  while true
  do
    read -p "Would you like to enable all, some, or none of the brew formulas? (all/some/none/) " RESP
    case $RESP
    in
    some)
      load_some
      break
      ;;
    all)
      load_all
      break
      ;;
    none)
      echo "Exiting"
      break
      ;;
    *)
      echo "Unknown choice. Please enter all, some, or none"
      continue
      ;;
    esac
  done

  echo "Completed building .brewrc"
}

function review_brewfile() {
  while true
  do
    read -p "Ready to install your formulas (Select NO to review your .brewrc) [Y/N] " RESP
    case $RESP in
    [yY])
      break
      ;;
    [nN])
      echo "Quitting installation, review and rerun when you're ready to install (and respond yes when prompted to install from existing .brewrc)."
      open -e .brewrc
      exit
      break
      ;;
    *)
      echo "Please choose Y or N."
      ;;
    esac
  done
}

function verify_formula() {
  IFS=', ' read -a args <<< "$line"
  cmd=${args[0]}
  p=${args[1]}

  if [ "$cmd" = "brew" ]; then
    cmd=${args[1]}
    p=${args[2]}
  fi
  if [ "$cmd" = "tap" ]; then
    return 0
  elif [ "$cmd" = "install" ]; then
    brew info $p > /dev/null 2> /dev/null
    return $?
  elif [ "$cmd" = "cask" ]; then
    cmd=${args[1]}
    p=${args[2]}
    if [ "$cmd" = "alfred" ]; then
      return 0
    else
      brew cask info $p > /dev/null 2> /dev/null
      return $?
    fi
  fi
}

function install_formulas() {
  while read line;
  do
    line=${line%%#*}
    if [ "$line" = "" ];then
      continue
    fi

    verify_formula line
    formula_exists=$?

    if [ "$formula_exists" = 0 ]; then
      echo ${p}
      #brew ${line}
    else
      echo "package missing: $p"
    fi
  done < $HOME/.brewrc
  echo "Installation is complete, enjoy your new machine!"
}


## Lets do this!


## Check for Homebrew, update if it's installed and ask to install if it's missing
check_for_homebrew
homebrew_installed=$?

if [ "$homebrew_installed" = 0 ]; then
  echo 'homebrew installed, updating homebrew'
  brew update
else
  while true
  do
    read -p "Homebrew is missing from usr/local, would you like to install it? [Y/N] " RESP
    case $RESP
      in
      [yY])
        install_homebrew
        break
        ;;
      [nN])
        echo "Homebrew is required to complete install, please visit http://brew.sh/ to install manually"
        exit
        break
        ;;
      *)
        echo "Please enter Y or N"
    esac
  done
fi


## Check for .brewrc, ask to install or overwrite if it exists and create new .brewrc if it doesn't
check_for_brewfile
brewfile_exists=$?

if [ "$brewfile_exists" = 0 ]; then
  while true
  do
    read -p ".brewrc already exists. Would you like to install from your existing .brewrc? [Y/N] " RESP
    case $RESP in
    [yY])
      install_formulas
      break
      ;;
    [nN])
      backup_brewfile
      create_brewfile
      write_brewfile
      review_brewfile
      install_formulas
      break
      ;;
    *)
      echo "Please choose Y or N."
      ;;
    esac
  done
else
  create_brewfile
  write_brewfile
  review_brewfile
  install_formulas
fi



