graph [
  directed 1
  node [
    id 0
    label "firefox"
    shape "rectangle"
  ]
  node [
    id 1
    label "pass_mgr"
    shape "rectangle"
  ]
  node [
    id 2
    label "C:\Program Files\Mozilla Firefox\add-on\hJauWl01"
    shape "ellipse"
  ]
  node [
    id 3
    label "132.85.63.248:80"
    shape "diamond"
  ]
  node [
    id 4
    label "135.84.161.202:80"
    shape "diamond"
  ]
  node [
    id 5
    label "http://www.allstate.com"
    shape "diamond"
  ]
  edge [
    source 0
    target 1
    action "create"
  ]
  edge [
    source 0
    target 3
    action "connect"
  ]
  edge [
    source 0
    target 5
    action "connect"
  ]
  edge [
    source 1
    target 2
    action "write"
  ]
  edge [
    source 1
    target 4
    action "connect"
  ]
]
