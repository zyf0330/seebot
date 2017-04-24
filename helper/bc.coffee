module.exports =
	channels:
		allPeople: '=bwACN'
		test: '=bwH94'
	envelope: (userId, channelId) ->
		o = user:
					id: userId
					message:
						subtype: 'normal'
						type: null
		message = o.user.message
		if channelId?
			message.channel_id  =  channelId
			message.type = 'channel_message'
		else
			message.uid  = userId
			message.type = 'message'
		return o
	notifyChannel: (text) ->
		'@<-channel-> ' + text
