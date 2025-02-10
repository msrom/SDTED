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
    label "4"
    name "IP1"
    type "connection"
  ]
  node [
    id 3
    label "6"
    name "user_data.db"
    type "file"
  ]
  node [
    id 4
    label "7"
    name "browser_history.log"
    type "file"
  ]
  node [
    id 5
    label "8"
    name "explorer.exe"
    type "process"
  ]
  node [
    id 6
    label "9"
    name "IP2"
    type "connection"
  ]
  node [
    id 7
    label "410"
    name "encrypted_file.enc"
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
    action "connect"
  ]
  edge [
    source 0
    target 7
    action "create"
  ]
  edge [
    source 1
    target 3
    action "read"
  ]
  edge [
    source 1
    target 4
    action "read"
  ]
  edge [
    source 1
    target 5
    action "create"
  ]
  edge [
    source 1
    target 6
    action "connect"
  ]
  edge [
    source 2
    target 0
    action "receive"
  ]
]
