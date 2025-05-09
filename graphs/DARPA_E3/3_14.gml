graph [
  directed 1
  node [
    id 0
    label "nginx"
    shape "rectangle"
  ]
  node [
    id 1
    label "pEja72mA (PID 71)"
    shape "rectangle"
  ]
  node [
    id 2
    label "sshd (PID 206911)"
    shape "rectangle"
  ]
  node [
    id 3
    label "/dev/ya_usa_675"
    shape "ellipse"
  ]
  node [
    id 4
    label "/tmp/eWq10bVcx"
    shape "ellipse"
  ]
  node [
    id 5
    label "/tmp/pEja72mA"
    shape "ellipse"
  ]
  node [
    id 6
    label "/tmp/memhelp.so"
    shape "ellipse"
  ]
  node [
    id 7
    label "/tmp/eraseme"
    shape "ellipse"
  ]
  node [
    id 8
    label "/tmp/done.so"
    shape "ellipse"
  ]
  node [
    id 9
    label "/etc/passwd"
    shape "ellipse"
  ]
  node [
    id 10
    label "25.159.96.207:80"
    shape "diamond"
  ]
  node [
    id 11
    label " 78.205.235.65:80"
    shape "diamond"
  ]
  node [
    id 12
    label "155.162.39.48:80"
    shape "diamond"
  ]
  node [
    id 13
    label "53.158.101.118:80"
    shape "diamond"
  ]
  node [
    id 14
    label "198.115.236.119:80"
    shape "diamond"
  ]
  edge [
    source 0
    target 4
    action "connect"
  ]
  edge [
    source 0
    target 3
    action "execute"
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
    target 8
    action "write"
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
    target 9
    action "read"
  ]
  edge [
    source 1
    target 2
    action "write"
  ]
  edge [
    source 2
    target 9
    action "read"
  ]
  edge [
    source 2
    target 14
    action "connect"
  ]
  edge [
    source 2
    target 2
    action "execute"
  ]
  edge [
    source 3
    target 5
    action "execute"
  ]
  edge [
    source 5
    target 1
    action "create"
  ]
  edge [
    source 10
    target 0
    action "connect"
  ]
]
