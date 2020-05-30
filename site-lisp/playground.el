;; this is an example of sending ls to a terminal
(save-window-excursion
  (switch-to-buffer "*terminal<1>*")
  (term-send-raw-string "q")
  (term-send-string (current-buffer) "ls")
  (term-send-return)
  )
