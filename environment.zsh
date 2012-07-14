# Override 'screen' term setting so solarized vim doesn't look weird
if [[ "$TERM" == "screen" ]]; then
  export TERM=xterm-256color
fi
