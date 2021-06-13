(asdf:defsystem bodge-nuklear-renderer
  :description "Native nuklear renderer"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :cffi :cffi-c-ref :bodge-nuklear-renderer-bindings)
  :serial t
  :pathname "src/"
  :components ((:file "packages")
               (:file "renderer")))


(asdf:defsystem bodge-nuklear-renderer/wrapper
  :description "Native nuklear renderer"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :cffi :cffi-c-ref :claw)
  :serial t
  :components ((:file "src/claw")
	       (:module nuklear-lib :pathname "src/lib/nuklear/")))
