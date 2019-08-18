(asdf:defsystem bodge-nuklear-renderer
  :description "Native nuklear renderer"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria cffi claw)
  :serial t
  :components ((:file "src/packages")
               (:static-file "bodge_nuklear_renderer.h")
               (:file "src/claw")
               (:file "src/renderer")
               (:module spec)
               (:module lib)
	       (:module nuklear-lib :pathname "lib/nuklear/")))
