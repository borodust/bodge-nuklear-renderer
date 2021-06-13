(uiop:define-package :%nk-renderer (:use))
(uiop:define-package :bodge-nuklear-renderer-bindings~pristine (:use
                                                                :cl))
(common-lisp:in-package :bodge-nuklear-renderer-bindings~pristine)

(cffi:defcstruct (%nk-renderer::key :size 8)
                 (%nk-renderer::down :int :offset 0)
                 (%nk-renderer::clicked :unsigned-int :offset 4))

(cffi:defcstruct (%nk-renderer::keyboard :size 260)
                 (%nk-renderer::keys (:struct %nk-renderer::key)
                  :count 30 :offset 0)
                 (%nk-renderer::text :char :count 16 :offset 240)
                 (%nk-renderer::text-len :int :offset 256))

(cffi:defcstruct (%nk-renderer::vec2 :size 8)
                 (%nk-renderer::x :float :offset 0)
                 (%nk-renderer::y :float :offset 4))

(cffi:defcstruct (%nk-renderer::mouse-button :size 16)
                 (%nk-renderer::down :int :offset 0)
                 (%nk-renderer::clicked :unsigned-int :offset 4)
                 (%nk-renderer::clicked-pos
                  (:struct %nk-renderer::vec2) :offset 8))

(cffi:defcstruct (%nk-renderer::mouse :size 100)
                 (%nk-renderer::buttons
                  (:struct %nk-renderer::mouse-button) :count 4
                  :offset 0)
                 (%nk-renderer::pos (:struct %nk-renderer::vec2)
                  :offset 64)
                 (%nk-renderer::prev (:struct %nk-renderer::vec2)
                  :offset 72)
                 (%nk-renderer::delta (:struct %nk-renderer::vec2)
                  :offset 80)
                 (%nk-renderer::scroll-delta
                  (:struct %nk-renderer::vec2) :offset 88)
                 (%nk-renderer::grab :unsigned-char :offset 96)
                 (%nk-renderer::grabbed :unsigned-char :offset 97)
                 (%nk-renderer::ungrab :unsigned-char :offset 98))

(cffi:defcstruct (%nk-renderer::input :size 360)
                 (%nk-renderer::keyboard
                  (:struct %nk-renderer::keyboard) :offset 0)
                 (%nk-renderer::mouse (:struct %nk-renderer::mouse)
                  :offset 260))

(cffi:defctype %nk-renderer::text-width-f (:pointer :void))

(cffi:defctype %nk-renderer::query-font-glyph-f (:pointer :void))

(cffi:defcunion (%nk-renderer::|C:@UA@NK-HANDLE| :size 8)
                (%nk-renderer::ptr (:pointer :void))
                (%nk-renderer::id :int))

(cffi:defctype %nk-renderer::handle
               (:union %nk-renderer::|C:@UA@NK-HANDLE|))

(cffi:defcstruct (%nk-renderer::user-font :size 40)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  0)
                 (%nk-renderer::height :float :offset 8)
                 (%nk-renderer::width %nk-renderer::text-width-f
                  :offset 16)
                 (%nk-renderer::query
                  %nk-renderer::query-font-glyph-f :offset 24)
                 (%nk-renderer::texture %nk-renderer::handle :offset
                  32))

(cffi:defcstruct (%nk-renderer::image :size 24)
                 (%nk-renderer::handle %nk-renderer::handle :offset
                  0)
                 (%nk-renderer::w :unsigned-short :offset 8)
                 (%nk-renderer::h :unsigned-short :offset 10)
                 (%nk-renderer::region :unsigned-short :count 4
                  :offset 12))

(cffi:defcstruct (%nk-renderer::cursor :size 40)
                 (%nk-renderer::img (:struct %nk-renderer::image)
                  :offset 0)
                 (%nk-renderer::size (:struct %nk-renderer::vec2)
                  :offset 24)
                 (%nk-renderer::offset (:struct %nk-renderer::vec2)
                  :offset 32))

(cffi:defctype %nk-renderer::byte :unsigned-char)

(cffi:defcstruct (%nk-renderer::color :size 4)
                 (%nk-renderer::r %nk-renderer::byte :offset 0)
                 (%nk-renderer::g %nk-renderer::byte :offset 1)
                 (%nk-renderer::b %nk-renderer::byte :offset 2)
                 (%nk-renderer::a %nk-renderer::byte :offset 3))

(cffi:defcstruct (%nk-renderer::style-text :size 12)
                 (%nk-renderer::color (:struct %nk-renderer::color)
                  :offset 0)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 4))

(cffi:defcenum (%nk-renderer::style-item-type :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:4805:6"
               (:nk-style-item-color 0)
               (:nk-style-item-image 1))

(cffi:defcunion (%nk-renderer::style-item-data :size 24)
                (%nk-renderer::image (:struct %nk-renderer::image))
                (%nk-renderer::color (:struct %nk-renderer::color)))

(cffi:defcstruct (%nk-renderer::style-item :size 32)
                 (%nk-renderer::type %nk-renderer::style-item-type
                  :offset 0)
                 (%nk-renderer::data
                  (:union %nk-renderer::style-item-data) :offset 8))

(cffi:defctype %nk-renderer::flags :unsigned-int)

(cffi:defcstruct (%nk-renderer::style-button :size 176)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::text-background
                  (:struct %nk-renderer::color) :offset 100)
                 (%nk-renderer::text-normal
                  (:struct %nk-renderer::color) :offset 104)
                 (%nk-renderer::text-hover
                  (:struct %nk-renderer::color) :offset 108)
                 (%nk-renderer::text-active
                  (:struct %nk-renderer::color) :offset 112)
                 (%nk-renderer::text-alignment %nk-renderer::flags
                  :offset 116)
                 (%nk-renderer::border :float :offset 120)
                 (%nk-renderer::rounding :float :offset 124)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 128)
                 (%nk-renderer::image-padding
                  (:struct %nk-renderer::vec2) :offset 136)
                 (%nk-renderer::touch-padding
                  (:struct %nk-renderer::vec2) :offset 144)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  152)
                 (%nk-renderer::draw-begin (:pointer :void) :offset
                  160)
                 (%nk-renderer::draw-end (:pointer :void) :offset
                  168))

(cffi:defcstruct (%nk-renderer::style-toggle :size 240)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::cursor-normal
                  (:struct %nk-renderer::style-item) :offset 104)
                 (%nk-renderer::cursor-hover
                  (:struct %nk-renderer::style-item) :offset 136)
                 (%nk-renderer::text-normal
                  (:struct %nk-renderer::color) :offset 168)
                 (%nk-renderer::text-hover
                  (:struct %nk-renderer::color) :offset 172)
                 (%nk-renderer::text-active
                  (:struct %nk-renderer::color) :offset 176)
                 (%nk-renderer::text-background
                  (:struct %nk-renderer::color) :offset 180)
                 (%nk-renderer::text-alignment %nk-renderer::flags
                  :offset 184)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 188)
                 (%nk-renderer::touch-padding
                  (:struct %nk-renderer::vec2) :offset 196)
                 (%nk-renderer::spacing :float :offset 204)
                 (%nk-renderer::border :float :offset 208)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  216)
                 (%nk-renderer::draw-begin (:pointer :void) :offset
                  224)
                 (%nk-renderer::draw-end (:pointer :void) :offset
                  232))

(cffi:defcstruct (%nk-renderer::style-selectable :size 280)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::pressed
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::normal-active
                  (:struct %nk-renderer::style-item) :offset 96)
                 (%nk-renderer::hover-active
                  (:struct %nk-renderer::style-item) :offset 128)
                 (%nk-renderer::pressed-active
                  (:struct %nk-renderer::style-item) :offset 160)
                 (%nk-renderer::text-normal
                  (:struct %nk-renderer::color) :offset 192)
                 (%nk-renderer::text-hover
                  (:struct %nk-renderer::color) :offset 196)
                 (%nk-renderer::text-pressed
                  (:struct %nk-renderer::color) :offset 200)
                 (%nk-renderer::text-normal-active
                  (:struct %nk-renderer::color) :offset 204)
                 (%nk-renderer::text-hover-active
                  (:struct %nk-renderer::color) :offset 208)
                 (%nk-renderer::text-pressed-active
                  (:struct %nk-renderer::color) :offset 212)
                 (%nk-renderer::text-background
                  (:struct %nk-renderer::color) :offset 216)
                 (%nk-renderer::text-alignment %nk-renderer::flags
                  :offset 220)
                 (%nk-renderer::rounding :float :offset 224)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 228)
                 (%nk-renderer::touch-padding
                  (:struct %nk-renderer::vec2) :offset 236)
                 (%nk-renderer::image-padding
                  (:struct %nk-renderer::vec2) :offset 244)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  256)
                 (%nk-renderer::draw-begin (:pointer :void) :offset
                  264)
                 (%nk-renderer::draw-end (:pointer :void) :offset
                  272))

(cffi:defcenum (%nk-renderer::symbol-type :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:493:6"
               (:nk-symbol-none 0)
               (:nk-symbol-x 1)
               (:nk-symbol-underscore 2)
               (:nk-symbol-circle-solid 3)
               (:nk-symbol-circle-outline 4)
               (:nk-symbol-rect-solid 5)
               (:nk-symbol-rect-outline 6)
               (:nk-symbol-triangle-up 7)
               (:nk-symbol-triangle-down 8)
               (:nk-symbol-triangle-left 9)
               (:nk-symbol-triangle-right 10)
               (:nk-symbol-plus 11)
               (:nk-symbol-minus 12)
               (:nk-symbol-max 13))

(cffi:defcstruct (%nk-renderer::style-slider :size 640)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::bar-normal
                  (:struct %nk-renderer::color) :offset 100)
                 (%nk-renderer::bar-hover
                  (:struct %nk-renderer::color) :offset 104)
                 (%nk-renderer::bar-active
                  (:struct %nk-renderer::color) :offset 108)
                 (%nk-renderer::bar-filled
                  (:struct %nk-renderer::color) :offset 112)
                 (%nk-renderer::cursor-normal
                  (:struct %nk-renderer::style-item) :offset 120)
                 (%nk-renderer::cursor-hover
                  (:struct %nk-renderer::style-item) :offset 152)
                 (%nk-renderer::cursor-active
                  (:struct %nk-renderer::style-item) :offset 184)
                 (%nk-renderer::border :float :offset 216)
                 (%nk-renderer::rounding :float :offset 220)
                 (%nk-renderer::bar-height :float :offset 224)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 228)
                 (%nk-renderer::spacing (:struct %nk-renderer::vec2)
                  :offset 236)
                 (%nk-renderer::cursor-size
                  (:struct %nk-renderer::vec2) :offset 244)
                 (%nk-renderer::show-buttons :int :offset 252)
                 (%nk-renderer::inc-button
                  (:struct %nk-renderer::style-button) :offset 256)
                 (%nk-renderer::dec-button
                  (:struct %nk-renderer::style-button) :offset 432)
                 (%nk-renderer::inc-symbol %nk-renderer::symbol-type
                  :offset 608)
                 (%nk-renderer::dec-symbol %nk-renderer::symbol-type
                  :offset 612)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  616)
                 (%nk-renderer::draw-begin (:pointer :void) :offset
                  624)
                 (%nk-renderer::draw-end (:pointer :void) :offset
                  632))

(cffi:defcstruct (%nk-renderer::style-progress :size 256)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::cursor-normal
                  (:struct %nk-renderer::style-item) :offset 104)
                 (%nk-renderer::cursor-hover
                  (:struct %nk-renderer::style-item) :offset 136)
                 (%nk-renderer::cursor-active
                  (:struct %nk-renderer::style-item) :offset 168)
                 (%nk-renderer::cursor-border-color
                  (:struct %nk-renderer::color) :offset 200)
                 (%nk-renderer::rounding :float :offset 204)
                 (%nk-renderer::border :float :offset 208)
                 (%nk-renderer::cursor-border :float :offset 212)
                 (%nk-renderer::cursor-rounding :float :offset 216)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 220)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  232)
                 (%nk-renderer::draw-begin (:pointer :void) :offset
                  240)
                 (%nk-renderer::draw-end (:pointer :void) :offset
                  248))

(cffi:defcstruct (%nk-renderer::style-scrollbar :size 616)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::cursor-normal
                  (:struct %nk-renderer::style-item) :offset 104)
                 (%nk-renderer::cursor-hover
                  (:struct %nk-renderer::style-item) :offset 136)
                 (%nk-renderer::cursor-active
                  (:struct %nk-renderer::style-item) :offset 168)
                 (%nk-renderer::cursor-border-color
                  (:struct %nk-renderer::color) :offset 200)
                 (%nk-renderer::border :float :offset 204)
                 (%nk-renderer::rounding :float :offset 208)
                 (%nk-renderer::border-cursor :float :offset 212)
                 (%nk-renderer::rounding-cursor :float :offset 216)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 220)
                 (%nk-renderer::show-buttons :int :offset 228)
                 (%nk-renderer::inc-button
                  (:struct %nk-renderer::style-button) :offset 232)
                 (%nk-renderer::dec-button
                  (:struct %nk-renderer::style-button) :offset 408)
                 (%nk-renderer::inc-symbol %nk-renderer::symbol-type
                  :offset 584)
                 (%nk-renderer::dec-symbol %nk-renderer::symbol-type
                  :offset 588)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  592)
                 (%nk-renderer::draw-begin (:pointer :void) :offset
                  600)
                 (%nk-renderer::draw-end (:pointer :void) :offset
                  608))

(cffi:defcstruct (%nk-renderer::style-edit :size 800)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::scrollbar
                  (:struct %nk-renderer::style-scrollbar) :offset
                  104)
                 (%nk-renderer::cursor-normal
                  (:struct %nk-renderer::color) :offset 720)
                 (%nk-renderer::cursor-hover
                  (:struct %nk-renderer::color) :offset 724)
                 (%nk-renderer::cursor-text-normal
                  (:struct %nk-renderer::color) :offset 728)
                 (%nk-renderer::cursor-text-hover
                  (:struct %nk-renderer::color) :offset 732)
                 (%nk-renderer::text-normal
                  (:struct %nk-renderer::color) :offset 736)
                 (%nk-renderer::text-hover
                  (:struct %nk-renderer::color) :offset 740)
                 (%nk-renderer::text-active
                  (:struct %nk-renderer::color) :offset 744)
                 (%nk-renderer::selected-normal
                  (:struct %nk-renderer::color) :offset 748)
                 (%nk-renderer::selected-hover
                  (:struct %nk-renderer::color) :offset 752)
                 (%nk-renderer::selected-text-normal
                  (:struct %nk-renderer::color) :offset 756)
                 (%nk-renderer::selected-text-hover
                  (:struct %nk-renderer::color) :offset 760)
                 (%nk-renderer::border :float :offset 764)
                 (%nk-renderer::rounding :float :offset 768)
                 (%nk-renderer::cursor-size :float :offset 772)
                 (%nk-renderer::scrollbar-size
                  (:struct %nk-renderer::vec2) :offset 776)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 784)
                 (%nk-renderer::row-padding :float :offset 792))

(cffi:defcstruct (%nk-renderer::style-property :size 1312)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::label-normal
                  (:struct %nk-renderer::color) :offset 100)
                 (%nk-renderer::label-hover
                  (:struct %nk-renderer::color) :offset 104)
                 (%nk-renderer::label-active
                  (:struct %nk-renderer::color) :offset 108)
                 (%nk-renderer::sym-left %nk-renderer::symbol-type
                  :offset 112)
                 (%nk-renderer::sym-right %nk-renderer::symbol-type
                  :offset 116)
                 (%nk-renderer::border :float :offset 120)
                 (%nk-renderer::rounding :float :offset 124)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 128)
                 (%nk-renderer::edit
                  (:struct %nk-renderer::style-edit) :offset 136)
                 (%nk-renderer::inc-button
                  (:struct %nk-renderer::style-button) :offset 936)
                 (%nk-renderer::dec-button
                  (:struct %nk-renderer::style-button) :offset 1112)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  1288)
                 (%nk-renderer::draw-begin (:pointer :void) :offset
                  1296)
                 (%nk-renderer::draw-end (:pointer :void) :offset
                  1304))

(cffi:defcstruct (%nk-renderer::style-chart :size 64)
                 (%nk-renderer::background
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 32)
                 (%nk-renderer::selected-color
                  (:struct %nk-renderer::color) :offset 36)
                 (%nk-renderer::color (:struct %nk-renderer::color)
                  :offset 40)
                 (%nk-renderer::border :float :offset 44)
                 (%nk-renderer::rounding :float :offset 48)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 52))

(cffi:defcstruct (%nk-renderer::style-tab :size 784)
                 (%nk-renderer::background
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 32)
                 (%nk-renderer::text (:struct %nk-renderer::color)
                  :offset 36)
                 (%nk-renderer::tab-maximize-button
                  (:struct %nk-renderer::style-button) :offset 40)
                 (%nk-renderer::tab-minimize-button
                  (:struct %nk-renderer::style-button) :offset 216)
                 (%nk-renderer::node-maximize-button
                  (:struct %nk-renderer::style-button) :offset 392)
                 (%nk-renderer::node-minimize-button
                  (:struct %nk-renderer::style-button) :offset 568)
                 (%nk-renderer::sym-minimize
                  %nk-renderer::symbol-type :offset 744)
                 (%nk-renderer::sym-maximize
                  %nk-renderer::symbol-type :offset 748)
                 (%nk-renderer::border :float :offset 752)
                 (%nk-renderer::rounding :float :offset 756)
                 (%nk-renderer::indent :float :offset 760)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 764)
                 (%nk-renderer::spacing (:struct %nk-renderer::vec2)
                  :offset 772))

(cffi:defcstruct (%nk-renderer::style-combo :size 352)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 96)
                 (%nk-renderer::label-normal
                  (:struct %nk-renderer::color) :offset 100)
                 (%nk-renderer::label-hover
                  (:struct %nk-renderer::color) :offset 104)
                 (%nk-renderer::label-active
                  (:struct %nk-renderer::color) :offset 108)
                 (%nk-renderer::symbol-normal
                  (:struct %nk-renderer::color) :offset 112)
                 (%nk-renderer::symbol-hover
                  (:struct %nk-renderer::color) :offset 116)
                 (%nk-renderer::symbol-active
                  (:struct %nk-renderer::color) :offset 120)
                 (%nk-renderer::button
                  (:struct %nk-renderer::style-button) :offset 128)
                 (%nk-renderer::sym-normal %nk-renderer::symbol-type
                  :offset 304)
                 (%nk-renderer::sym-hover %nk-renderer::symbol-type
                  :offset 308)
                 (%nk-renderer::sym-active %nk-renderer::symbol-type
                  :offset 312)
                 (%nk-renderer::border :float :offset 316)
                 (%nk-renderer::rounding :float :offset 320)
                 (%nk-renderer::content-padding
                  (:struct %nk-renderer::vec2) :offset 324)
                 (%nk-renderer::button-padding
                  (:struct %nk-renderer::vec2) :offset 332)
                 (%nk-renderer::spacing (:struct %nk-renderer::vec2)
                  :offset 340))

(cffi:defcenum (%nk-renderer::style-header-align :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:5146:6"
               (:nk-header-left 0)
               (:nk-header-right 1))

(cffi:defcstruct (%nk-renderer::style-window-header :size 504)
                 (%nk-renderer::normal
                  (:struct %nk-renderer::style-item) :offset 0)
                 (%nk-renderer::hover
                  (:struct %nk-renderer::style-item) :offset 32)
                 (%nk-renderer::active
                  (:struct %nk-renderer::style-item) :offset 64)
                 (%nk-renderer::close-button
                  (:struct %nk-renderer::style-button) :offset 96)
                 (%nk-renderer::minimize-button
                  (:struct %nk-renderer::style-button) :offset 272)
                 (%nk-renderer::close-symbol
                  %nk-renderer::symbol-type :offset 448)
                 (%nk-renderer::minimize-symbol
                  %nk-renderer::symbol-type :offset 452)
                 (%nk-renderer::maximize-symbol
                  %nk-renderer::symbol-type :offset 456)
                 (%nk-renderer::label-normal
                  (:struct %nk-renderer::color) :offset 460)
                 (%nk-renderer::label-hover
                  (:struct %nk-renderer::color) :offset 464)
                 (%nk-renderer::label-active
                  (:struct %nk-renderer::color) :offset 468)
                 (%nk-renderer::align
                  %nk-renderer::style-header-align :offset 472)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 476)
                 (%nk-renderer::label-padding
                  (:struct %nk-renderer::vec2) :offset 484)
                 (%nk-renderer::spacing (:struct %nk-renderer::vec2)
                  :offset 492))

(cffi:defcstruct (%nk-renderer::style-window :size 720)
                 (%nk-renderer::header
                  (:struct %nk-renderer::style-window-header) :offset
                  0)
                 (%nk-renderer::fixed-background
                  (:struct %nk-renderer::style-item) :offset 504)
                 (%nk-renderer::background
                  (:struct %nk-renderer::color) :offset 536)
                 (%nk-renderer::border-color
                  (:struct %nk-renderer::color) :offset 540)
                 (%nk-renderer::popup-border-color
                  (:struct %nk-renderer::color) :offset 544)
                 (%nk-renderer::combo-border-color
                  (:struct %nk-renderer::color) :offset 548)
                 (%nk-renderer::contextual-border-color
                  (:struct %nk-renderer::color) :offset 552)
                 (%nk-renderer::menu-border-color
                  (:struct %nk-renderer::color) :offset 556)
                 (%nk-renderer::group-border-color
                  (:struct %nk-renderer::color) :offset 560)
                 (%nk-renderer::tooltip-border-color
                  (:struct %nk-renderer::color) :offset 564)
                 (%nk-renderer::scaler
                  (:struct %nk-renderer::style-item) :offset 568)
                 (%nk-renderer::border :float :offset 600)
                 (%nk-renderer::combo-border :float :offset 604)
                 (%nk-renderer::contextual-border :float :offset 608)
                 (%nk-renderer::menu-border :float :offset 612)
                 (%nk-renderer::group-border :float :offset 616)
                 (%nk-renderer::tooltip-border :float :offset 620)
                 (%nk-renderer::popup-border :float :offset 624)
                 (%nk-renderer::min-row-height-padding :float :offset
                  628)
                 (%nk-renderer::rounding :float :offset 632)
                 (%nk-renderer::spacing (:struct %nk-renderer::vec2)
                  :offset 636)
                 (%nk-renderer::scrollbar-size
                  (:struct %nk-renderer::vec2) :offset 644)
                 (%nk-renderer::min-size (:struct %nk-renderer::vec2)
                  :offset 652)
                 (%nk-renderer::padding (:struct %nk-renderer::vec2)
                  :offset 660)
                 (%nk-renderer::group-padding
                  (:struct %nk-renderer::vec2) :offset 668)
                 (%nk-renderer::popup-padding
                  (:struct %nk-renderer::vec2) :offset 676)
                 (%nk-renderer::combo-padding
                  (:struct %nk-renderer::vec2) :offset 684)
                 (%nk-renderer::contextual-padding
                  (:struct %nk-renderer::vec2) :offset 692)
                 (%nk-renderer::menu-padding
                  (:struct %nk-renderer::vec2) :offset 700)
                 (%nk-renderer::tooltip-padding
                  (:struct %nk-renderer::vec2) :offset 708))

(cffi:defcstruct (%nk-renderer::style :size 7544)
                 (%nk-renderer::font
                  (:pointer (:struct %nk-renderer::user-font))
                  :offset 0)
                 (%nk-renderer::cursors
                  (:pointer
                   (:pointer (:struct %nk-renderer::cursor)))
                  :offset 8)
                 (%nk-renderer::cursor-active
                  (:pointer (:struct %nk-renderer::cursor)) :offset
                  64)
                 (%nk-renderer::cursor-last
                  (:pointer (:struct %nk-renderer::cursor)) :offset
                  72)
                 (%nk-renderer::cursor-visible :int :offset 80)
                 (%nk-renderer::text
                  (:struct %nk-renderer::style-text) :offset 84)
                 (%nk-renderer::button
                  (:struct %nk-renderer::style-button) :offset 96)
                 (%nk-renderer::contextual-button
                  (:struct %nk-renderer::style-button) :offset 272)
                 (%nk-renderer::menu-button
                  (:struct %nk-renderer::style-button) :offset 448)
                 (%nk-renderer::option
                  (:struct %nk-renderer::style-toggle) :offset 624)
                 (%nk-renderer::checkbox
                  (:struct %nk-renderer::style-toggle) :offset 864)
                 (%nk-renderer::selectable
                  (:struct %nk-renderer::style-selectable) :offset
                  1104)
                 (%nk-renderer::slider
                  (:struct %nk-renderer::style-slider) :offset 1384)
                 (%nk-renderer::progress
                  (:struct %nk-renderer::style-progress) :offset
                  2024)
                 (%nk-renderer::property
                  (:struct %nk-renderer::style-property) :offset
                  2280)
                 (%nk-renderer::edit
                  (:struct %nk-renderer::style-edit) :offset 3592)
                 (%nk-renderer::chart
                  (:struct %nk-renderer::style-chart) :offset 4392)
                 (%nk-renderer::scrollh
                  (:struct %nk-renderer::style-scrollbar) :offset
                  4456)
                 (%nk-renderer::scrollv
                  (:struct %nk-renderer::style-scrollbar) :offset
                  5072)
                 (%nk-renderer::tab (:struct %nk-renderer::style-tab)
                  :offset 5688)
                 (%nk-renderer::combo
                  (:struct %nk-renderer::style-combo) :offset 6472)
                 (%nk-renderer::window
                  (:struct %nk-renderer::style-window) :offset 6824))

(cffi:defctype %nk-renderer::size :unsigned-long)

(cffi:defcstruct (%nk-renderer::buffer-marker :size 16)
                 (%nk-renderer::active :int :offset 0)
                 (%nk-renderer::offset %nk-renderer::size :offset 8))

(cffi:defctype %nk-renderer::plugin-alloc (:pointer :void))

(cffi:defctype %nk-renderer::plugin-free (:pointer :void))

(cffi:defcstruct (%nk-renderer::allocator :size 24)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  0)
                 (%nk-renderer::alloc %nk-renderer::plugin-alloc
                  :offset 8)
                 (%nk-renderer::free %nk-renderer::plugin-free
                  :offset 16))

(cffi:defcenum (%nk-renderer::allocation-type :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:4101:6"
               (:nk-buffer-fixed 0)
               (:nk-buffer-dynamic 1))

(cffi:defcstruct (%nk-renderer::memory :size 16)
                 (%nk-renderer::ptr (:pointer :void) :offset 0)
                 (%nk-renderer::size %nk-renderer::size :offset 8))

(cffi:defcstruct (%nk-renderer::buffer :size 120)
                 (%nk-renderer::marker
                  (:struct %nk-renderer::buffer-marker) :count 2
                  :offset 0)
                 (%nk-renderer::pool
                  (:struct %nk-renderer::allocator) :offset 32)
                 (%nk-renderer::type %nk-renderer::allocation-type
                  :offset 56)
                 (%nk-renderer::memory (:struct %nk-renderer::memory)
                  :offset 64)
                 (%nk-renderer::grow-factor :float :offset 80)
                 (%nk-renderer::allocated %nk-renderer::size :offset
                  88)
                 (%nk-renderer::needed %nk-renderer::size :offset 96)
                 (%nk-renderer::calls %nk-renderer::size :offset 104)
                 (%nk-renderer::size %nk-renderer::size :offset 112))

(cffi:defctype %nk-renderer::plugin-paste (:pointer :void))

(cffi:defctype %nk-renderer::plugin-copy (:pointer :void))

(cffi:defcstruct (%nk-renderer::clipboard :size 24)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  0)
                 (%nk-renderer::paste %nk-renderer::plugin-paste
                  :offset 8)
                 (%nk-renderer::copy %nk-renderer::plugin-copy
                  :offset 16))

(cffi:defcenum (%nk-renderer::button-behavior :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:470:6"
               (:nk-button-default 0)
               (:nk-button-repeater 1))

(cffi:defcstruct (%nk-renderer::config-stack-style-item-element :size
                  40)
                 (%nk-renderer::address
                  (:pointer (:struct %nk-renderer::style-item))
                  :offset 0)
                 (%nk-renderer::old-value
                  (:struct %nk-renderer::style-item) :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-style-item :size 648)
                 (%nk-renderer::head :int :offset 0)
                 (%nk-renderer::elements
                  (:struct
                   %nk-renderer::config-stack-style-item-element)
                  :count 16 :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-float-element :size 16)
                 (%nk-renderer::address (:pointer :float) :offset 0)
                 (%nk-renderer::old-value :float :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-float :size 520)
                 (%nk-renderer::head :int :offset 0)
                 (%nk-renderer::elements
                  (:struct %nk-renderer::config-stack-float-element)
                  :count 32 :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-vec2-element :size 16)
                 (%nk-renderer::address
                  (:pointer (:struct %nk-renderer::vec2)) :offset 0)
                 (%nk-renderer::old-value
                  (:struct %nk-renderer::vec2) :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-vec2 :size 264)
                 (%nk-renderer::head :int :offset 0)
                 (%nk-renderer::elements
                  (:struct %nk-renderer::config-stack-vec2-element)
                  :count 16 :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-flags-element :size 16)
                 (%nk-renderer::address
                  (:pointer %nk-renderer::flags) :offset 0)
                 (%nk-renderer::old-value %nk-renderer::flags :offset
                  8))

(cffi:defcstruct (%nk-renderer::config-stack-flags :size 520)
                 (%nk-renderer::head :int :offset 0)
                 (%nk-renderer::elements
                  (:struct %nk-renderer::config-stack-flags-element)
                  :count 32 :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-color-element :size 16)
                 (%nk-renderer::address
                  (:pointer (:struct %nk-renderer::color)) :offset 0)
                 (%nk-renderer::old-value
                  (:struct %nk-renderer::color) :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-color :size 520)
                 (%nk-renderer::head :int :offset 0)
                 (%nk-renderer::elements
                  (:struct %nk-renderer::config-stack-color-element)
                  :count 32 :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-user-font-element :size
                  16)
                 (%nk-renderer::address
                  (:pointer
                   (:pointer (:struct %nk-renderer::user-font)))
                  :offset 0)
                 (%nk-renderer::old-value
                  (:pointer (:struct %nk-renderer::user-font))
                  :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-user-font :size 136)
                 (%nk-renderer::head :int :offset 0)
                 (%nk-renderer::elements
                  (:struct
                   %nk-renderer::config-stack-user-font-element)
                  :count 8 :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-button-behavior-element
                  :size 16)
                 (%nk-renderer::address
                  (:pointer %nk-renderer::button-behavior) :offset 0)
                 (%nk-renderer::old-value
                  %nk-renderer::button-behavior :offset 8))

(cffi:defcstruct (%nk-renderer::config-stack-button-behavior :size
                  136)
                 (%nk-renderer::head :int :offset 0)
                 (%nk-renderer::elements
                  (:struct
                   %nk-renderer::config-stack-button-behavior-element)
                  :count 8 :offset 8))

(cffi:defcstruct (%nk-renderer::configuration-stacks :size 2744)
                 (%nk-renderer::style-items
                  (:struct %nk-renderer::config-stack-style-item)
                  :offset 0)
                 (%nk-renderer::floats
                  (:struct %nk-renderer::config-stack-float) :offset
                  648)
                 (%nk-renderer::vectors
                  (:struct %nk-renderer::config-stack-vec2) :offset
                  1168)
                 (%nk-renderer::flags
                  (:struct %nk-renderer::config-stack-flags) :offset
                  1432)
                 (%nk-renderer::colors
                  (:struct %nk-renderer::config-stack-color) :offset
                  1952)
                 (%nk-renderer::fonts
                  (:struct %nk-renderer::config-stack-user-font)
                  :offset 2472)
                 (%nk-renderer::button-behaviors
                  (:struct
                   %nk-renderer::config-stack-button-behavior)
                  :offset 2608))

(cffi:defcstruct (%nk-renderer::rect :size 16)
                 (%nk-renderer::x :float :offset 0)
                 (%nk-renderer::y :float :offset 4)
                 (%nk-renderer::w :float :offset 8)
                 (%nk-renderer::h :float :offset 12))

(cffi:defcenum (%nk-renderer::anti-aliasing :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:1142:6"
               (:nk-anti-aliasing-off 0)
               (:nk-anti-aliasing-on 1))

(cffi:defcstruct (%nk-renderer::draw-null-texture :size 16)
                 (%nk-renderer::texture %nk-renderer::handle :offset
                  0)
                 (%nk-renderer::uv (:struct %nk-renderer::vec2)
                  :offset 8))

(cffi:defcenum (%nk-renderer::draw-vertex-layout-attribute
                :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:4677:6"
               (:nk-vertex-position 0)
               (:nk-vertex-color 1)
               (:nk-vertex-texcoord 2)
               (:nk-vertex-attribute-count 3))

(cffi:defcenum (%nk-renderer::draw-vertex-layout-format
                :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:4684:6"
               (:nk-format-schar 0)
               (:nk-format-sshort 1)
               (:nk-format-sint 2)
               (:nk-format-uchar 3)
               (:nk-format-ushort 4)
               (:nk-format-uint 5)
               (:nk-format-float 6)
               (:nk-format-double 7)
               (:nk-format-color-begin 8)
               (:nk-format-r8g8b8 8)
               (:nk-format-r16g15b16 9)
               (:nk-format-r32g32b32 10)
               (:nk-format-r8g8b8a8 11)
               (:nk-format-b8g8r8a8 12)
               (:nk-format-r16g15b16a16 13)
               (:nk-format-r32g32b32a32 14)
               (:nk-format-r32g32b32a32-float 15)
               (:nk-format-r32g32b32a32-double 16)
               (:nk-format-rgb32 17)
               (:nk-format-rgba32 18)
               (:nk-format-color-end 18)
               (:nk-format-count 19))

(cffi:defcstruct (%nk-renderer::draw-vertex-layout-element :size 16)
                 (%nk-renderer::attribute
                  %nk-renderer::draw-vertex-layout-attribute :offset
                  0)
                 (%nk-renderer::format
                  %nk-renderer::draw-vertex-layout-format :offset 4)
                 (%nk-renderer::offset %nk-renderer::size :offset 8))

(cffi:defcstruct (%nk-renderer::convert-config :size 64)
                 (%nk-renderer::global-alpha :float :offset 0)
                 (%nk-renderer::line-aa %nk-renderer::anti-aliasing
                  :offset 4)
                 (%nk-renderer::shape-aa %nk-renderer::anti-aliasing
                  :offset 8)
                 (%nk-renderer::circle-segment-count :unsigned-int
                  :offset 12)
                 (%nk-renderer::arc-segment-count :unsigned-int
                  :offset 16)
                 (%nk-renderer::curve-segment-count :unsigned-int
                  :offset 20)
                 (%nk-renderer::null
                  (:struct %nk-renderer::draw-null-texture) :offset
                  24)
                 (%nk-renderer::vertex-layout
                  (:pointer
                   (:struct
                    %nk-renderer::draw-vertex-layout-element))
                  :offset 40)
                 (%nk-renderer::vertex-size %nk-renderer::size
                  :offset 48)
                 (%nk-renderer::vertex-alignment %nk-renderer::size
                  :offset 56))

(cffi:defcstruct (%nk-renderer::draw-list :size 240)
                 (%nk-renderer::clip-rect
                  (:struct %nk-renderer::rect) :offset 0)
                 (%nk-renderer::circle-vtx
                  (:struct %nk-renderer::vec2) :count 12 :offset 16)
                 (%nk-renderer::config
                  (:struct %nk-renderer::convert-config) :offset 112)
                 (%nk-renderer::buffer
                  (:pointer (:struct %nk-renderer::buffer)) :offset
                  176)
                 (%nk-renderer::vertices
                  (:pointer (:struct %nk-renderer::buffer)) :offset
                  184)
                 (%nk-renderer::elements
                  (:pointer (:struct %nk-renderer::buffer)) :offset
                  192)
                 (%nk-renderer::element-count :unsigned-int :offset
                  200)
                 (%nk-renderer::vertex-count :unsigned-int :offset
                  204)
                 (%nk-renderer::cmd-count :unsigned-int :offset 208)
                 (%nk-renderer::cmd-offset %nk-renderer::size :offset
                  216)
                 (%nk-renderer::path-count :unsigned-int :offset 224)
                 (%nk-renderer::path-offset :unsigned-int :offset
                  228)
                 (%nk-renderer::line-aa %nk-renderer::anti-aliasing
                  :offset 232)
                 (%nk-renderer::shape-aa %nk-renderer::anti-aliasing
                  :offset 236))

(cffi:defcstruct (%nk-renderer::str :size 128)
                 (%nk-renderer::buffer (:struct %nk-renderer::buffer)
                  :offset 0)
                 (%nk-renderer::len :int :offset 120))

(cffi:defctype %nk-renderer::plugin-filter (:pointer :void))

(cffi:defcstruct (%nk-renderer::text-undo-record :size 12)
                 (%nk-renderer::where :int :offset 0)
                 (%nk-renderer::insert-length :short :offset 4)
                 (%nk-renderer::delete-length :short :offset 6)
                 (%nk-renderer::char-storage :short :offset 8))

(cffi:defctype %nk-renderer::rune :unsigned-int)

(cffi:defcstruct (%nk-renderer::text-undo-state :size 5192)
                 (%nk-renderer::undo-rec
                  (:struct %nk-renderer::text-undo-record) :count 99
                  :offset 0)
                 (%nk-renderer::undo-char %nk-renderer::rune :count
                  999 :offset 1188)
                 (%nk-renderer::undo-point :short :offset 5184)
                 (%nk-renderer::redo-point :short :offset 5186)
                 (%nk-renderer::undo-char-point :short :offset 5188)
                 (%nk-renderer::redo-char-point :short :offset 5190))

(cffi:defcstruct (%nk-renderer::text-edit :size 5384)
                 (%nk-renderer::clip
                  (:struct %nk-renderer::clipboard) :offset 0)
                 (%nk-renderer::string (:struct %nk-renderer::str)
                  :offset 24)
                 (%nk-renderer::filter %nk-renderer::plugin-filter
                  :offset 152)
                 (%nk-renderer::scrollbar
                  (:struct %nk-renderer::vec2) :offset 160)
                 (%nk-renderer::cursor :int :offset 168)
                 (%nk-renderer::select-start :int :offset 172)
                 (%nk-renderer::select-end :int :offset 176)
                 (%nk-renderer::mode :unsigned-char :offset 180)
                 (%nk-renderer::cursor-at-end-of-line :unsigned-char
                  :offset 181)
                 (%nk-renderer::initialized :unsigned-char :offset
                  182)
                 (%nk-renderer::has-preferred-x :unsigned-char
                  :offset 183)
                 (%nk-renderer::single-line :unsigned-char :offset
                  184)
                 (%nk-renderer::active :unsigned-char :offset 185)
                 (%nk-renderer::padding1 :unsigned-char :offset 186)
                 (%nk-renderer::preferred-x :float :offset 188)
                 (%nk-renderer::undo
                  (:struct %nk-renderer::text-undo-state) :offset
                  192))

(cffi:defcstruct (%nk-renderer::command-buffer :size 64)
                 (%nk-renderer::base
                  (:pointer (:struct %nk-renderer::buffer)) :offset
                  0)
                 (%nk-renderer::clip (:struct %nk-renderer::rect)
                  :offset 8)
                 (%nk-renderer::use-clipping :int :offset 24)
                 (%nk-renderer::userdata %nk-renderer::handle :offset
                  32)
                 (%nk-renderer::begin %nk-renderer::size :offset 40)
                 (%nk-renderer::end %nk-renderer::size :offset 48)
                 (%nk-renderer::last %nk-renderer::size :offset 56))

(cffi:defcstruct (%nk-renderer::page :size 528))

(cffi:defctype %nk-renderer::hash :unsigned-int)

(cffi:defctype %nk-renderer::uint :unsigned-int)

(cffi:defcstruct (%nk-renderer::table :size 496))

(cffi:defcstruct (%nk-renderer::table :size 496)
                 (%nk-renderer::seq :unsigned-int :offset 0)
                 (%nk-renderer::size :unsigned-int :offset 4)
                 (%nk-renderer::keys %nk-renderer::hash :count 59
                  :offset 8)
                 (%nk-renderer::values %nk-renderer::uint :count 59
                  :offset 244)
                 (%nk-renderer::next
                  (:pointer (:struct %nk-renderer::table)) :offset
                  480)
                 (%nk-renderer::prev
                  (:pointer (:struct %nk-renderer::table)) :offset
                  488))

(cffi:defcenum (%nk-renderer::panel-type :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:5252:6"
               (:nk-panel-none 0)
               (:nk-panel-window 1)
               (:nk-panel-group 2)
               (:nk-panel-popup 4)
               (:nk-panel-contextual 16)
               (:nk-panel-combo 32)
               (:nk-panel-menu 64)
               (:nk-panel-tooltip 128))

(cffi:defcstruct (%nk-renderer::scroll :size 8)
                 (%nk-renderer::x %nk-renderer::uint :offset 0)
                 (%nk-renderer::y %nk-renderer::uint :offset 4))

(cffi:defcstruct (%nk-renderer::menu-state :size 24)
                 (%nk-renderer::x :float :offset 0)
                 (%nk-renderer::y :float :offset 4)
                 (%nk-renderer::w :float :offset 8)
                 (%nk-renderer::h :float :offset 12)
                 (%nk-renderer::offset (:struct %nk-renderer::scroll)
                  :offset 16))

(cffi:defcenum (%nk-renderer::panel-row-layout-type :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:5284:6"
               (:nk-layout-dynamic-fixed 0)
               (:nk-layout-dynamic-row 1)
               (:nk-layout-dynamic-free 2)
               (:nk-layout-dynamic 3)
               (:nk-layout-static-fixed 4)
               (:nk-layout-static-row 5)
               (:nk-layout-static-free 6)
               (:nk-layout-static 7)
               (:nk-layout-template 8)
               (:nk-layout-count 9))

(cffi:defcstruct (%nk-renderer::row-layout :size 136)
                 (%nk-renderer::type
                  %nk-renderer::panel-row-layout-type :offset 0)
                 (%nk-renderer::index :int :offset 4)
                 (%nk-renderer::height :float :offset 8)
                 (%nk-renderer::min-height :float :offset 12)
                 (%nk-renderer::columns :int :offset 16)
                 (%nk-renderer::ratio (:pointer :float) :offset 24)
                 (%nk-renderer::item-width :float :offset 32)
                 (%nk-renderer::item-height :float :offset 36)
                 (%nk-renderer::item-offset :float :offset 40)
                 (%nk-renderer::filled :float :offset 44)
                 (%nk-renderer::item (:struct %nk-renderer::rect)
                  :offset 48)
                 (%nk-renderer::tree-depth :int :offset 64)
                 (%nk-renderer::templates :float :count 16 :offset
                  68))

(cffi:defcenum (%nk-renderer::chart-type :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:475:6"
               (:nk-chart-lines 0)
               (:nk-chart-column 1)
               (:nk-chart-max 2))

(cffi:defcstruct (%nk-renderer::chart-slot :size 40)
                 (%nk-renderer::type %nk-renderer::chart-type :offset
                  0)
                 (%nk-renderer::color (:struct %nk-renderer::color)
                  :offset 4)
                 (%nk-renderer::highlight
                  (:struct %nk-renderer::color) :offset 8)
                 (%nk-renderer::min :float :offset 12)
                 (%nk-renderer::max :float :offset 16)
                 (%nk-renderer::range :float :offset 20)
                 (%nk-renderer::count :int :offset 24)
                 (%nk-renderer::last (:struct %nk-renderer::vec2)
                  :offset 28)
                 (%nk-renderer::index :int :offset 36))

(cffi:defcstruct (%nk-renderer::chart :size 180)
                 (%nk-renderer::slot :int :offset 0)
                 (%nk-renderer::x :float :offset 4)
                 (%nk-renderer::y :float :offset 8)
                 (%nk-renderer::w :float :offset 12)
                 (%nk-renderer::h :float :offset 16)
                 (%nk-renderer::slots
                  (:struct %nk-renderer::chart-slot) :count 4 :offset
                  20))

(cffi:defcstruct (%nk-renderer::panel :size 448))

(cffi:defcstruct (%nk-renderer::panel :size 448)
                 (%nk-renderer::type %nk-renderer::panel-type :offset
                  0)
                 (%nk-renderer::flags %nk-renderer::flags :offset 4)
                 (%nk-renderer::bounds (:struct %nk-renderer::rect)
                  :offset 8)
                 (%nk-renderer::offset-x
                  (:pointer %nk-renderer::uint) :offset 24)
                 (%nk-renderer::offset-y
                  (:pointer %nk-renderer::uint) :offset 32)
                 (%nk-renderer::at-x :float :offset 40)
                 (%nk-renderer::at-y :float :offset 44)
                 (%nk-renderer::max-x :float :offset 48)
                 (%nk-renderer::footer-height :float :offset 52)
                 (%nk-renderer::header-height :float :offset 56)
                 (%nk-renderer::border :float :offset 60)
                 (%nk-renderer::has-scrolling :unsigned-int :offset
                  64)
                 (%nk-renderer::clip (:struct %nk-renderer::rect)
                  :offset 68)
                 (%nk-renderer::menu
                  (:struct %nk-renderer::menu-state) :offset 84)
                 (%nk-renderer::row
                  (:struct %nk-renderer::row-layout) :offset 112)
                 (%nk-renderer::chart (:struct %nk-renderer::chart)
                  :offset 248)
                 (%nk-renderer::buffer
                  (:pointer (:struct %nk-renderer::command-buffer))
                  :offset 432)
                 (%nk-renderer::parent
                  (:pointer (:struct %nk-renderer::panel)) :offset
                  440))

(cffi:defcstruct (%nk-renderer::property-state :size 104)
                 (%nk-renderer::active :int :offset 0)
                 (%nk-renderer::prev :int :offset 4)
                 (%nk-renderer::buffer :char :count 64 :offset 8)
                 (%nk-renderer::length :int :offset 72)
                 (%nk-renderer::cursor :int :offset 76)
                 (%nk-renderer::select-start :int :offset 80)
                 (%nk-renderer::select-end :int :offset 84)
                 (%nk-renderer::name %nk-renderer::hash :offset 88)
                 (%nk-renderer::seq :unsigned-int :offset 92)
                 (%nk-renderer::old :unsigned-int :offset 96)
                 (%nk-renderer::state :int :offset 100))

(cffi:defcstruct (%nk-renderer::window :size 472))

(cffi:defcstruct (%nk-renderer::popup-buffer :size 40)
                 (%nk-renderer::begin %nk-renderer::size :offset 0)
                 (%nk-renderer::parent %nk-renderer::size :offset 8)
                 (%nk-renderer::last %nk-renderer::size :offset 16)
                 (%nk-renderer::end %nk-renderer::size :offset 24)
                 (%nk-renderer::active :int :offset 32))

(cffi:defcstruct (%nk-renderer::popup-state :size 96)
                 (%nk-renderer::win
                  (:pointer (:struct %nk-renderer::window)) :offset
                  0)
                 (%nk-renderer::type %nk-renderer::panel-type :offset
                  8)
                 (%nk-renderer::buf
                  (:struct %nk-renderer::popup-buffer) :offset 16)
                 (%nk-renderer::name %nk-renderer::hash :offset 56)
                 (%nk-renderer::active :int :offset 60)
                 (%nk-renderer::combo-count :unsigned-int :offset 64)
                 (%nk-renderer::con-count :unsigned-int :offset 68)
                 (%nk-renderer::con-old :unsigned-int :offset 72)
                 (%nk-renderer::active-con :unsigned-int :offset 76)
                 (%nk-renderer::header (:struct %nk-renderer::rect)
                  :offset 80))

(cffi:defcstruct (%nk-renderer::edit-state :size 44)
                 (%nk-renderer::name %nk-renderer::hash :offset 0)
                 (%nk-renderer::seq :unsigned-int :offset 4)
                 (%nk-renderer::old :unsigned-int :offset 8)
                 (%nk-renderer::active :int :offset 12)
                 (%nk-renderer::prev :int :offset 16)
                 (%nk-renderer::cursor :int :offset 20)
                 (%nk-renderer::sel-start :int :offset 24)
                 (%nk-renderer::sel-end :int :offset 28)
                 (%nk-renderer::scrollbar
                  (:struct %nk-renderer::scroll) :offset 32)
                 (%nk-renderer::mode :unsigned-char :offset 40)
                 (%nk-renderer::single-line :unsigned-char :offset
                  41))

(cffi:defcstruct (%nk-renderer::window :size 472)
                 (%nk-renderer::seq :unsigned-int :offset 0)
                 (%nk-renderer::name %nk-renderer::hash :offset 4)
                 (%nk-renderer::name-string :char :count 64 :offset
                  8)
                 (%nk-renderer::flags %nk-renderer::flags :offset 72)
                 (%nk-renderer::bounds (:struct %nk-renderer::rect)
                  :offset 76)
                 (%nk-renderer::scrollbar
                  (:struct %nk-renderer::scroll) :offset 92)
                 (%nk-renderer::buffer
                  (:struct %nk-renderer::command-buffer) :offset 104)
                 (%nk-renderer::layout
                  (:pointer (:struct %nk-renderer::panel)) :offset
                  168)
                 (%nk-renderer::scrollbar-hiding-timer :float :offset
                  176)
                 (%nk-renderer::property
                  (:struct %nk-renderer::property-state) :offset 180)
                 (%nk-renderer::popup
                  (:struct %nk-renderer::popup-state) :offset 288)
                 (%nk-renderer::edit
                  (:struct %nk-renderer::edit-state) :offset 384)
                 (%nk-renderer::scrolled :unsigned-int :offset 428)
                 (%nk-renderer::tables
                  (:pointer (:struct %nk-renderer::table)) :offset
                  432)
                 (%nk-renderer::table-count :unsigned-int :offset
                  440)
                 (%nk-renderer::next
                  (:pointer (:struct %nk-renderer::window)) :offset
                  448)
                 (%nk-renderer::prev
                  (:pointer (:struct %nk-renderer::window)) :offset
                  456)
                 (%nk-renderer::parent
                  (:pointer (:struct %nk-renderer::window)) :offset
                  464))

(cffi:defcunion (%nk-renderer::page-data :size 496)
                (%nk-renderer::tbl (:struct %nk-renderer::table))
                (%nk-renderer::pan (:struct %nk-renderer::panel))
                (%nk-renderer::win (:struct %nk-renderer::window)))

(cffi:defcstruct (%nk-renderer::page-element :size 512))

(cffi:defcstruct (%nk-renderer::page-element :size 512)
                 (%nk-renderer::data (:union %nk-renderer::page-data)
                  :offset 0)
                 (%nk-renderer::next
                  (:pointer (:struct %nk-renderer::page-element))
                  :offset 496)
                 (%nk-renderer::prev
                  (:pointer (:struct %nk-renderer::page-element))
                  :offset 504))

(cffi:defcstruct (%nk-renderer::page :size 528)
                 (%nk-renderer::size :unsigned-int :offset 0)
                 (%nk-renderer::next
                  (:pointer (:struct %nk-renderer::page)) :offset 8)
                 (%nk-renderer::win
                  (:struct %nk-renderer::page-element) :count 1
                  :offset 16))

(cffi:defcstruct (%nk-renderer::pool :size 72)
                 (%nk-renderer::alloc
                  (:struct %nk-renderer::allocator) :offset 0)
                 (%nk-renderer::type %nk-renderer::allocation-type
                  :offset 24)
                 (%nk-renderer::page-count :unsigned-int :offset 28)
                 (%nk-renderer::pages
                  (:pointer (:struct %nk-renderer::page)) :offset 32)
                 (%nk-renderer::freelist
                  (:pointer (:struct %nk-renderer::page-element))
                  :offset 40)
                 (%nk-renderer::capacity :unsigned-int :offset 48)
                 (%nk-renderer::size %nk-renderer::size :offset 56)
                 (%nk-renderer::cap %nk-renderer::size :offset 64))

(cffi:defcstruct (%nk-renderer::context :size 16624)
                 (%nk-renderer::input (:struct %nk-renderer::input)
                  :offset 0)
                 (%nk-renderer::style (:struct %nk-renderer::style)
                  :offset 360)
                 (%nk-renderer::memory (:struct %nk-renderer::buffer)
                  :offset 7904)
                 (%nk-renderer::clip
                  (:struct %nk-renderer::clipboard) :offset 8024)
                 (%nk-renderer::last-widget-state %nk-renderer::flags
                  :offset 8048)
                 (%nk-renderer::button-behavior
                  %nk-renderer::button-behavior :offset 8052)
                 (%nk-renderer::stacks
                  (:struct %nk-renderer::configuration-stacks)
                  :offset 8056)
                 (%nk-renderer::delta-time-seconds :float :offset
                  10800)
                 (%nk-renderer::draw-list
                  (:struct %nk-renderer::draw-list) :offset 10808)
                 (%nk-renderer::text-edit
                  (:struct %nk-renderer::text-edit) :offset 11048)
                 (%nk-renderer::overlay
                  (:struct %nk-renderer::command-buffer) :offset
                  16432)
                 (%nk-renderer::build :int :offset 16496)
                 (%nk-renderer::use-pool :int :offset 16500)
                 (%nk-renderer::pool (:struct %nk-renderer::pool)
                  :offset 16504)
                 (%nk-renderer::begin
                  (:pointer (:struct %nk-renderer::window)) :offset
                  16576)
                 (%nk-renderer::end
                  (:pointer (:struct %nk-renderer::window)) :offset
                  16584)
                 (%nk-renderer::active
                  (:pointer (:struct %nk-renderer::window)) :offset
                  16592)
                 (%nk-renderer::current
                  (:pointer (:struct %nk-renderer::window)) :offset
                  16600)
                 (%nk-renderer::freelist
                  (:pointer (:struct %nk-renderer::page-element))
                  :offset 16608)
                 (%nk-renderer::count :unsigned-int :offset 16616)
                 (%nk-renderer::seq :unsigned-int :offset 16620))

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

(cffi:defcstruct (%nk-renderer::baked-font :size 32)
                 (%nk-renderer::height :float :offset 0)
                 (%nk-renderer::ascent :float :offset 4)
                 (%nk-renderer::descent :float :offset 8)
                 (%nk-renderer::glyph-offset %nk-renderer::rune
                  :offset 12)
                 (%nk-renderer::glyph-count %nk-renderer::rune
                  :offset 16)
                 (%nk-renderer::ranges (:pointer %nk-renderer::rune)
                  :offset 24))

(cffi:defcstruct (%nk-renderer::font-glyph :size 48)
                 (%nk-renderer::codepoint %nk-renderer::rune :offset
                  0)
                 (%nk-renderer::xadvance :float :offset 4)
                 (%nk-renderer::x0 :float :offset 8)
                 (%nk-renderer::y0 :float :offset 12)
                 (%nk-renderer::x1 :float :offset 16)
                 (%nk-renderer::y1 :float :offset 20)
                 (%nk-renderer::w :float :offset 24)
                 (%nk-renderer::h :float :offset 28)
                 (%nk-renderer::u0 :float :offset 32)
                 (%nk-renderer::v0 :float :offset 36)
                 (%nk-renderer::u1 :float :offset 40)
                 (%nk-renderer::v1 :float :offset 44))

(cffi:defcenum (%nk-renderer::font-coord-type :unsigned-int)
               "/home/borodust/devel/repo/bodge-projects/bodge-nuklear-renderer/src/lib/nuklear/nuklear.h:3930:6"
               (:nk-coord-uv 0)
               (:nk-coord-pixel 1))

(cffi:defcstruct (%nk-renderer::font-config :size 88))

(cffi:defcstruct (%nk-renderer::font-config :size 88)
                 (%nk-renderer::next
                  (:pointer (:struct %nk-renderer::font-config))
                  :offset 0)
                 (%nk-renderer::ttf-blob (:pointer :void) :offset 8)
                 (%nk-renderer::ttf-size %nk-renderer::size :offset
                  16)
                 (%nk-renderer::ttf-data-owned-by-atlas
                  :unsigned-char :offset 24)
                 (%nk-renderer::merge-mode :unsigned-char :offset 25)
                 (%nk-renderer::pixel-snap :unsigned-char :offset 26)
                 (%nk-renderer::oversample-v :unsigned-char :offset
                  27)
                 (%nk-renderer::oversample-h :unsigned-char :offset
                  28)
                 (%nk-renderer::padding :unsigned-char :count 3
                  :offset 29)
                 (%nk-renderer::size :float :offset 32)
                 (%nk-renderer::coord-type
                  %nk-renderer::font-coord-type :offset 36)
                 (%nk-renderer::spacing (:struct %nk-renderer::vec2)
                  :offset 40)
                 (%nk-renderer::range (:pointer %nk-renderer::rune)
                  :offset 48)
                 (%nk-renderer::font
                  (:pointer (:struct %nk-renderer::baked-font))
                  :offset 56)
                 (%nk-renderer::fallback-glyph %nk-renderer::rune
                  :offset 64)
                 (%nk-renderer::n
                  (:pointer (:struct %nk-renderer::font-config))
                  :offset 72)
                 (%nk-renderer::p
                  (:pointer (:struct %nk-renderer::font-config))
                  :offset 80))

(cffi:defcstruct (%nk-renderer::font :size 128)
                 (%nk-renderer::next
                  (:pointer (:struct %nk-renderer::font)) :offset 0)
                 (%nk-renderer::handle
                  (:struct %nk-renderer::user-font) :offset 8)
                 (%nk-renderer::info
                  (:struct %nk-renderer::baked-font) :offset 48)
                 (%nk-renderer::scale :float :offset 80)
                 (%nk-renderer::glyphs
                  (:pointer (:struct %nk-renderer::font-glyph))
                  :offset 88)
                 (%nk-renderer::fallback
                  (:pointer (:struct %nk-renderer::font-glyph))
                  :offset 96)
                 (%nk-renderer::fallback-codepoint %nk-renderer::rune
                  :offset 104)
                 (%nk-renderer::texture %nk-renderer::handle :offset
                  112)
                 (%nk-renderer::config
                  (:pointer (:struct %nk-renderer::font-config))
                  :offset 120))

(declaim (inline %nk-renderer::bodge-renderer-font))

(cffi:defcfun ("nk_bodge_renderer_font"
               %nk-renderer::bodge-renderer-font)
              (:pointer (:struct %nk-renderer::font))
              (%nk-renderer::renderer
               (:pointer (:struct %nk-renderer::bodge-renderer))))

(eval-when (:load-toplevel :compile-toplevel :execute)
  (export '%nk-renderer::offset-y :%nk-renderer)
  (export '%nk-renderer::ranges :%nk-renderer)
  (export '%nk-renderer::min-row-height-padding :%nk-renderer)
  (export '%nk-renderer::show-buttons :%nk-renderer)
  (export '%nk-renderer::sym-maximize :%nk-renderer)
  (export '%nk-renderer::config-stack-vec2-element :%nk-renderer)
  (export '%nk-renderer::content-padding :%nk-renderer)
  (export '%nk-renderer::key :%nk-renderer)
  (export '%nk-renderer::ttf-blob :%nk-renderer)
  (export '%nk-renderer::line-aa :%nk-renderer)
  (export '%nk-renderer::background :%nk-renderer)
  (export '%nk-renderer::last :%nk-renderer)
  (export '%nk-renderer::address :%nk-renderer)
  (export '%nk-renderer::p :%nk-renderer)
  (export '%nk-renderer::parent :%nk-renderer)
  (export '%nk-renderer::inc-button :%nk-renderer)
  (export '%nk-renderer::popup-buffer :%nk-renderer)
  (export '%nk-renderer::border :%nk-renderer)
  (export '%nk-renderer::next :%nk-renderer)
  (export '%nk-renderer::keys :%nk-renderer)
  (export '%nk-renderer::query-font-glyph-f :%nk-renderer)
  (export '%nk-renderer::cmd-count :%nk-renderer)
  (export '%nk-renderer::style-window-header :%nk-renderer)
  (export '%nk-renderer::down :%nk-renderer)
  (export '%nk-renderer::draw-list :%nk-renderer)
  (export '%nk-renderer::checkbox :%nk-renderer)
  (export '%nk-renderer::cursor-at-end-of-line :%nk-renderer)
  (export '%nk-renderer::u1 :%nk-renderer)
  (export '%nk-renderer::button-behaviors :%nk-renderer)
  (export '%nk-renderer::pressed :%nk-renderer)
  (export '%nk-renderer::count :%nk-renderer)
  (export '%nk-renderer::descent :%nk-renderer)
  (export '%nk-renderer::u0 :%nk-renderer)
  (export '%nk-renderer::property :%nk-renderer)
  (export '%nk-renderer::text-width-f :%nk-renderer)
  (export '%nk-renderer::draw-null-texture :%nk-renderer)
  (export '%nk-renderer::input :%nk-renderer)
  (export '%nk-renderer::glyph-offset :%nk-renderer)
  (export '%nk-renderer::row-layout :%nk-renderer)
  (export '%nk-renderer::group-border-color :%nk-renderer)
  (export '%nk-renderer::grow-factor :%nk-renderer)
  (export '%nk-renderer::fallback-codepoint :%nk-renderer)
  (export '%nk-renderer::align :%nk-renderer)
  (export '%nk-renderer::ptr :%nk-renderer)
  (export '%nk-renderer::menu-state :%nk-renderer)
  (export '%nk-renderer::state :%nk-renderer)
  (export '%nk-renderer::sym-minimize :%nk-renderer)
  (export '%nk-renderer::padding1 :%nk-renderer)
  (export '%nk-renderer::row-padding :%nk-renderer)
  (export '%nk-renderer::popup-state :%nk-renderer)
  (export '%nk-renderer::mode :%nk-renderer)
  (export '%nk-renderer::header :%nk-renderer)
  (export '%nk-renderer::head :%nk-renderer)
  (export '%nk-renderer::delta-time-seconds :%nk-renderer)
  (export '%nk-renderer::tab-minimize-button :%nk-renderer)
  (export '%nk-renderer::label-hover :%nk-renderer)
  (export '%nk-renderer::n :%nk-renderer)
  (export '%nk-renderer::scrollbar :%nk-renderer)
  (export '%nk-renderer::buttons :%nk-renderer)
  (export '%nk-renderer::bar-hover :%nk-renderer)
  (export '%nk-renderer::tbl :%nk-renderer)
  (export '%nk-renderer::minimize-button :%nk-renderer)
  (export '%nk-renderer::panel-row-layout-type :%nk-renderer)
  (export '%nk-renderer::name :%nk-renderer)
  (export '%nk-renderer::r :%nk-renderer)
  (export '%nk-renderer::scroll :%nk-renderer)
  (export '%nk-renderer::con-old :%nk-renderer)
  (export '%nk-renderer::image-padding :%nk-renderer)
  (export '%nk-renderer::cmd-offset :%nk-renderer)
  (export '%nk-renderer::selected-text-hover :%nk-renderer)
  (export '%nk-renderer::redo-char-point :%nk-renderer)
  (export '%nk-renderer::colors :%nk-renderer)
  (export '%nk-renderer::free :%nk-renderer)
  (export '%nk-renderer::ttf-size :%nk-renderer)
  (export '%nk-renderer::bodge-render :%nk-renderer)
  (export '%nk-renderer::marker :%nk-renderer)
  (export '%nk-renderer::cursor-text-normal :%nk-renderer)
  (export '%nk-renderer::sym-right :%nk-renderer)
  (export '%nk-renderer::needed :%nk-renderer)
  (export '%nk-renderer::filled :%nk-renderer)
  (export '%nk-renderer::font-glyph :%nk-renderer)
  (export '%nk-renderer::popup :%nk-renderer)
  (export '%nk-renderer::contextual-button :%nk-renderer)
  (export '%nk-renderer::text-normal :%nk-renderer)
  (export '%nk-renderer::fallback :%nk-renderer)
  (export '%nk-renderer::page-count :%nk-renderer)
  (export '%nk-renderer::win :%nk-renderer)
  (export '%nk-renderer::x0 :%nk-renderer)
  (export '%nk-renderer::y :%nk-renderer)
  (export '%nk-renderer::config-stack-flags :%nk-renderer)
  (export '%nk-renderer::undo-char :%nk-renderer)
  (export '%nk-renderer::indent :%nk-renderer)
  (export '%nk-renderer::minimize-symbol :%nk-renderer)
  (export '%nk-renderer::menu :%nk-renderer)
  (export '%nk-renderer::preferred-x :%nk-renderer)
  (export '%nk-renderer::max :%nk-renderer)
  (export '%nk-renderer::attribute :%nk-renderer)
  (export '%nk-renderer::style-tab :%nk-renderer)
  (export '%nk-renderer::window :%nk-renderer)
  (export '%nk-renderer::text-undo-state :%nk-renderer)
  (export '%nk-renderer::ungrab :%nk-renderer)
  (export '%nk-renderer::con-count :%nk-renderer)
  (export '%nk-renderer::bodge-renderer-font :%nk-renderer)
  (export '%nk-renderer::bar-height :%nk-renderer)
  (export '%nk-renderer::current :%nk-renderer)
  (export '%nk-renderer::a :%nk-renderer)
  (export '%nk-renderer::maximize-symbol :%nk-renderer)
  (export '%nk-renderer::select-start :%nk-renderer)
  (export '%nk-renderer::layout :%nk-renderer)
  (export '%nk-renderer::format :%nk-renderer)
  (export '%nk-renderer::templates :%nk-renderer)
  (export '%nk-renderer::item-width :%nk-renderer)
  (export '%nk-renderer::config-stack-user-font :%nk-renderer)
  (export '%nk-renderer::base :%nk-renderer)
  (export '%nk-renderer::y1 :%nk-renderer)
  (export '%nk-renderer::values :%nk-renderer)
  (export '%nk-renderer::length :%nk-renderer)
  (export '%nk-renderer::prev :%nk-renderer)
  (export '%nk-renderer::xadvance :%nk-renderer)
  (export '%nk-renderer::pages :%nk-renderer)
  (export '%nk-renderer::node-minimize-button :%nk-renderer)
  (export '%nk-renderer::buffer-marker :%nk-renderer)
  (export '%nk-renderer::vertices :%nk-renderer)
  (export '%nk-renderer::delta :%nk-renderer)
  (export '%nk-renderer::capacity :%nk-renderer)
  (export '%nk-renderer::scale :%nk-renderer)
  (export '%nk-renderer::rune :%nk-renderer)
  (export '%nk-renderer::label-active :%nk-renderer)
  (export '%nk-renderer::info :%nk-renderer)
  (export '%nk-renderer::arc-segment-count :%nk-renderer)
  (export '%nk-renderer::page-data :%nk-renderer)
  (export '%nk-renderer::vectors :%nk-renderer)
  (export '%nk-renderer::padding :%nk-renderer)
  (export '%nk-renderer::cap :%nk-renderer)
  (export '%nk-renderer::user-font :%nk-renderer)
  (export '%nk-renderer::paste :%nk-renderer)
  (export '%nk-renderer::slot :%nk-renderer)
  (export '%nk-renderer::use-pool :%nk-renderer)
  (export '%nk-renderer::style-property :%nk-renderer)
  (export '%nk-renderer::min-height :%nk-renderer)
  (export '%nk-renderer::scrollbar-size :%nk-renderer)
  (export '%nk-renderer::oversample-h :%nk-renderer)
  (export '%nk-renderer::style-edit :%nk-renderer)
  (export '%nk-renderer::redo-point :%nk-renderer)
  (export '%nk-renderer::image :%nk-renderer)
  (export '%nk-renderer::normal-active :%nk-renderer)
  (export '%nk-renderer::tables :%nk-renderer)
  (export '%nk-renderer::label-padding :%nk-renderer)
  (export '%nk-renderer::uint :%nk-renderer)
  (export '%nk-renderer::config-stack-button-behavior-element
          :%nk-renderer)
  (export '%nk-renderer::button-behavior :%nk-renderer)
  (export '%nk-renderer::item-height :%nk-renderer)
  (export '%nk-renderer::border-cursor :%nk-renderer)
  (export '%nk-renderer::bar-filled :%nk-renderer)
  (export '%nk-renderer::text :%nk-renderer)
  (export '%nk-renderer::active :%nk-renderer)
  (export '%nk-renderer::cursor-visible :%nk-renderer)
  (export '%nk-renderer::single-line :%nk-renderer)
  (export '%nk-renderer::buf :%nk-renderer)
  (export '%nk-renderer::width :%nk-renderer)
  (export '%nk-renderer::cursor :%nk-renderer)
  (export '%nk-renderer::pressed-active :%nk-renderer)
  (export '%nk-renderer::anti-aliasing :%nk-renderer)
  (export '%nk-renderer::config-stack-float-element :%nk-renderer)
  (export '%nk-renderer::sym-active :%nk-renderer)
  (export '%nk-renderer::undo-char-point :%nk-renderer)
  (export '%nk-renderer::freelist :%nk-renderer)
  (export '%nk-renderer::row :%nk-renderer)
  (export '%nk-renderer::active-con :%nk-renderer)
  (export '%nk-renderer::text-active :%nk-renderer)
  (export '%nk-renderer::pan :%nk-renderer)
  (export '%nk-renderer::filter :%nk-renderer)
  (export '%nk-renderer::text-background :%nk-renderer)
  (export '%nk-renderer::initialized :%nk-renderer)
  (export '%nk-renderer::bar-normal :%nk-renderer)
  (export '%nk-renderer::style-item :%nk-renderer)
  (export '%nk-renderer::begin :%nk-renderer)
  (export '%nk-renderer::contextual-padding :%nk-renderer)
  (export '%nk-renderer::sym-left :%nk-renderer)
  (export '%nk-renderer::plugin-copy :%nk-renderer)
  (export '%nk-renderer::vertex-alignment :%nk-renderer)
  (export '%nk-renderer::style-scrollbar :%nk-renderer)
  (export '%nk-renderer::text-edit :%nk-renderer)
  (export '%nk-renderer::name-string :%nk-renderer)
  (export '%nk-renderer::selected-text-normal :%nk-renderer)
  (export '%nk-renderer::flags :%nk-renderer)
  (export '%nk-renderer::sel-end :%nk-renderer)
  (export '%nk-renderer::font :%nk-renderer)
  (export '%nk-renderer::plugin-paste :%nk-renderer)
  (export '%nk-renderer::combo-count :%nk-renderer)
  (export '%nk-renderer::allocator :%nk-renderer)
  (export '%nk-renderer::use-clipping :%nk-renderer)
  (export '%nk-renderer::header-height :%nk-renderer)
  (export '%nk-renderer::spacing :%nk-renderer)
  (export '%nk-renderer::bodge-renderer-destroy :%nk-renderer)
  (export '%nk-renderer::vec2 :%nk-renderer)
  (export '%nk-renderer::chart-type :%nk-renderer)
  (export '%nk-renderer::selected-color :%nk-renderer)
  (export '%nk-renderer::style-chart :%nk-renderer)
  (export '%nk-renderer::elements :%nk-renderer)
  (export '%nk-renderer::str :%nk-renderer)
  (export '%nk-renderer::offset :%nk-renderer)
  (export '%nk-renderer::popup-border :%nk-renderer)
  (export '%nk-renderer::select-end :%nk-renderer)
  (export '%nk-renderer::offset-x :%nk-renderer)
  (export '%nk-renderer::byte :%nk-renderer)
  (export '%nk-renderer::mouse-button :%nk-renderer)
  (export '%nk-renderer::popup-padding :%nk-renderer)
  (export '%nk-renderer::style-items :%nk-renderer)
  (export '%nk-renderer::text-normal-active :%nk-renderer)
  (export '%nk-renderer::rounding :%nk-renderer)
  (export '%nk-renderer::contextual-border-color :%nk-renderer)
  (export '%nk-renderer::bodge-renderer-create :%nk-renderer)
  (export '%nk-renderer::slider :%nk-renderer)
  (export '%nk-renderer::cursor-border-color :%nk-renderer)
  (export '%nk-renderer::style-text :%nk-renderer)
  (export '%nk-renderer::keyboard :%nk-renderer)
  (export '%nk-renderer::cursor-hover :%nk-renderer)
  (export '%nk-renderer::scrollh :%nk-renderer)
  (export '%nk-renderer::bar-active :%nk-renderer)
  (export '%nk-renderer::y0 :%nk-renderer)
  (export '%nk-renderer::vertex-layout :%nk-renderer)
  (export '%nk-renderer::close-symbol :%nk-renderer)
  (export '%nk-renderer::type :%nk-renderer)
  (export '%nk-renderer::scaler :%nk-renderer)
  (export '%nk-renderer::handle :%nk-renderer)
  (export '%nk-renderer::plugin-free :%nk-renderer)
  (export '%nk-renderer::node-maximize-button :%nk-renderer)
  (export '%nk-renderer::element-count :%nk-renderer)
  (export '%nk-renderer::index :%nk-renderer)
  (export '%nk-renderer::cursor-last :%nk-renderer)
  (export '%nk-renderer::cursor-rounding :%nk-renderer)
  (export '%nk-renderer::footer-height :%nk-renderer)
  (export '%nk-renderer::menu-border :%nk-renderer)
  (export '%nk-renderer::data :%nk-renderer)
  (export '%nk-renderer::mouse :%nk-renderer)
  (export '%nk-renderer::undo-rec :%nk-renderer)
  (export '%nk-renderer::plugin-alloc :%nk-renderer)
  (export '%nk-renderer::clip-rect :%nk-renderer)
  (export '%nk-renderer::panel :%nk-renderer)
  (export '%nk-renderer::ratio :%nk-renderer)
  (export '%nk-renderer::circle-vtx :%nk-renderer)
  (export '%nk-renderer::selected-hover :%nk-renderer)
  (export '%nk-renderer::highlight :%nk-renderer)
  (export '%nk-renderer::panel-type :%nk-renderer)
  (export '%nk-renderer::coord-type :%nk-renderer)
  (export '%nk-renderer::sym-hover :%nk-renderer)
  (export '%nk-renderer::allocation-type :%nk-renderer)
  (export '%nk-renderer::combo-padding :%nk-renderer)
  (export '%nk-renderer::baked-font :%nk-renderer)
  (export '%nk-renderer::id :%nk-renderer)
  (export '%nk-renderer::path-count :%nk-renderer)
  (export '%nk-renderer::text-undo-record :%nk-renderer)
  (export '%nk-renderer::codepoint :%nk-renderer)
  (export '%nk-renderer::cursor-size :%nk-renderer)
  (export '%nk-renderer::config :%nk-renderer)
  (export '%nk-renderer::tooltip-border-color :%nk-renderer)
  (export '%nk-renderer::style-window :%nk-renderer)
  (export '%nk-renderer::vertex-size :%nk-renderer)
  (export '%nk-renderer::ascent :%nk-renderer)
  (export '%nk-renderer::edit-state :%nk-renderer)
  (export '%nk-renderer::bodge-renderer :%nk-renderer)
  (export '%nk-renderer::merge-mode :%nk-renderer)
  (export '%nk-renderer::symbol-active :%nk-renderer)
  (export '%nk-renderer::config-stack-style-item :%nk-renderer)
  (export '%nk-renderer::has-preferred-x :%nk-renderer)
  (export '%nk-renderer::pixel-snap :%nk-renderer)
  (export '%nk-renderer::old :%nk-renderer)
  (export '%nk-renderer::w :%nk-renderer)
  (export '%nk-renderer::v1 :%nk-renderer)
  (export '%nk-renderer::symbol-normal :%nk-renderer)
  (export '%nk-renderer::floats :%nk-renderer)
  (export '%nk-renderer::item-offset :%nk-renderer)
  (export '%nk-renderer::symbol-type :%nk-renderer)
  (export '%nk-renderer::combo :%nk-renderer)
  (export '%nk-renderer::progress :%nk-renderer)
  (export '%nk-renderer::at-y :%nk-renderer)
  (export '%nk-renderer::rounding-cursor :%nk-renderer)
  (export '%nk-renderer::chart-slot :%nk-renderer)
  (export '%nk-renderer::edit :%nk-renderer)
  (export '%nk-renderer::style-button :%nk-renderer)
  (export '%nk-renderer::close-button :%nk-renderer)
  (export '%nk-renderer::sel-start :%nk-renderer)
  (export '%nk-renderer::ttf-data-owned-by-atlas :%nk-renderer)
  (export '%nk-renderer::text-hover :%nk-renderer)
  (export '%nk-renderer::draw-vertex-layout-format :%nk-renderer)
  (export '%nk-renderer::style-header-align :%nk-renderer)
  (export '%nk-renderer::texture :%nk-renderer)
  (export '%nk-renderer::touch-padding :%nk-renderer)
  (export '%nk-renderer::x :%nk-renderer)
  (export '%nk-renderer::img :%nk-renderer)
  (export '%nk-renderer::hash :%nk-renderer)
  (export '%nk-renderer::min-size :%nk-renderer)
  (export '%nk-renderer::combo-border-color :%nk-renderer)
  (export '%nk-renderer::text-pressed :%nk-renderer)
  (export '%nk-renderer::plugin-filter :%nk-renderer)
  (export '%nk-renderer::pool :%nk-renderer)
  (export '%nk-renderer::at-x :%nk-renderer)
  (export '%nk-renderer::text-hover-active :%nk-renderer)
  (export '%nk-renderer::build :%nk-renderer)
  (export '%nk-renderer::inc-symbol :%nk-renderer)
  (export '%nk-renderer::table :%nk-renderer)
  (export '%nk-renderer::bounds :%nk-renderer)
  (export '%nk-renderer::selected-normal :%nk-renderer)
  (export '%nk-renderer::tooltip-padding :%nk-renderer)
  (export '%nk-renderer::style-progress :%nk-renderer)
  (export '%nk-renderer::item :%nk-renderer)
  (export '%nk-renderer::overlay :%nk-renderer)
  (export '%nk-renderer::fonts :%nk-renderer)
  (export '%nk-renderer::text-alignment :%nk-renderer)
  (export '%nk-renderer::scrolled :%nk-renderer)
  (export '%nk-renderer::glyph-count :%nk-renderer)
  (export '%nk-renderer::region :%nk-renderer)
  (export '%nk-renderer::buffer :%nk-renderer)
  (export '%nk-renderer::shape-aa :%nk-renderer)
  (export '%nk-renderer::menu-border-color :%nk-renderer)
  (export '%nk-renderer::config-stack-color :%nk-renderer)
  (export '%nk-renderer::insert-length :%nk-renderer)
  (export '%nk-renderer::last-widget-state :%nk-renderer)
  (export '%nk-renderer::cursor-border :%nk-renderer)
  (export '%nk-renderer::tab-maximize-button :%nk-renderer)
  (export '%nk-renderer::style-item-data :%nk-renderer)
  (export '%nk-renderer::style-combo :%nk-renderer)
  (export '%nk-renderer::config-stack-float :%nk-renderer)
  (export '%nk-renderer::style-slider :%nk-renderer)
  (export '%nk-renderer::button :%nk-renderer)
  (export '%nk-renderer::cursors :%nk-renderer)
  (export '%nk-renderer::min :%nk-renderer)
  (export '%nk-renderer::null :%nk-renderer)
  (export '%nk-renderer::max-x :%nk-renderer)
  (export '%nk-renderer::text-pressed-active :%nk-renderer)
  (export '%nk-renderer::command-buffer :%nk-renderer)
  (export '%nk-renderer::undo-point :%nk-renderer)
  (export '%nk-renderer::convert-config :%nk-renderer)
  (export '%nk-renderer::cursor-active :%nk-renderer)
  (export '%nk-renderer::pos :%nk-renderer)
  (export '%nk-renderer::group-padding :%nk-renderer)
  (export '%nk-renderer::style :%nk-renderer)
  (export '%nk-renderer::b :%nk-renderer)
  (export '%nk-renderer::cursor-text-hover :%nk-renderer)
  (export '%nk-renderer::menu-padding :%nk-renderer)
  (export '%nk-renderer::config-stack-color-element :%nk-renderer)
  (export '%nk-renderer::global-alpha :%nk-renderer)
  (export '%nk-renderer::tab :%nk-renderer)
  (export '%nk-renderer::clicked-pos :%nk-renderer)
  (export '%nk-renderer::clicked :%nk-renderer)
  (export '%nk-renderer::h :%nk-renderer)
  (export '%nk-renderer::tree-depth :%nk-renderer)
  (export '%nk-renderer::cursor-normal :%nk-renderer)
  (export '%nk-renderer::delete-length :%nk-renderer)
  (export '%nk-renderer::columns :%nk-renderer)
  (export '%nk-renderer::undo :%nk-renderer)
  (export '%nk-renderer::page-element :%nk-renderer)
  (export '%nk-renderer::v0 :%nk-renderer)
  (export '%nk-renderer::style-item-type :%nk-renderer)
  (export '%nk-renderer::alloc :%nk-renderer)
  (export '%nk-renderer::draw-begin :%nk-renderer)
  (export '%nk-renderer::scrollv :%nk-renderer)
  (export '%nk-renderer::configuration-stacks :%nk-renderer)
  (export '%nk-renderer::string :%nk-renderer)
  (export '%nk-renderer::label-normal :%nk-renderer)
  (export '%nk-renderer::path-offset :%nk-renderer)
  (export '%nk-renderer::hover :%nk-renderer)
  (export '%nk-renderer::scroll-delta :%nk-renderer)
  (export '%nk-renderer::query :%nk-renderer)
  (export '%nk-renderer::config-stack-style-item-element
          :%nk-renderer)
  (export '%nk-renderer::config-stack-flags-element :%nk-renderer)
  (export '%nk-renderer::font-config :%nk-renderer)
  (export '%nk-renderer::seq :%nk-renderer)
  (export '%nk-renderer::char-storage :%nk-renderer)
  (export '%nk-renderer::context :%nk-renderer)
  (export '%nk-renderer::rect :%nk-renderer)
  (export '%nk-renderer::draw-vertex-layout-attribute :%nk-renderer)
  (export '%nk-renderer::table-count :%nk-renderer)
  (export '%nk-renderer::option :%nk-renderer)
  (export '%nk-renderer::hover-active :%nk-renderer)
  (export '%nk-renderer::normal :%nk-renderer)
  (export '%nk-renderer::height :%nk-renderer)
  (export '%nk-renderer::popup-border-color :%nk-renderer)
  (export '%nk-renderer::draw-vertex-layout-element :%nk-renderer)
  (export '%nk-renderer::color :%nk-renderer)
  (export '%nk-renderer::symbol-hover :%nk-renderer)
  (export '%nk-renderer::uv :%nk-renderer)
  (export '%nk-renderer::group-border :%nk-renderer)
  (export '%nk-renderer::button-padding :%nk-renderer)
  (export '%nk-renderer::userdata :%nk-renderer)
  (export '%nk-renderer::fallback-glyph :%nk-renderer)
  (export '%nk-renderer::border-color :%nk-renderer)
  (export '%nk-renderer::slots :%nk-renderer)
  (export '%nk-renderer::circle-segment-count :%nk-renderer)
  (export '%nk-renderer::text-len :%nk-renderer)
  (export '%nk-renderer::where :%nk-renderer)
  (export '%nk-renderer::grab :%nk-renderer)
  (export '%nk-renderer::allocated :%nk-renderer)
  (export '%nk-renderer::range :%nk-renderer)
  (export '%nk-renderer::size :%nk-renderer)
  (export '%nk-renderer::glyphs :%nk-renderer)
  (export '%nk-renderer::menu-button :%nk-renderer)
  (export '%nk-renderer::copy :%nk-renderer)
  (export '%nk-renderer::font-coord-type :%nk-renderer)
  (export '%nk-renderer::dec-symbol :%nk-renderer)
  (export '%nk-renderer::tooltip-border :%nk-renderer)
  (export '%nk-renderer::old-value :%nk-renderer)
  (export '%nk-renderer::selectable :%nk-renderer)
  (export '%nk-renderer::has-scrolling :%nk-renderer)
  (export '%nk-renderer::clipboard :%nk-renderer)
  (export '%nk-renderer::vertex-count :%nk-renderer)
  (export '%nk-renderer::fixed-background :%nk-renderer)
  (export '%nk-renderer::memory :%nk-renderer)
  (export '%nk-renderer::len :%nk-renderer)
  (export '%nk-renderer::combo-border :%nk-renderer)
  (export '%nk-renderer::stacks :%nk-renderer)
  (export '%nk-renderer::|C:@UA@NK-HANDLE| :%nk-renderer)
  (export '%nk-renderer::config-stack-button-behavior :%nk-renderer)
  (export '%nk-renderer::style-selectable :%nk-renderer)
  (export '%nk-renderer::clip :%nk-renderer)
  (export '%nk-renderer::curve-segment-count :%nk-renderer)
  (export '%nk-renderer::page :%nk-renderer)
  (export '%nk-renderer::chart :%nk-renderer)
  (export '%nk-renderer::x1 :%nk-renderer)
  (export '%nk-renderer::property-state :%nk-renderer)
  (export '%nk-renderer::style-toggle :%nk-renderer)
  (export '%nk-renderer::g :%nk-renderer)
  (export '%nk-renderer::scrollbar-hiding-timer :%nk-renderer)
  (export '%nk-renderer::config-stack-vec2 :%nk-renderer)
  (export '%nk-renderer::calls :%nk-renderer)
  (export '%nk-renderer::oversample-v :%nk-renderer)
  (export '%nk-renderer::grabbed :%nk-renderer)
  (export '%nk-renderer::contextual-border :%nk-renderer)
  (export '%nk-renderer::sym-normal :%nk-renderer)
  (export '%nk-renderer::end :%nk-renderer)
  (export '%nk-renderer::dec-button :%nk-renderer)
  (export '%nk-renderer::config-stack-user-font-element
          :%nk-renderer)
  (export '%nk-renderer::draw-end :%nk-renderer))

