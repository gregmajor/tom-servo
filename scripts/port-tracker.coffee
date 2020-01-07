# Description:
#   Makes hubot keep track of your network ports.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot reserve port for <appName>- Reserves a range of 100 port numbers for an app 
#   hubot delete port <appName> - Deletes all the port reservations for an app
#   hubot show ports - Shows the reserved ports
#   hubot port help - Shows a help message for port tracking
#
# Author:
#   Jason Dentler

class portTracker

  constructor: (@robot) ->

    # Try to snag saved reserved ports...
    @reservedports = @robot.brain.get('ports')

    # If there's not anything then simply init to empty...
    if not @reservedports
      @reservedports = []

    @robot.brain.on 'loaded', =>
      @brainports = @robot.brain.get('ports')

      if @brainports
        @reservedports = @brainports

  # Gets all the ports. ALL THE portS!
  reservedports: -> @reservedports

  cleanAppName: (appName) ->
    return appName.replace /^\s+|\s+$/g, ""

  # Reserve the next block of ports for the specified app
  add: (user, appName) ->
    appName = @cleanAppName appName
    # Grab what we know...
    reservations = @reservedports.map (p) -> p.startNumber;
    reservations.push(1000);
    nextRange =  Math.max(reservations...) + 100;
    return @assign user, appName, nextRange

  # Reserve a specific block of ports to an app
  assign: (user, appName, startNumber) ->
    appName = @cleanAppName appName
    newPort = { key: appName, appName: appName, startNumber: startNumber, user: user};

    found = (port for port in @reservedports when port.startNumber is startNumber)
    if found && found.length 
      return "Application #{found[0].appName} has already reserved ports #{found[0].startNumber} through #{found[0].startNumber + 99}! Try another range."

    @reservedports.push newPort
    @updateBrain @reservedports
    response = "Okay, I have reserved ports #{newPort.startNumber} through #{newPort.startNumber + 99} for #{newPort.appName}. Check Wikipedia for specific ports within that range you should avoid. https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Registered_ports\n\n"
    return response

  # Deletes reserved ports for the specified app
  deleteByName: (appName) ->
    appName = @cleanAppName appName
    found = (port for port in @reservedports when port.key is appName)
    if not found || found.length == 0
        return "Application #{appName} doesn't have a reserved block of ports!"
    @reservedports = @reservedports.filter (n) -> n.key != appName
    @updateBrain @reservedports
    return "Okay, I have deleted all port reservations for #{appName}."

  showPorts: () ->
    response = '\n'
    if not @reservedports || @reservedports.length == 0
      response += "I haven't reserved any ports!"
    else
      for port in @reservedports
        response += "Ports #{port.startNumber} through #{port.startNumber + 99} are reserved for #{port.key}.\n"
    return response;

  # Updates the robot brain. BRAAAAINS!
  updateBrain: (reservedports) ->    
    @robot.brain.set 'ports', reservedports
    return

module.exports = (robot) ->

  # Fire up our tracker (wrap the bot)...
  tracker = new portTracker robot

  # Wire up to process bot messages...
  #robot.listeners.push new SlackBotListener(robot, /[\s\S]*/i, (msg) -> tracker.processMessage(msg, msg.message.text))

  robot.respond /(assign|reserve) ports for (.+?)$/i, (msg) ->
    appName = msg.match[1]
    result = tracker.add(msg.message.user.name, appName)
    msg.reply result

  robot.respond /(assign|reserve) ports (\d+00?) for (.+?)$/i, (msg) ->
    portRange = parseInt(msg.match[1], 10);
    appName = msg.match[2];
    result = tracker.assign(msg.message.user.name, appName, portRange)
    msg.reply result;

  robot.respond /delete ports (?:for )?(.+?)$/i, (msg) ->
    appName = msg.match[1]
    result = tracker.deleteByName(appName)
    msg.send result

  # hubot show ports
  robot.respond /(show|list) ports/i, (msg) ->
    result = tracker.showPorts()
    msg.send result

  # hubot port help
  robot.respond /(port|ports) help/i, (msg) ->
    help = "\n"
    help += "Here are the port reservation commands you can give me:\n\n"
    help += "reserve ports for <app name> - Reserves the next block of 100 ports for an application\n"
    help += "reserve ports <starting port number> for <app name> - Reserves a specific block of 100 ports for an application\n"
    help += "delete ports for <app name> - Deletes all port reservations for an application\n"
    help += "show ports - Shows all the port reservations\n"
    msg.send help
