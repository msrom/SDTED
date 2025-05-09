graph [
  directed 1
  node [
    id 0
    label "firefox"
    shape "rectangle"
  ]
  node [
    id 1
    label "cache (PID 24851)"
    shape "rectangle"
  ]
  node [
    id 2
    label "/dev/glx_alsa_675"
    shape "ellipse"
  ]
  node [
    id 3
    label "/etc/profile"
    shape "ellipse"
  ]
  node [
    id 4
    label "/etc/passwd"
    shape "ellipse"
  ]
  node [
    id 5
    label "/etc/group"
    shape "ellipse"
  ]
  node [
    id 6
    label "/home/admin/cache"
    shape "ellipse"
  ]
  node [
    id 7
    label "/var/log/tmp"
    shape "ellipse"
  ]
  node [
    id 8
    label "145.199.103.57:80"
    shape "diamond"
  ]
  node [
    id 9
    label "61.130.69.232:80"
    shape "diamond"
  ]
  node [
    id 10
    label "2.233.33.53:80"
    shape "diamond"
  ]
  node [
    id 11
    label "180.156.107.146:80"
    shape "diamond"
  ]
  node [
    id 12
    label "http://www.allstate.com"
    shape "diamond"
  ]
  edge [
    source 0
    target 2
    action "write"
  ]
  edge [
    source 0
    target 8
    action "connect"
  ]
  edge [
    source 0
    target 9
    action "connect"
  ]
  edge [
    source 0
    target 10
    action "connect"
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
    action "read"
  ]
  edge [
    source 0
    target 6
    action "write"
  ]
  edge [
    source 0
    target 12
    action "connect"
  ]
  edge [
    source 0
    target 1
    action "create"
  ]
  edge [
    source 1
    target 6
    action "write"
  ]
  edge [
    source 1
    target 7
    action "write"
  ]
  edge [
    source 1
    target 11
    action "connect"
  ]
  edge [
    source 6
    target 2
    action "write"
  ]
]
