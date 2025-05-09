graph [
  directed 1
  node [
    id 0
    label "nginx"
    shape "rectangle"
  ]
  node [
    id 1
    label "sshd (PID 802)"
    shape "rectangle"
  ]
  node [
    id 2
    label "/tmp/grain"
    shape "ellipse"
  ]
  node [
    id 3
    label "/etc/passwd"
    shape "ellipse"
  ]
  node [
    id 4
    label "/etc/group"
    shape "ellipse"
  ]
  node [
    id 5
    label "25.159.96.207:80"
    shape "diamond"
  ]
  node [
    id 6
    label "155.162.39.48:80"
    shape "diamond"
  ]
  node [
    id 7
    label " 78.205.235.65:80"
    shape "diamond"
  ]
  edge [
    source 0
    target 2
    action "write"
  ]
  edge [
    source 0
    target 3
    action "read"
  ]
  edge [
    source 0
    target 4
    action "read"
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
    source 0
    target 1
    action "write"
  ]
]
