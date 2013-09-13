;; -*-mode: Emacs-Lisp; auto-recompile:t -*-
(require 'shimbun)
(require 'sb-rss)
;; TODO remove tags and other related articles from contents
(luna-define-class shimbun-eldeber (shimbun-rss) ())

(defvar shimbun-eldeber-url "http://www.eldeber.com.bo/rss")
(defvar shimbun-eldeber-from-address "web@eldeber.com.bo")
(defvar shimbun-eldeber-content-start "<span class=\"Estilo30 Estilo54\">")
(defvar shimbun-eldeber-content-end "<!-- Inserta esta etiqueta donde quieras que aparezca insignia. -->")

(defvar shimbun-eldeber-path-alist
  '(("ultimas" . "/ultimas-noticias.php")
    ("santacruz" . "/santacruz.php")
    ("nacional" . "/nacional.php")
    ("internacional" . "/internacional.php")
    ("economia" . "/economia.php")
    ("deportes" . "/deportes.php")
    ("sociales" . "/sociales.php")
    ("escenas" . "/escenas.php")
    ("sumario" . "/sumario.php")))

(defvar shimbun-eldeber-groups (mapcar 'car shimbun-eldeber-path-alist))

(luna-define-method shimbun-index-url ((shimbun shimbun-eldeber))
  (concat shimbun-eldeber-url
	  (cdr (assoc (shimbun-current-group-internal shimbun)
		      shimbun-eldeber-path-alist))))

(provide 'sb-eldeber)

;;; sb-eldeber.el ends here
