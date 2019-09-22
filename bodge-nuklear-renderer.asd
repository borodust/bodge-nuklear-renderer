(asdf:defsystem bodge-nuklear-renderer
  :description "Native nuklear renderer"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :cffi :cffi-c-ref :claw)
  :serial t
  :pathname "src/"
  :components ((:file "packages")
               (:static-file "bodge_nuklear_renderer.h")
               (:file "claw")
               (:file "renderer")
               (:module spec)
               (:module lib)
	       (:module nuklear-lib :pathname "lib/nuklear/")))
