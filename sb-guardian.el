(require 'shimbun)
(require 'sb-rss)
;; TODO add more categories & check some empty news
(luna-define-class shimbun-guardian (shimbun-rss) ())
(defvar shimbun-guardian-url "http://feeds.theguardian.com/theguardian")
(defvar shimbun-guardian-from-address "userhelp@theguardian.com")
(defvar shimbun-guardian-content-start
  (regexp-opt '("<div id=\"live-blog-new-updates-wrapper\">" ;; blog content
		"<div class=\"flexible-content-body\">";; twitter content
		"<div class=\"video-metadata\">" ;; video
		"<div class=\"gallery-header\">" ;; galleries
		"<div class=\"main-picture \">" ;; comic strips
		"<div id=\"article-body-blocks\">"))) ;; article content

(defvar shimbun-guardian-content-end
  (regexp-opt '("<ul id=\"blog-nav-bottom\" class=\"blog-navigation\">" ;; live updates
		"<div class=\"email-subscription-promo b4 uk\">" ;; articles with subscription offers
		"<ul class=\"share-links col-8 b3 trackable-component\"         	        data-component=\"Video:bottom share tools\">" ;; video
		"<div class='col-4 keyline'>" ;; video just in case other option cuts blank spaces
		"<ul id=\"content-actions\" class=\"share-links trackable-component\"         	        data-component=\"Gallery:top share tools\">" ;; galleries
		"<div class=\"two-col gallery-related\">" ;; galleries just in case  other option cuts blank spaces
		"<div id=\"related\">" ;; articles
		"<div class=\"gallery-navigation\">" ;; comic strips
		"<script type=\"text/javascript\">"))) ;; blogs

(defvar shimbun-guardian-path-alist
  '(("headlines" . "/uk/rss")
    ("uk" . "/uk-news/rss")
    ("world" . "/world/rss")
    ("sport" . "/sport/rss")
    ("culture" . "/culture/rss")
    ("business" . "/business/rss")
    ("commentisfree" . "/commentisfree/rss")
    ("lifeandstyle" . "/lifeandstyle/rss")
    ("travel" . "/travel/rss")
    ("tech". "/technology/rss")
    ("society" . "/society/rss")))

(defvar shimbun-guardian-groups (mapcar 'car shimbun-guardian-path-alist))

(luna-define-method shimbun-index-url ((shimbun shimbun-guardian))
  (concat shimbun-guardian-url
	  (cdr (assoc (shimbun-current-group-internal shimbun)
		      shimbun-guardian-path-alist))))

(provide 'sb-guardian)
