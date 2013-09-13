(require 'shimbun)
(require 'sb-rss)

;; TODO remove twitter and size (+a -a) tags
(luna-define-class shimbun-lequipe (shimbun-rss) ())

(defvar shimbun-lequipe-url "http://www.lequipe.fr/rss")
(defvar shimbun-lequipe-from-address "webmaster@lequipe.fr")

(defvar shimbun-lequipe-content-start
  (regexp-opt '("<div class=\"chapeau\">"
		"<div class=\"clear\">")))

(defvar shimbun-lequipe-content-end
  (regexp-opt '("<b class=\"edito_auteur\">"
		"<div id=\"bloc_bas_breve\">"
		"<div id=\"ensavoirplus\">")))

(defvar shimbun-lequipe-path-alist
  '(("alaune" . "/actu_rss.xml")
    ("football" . "/actu_rss_Football.xml")
    ("automoto" . "/actu_rss_Auto-Moto.xml")
    ("tennis" . "/actu_rss_Tennis.xml")
    ("golf" . "/actu_rss_Golf.xml")
    ("rugby" . "/actu_rss_Rugby.xml")
    ("basket" . "/actu_rss_Basket.xml")
    ("hand" . "/actu_rss_Hand.xml")
    ("cyclisme" . "/actu_rss_Cyclisme.xml")
    ("judo" . "/actu_rss_Judo.xml")
    ("sky" . "/actu_rss_Ski.xml")
    ("athletisme" . "/actu_rss_Athletisme.xml")
    ("voile" . "/actu_rss_Voile.xml")
    ("natation" . "/actu_rss_Natation.xml")
    ("escrime" . "/actu_rss_Escrime.xml")
    ("volley" . "/actu_rss_Volley.xml")))

(defvar shimbun-lequipe-groups (mapcar 'car shimbun-lequipe-path-alist))

(luna-define-method shimbun-index-url ((shimbun shimbun-lequipe))
  (concat shimbun-lequipe-url
	  (cdr (assoc (shimbun-current-group-internal shimbun)
		      shimbun-lequipe-path-alist))))

(provide 'sb-lequipe)

;;; sb-lequipe.el ends here
