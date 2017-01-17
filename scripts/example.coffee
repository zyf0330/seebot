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

name = 'seebot'

module.exports = (robot) ->
	robot.hear name, (res) ->
		res.reply '叫我干什么'

	cmds = ['hi', 'whousenet']
	robot.respond /cmds/, (res) ->
		res.send cmds

	robot.respond /hi/, (res) ->
		res.reply 'Hello!'

	robot.respond /whousenet/, (res) ->
		res.send '等待中。不要重复执行'
		child_process.exec '/home/zyf/whousenet.sh', (err, stdout, stderr) ->
			if err
				return res.send '获取失败', stdout, stderr
			res.send stdout
