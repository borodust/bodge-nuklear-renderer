(claw:c-include "bodge_nuklear_renderer.h" bodge-nuklear-renderer
  :in-package (:%nuklear-renderer :%nk-renderer)
  :sysincludes (:nuklear-lib)
  :include-definitions ("nk_bodge\\w*")
  :rename-symbols (claw:by-removing-prefixes "nk_"))
