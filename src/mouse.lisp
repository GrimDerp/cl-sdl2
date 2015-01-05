(in-package #:sdl2)


(defmacro warp-mouse-in-window (win x y)
  "Use this function to move the mouse to the given position within the window."
  `(sdl-warp-mouse-in-window ,win ,x ,y))

(defun hide-cursor ()
  (sdl-true-p (check-rc (sdl-show-cursor sdl2-ffi:+sdl-disable+))))

(defun show-cursor ()
  (sdl-true-p (check-rc (sdl-show-cursor sdl2-ffi:+sdl-enable+))))

(defun set-relative-mouse-mode (enabled)
  (check-rc (sdl-set-relative-mouse-mode enabled)))

(defun relative-mouse-mode-p ()
  (sdl-true-p (sdl-get-relative-mouse-mode)))

(defun toggle-relative-mouse-mode ()
  (set-relative-mouse-mode (not (relative-mouse-mode-p))))

(defun mouse-state ()
  (c-with ((x :int) (y :int))
    (let ((buttons (sdl2-ffi.functions:sdl-get-mouse-state (x &) (y &))))
      (values x y buttons))))

(defun mouse-state-p (button)
  (let ((buttons (sdl2-ffi.functions:sdl-get-mouse-state nil nil))
        (mask (ash 1 (1- button))))
    (plusp (logand buttons mask))))

