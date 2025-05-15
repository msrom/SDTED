graph [
  directed 1
  node [
    id 0
    label "whoamai"
    shape "rectangle"
  ]
  node [
    id 1
    label "firefox"
    shape "rectangle"
  ]
  node [
    id 2
    label "hostname"
    shape "rectangle"
  ]
  node [
    id 3
    label "C:\user\admin\Documents\dani.docx"
    shape "ellipse"
  ]
  node [
    id 4
    label "C:\user\admin\Documents\Exam.doc"
    shape "ellipse"
  ]
  node [
    id 5
    label "C:\windows\system32\drivers\etc\hosts"
    shape "ellipse"
  ]
  node [
    id 6
    label "193.189.212.26:80"
    shape "diamond"
  ]
  node [
    id 7
    label "179.252.65.246:80"
    shape "diamond"
  ]
  node [
    id 8
    label "C:\user\admin\Documents\bookers.rtf"
    shape "ellipse"
  ]
  node [
    id 9
    label "C:\user\admin\Documents\Document.rtf"
    shape "ellipse"
  ]
  node [
    id 10
    label "C:\user\admin\Documents\InfoAdapter.rtf"
    shape "ellipse"
  ]
  node [
    id 11
    label "C:\user\admin\Documents\InfoAdvance.doc"
    shape "ellipse"
  ]
  node [
    id 12
    label "C:\user\admin\Documents\netstat.rtf"
    shape "ellipse"
  ]
  node [
    id 13
    label "C:\user\admin\Documents\statistic.rtf"
    shape "ellipse"
  ]
  node [
    id 14
    label "156.78.147.114:80"
    shape "diamond"
  ]
  node [
    id 15
    label "16.54.116.146:80"
    shape "diamond"
  ]
  node [
    id 16
    label "ak"
    shape "diamond"
  ]
  node [
    id 17
    label "http://www.cnpc.com.cn"
    shape "diamond"
  ]
  node [
    id 18
    label "174.254.55.248:80"
    shape "diamond"
  ]
  edge [
    source 1
    target 0
    action "execute"
  ]
  edge [
    source 1
    target 2
    action "execute"
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
    action "execute"
  ]
  edge [
    source 1
    target 6
    action "connect"
  ]
  edge [
    source 1
    target 7
    action "connect"
  ]
  edge [
    source 5
    target 8
    action "execute"
  ]
  edge [
    source 5
    target 9
    action "execute"
  ]
  edge [
    source 5
    target 10
    action "execute"
  ]
  edge [
    source 5
    target 11
    action "read"
  ]
  edge [
    source 5
    target 12
    action "read"
  ]
  edge [
    source 5
    target 13
    action "execute"
  ]
  edge [
    source 12
    target 16
    action "execute"
  ]
  edge [
    source 12
    target 17
    action "connect"
  ]
  edge [
    source 12
    target 18
    action "connect"
  ]
  edge [
    source 13
    target 14
    action "connect"
  ]
  edge [
    source 13
    target 15
    action "connect"
  ]
]
