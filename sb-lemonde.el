(require 'shimbun)
(require 'sb-rss)

(luna-define-class shimbun-lemonde (shimbun-rss) ())
;; TODO support 'video' pages
(defvar shimbun-lemonde-url "http://www.lemonde.fr/rss/")
(defvar shimbun-lemonde-from-address "web@lemonde.fr")
(defvar shimbun-lemonde-content-start
  (regexp-opt '("<div id=\"articleBody\" class=\"txt15_140\" itemprop=\"articleBody\">" ;; article
		"<div class=\"entry-content\">" ;; blog
		"<div class=\"legende lien_souligne\">" ;; images
		)))

(defvar shimbun-lemonde-content-end
  (regexp-opt '("</article>" ;; article
		"<div class=\"wp-socializer 16px\">" ;; blog
		"<span class=\"toolbar\">" ;; images
		)))

(defvar shimbun-lemonde-path-alist
  '(("alaune" . "/une.xml")
    ("international" . "/tag/international.xml")
    ("politique" . "/tag/politique.xml")
    ("societe" . "/tag/societe.xml")
    ("economie" . "/tag/economie.xml")
    ("culture" . "/tag/culture.xml")
    ("idees" . "/tag/idees.xml")
    ("planete" . "/tag/planete.xml")
    ("sport" . "/tag/sport.xml")
    ("sciences" . "/tag/sciences.xml")
    ("technologies" . "/tag/technologies.xml")
    ("style" . "/tag/style.xml")
    ("vous" . "/tag/vous.xml")
    ("education" . "/tag/education.xml")
    ("sante" . "/tag/sante.xml")
    ("argent" . "/tag/argent.xml")
    ("emploi" . "/tag/emploi.xml")
    ("academie" . "/tag/monde-academie.xml")
    ("finance" . "/tag/finance.xml")
    ("livres" . "/tag/livres.xml")
    ("media" . "/tag/actualite-medias.xml")
    ("mode" . "/tag/mode.xml")
    ("lemagazine" . "/tag/le-magazine.xml")
    ("afrique" . "/tag/afrique.xml")
    ("ameriques" . "/tag/ameriques.xml")
    ("asiepacifique" . "/tag/asie-pacifique.xml")
    ("europe" . "/tag/europe.xml")
    ("procheorient" . "/tag/proche-orient.xml")))

(defvar shimbun-lemonde-groups (mapcar 'car shimbun-lemonde-path-alist))

(luna-define-method shimbun-index-url ((shimbun shimbun-lemonde))
  (concat shimbun-lemonde-url
	  (cdr (assoc (shimbun-current-group-internal shimbun)
		      shimbun-lemonde-path-alist))))

(provide 'sb-lemonde)

;;; sb-lemonde.el ends here
