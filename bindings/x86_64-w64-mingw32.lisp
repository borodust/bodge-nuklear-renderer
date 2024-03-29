;; Generated by :claw at 2021-08-29T13:35:20.612187Z
(uiop:define-package :%nk-renderer (:use))
(uiop:define-package :bodge-nuklear-renderer-bindings~pristine (:use
                                                                :cl))
(common-lisp:in-package :bodge-nuklear-renderer-bindings~pristine)

(cffi:defcstruct (%nk-renderer::context :size 16528))

(cffi:defcstruct (%nk-renderer::bodge-renderer :size 0))

(declaim (inline %nk-renderer::bodge-render))

(cffi:defcfun ("nk_bodge_render" %nk-renderer::bodge-render)
              :void
              (%nk-renderer::ctx
               (:pointer (:struct %nk-renderer::context)))
              (%nk-renderer::renderer
               (:pointer (:struct %nk-renderer::bodge-renderer)))
              (%nk-renderer::width :int)
              (%nk-renderer::height :int)
              (%nk-renderer::pixel-ratio :float))

(declaim (inline %nk-renderer::bodge-renderer-create))

(cffi:defcfun ("nk_bodge_renderer_create"
               %nk-renderer::bodge-renderer-create)
              (:pointer (:struct %nk-renderer::bodge-renderer))
              (%nk-renderer::max-vertex-buffer :int)
              (%nk-renderer::max-element-buffer :int))

(declaim (inline %nk-renderer::bodge-renderer-destroy))

(cffi:defcfun ("nk_bodge_renderer_destroy"
               %nk-renderer::bodge-renderer-destroy)
              :void
              (%nk-renderer::renderer
               (:pointer (:struct %nk-renderer::bodge-renderer))))

(cffi:defcstruct (%nk-renderer::font :size 128))

(declaim (inline %nk-renderer::bodge-renderer-font))

(cffi:defcfun ("nk_bodge_renderer_font"
               %nk-renderer::bodge-renderer-font)
              (:pointer (:struct %nk-renderer::font))
              (%nk-renderer::renderer
               (:pointer (:struct %nk-renderer::bodge-renderer))))

(eval-when (:load-toplevel :compile-toplevel :execute)
  (export '%nk-renderer::bodge-render :%nk-renderer)
  (export '%nk-renderer::bodge-renderer-font :%nk-renderer)
  (export '%nk-renderer::bodge-renderer-create :%nk-renderer)
  (export '%nk-renderer::bodge-renderer :%nk-renderer)
  (export '%nk-renderer::context :%nk-renderer)
  (export '%nk-renderer::bodge-renderer-destroy :%nk-renderer)
  (export '%nk-renderer::font :%nk-renderer))

