### Pinterest object ###
Socialmedia.Pinterest = ->
	this.init()

### Pinterest init method ###
Socialmedia.Pinterest.prototype.init = ->
	_this = this
	((doc, tag, id) ->
		return if doc.getElementById id
		sdk = doc.createElement tag
		sdk.id = id
		sdk.async = true
		sdk.src = Socialmedia.SDK.pinterest
		ref = doc.getElementsByTagName(tag)[0]
		ref.parentNode.insertBefore sdk, ref
		_this.pinsdk = doc.querySelector '#' + id
		return
	)(document, 'script', 'pinterest-jssdk')

### Pinterest share method ###
Socialmedia.Pinterest.prototype.Pinit = (options) ->
	platformUrl = '//pinterest.com/pin/create/button/?'
	data = options? and options.link? and "url=#{encodeURIComponent options.link }" or "url=#{encodeURIComponent window.location.href}"
	data += options? and options.image? and "media=#{encodeURIComponent options.image }" or ""
	data += options? and options.description? and "description=#{encodeURIComponent options.description }" or "description=#{encodeURIComponent document.title}"
	Socialmedia.Popup.apply this, [platformUrl + data, 
		width: 765 
		height: 325
	]