(require 'shimbun)
(require 'sb-rss)
;; TODO manage news with flash content (sports)
;; TODO clean article with tags:
;;                               <div class="sidebar-cont">
;;                               <div class="correlati">

(luna-define-class shimbun-larepubblica (shimbun-rss) ())

;; http://www.repubblica.it/static/servizi/rss/index.html
(defvar shimbun-larepubblica-url "http://www.repubblica.it/rss")
(defvar shimbun-larepubblica-from-address "pubblicawww@repubblica.it")
(defvar shimbun-larepubblica-content-start
  (regexp-opt '("<h3 itemprop=\"description\">"
		"<p class=\"summary\">"
		"<h3>")))

(defvar shimbun-larepubblica-content-end
  (regexp-opt '("<aside class=\"tags\">"
		"<p class=\"disclaimer clearfix\">")))
(defvar shimbun-larepubblica-path-alist
  '(("homepage" . "/homepage/rss2.0.xml")
    ("cronaca" . "/cronaca/rss2.0.xml")
    ("politica" . "/politica/rss2.0.xml")
    ("tecnologia" . "/tecnologia/rss2.0.xml")
    ("ambiente" . "/ambiente/rss2.0.xml")
    ("esteri" . "/esteri/rss2.0.xml")
    ("calcio" . "/sport/calcio/rss2.0.xml")
    ("sport" . "/sport/rss2.0.xml")
    ("motori" . "/motori/rss2.0.xml")
    ("scienze" . "/scienze/rss2.0.xml")
    ("spettacolicultura" . "/spettacoli_e_cultura/rss2.0.xml")
    ("scuolauniversita" . "/scuola_e_universita/rss2.0.xml")
    ("mondosolidale" . "/solidarieta/rss2.0.xml")
    ("economiafinanza" . "/economia/rss2.0.xml")))

(defvar shimbun-larepubblica-groups (mapcar 'car shimbun-larepubblica-path-alist))

(luna-define-method shimbun-index-url ((shimbun shimbun-larepubblica))
  (concat shimbun-larepubblica-url
	  (cdr (assoc (shimbun-current-group-internal shimbun)
		      shimbun-larepubblica-path-alist))))

(provide 'sb-larepubblica)

;;; sb-larepubblica.el ends here
