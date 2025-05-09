graph [
  directed 1
  node [
    id 0
    label "nginx"
    shape "rectangle"
  ]
  node [
    id 1
    label "/tmp/tcexec"
    shape "rectangle"
  ]
  node [
    id 2
    label "uname"
    shape "rectangle"
  ]
  node [
    id 3
    label "phishing e-mail"
    shape "ellipse"
  ]
  node [
    id 4
    label "207.103.191.4:80"
    shape "diamond"
  ]
  node [
    id 5
    label "103.12.253.24:80"
    shape "diamond"
  ]
  node [
    id 6
    label "128.55.12.1"
    shape "diamond"
  ]
  node [
    id 7
    label "128.55.12.67"
    shape "diamond"
  ]
  node [
    id 8
    label "128.55.12.110"
    shape "diamond"
  ]
  node [
    id 9
    label "128.55.12.103"
    shape "diamond"
  ]
  node [
    id 10
    label "128.55.12.141"
    shape "diamond"
  ]
  node [
    id 11
    label "128.55.12.166"
    shape "diamond"
  ]
  node [
    id 12
    label "128.55.12.55"
    shape "diamond"
  ]
  node [
    id 13
    label "162.66.239.75:80"
    shape "diamond"
  ]
  node [
    id 14
    label "128.55.12.167 (bob -> everyone)"
    shape "diamond"
  ]
  node [
    id 15
    label "128.55.12.73"
    shape "diamond"
  ]
  edge [
    source 0
    target 3
    action "read"
  ]
  edge [
    source 0
    target 1
    action "execute"
  ]
  edge [
    source 0
    target 15
    action "connect"
  ]
  edge [
    source 1
    target 4
    action "connect"
  ]
  edge [
    source 1
    target 5
    action "connect"
  ]
  edge [
    source 1
    target 6
    action "connect"
  ]
  edge [
    source 1
    target 7
    action "connect"
  ]
  edge [
    source 1
    target 8
    action "connect"
  ]
  edge [
    source 1
    target 9
    action "connect"
  ]
  edge [
    source 1
    target 10
    action "connect"
  ]
  edge [
    source 1
    target 11
    action "connect"
  ]
  edge [
    source 1
    target 12
    action "connect"
  ]
  edge [
    source 1
    target 13
    action "connect"
  ]
  edge [
    source 1
    target 2
    action "execute"
  ]
  edge [
    source 1
    target 15
    action "connect"
  ]
  edge [
    source 14
    target 15
    action "connect"
  ]
]
