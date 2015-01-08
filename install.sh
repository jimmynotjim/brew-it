BREW_IT="$HOME/.brew_it"

echo "Checking usr/local for Homebrew"
test ! -w /usr/local/Library/brew.rb &&
  while true
  do
    read -p "Homebrew is missing from usr/local, would you like to install it? [Y/N] " RESP

    case $RESP
      in
      [yY])
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo "Updating Homebrew"
        brew update
        break
        ;;
      [nN])
        break
        ;;
      *)
        echo "Please enter Y or N"
    esac
  done

echo "Searching for existing .brewrc"
test -w $HOME/.brewrc &&
  cp $HOME/.brewrc $HOME/.brewrc.bak &&
  echo "Your original .brewrc has been backed up to .brewrc.bak"

cp $HOME/.brew_it/template/brewrc.template.bash $HOME/.brewrc

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

function verify_formula() {
  IFS=', ' read -a args <<< "$line"
  cmd=${args[0]}
  p=${args[1]}

  if [ "$cmd" = "brew" ]; then
    cmd=${args[1]}
    p=${args[2]}
  fi
  if [ "$cmd" = "tap" ]; then
    verify=true
  elif [ "$cmd" = "install" ]; then
    brew info $p > /dev/null 2> /dev/null

    if [ "$?" = 0 ];then
      verify=true
    else
      verify=false
    fi
  elif [ "$cmd" = "cask" ]; then
    cmd=${args[1]}
    p=${args[2]}
    if [ "$cmd" = "alfred" ]; then
      verify=true
    else
      brew cask info $p > /dev/null 2> /dev/null

      if [ "$?" = 0 ];then
        verify=true
      else
        verify=false
      fi
    fi
  fi
}

function install_formulas() {
  while true
  do
    read -p "Completed building .brewrc, ready to install your formulas (Select NO to review your .brewrc) [Y/N] " RESP
    case $RESP in
    [yY])
      while read line;
      do
        line=${line%%#*}
        if [ "$line" = "" ];then
          continue
        fi
        verify_formula line
        if [ "$verify" = true ]; then
          brew ${line}
        else
          echo "package missing: $p"
        fi
      done < $HOME/.brewrc
      echo "Installation is complete, enjoy your new machine!"
        break
      ;;
    [nN])
      echo "Quitting installation, review and run \"brew bundle ~/.brewrc\" when you are ready to install."
      open -e .brewrc
      break
      ;;
    *)
      echo "Please choose Y or N."
      ;;
    esac
  done
}

while true
do
  read -p "Would you like to enable all, some, or none of the brew formulas? (all/some/none) " RESP
  case $RESP
  in
  some)
    load_some
    install_formulas
    break
    ;;
  all)
    load_all
    install_formulas
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

