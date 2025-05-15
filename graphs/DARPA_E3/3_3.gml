graph [
  directed 1
  node [
    id 0
    label "141.43.176.203:80"
    shape "diamond"
  ]
  node [
    id 1
    label "104.228.117.212:80"
    shape "diamond"
  ]
  node [
    id 2
    label "http://www.git.edu"
    shape "diamond"
  ]
  node [
    id 3
    label "quit"
    shape "rectangle"
  ]
  node [
    id 4
    label "ps"
    shape "rectangle"
  ]
  node [
    id 5
    label "hostname"
    shape "rectangle"
  ]
  node [
    id 6
    label "146.153.68.151:80"
    shape "diamond"
  ]
  node [
    id 7
    label "firefox"
    shape "rectangle"
  ]
  node [
    id 8
    label "/dev/glx_alsa_675"
    shape "ellipse"
  ]
  node [
    id 9
    label "/home/admin/clean"
    shape "ellipse"
  ]
  node [
    id 10
    label "clean (PID ?)"
    shape "rectangle"
  ]
  node [
    id 11
    label "161.116.88.72:80"
    shape "diamond"
  ]
  node [
    id 12
    label "whoami"
    shape "rectangle"
  ]
  edge [
    source 7
    target 0
    action "connect"
  ]
  edge [
    source 7
    target 1
    action "connect"
  ]
  edge [
    source 7
    target 2
    action "connect"
  ]
  edge [
    source 7
    target 3
    action "execute"
  ]
  edge [
    source 7
    target 4
    action "execute"
  ]
  edge [
    source 7
    target 5
    action "execute"
  ]
  edge [
    source 7
    target 6
    action "connect"
  ]
  edge [
    source 7
    target 9
    action "write"
  ]
  edge [
    source 7
    target 12
    action "execute"
  ]
  edge [
    source 8
    target 9
    action "write"
  ]
  edge [
    source 9
    target 10
    action "create"
  ]
  edge [
    source 9
    target 8
    action "execute"
  ]
  edge [
    source 10
    target 11
    action "connect"
  ]
  edge [
    source 10
    target 12
    action "execute"
  ]
]
