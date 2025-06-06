graph [
  directed 1
  node [
    id 0
    label "browser"
    shape "rectangle"
  ]
  node [
    id 1
    label "com.android.email"
    shape "rectangle"
  ]
  node [
    id 2
    label "phishing e-mail"
    shape "ellipse"
  ]
  node [
    id 3
    label "credentials"
    shape "ellipse"
  ]
  node [
    id 4
    label "208.75.117.2"
    shape "diamond"
  ]
  node [
    id 5
    label "208.75.117.3"
    shape "diamond"
  ]
  node [
    id 6
    label "http://www.foo1.com"
    shape "diamond"
  ]
  node [
    id 7
    label "http://www.nasa.ng"
    shape "diamond"
  ]
  node [
    id 8
    label "62.83.155.175 (Bovia -> bob)"
    shape "diamond"
  ]
  node [
    id 9
    label "128.55.12.73"
    shape "diamond"
  ]
  edge [
    source 0
    target 4
    action "connect"
  ]
  edge [
    source 0
    target 5
    action "connect"
  ]
  edge [
    source 0
    target 6
    action "connect"
  ]
  edge [
    source 0
    target 7
    action "connect"
  ]
  edge [
    source 1
    target 0
    action "open"
  ]
  edge [
    source 1
    target 2
    action "read"
  ]
  edge [
    source 1
    target 9
    action "connect"
  ]
  edge [
    source 4
    target 3
    action "open"
  ]
  edge [
    source 8
    target 9
    action "connect"
  ]
]
