# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

child_process = require 'child_process'

module.exports = (robot) ->
	robot.hear ///^#{robot.name}$///, (res) ->
		res.reply '叫我干什么'

	enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
	leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
	robot.enter (res) ->
    res.send res.random enterReplies
  robot.leave (res) ->
    res.send res.random leaveReplies

	cmds = ['hi', 'whousenet']
	robot.respond /(cmds|.*(你(能|会)(做|干)什么|what can you do).*)/, (res) ->
		res.send cmds.join(', ')

	robot.respond /hi/, (res) ->
		res.reply 'Hello!'

	robot.respond /whousenet/, (res) ->
		res.send '获取中。。。不要重复执行'
		child_process.exec '/home/zyf/whousenet.sh', (err, stdout, stderr) ->
			if err
				return res.send '获取失败', stdout, stderr
			res.send stdout
