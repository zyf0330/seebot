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
schedule = require 'node-schedule'
bc = require '../helper/bc'

module.exports = (robot) ->
	commands = robot.commands

	notify = {}

	enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
	leaveReplies = ['Someone leaves']
	robot.enter (res) ->
		res.reply res.random enterReplies
	robot.leave (res) ->
		res.send res.random leaveReplies


	robot.hear ///^#{robot.name}$///i, (res) ->
		res.reply '叫我干什么'

	robot.respond /(你(能|会)(做|干)什么(呀|啊)?|what can (you|u) do)/, (res) ->
		res.reply '我会干的多呢，say help to me'

	commands.push "#{robot.name} hi - say hi to #{robot.name}"
	robot.respond /\W*hi\W*$/i, (res) ->
		res.reply 'Hi too!'

	# commands.push "#{robot.name} whousenet - tell you who is occupying Ethernet and Internet bandwidth"
	# robot.respond /whousenet/i, (res) ->
	# 	res.send '获取中。。。不要重复执行'
	# 	child_process.exec '/home/zyf/whousenet.sh', (err, stdout, stderr) ->
	# 		if err
	# 			return res.send '获取失败', stdout, stderr
	# 		res.send stdout

	commands.push "谁最帅 - tell you who is the most beautiful one"
	robot.hear /谁最帅/i, (res) ->
		p = Math.random()
		res.send if p < 0.8 then '绝对不是谭粽球了！' else '会是谁呢，应该是名字里有风又有云的那个人'
	commands.push "谁最丑 - tell you who is the most ugly one"
	robot.hear /谁最丑/i, (res) ->
		p = Math.random()
		res.send if p < 0.7 then '七成是谭粽球！' else if p < 0.8 then '八成是谭粽球！' else if p < 0.9 then '九成是谭粽球！' else '只有十分之一的几率不是他，你们懂了吗'
	robot.hear /^天黑了/i, (res) ->
		res.send '谭粽球出来耍帅🐷了'
	robot.hear /^天亮了/i, (res) ->
		res.send '谭粽球回去丑😭了'

	notify.updateProgress = () ->
		channel = bc.channels.allPeople
		# channel = bc.channels.test
		robot.send bc.envelope(null, channel), bc.notifyChannel('请各位更新自己的进度墙标签')

	# 工作日每晚六点提醒
	schedule.scheduleJob '0 18 * * 1-5', notify.updateProgress


	# robot.respond /test/, (res) ->
	# 	console.log res.message
