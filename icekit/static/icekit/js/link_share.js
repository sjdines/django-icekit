$(document).ready(function() {
	var shareButtons = $('.js-share');
	var buttonClass = {
		active: 'share-button--active',
		generate: 'share-button--generate'
	};
	shareButtons.data('copied', false);

	var copyTextToClipboard = function(button) {
		var inputField = button.find('input');

		// Get full URL from data and replace truncated URL
		inputField.val(inputField.data('full-url'));

		// `select()` is doesn't work for iOS, but that's okay because it
		// makes the experience bad anyway and we rely on this failing later
		// on to detect situations where we need different tooltip copy.
		inputField.select();

		try {
			var _successful = document.execCommand('copy');
			if (_successful) {
				button.addClass(buttonClass.active);
				button.data('copied', true);
			} else {
				// Set and show tooltip hint to copy selected link from INPUT
				if (inputField[0].selectionStart == inputField[0].selectionEnd) {
					// The `select()` call above failed, we are probably on
					// a mobile browser that doesn't support that operation.
					inputField.attr('title', 'Select and Copy Link');
				} else {
					inputField.attr('title', 'Press Command + C To Copy');
				}
				// Trigger title tooltip to display immediately
				inputField.tooltip().mouseover();
				// Forcibly un-trigger title tooltip when the input field loses
				// focus, so the tooltip will go away on iOS.
				inputField.focusout(function() {
					inputField.tooltip().mouseout();
				});
			}
		} catch (err) {
			console.error('Oops, unable to copy');
		}
	}

	function prepareShareButtons(url) {
		var _username = window.ICEKIT_SHARE_USERNAME;
		var _key = window.ICEKIT_SHARE_KEY;
		if (!_username || !_key) {
			return;
		}
		$.ajax({
			url: "https://api-ssl.bit.ly/v3/shorten",
			data: {
				'longUrl': url,
				'apiKey': _key,
				'login': _username
			},
			dataType: 'JSON',
			success: function (data) {
				if (data.status_code !== 200) {
					// No short link available for some reason, fall back
					// to original URL (full link) instead
					var _shortUrl = url;
				} else {
					var _shortUrl = data.data.url;
				}
				var _shorterUrl = _shortUrl.replace(/http[s]*:\/\//, '');
				// Set truncated URL in INPUT field but set full URL in data
				shareButtons.find('input').val(_shorterUrl).data('full-url', _shortUrl);
				shareButtons.addClass(buttonClass.generate);
			}
		});
	}

	prepareShareButtons(window.location.href);

	shareButtons.on('click', function () {
		var button = $(this);
		if (button.data('copied')) {
			button.removeClass(buttonClass.active);
			button.data('copied', false);
		} else {
			copyTextToClipboard(button);
		}
	});
});
