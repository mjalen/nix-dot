;; A simple outlet for me to express my inner FRUSTRATIONS in the form of functions :)

(defun disp ()
  (interactive)
  (shell-command "disp"))

(defun disp-end ()
  (interactive)
  (shell-command "disp-end"))

(defun scrot ()
  (interactive)
  (shell-command "scrot -s"))
