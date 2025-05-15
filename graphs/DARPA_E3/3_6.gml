graph [
  directed 1
  node [
    id 0
    label "proc_1"
    shape "rectangle"
  ]
  node [
    id 1
    label "proc_2"
    shape "rectangle"
  ]
  node [
    id 2
    label "proc_3"
    shape "rectangle"
  ]
  node [
    id 3
    label "proc_4"
    shape "rectangle"
  ]
  node [
    id 4
    label "proc_5"
    shape "rectangle"
  ]
  node [
    id 5
    label "proc_6"
    shape "rectangle"
  ]
  node [
    id 6
    label "file_1"
    shape "ellipse"
  ]
  node [
    id 7
    label "file_2"
    shape "ellipse"
  ]
  node [
    id 8
    label "file_3"
    shape "ellipse"
  ]
  node [
    id 9
    label "file_4"
    shape "ellipse"
  ]
  node [
    id 10
    label "file_5"
    shape "ellipse"
  ]
  node [
    id 11
    label "file_6"
    shape "ellipse"
  ]
  node [
    id 12
    label "file_7"
    shape "ellipse"
  ]
  node [
    id 13
    label "file_8"
    shape "ellipse"
  ]
  node [
    id 14
    label "conn_1"
    shape "diamond"
  ]
  node [
    id 15
    label "conn_2"
    shape "diamond"
  ]
  node [
    id 16
    label "conn_3"
    shape "diamond"
  ]
  node [
    id 17
    label "conn_4"
    shape "diamond"
  ]
  edge [
    source 0
    target 14
    action "connect"
  ]
  edge [
    source 0
    target 15
    action "connect"
  ]
  edge [
    source 0
    target 16
    action "connect"
  ]
  edge [
    source 0
    target 1
    action "create"
  ]
  edge [
    source 0
    target 3
    action "create"
  ]
  edge [
    source 0
    target 6
    action "read"
  ]
  edge [
    source 0
    target 7
    action "write"
  ]
  edge [
    source 0
    target 8
    action "write"
  ]
  edge [
    source 0
    target 9
    action "write"
  ]
  edge [
    source 1
    target 2
    action "create"
  ]
  edge [
    source 2
    target 3
    action "read"
  ]
  edge [
    source 2
    target 10
    action "read"
  ]
  edge [
    source 2
    target 11
    action "read"
  ]
  edge [
    source 2
    target 12
    action "read"
  ]
  edge [
    source 2
    target 7
    action "write"
  ]
  edge [
    source 2
    target 9
    action "write"
  ]
  edge [
    source 2
    target 4
    action "create"
  ]
  edge [
    source 2
    target 17
    action "connect"
  ]
  edge [
    source 2
    target 8
    action "write"
  ]
  edge [
    source 3
    target 1
    action "read"
  ]
  edge [
    source 3
    target 4
    action "read"
  ]
  edge [
    source 4
    target 5
    action "create"
  ]
  edge [
    source 5
    target 7
    action "read"
  ]
  edge [
    source 5
    target 9
    action "read"
  ]
  edge [
    source 5
    target 17
    action "connect"
  ]
  edge [
    source 5
    target 13
    action "read"
  ]
  edge [
    source 5
    target 8
    action "read"
  ]
]
