graph [
  directed 1
  node [
    id 0
    label "phishing e-mail"
    shape "ellipse"
  ]
  node [
    id 1
    label "thunderbird"
    shape "rectangle"
  ]
  node [
    id 2
    label "tcexec"
    shape "rectangle"
  ]
  node [
    id 3
    label "128.55.12.73"
    shape "diamond"
  ]
  node [
    id 4
    label "128.55.12.167 (bob -> everyone)"
    shape "diamond"
  ]
  edge [
    source 1
    target 0
    action "read"
  ]
  edge [
    source 1
    target 2
    action "execute"
  ]
  edge [
    source 1
    target 3
    action "connect"
  ]
  edge [
    source 2
    target 2
    action "execute"
  ]
  edge [
    source 4
    target 3
    action "connect"
  ]
]
