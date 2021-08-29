(claw:defwrapper (:bodge-nuklear-renderer/wrapper
                  (:headers "bodge_nuklear_renderer.h")
                  (:includes "src/" :nuklear-lib)
                  (:include-definitions "nk_bodge\\w*")
                  (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
                            ((:and :x86-64 :windows) "x86_64-w64-mingw32")
                            ((:and :x86-64 :darwin) "x86_64-apple-darwin-gnu"))
                  (:persistent :bodge-nuklear-renderer-bindings
                   :depends-on (:claw-utils)))
  :in-package :%nk-renderer
  :symbolicate-names (:by-removing-prefixes "nk_"))
