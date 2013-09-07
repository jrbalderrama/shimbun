(require 'shimbun)
(require 'sb-rss)
;; TODO clean article with tags:
;;                               <div class="RS_SKIP">
;;                               <div class="polymedia box_ArticlePlayer">

(luna-define-class shimbun-gazzetta (shimbun-rss) ())
;; http://www.gazzetta.it/rss/
(defvar shimbun-gazzetta-url "http://www.gazzetta.it/rss")
(defvar shimbun-gazzetta-from-address "web@gazzetta.it")
(defvar shimbun-gazzetta-content-start
  (regexp-opt '("<h3>")))

(defvar shimbun-gazzetta-content-end
  (regexp-opt '("<cite class=\"signature\">")))

(defvar shimbun-gazzetta-path-alist
  '(("ultimora" . "/Ultimora.xml")
    ("tuttelenotizie" . "/Home.xml")
    ("calcio" . "/Calcio.xml")
    ("formula1" . "/Formula1.xml")
    ("motomondiale" . "/Motomondiale.xml")
    ("motori" . "/Motori.xml")
    ("ciclismo" . "/Ciclismo.xml")
    ("basket" . "/Basket.xml")
    ("tennis" . "/Tennis.xml")
    ("pallavolo" . "/Pallavolo.xml")
    ("vela" . "/Vela.xml")
    ("atletica" . "/Atletica.xml")
    ("altrisport" . "/Sport_Vari.xml")))

(defvar shimbun-gazzetta-groups (mapcar 'car shimbun-gazzetta-path-alist))

(luna-define-method shimbun-index-url ((shimbun shimbun-gazzetta))
  (concat shimbun-gazzetta-url
	  (cdr (assoc (shimbun-current-group-internal shimbun)
		      shimbun-gazzetta-path-alist))))

(provide 'sb-gazzetta)

;;; sb-gazzetta.el ends here
