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
    label "82"
    name "cmd.exe(2)(new)"
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
    label "84"
    name "IP1(new)"
    type "connection"
  ]
  node [
    id 5
    label "5"
    name "temp.tmp"
    type "file"
  ]
  node [
    id 6
    label "6"
    name "user_data.db"
    type "file"
  ]
  node [
    id 7
    label "87"
    name "browser_history.log(new)"
    type "file"
  ]
  node [
    id 8
    label "88"
    name "explorer.exe(new)"
    type "process"
  ]
  node [
    id 9
    label "9"
    name "IP2"
    type "connection"
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
    source 1
    target 6
    action "read"
  ]
  edge [
    source 1
    target 7
    action "read"
  ]
  edge [
    source 1
    target 8
    action "create"
  ]
  edge [
    source 1
    target 9
    action "connect"
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
