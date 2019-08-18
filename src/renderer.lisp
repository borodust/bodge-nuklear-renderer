(cl:in-package :nuklear-renderer)

(defvar *max-vertex-buffer-size* (* 512 1024))
(defvar *max-element-buffer-size* (* 128 1024))

;;;
;;; RENDERING
;;;
(defstruct nk-renderer
  handle)


(defun renderer-font (renderer)
  (%nk-renderer:bodge-renderer-font (nk-renderer-handle renderer)))


(defun make-renderer ()
  (make-nk-renderer
   :handle (%nk-renderer:bodge-renderer-create *max-vertex-buffer-size*
                                               *max-element-buffer-size*)))


(defun destroy-renderer (renderer)
  (%nk-renderer:bodge-renderer-destroy (nk-renderer-handle renderer)))


(defun render-nuklear (renderer context width height &optional (pixel-ratio 1f0))
  (%nk-renderer:bodge-render context (nk-renderer-handle renderer)
                             (floor width) (floor height) (float pixel-ratio 0f0)))
