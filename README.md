[![Build Status](https://travis-ci.org/borodust/bodge-nuklear-renderer.svg)](https://travis-ci.org/borodust/bodge-nuklear-renderer) [![Build status](https://ci.appveyor.com/api/projects/status/gaqlwmf7shnbsv5d?svg=true)](https://ci.appveyor.com/project/borodust/bodge-nuklear-renderer)

# BODGE-NUKLEAR-RENDERER

Native/original OpenGL3 vertex buffer-backed renderer for `bodge-nuklear`
adapted from `Nuklear` codebase.

# Requirements

* ASDF/Quicklisp
* x86_64/i686 GNU/Linux, macOS or Windows

# Loading
```lisp
(ql:quickload '(nuklear-renderer-blob bodge-nuklear-renderer))
```

# Usage

### Interface
See `#'make-renderer` and `#'render-nuklear` functions.

To use the renderer you additionally need to load `bodge-glad` and `glad-blob`
and invoke `(glad:init)` in the thread with valid OpenGL 3+ context before any
call to the renderer to initialize required OpenGL entrypoints.

# Example
Example on how to use nuklear and included renderer can be found in example of
`bodge-nuklear` system.
