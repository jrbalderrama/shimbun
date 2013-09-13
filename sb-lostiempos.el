(require 'shimbun)
(require 'sb-rss)

(luna-define-class shimbun-lostiempos (shimbun-rss) ())

;; www.lostiempos.com/rss/
(defvar shimbun-lostiempos-url "http://www.lostiempos.com/rss")
(defvar shimbun-lostiempos-from-address "lostiempos@lostiempos-bolivia.com")
;; (defvar shimbun-lostiempos-expiration-days 7)
(defvar shimbun-lostiempos-content-start "<!-- fin pub -->")
(defvar shimbun-lostiempos-content-end "<!-- fin articulo_contenido -->")

(defvar shimbun-lostiempos-path-alist
  '(("ultimas" . "/lostiempos-ultimas.xml")
    ("titulares" . "/lostiempos-titulares.xml")
    ("nacional" . "/lostiempos-nacional.xml")
    ("local" . "/lostiempos-local.xml")
    ("internacional" . "/lostiempos-internacional.xml")
    ("deportes" . "/lostiempos-deportes.xml")
    ("economia" . "/lostiempos-economia.xml")
    ("politica" . "/lostiempos-politica.xml")
    ("opiniones" . "/lostiempos-opiniones.xml")
    ("tragaluz" . "/lostiempos-tragaluz.xml")
    ("vidayfuturo" . "/lostiempos-vida-y-futuro.xml")
    ("oh" . "/oh-actualidad.xml")
    ("click" . "/click-masleidas.xml")
    ("lecturas" . "/lecturas-masleidas.xml")
    ("buenprovecho" . "/buen-provecho-masleidas.xml")
    ("mdemujer" . "/m_de_mujer-masleidas.xml")
    ("hdehombre" . "/h-de-hombre-masleidas.xml")
    ("cine" . "/lecturas-cine-masleidas.xml")))

(defvar shimbun-lostiempos-groups (mapcar 'car shimbun-lostiempos-path-alist))

(luna-define-method shimbun-index-url ((shimbun shimbun-lostiempos))
  (concat shimbun-lostiempos-url
	  (cdr (assoc (shimbun-current-group-internal shimbun)
		      shimbun-lostiempos-path-alist))))

(provide 'sb-lostiempos)

;;; sb-lostiempos.el ends here
