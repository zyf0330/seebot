# Description:
#	 Example scripts for you to examine and try out.
#
# Notes:
#	 They are commented out by default, because most of them are pretty silly and
#	 wouldn't be useful and amusing enough for day to day huboting.
#	 Uncomment the ones you want to try and experiment with.
#
#	 These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

child_process = require 'child_process'

module.exports = (robot) ->

	enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
	leaveReplies = ['Someone leaves']
	robot.enter (res) ->
		res.reply res.random enterReplies
	robot.leave (res) ->
		res.send res.random leaveReplies

	cmds = ['hi', 'whousenet']
	robot.respond /(cmds|.*(你(能|会)(做|干)什么|what can you do).*)/, (res) ->
		res.send cmds.join(', ')

	robot.respond /hi/, (res) ->
		res.reply 'Hi too!'

	robot.respond /whousenet/, (res) ->
		res.send '获取中。。。不要重复执行'
		child_process.exec '/home/zyf/whousenet.sh', (err, stdout, stderr) ->
			if err
				return res.send '获取失败', stdout, stderr
			res.send stdout



	robot.respond ///#{robot.name}///, (res) ->
		res.reply '没事叫我干什么'
