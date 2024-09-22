(defun zettel-compose-generate-output ()
  "Run zettel-compose.py to generate output with specific options based on the current buffer."
  (interactive)
  (let* ((options (list :index-file (buffer-file-name)
                        :custom-url "x-phi://"
                        :parallel-texts-selection "r"
                        :suppress-index t
                        :watch t
                        :no-title t
                        :stream-to-marked nil
                        :no-commented-references t
                        :output (expand-file-name "~/Downloads/OUTPUT.md"))))
    (zettel-compose-run options)
    (message "Generated output for %s" (buffer-file-name))))

(defun zettel-compose-generate-handout ()
  "Generate a handout using zettel-compose.py based on the current buffer."
  (interactive)
  (let* ((output-file (expand-file-name (concat "Handout " (buffer-name)) "~/Downloads"))
         (options (list :index-file (buffer-file-name)
                        :output output-file
                        :no-title t
                        :no-separator t
                        :watch t
                        :handout-mode t
                        :handout-with-sections t
                        :parallel-texts-processor t)))
    (zettel-compose-run options)
    (message "Generating handout for %s" (buffer-file-name))))

(defun zettel-compose-stream-handout ()
  "Stream a handout to Marked based on the current buffer."
  (interactive)
  (let* ((options (list :index-file (buffer-file-name)
                        :no-title t
                        :custom-url "x-phi://"
                        :watch t
                        :stream-to-marked t
                        :handout-mode t
                        :handout-with-sections t)))
    (zettel-compose-run options)
    (message "Streaming handout for %s" (buffer-file-name))))

(defun zettel-compose-browse ()
  "Run zettel-compose.py with browsing options based on the current buffer."
  (interactive)
  (let* ((options (list :index-file (buffer-file-name)
                        :watch t
                        :link-all t
                        :stream-to-marked t
                        :custom-url "x-phi://"
                        :section-symbol "")))
    (zettel-compose-run options)
    (message "Browsing content of %s" (buffer-file-name))))

(spacemacs/declare-prefix "a Z" "zettel-compose")

(spacemacs/set-leader-keys
  "a Z Z" 'zettel-compose-run
  "a Z o" 'zettel-compose-generate-output
  "a Z S" 'zettel-compose-stop-all-processes
  "a Z h" 'zettel-compose-generate-handout
  "a Z H" 'zettel-compose-stream-handout
  "a Z b" 'zettel-compose-browse)
