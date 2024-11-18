import Foundation

enum TestCases: CaseIterable {
    case theOriginal
    case reduce
}

extension TestCases {
    var groundTruth: [String: Int] {
        switch(self) {
            case .theOriginal: ["main" : 15]
            case .reduce: [
            "fillarray" : 52,
            "reduce": 14,
            "main": 5,
            ]
        }
    }

    var source: Data {
        switch(self) {
            case .theOriginal:
            """
            {
              "functions": [
                {
                  "args": [
                    {
                      "name": "cond",
                      "type": "bool"
                    }
                  ],
                  "instrs": [
                    {
                      "label": "entry"
                    },
                    {
                      "dest": "a",
                      "op": "const",
                      "type": "int",
                      "value": 47
                    },
                    {
                      "dest": "b",
                      "op": "const",
                      "type": "int",
                      "value": 2
                    },
                    {
                      "args": [
                        "b"
                      ],
                      "op": "print"
                    },
                    {
                      "args": [
                        "cond"
                      ],
                      "labels": [
                        "left",
                        "right"
                      ],
                      "op": "br"
                    },
                    {
                      "label": "left"
                    },
                    {
                      "args": [
                        "a",
                        "a"
                      ],
                      "dest": "a",
                      "op": "add",
                      "type": "int"
                    },
                    {
                      "dest": "b",
                      "op": "const",
                      "type": "int",
                      "value": 3
                    },
                    {
                      "args": [
                        "b"
                      ],
                      "op": "print"
                    },
                    {
                      "labels": [
                        "exit"
                      ],
                      "op": "jmp"
                    },
                    {
                      "label": "right"
                    },
                    {
                      "args": [
                        "a",
                        "a"
                      ],
                      "dest": "a",
                      "op": "mul",
                      "type": "int"
                    },
                    {
                      "labels": [
                        "exit"
                      ],
                      "op": "jmp"
                    },
                    {
                      "label": "exit"
                    },
                    {
                      "args": [
                        "a"
                      ],
                      "op": "print"
                    }
                  ],
                  "name": "main"
                }
              ]
            }
            """.data(using: .utf8)!

            case .reduce:
            """
            {
                "functions": [
                {
                    "instrs": [
                    {
                        "dest": "a00",
          "op": "const",
          "type": "int",
          "value": 34
        },
        {
          "dest": "a01",
          "op": "const",
          "type": "int",
          "value": 28
        },
        {
          "dest": "a02",
          "op": "const",
          "type": "int",
          "value": 38
        },
        {
          "dest": "a03",
          "op": "const",
          "type": "int",
          "value": 29
        },
        {
          "dest": "a04",
          "op": "const",
          "type": "int",
          "value": 26
        },
        {
          "dest": "a05",
          "op": "const",
          "type": "int",
          "value": 78
        },
        {
          "dest": "a06",
          "op": "const",
          "type": "int",
          "value": 91
        },
        {
          "dest": "a07",
          "op": "const",
          "type": "int",
          "value": 83
        },
        {
          "dest": "a08",
          "op": "const",
          "type": "int",
          "value": 67
        },
        {
          "dest": "a09",
          "op": "const",
          "type": "int",
          "value": 92
        },
        {
          "dest": "a10",
          "op": "const",
          "type": "int",
          "value": 56
        },
        {
          "dest": "a11",
          "op": "const",
          "type": "int",
          "value": 92
        },
        {
          "dest": "a12",
          "op": "const",
          "type": "int",
          "value": 67
        },
        {
          "dest": "a13",
          "op": "const",
          "type": "int",
          "value": 826
        },
        {
          "dest": "a14",
          "op": "const",
          "type": "int",
          "value": 38
        },
        {
          "dest": "a15",
          "op": "const",
          "type": "int",
          "value": 43
        },
        {
          "dest": "size",
          "op": "const",
          "type": "int",
          "value": 16
        },
        {
          "args": [
            "size"
          ],
          "dest": "return_ptr",
          "op": "alloc",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "return_ptr"
          ],
          "dest": "arr",
          "op": "id",
          "type": {
            "ptr": "int"
          }
        },
        {
          "dest": "one",
          "op": "const",
          "type": "int",
          "value": 1
        },
        {
          "args": [
            "arr",
            "a00"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a01"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a02"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a03"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a04"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a05"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a06"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a07"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a08"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a09"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a10"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a11"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a12"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a13"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a14"
          ],
          "op": "store"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "arr",
            "a15"
          ],
          "op": "store"
        },
        {
          "args": [
            "return_ptr"
          ],
          "op": "ret"
        }
      ],
      "name": "fillarray",
      "type": {
        "ptr": "int"
      }
    },
    {
      "args": [
        {
          "name": "arr",
          "type": {
            "ptr": "int"
          }
        },
        {
          "name": "count",
          "type": "int"
        }
      ],
      "instrs": [
        {
          "dest": "acc",
          "op": "const",
          "type": "int",
          "value": 0
        },
        {
          "dest": "i",
          "op": "const",
          "type": "int",
          "value": 0
        },
        {
          "args": [
            "i",
            "count"
          ],
          "dest": "done",
          "op": "eq",
          "type": "bool"
        },
        {
          "dest": "one",
          "op": "const",
          "type": "int",
          "value": 1
        },
        {
          "args": [
            "done"
          ],
          "labels": [
            "done",
            "loop"
          ],
          "op": "br"
        },
        {
          "label": "loop"
        },
        {
          "args": [
            "arr"
          ],
          "dest": "v1",
          "op": "load",
          "type": "int"
        },
        {
          "args": [
            "acc",
            "v1"
          ],
          "dest": "acc",
          "op": "add",
          "type": "int"
        },
        {
          "args": [
            "arr",
            "one"
          ],
          "dest": "arr",
          "op": "ptradd",
          "type": {
            "ptr": "int"
          }
        },
        {
          "args": [
            "i",
            "one"
          ],
          "dest": "i",
          "op": "add",
          "type": "int"
        },
        {
          "args": [
            "i",
            "count"
          ],
          "dest": "done",
          "op": "eq",
          "type": "bool"
        },
        {
          "args": [
            "done"
          ],
          "labels": [
            "done",
            "loop"
          ],
          "op": "br"
        },
        {
          "label": "done"
        },
        {
          "args": [
            "acc"
          ],
          "op": "ret"
        }
      ],
      "name": "reduce",
      "type": "int"
    },
    {
      "instrs": [
        {
          "dest": "arr",
          "funcs": [
            "fillarray"
          ],
          "op": "call",
          "type": {
            "ptr": "int"
          }
        },
        {
          "dest": "count",
          "op": "const",
          "type": "int",
          "value": 16
        },
        {
          "args": [
            "arr",
            "count"
          ],
          "dest": "result",
          "funcs": [
            "reduce"
          ],
          "op": "call",
          "type": "int"
        },
        {
          "args": [
            "arr"
          ],
          "op": "free"
        },
        {
          "args": [
            "result"
          ],
          "op": "print"
        }
      ],
      "name": "main"
    }
  ]
}
""".data(using: .utf8)!
        }
    }
}

