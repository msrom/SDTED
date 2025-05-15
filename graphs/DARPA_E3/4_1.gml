graph [
  directed 1
  node [
    id 0
    label "proc_1"
    shape "rectangle"
  ]
  node [
    id 1
    label "62.83.155.175 (bob -> everyone)"
    shape "diamond"
  ]
  node [
    id 2
    label "62.83.155.175 (bob -> charles)"
    shape "diamond"
  ]
  node [
    id 3
    label "62.83.155.175 (bob -> henry)"
    shape "diamond"
  ]
  node [
    id 4
    label "62.83.155.175 (Bovia -> bob)"
    shape "diamond"
  ]
  node [
    id 5
    label "128.55.12.167 (bob -> everyone tcexec)"
    shape "diamond"
  ]
  edge [
    source 1
    target 0
    action "connect"
  ]
  edge [
    source 2
    target 0
    action "connect"
  ]
  edge [
    source 3
    target 0
    action "connect"
  ]
  edge [
    source 4
    target 0
    action "connect"
  ]
  edge [
    source 5
    target 0
    action "connect"
  ]
]
