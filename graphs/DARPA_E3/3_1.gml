graph [
  directed 1
  node [
    id 0
    label "81.49.200.186"
    shape "diamond"
  ]
  node [
    id 1
    label "nginx"
    shape "rectangle"
  ]
  node [
    id 2
    label "78.205.235.65:80"
    shape "diamond"
  ]
  node [
    id 3
    label "200.16.109.214:80"
    shape "diamond"
  ]
  node [
    id 4
    label "/dev/gla_alsa_675"
    shape "ellipse"
  ]
  node [
    id 5
    label "/tmp/vUgefal"
    shape "ellipse"
  ]
  node [
    id 6
    label "vUgefal"
    shape "rectangle"
  ]
  node [
    id 7
    label "139.123.0.111:80"
    shape "diamond"
  ]
  node [
    id 8
    label "154.145.113.18:80"
    shape "diamond"
  ]
  node [
    id 9
    label "61.167.39.128:80"
    shape "diamond"
  ]
  node [
    id 10
    label "/etc/group"
    shape "ellipse"
  ]
  node [
    id 11
    label "/etc/passwd"
    shape "ellipse"
  ]
  node [
    id 12
    label "sshd (PID 8000)"
    shape "rectangle"
  ]
  node [
    id 13
    label "/var/log/devc"
    shape "ellipse"
  ]
  edge [
    source 0
    target 1
    action "connect"
  ]
  edge [
    source 1
    target 2
    action "connect"
  ]
  edge [
    source 1
    target 3
    action "connect"
  ]
  edge [
    source 1
    target 4
    action "write"
  ]
  edge [
    source 1
    target 10
    action "read"
  ]
  edge [
    source 1
    target 11
    action "read"
  ]
  edge [
    source 1
    target 5
    action "create"
  ]
  edge [
    source 4
    target 5
    action "execute"
  ]
  edge [
    source 5
    target 6
    action "create"
  ]
  edge [
    source 6
    target 10
    action "read"
  ]
  edge [
    source 6
    target 7
    action "connect"
  ]
  edge [
    source 6
    target 8
    action "connect"
  ]
  edge [
    source 6
    target 9
    action "connect"
  ]
  edge [
    source 6
    target 11
    action "write"
  ]
  edge [
    source 6
    target 12
    action "create"
  ]
  edge [
    source 6
    target 13
    action "write"
  ]
]
