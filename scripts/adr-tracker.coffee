# Description:
#   Makes hubot keep track of your Architectural Decision Records (ADRs).
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot assign adr - Assigns an ADR number to the requesting user
#   hubot delete adr <name> - Deletes an assigned ADR
#   hubot show adrs - Shows the assigned ADR
#   hubot adr help - Shows a help message for ADR tracking
#
# Author:
#   Greg Major

class AdrTracker

  constructor: (@robot) ->

    # Try to snag saved assigned ADRs...
    @assignedAdrs = @robot.brain.get('adrs')

    # If there's not anything then simply init to empty...
    if not @assignedAdrs
      @assignedAdrs = []

    @robot.brain.on 'loaded', =>
      @brainAdrs = @robot.brain.get('adrs')

      if @brainAdrs
        @assignedAdrs = @brainAdrs

  # Gets all the ADRs.
  assignedAdrs: -> @assignedAdrs

  # Pads a number with leading zeros.
  padDigits: (number, digits) ->
    return Array(Math.max(digits - String(number).length + 1, 0)).join(0) + number

  # Assigns a new ADR.
  add: (user, name) ->

    # Grab what we know...
    assignedAdrs = @assignedAdrs

    # Start with an empty set of ADRs...
    adrNumbers = []

    # Now grab every ADR number...
    for adr in assignedAdrs
      adrNumbers.push adr.number

    # Start at one if there are no ADRs, otherwise bump the number by one...
    if adrNumbers.length is 0
      adrNumber = 1
    else
      adrNumber = Math.max adrNumbers...
      adrNumber++

    adrNumber = @padDigits(adrNumber, 4)

    adrName = "adr-" + adrNumber

    newAdr = {key: adrName, number: adrNumber, user: user}

    # Save it...
    @assignedAdrs.push newAdr
    @updateBrain @assignedAdr

    response = "Okay, I have assigned #{adrName} to you.\n\n"
    return response

  # Deletes an assigned ADR.
  deleteByNumber: (adrNumber) ->
    found = (adr for adr in @assignedAdrs when adr.number is adrNumber)
    if not found || found.length == 0
        return "ADR #{adrNumber} does not exist!"
    @assignedAdrs = @assignedAdrs.filter (n) -> n.number != adrNumber
    @updateBrain @assignedAdrs
    return "Okay, I have deleted #{adrNumber}."

  # Deletes all the assigned ADRs.
  deleteAll: () ->
    @assignedAdrs = []
    @updateBrain @assignedAdrs
    return "Okay, I have deleted all the ADRs."

  # Updates the robot brain. BRAAAAINS!
  updateBrain: (assignedAdrs) ->
    @robot.brain.set 'adrs', assignedAdrs
    return

module.exports = (robot) ->

  # Fire up our tracker (wrap the bot)...
  tracker = new AdrTracker robot

  # Wire up to process bot messages...
  #robot.listeners.push new SlackBotListener(robot, /[\s\S]*/i, (msg) -> tracker.processMessage(msg, msg.message.text))

  robot.respond /assign adr/i, (msg) ->
    result = tracker.add(msg.message.user.name, "NewADR")
    msg.reply result

  # hubot assign ADR
  robot.respond /assign adr (.+?)$/i, (msg) ->
    name = "NewADR"
    if msg.match[1]
      if msg.match[1] != '' || msg.match[1] != ' '
        name = msg.match[1].replace /^\s+|\s+$/g, ""
    result = tracker.add(msg.message.user.name, name)
    msg.reply result

  # hubot delete all ADRs
  robot.respond /delete all adrs/i, (msg) ->
    result = tracker.deleteAll()
    msg.send result

  # hubot delete ADR <number>
  robot.respond /delete adr (.+?)$/i, (msg) ->
    adrNumber = msg.match[1]
    result = tracker.deleteByNumber(adrNumber)
    msg.send result

  # hubot show ADRs
  robot.respond /(show|list) adrs/i, (msg) ->
    response = "\n"

    if not tracker.assignedAdrs || tracker.assignedAdrs.length == 0
      response += "I haven't assigned any ADRs!"
    else
      for adr in tracker.assignedAdrs
        response += "#{adr.number} is assigned to #{adr.user}\n"

    msg.send response

  # hubot adr help
  robot.respond /(adr|adrs) help/i, (msg) ->
    help = "\n"
    help += "Here are the ADR tracking commands you can give me:\n\n"
    help += "assign adr - Assigns a ADR number to the requesting user\n"
    help += "delete adr <number> - Deletes an assigned ADR\n"
    help += "show adrs - Shows the assigned ADRs\n"
    msg.send help
