graph [
  directed 1
  node [
    id 0
    label "browser"
    shape "rectangle"
  ]
  node [
    id 1
    label "thunderbird"
    shape "rectangle"
  ]
  node [
    id 2
    label "phishing e-mail"
    shape "ellipse"
  ]
  node [
    id 3
    label "128.55.12.73"
    shape "diamond"
  ]
  node [
    id 4
    label "62.83.155.175 (bob -> everyone)"
    shape "diamond"
  ]
  node [
    id 5
    label "http://www.nasa.ng"
    shape "diamond"
  ]
  node [
    id 6
    label "208.75.117.3"
    shape "diamond"
  ]
  node [
    id 7
    label "http://www.foo1.com"
    shape "diamond"
  ]
  node [
    id 8
    label "208.75.117.2"
    shape "diamond"
  ]
  edge [
    source 1
    target 2
    action "read"
  ]
  edge [
    source 1
    target 3
    action "connect"
  ]
  edge [
    source 1
    target 0
    action "open"
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
    source 4
    target 3
    action "connect"
  ]
]
