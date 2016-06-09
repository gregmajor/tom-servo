# Description:
#   track who has what autobahn environments
#
# Commands:
#   hubot env claim <envname> <team|person> - assign and env to a team or person.
#   hubot env list - Returns all environments and own is claiming them.
#   hubot env clear - clear env history
util = require('util')
module.exports = (robot) ->
    setClaimToEnv = (res, envName, personOrTeam, byUser) ->
        envTracking = robot.brain.get('envTracking')
        now = new Date()
        previousOwner = null
        if envTracking!=null
            if envTracking.hasOwnProperty envName
                previous = envTracking[envName]
                findUser = new RegExp("by (.+) on").exec(previous)
                if findUser
                    previousOwner = findUser[1]
        else
           envTracking = {} 
        envTracking[envName] = 'owner ' + personOrTeam + " by " + byUser + " on " + now
        robot.brain.set 'envTracking', envTracking
        return previousOwner
    robot.respond /env claim (.+) (.+)/i, (res) ->
        claimEnv = res.match[1]
        personOrTeam = res.match[2]
        error = false
        if(claimEnv!=null)
            error = true
        if(personOrTeam!=null)
            error = true
            
        previousClaim = setClaimToEnv res, claimEnv, personOrTeam, res.message.user.name
        previousClaimCC = ""
        if(previousClaim)
            previousClaimCC = " CC: @" + previousClaim
        res.reply "You have stake claim of *"+claimEnv+"* for *" + personOrTeam + "*" + previousClaimCC
    robot.respond /env list/i, (res) ->
        envTracking = robot.brain.get('envTracking')
        if envTracking==null
            res.send "I do not have any environments claimed"
        else
            res.send util.inspect(envTracking, {showHidden: false, depth: 4}).replace("{", "").replace("}", "")
        
        
    robot.respond /env clear/i, (res) ->
        robot.brain.set 'envTracking', null
        res.reply "Cleared all tracking of environment claims"