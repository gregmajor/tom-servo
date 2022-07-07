# Description:
#   These are useful little bits that hubot can do for you.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Greg Major

stringTable = require('string-table')

module.exports = (robot) ->

  # Test Credit Cards
  robot.respond /\b(\W|^)(test|tests)\b.+\b(card|credit card)\b(\W|$)/igm, (msg) ->
    msg.reply "Here are some test credit card numbers:\nAmerican Express - 378282246310005\nDiners Club - 38520000023237\nDiscover - 6011111111111117\nJCB - 3530111333300000\nMasterCard - 5555555555554444\nVisa - 4111111111111111\n"

  # Tool Links
  robot.respond /\b(\W|^)(show|list|find)\b.+\b(tools|urls|links|domains)\b(\W|$)/igm, (msg) ->
    links = [
      {
        name: "Domain Names",
        url: "https://gsfsgroup.atlassian.net/wiki/spaces/RL/pages/303267841/Domain+Names"
      },
      {
        name: "Services List",
        url: "https://gsfsgroup.atlassian.net/wiki/spaces/RL/pages/58589185/Services+and+Tools"
      }
    ]

    response = "```\n"
    response += stringTable.create(links, { capitalizeHeaders: true })
    response += "```"

    msg.reply response
