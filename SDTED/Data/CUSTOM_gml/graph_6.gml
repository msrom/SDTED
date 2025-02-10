graph [
  directed 1
  node [
    id 0
    label "0"
    name "mw.exe"
    type "process"
  ]
  node [
    id 1
    label "1"
    name "cmd.exe(1)"
    type "process"
  ]
  node [
    id 2
    label "2"
    name "cmd.exe(2)"
    type "process"
  ]
  node [
    id 3
    label "3"
    name "config.sys"
    type "file"
  ]
  node [
    id 4
    label "4"
    name "IP1"
    type "connection"
  ]
  node [
    id 5
    label "5"
    name "temp.tmp"
    type "file"
  ]
  edge [
    source 0
    target 1
    action "create"
  ]
  edge [
    source 0
    target 2
    action "create"
  ]
  edge [
    source 0
    target 3
    action "read"
  ]
  edge [
    source 0
    target 4
    action "connect"
  ]
  edge [
    source 1
    target 5
    action "create"
  ]
  edge [
    source 2
    target 5
    action "read"
  ]
  edge [
    source 2
    target 4
    action "send"
  ]
]
