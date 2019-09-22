(uiop:define-package :%nuklear-renderer
  (:nicknames :%nk-renderer)
  (:use))


(claw:defwrapper (nuklear-renderer::bodge-nuklear-renderer
                  (:includes :nuklear-lib)
                  (:include-definitions "nk_bodge\\w*"))
  :in-package :%nk-renderer
  :symbolicate-names (:by-removing-prefixes "nk_"))
