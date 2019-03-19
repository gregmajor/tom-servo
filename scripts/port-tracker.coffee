# Description:
#   Makes hubot keep track of your database ports.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot assign port <appName>- Assigns a port number to the requesting user
#   hubot delete port <appName> - Deletes an assigned port
#   hubot show ports - Shows the assigned ports
#   hubot port help - Shows a help message for port tracking
#
# Author:
#   Greg Major

#TextMessage = require('hubot').TextMessage
#SlackBotListener = require('hubot-slack').SlackBotListener

class portTracker

  constructor: (@robot) ->

    # Try to snag saved assigned ports...
    @assignedports = @robot.brain.get('ports')

    # If there's not anything then simply init to empty...
    if not @assignedports
      @assignedports = []

    @robot.brain.on 'loaded', =>
      @brainports = @robot.brain.get('ports')

      if @brainports
        @assignedports = @brainports

  # Gets all the ports. ALL THE portS!
  assignedports: -> @assignedports

  # Pads a number with leading zeros.
  padDigits: (number, digits) ->
    return Array(Math.max(digits - String(number).length + 1, 0)).join(0) + number

  cleanAppName: (appName) ->
    return appName.replace /^\s+|\s+$/g, ""

  # Assigns a new port.
  add: (user, appName) ->
    appName = @cleanAppName appName
    # Grab what we know...
    assignedports = @assignedports

    reservations = assignedports.map (p) -> p.startNumber;
    reservations.push(1000);
    nextRange =  Math.max(reservations...) + 100;
    @assign user, appName, nextRange

  # Assign a specific block of ports to an app
  assign: (user, appName, startNumber) ->
    appName = @cleanAppName appName
    newPort = { key: appName, appName: appName, startNumber: startNumber, user: user};

    found = (port for port in @assignedports when port.startNumber is startNumber)
    if found && found.length 
      return "Application #{found[0].appName} has already reserved ports #{found[0].startNumber} through #{found[0].startNumber + 99}! Try another range."

    @assignedports.push newPort
    @updateBrain @assignedports
    response = "Okay, I have reserved ports #{newPort.startNumber} through #{newPort.startNumber + 99} for #{newPort.appName}. Check Wikipedia for specific ports within that range you should avoid. https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Registered_ports\n\n"
    return response

  # Deletes an assigned port.
  deleteByName: (appName) ->
    appName = @cleanAppName appName
    found = (port for port in @assignedports when port.key is appName)
    if not found || found.length == 0
        return "Application #{appName} doesn't have a reserved block of ports!"
    @assignedports = @assignedports.filter (n) -> n.key != appName
    @updateBrain @assignedports
    return "Okay, I have deleted #{appName}."

  # Updates the robot brain. BRAAAAINS!
  updateBrain: (assignedports) ->
    @robot.brain.set 'ports', assignedports
    return

module.exports = (robot) ->

  # Fire up our tracker (wrap the bot)...
  tracker = new portTracker robot

  # Wire up to process bot messages...
  #robot.listeners.push new SlackBotListener(robot, /[\s\S]*/i, (msg) -> tracker.processMessage(msg, msg.message.text))

  robot.respond /assign ports to (.+?)$/i, (msg) ->
    appName = msg.match[1]
    result = tracker.add(msg.message.user.name, appName)
    msg.reply result

  robot.respond /assign ports (\d+00?) to (.+?)$/i, (msg) ->
    portRange = parseInt(msg.match[1], 10);
    appName = msg.match[2];
    result = tracker.assign(msg.message.user.name, appName, portRange)
    msg.reply result;

  # hubot delete port <name>
  robot.respond /delete ports (.+?)$/i, (msg) ->
    appName = msg.match[1]
    result = tracker.deleteByName(appName)
    msg.send result

  # hubot show ports
  robot.respond /(show|list) ports/i, (msg) ->
    response = "\n"

    if not tracker.assignedports || tracker.assignedports.length == 0
      response += "I haven't reserved any ports!"
    else
      for port in tracker.assignedports
        response += "Ports #{port.startNumber} through #{port.startNumber + 99} are reserved for #{port.key}.\n"

    msg.send response

  # hubot port help
  robot.respond /(port|ports) help/i, (msg) ->
    help = "\n"
    help += "Here are the port assignment commands you can give me:\n\n"
    help += "assign ports to <app name> - Assigns the next block of 100 ports to an application\n"
    help += "assign ports <starting port number> to <app name> - Assigns a specific block of 100 ports to an application\n"
    help += "delete ports <app name> - Deletes all port assignments for an application\n"
    help += "show ports - Shows the assigned ports\n"
    msg.send help
