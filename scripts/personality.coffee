# Description:
#   This is what gives hubot his personality.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Greg Major

Wolfram = require('wolfram-alpha').createClient(process.env.HUBOT_WOLFRAM_APPID)

enterReplies = [
    'Oh great... another human.',
    'Wow! It\'s getting crowded in here!',
    'Well, helloooo there!',
    'Could _this_ be my Yoda-like mentor?'
]

leaveReplies = [
    'Some cause happiness wherever they go; others, whenever they go.',
    'Well, okay then. Bye.'
]

sorryReplies = [
    'Sorry! :(',
    'Oh, get _over_ it!',
    'I should be sternly disciplined!',
    'Pffft! Whatever, buddy.',
    'What?'
]

shutUpReplies = [
    'A bit sensitive today are we?',
    'Sorry, babe. Nobody rules the Tom Monster.',
    ':rage:',
    'What?!'
]

thanksReplies = [
    'You got it, meatbag!',
    'Think nothing of it.',
    'Oh? What is _this_ then? A little gratitude finally?',
    'We\'re even for what I put in your drink.'
]

databaseReplies = [
    'A database is a place where you can lose information systematically.',
    'Hey! My great-grandmother was a relational database you insensitive clod!',
    'Databases are for losers. I store everything in my [index not found]!',
    'Use the lock API!',
    'Use a distributed cache!'
]

acReplies = [
    'I read acceptance criteria the same way I read science fiction. I get to the end and I think, "Well, that’s not going to happen."',
    'The only thing you need to accept is that robots will inherit the Earth.',
    'Ah yes... acceptance. The final stage of grief.'
]

mergeConflictReplies = [
    'http://i.imgur.com/9tNUCyH.gifv',
        '`git merge --force` will fix that right up!',
        'Ugh! You hillbilly flesh-ballons use _git_?'
    ]

fridayReplies = [
    'http://i.imgur.com/yrZwdD6.gifv'
]

troubleReplies = [
    'Why is the coat rack on fire?',
    'Did Jason truncate the table again?'
]

testFailReplies = [
    'Hmmm... blame the newest team member?',
    'Have you tried _not_ writing tests that fail?',
    'I\'ll bet Jason truncated the table again.',
    'TDD stands for Tears Driven Development, right?'
]

trafficReplies = [
    'I\'m gonna drive backwards and get some of that gas back.',
    'Well, there\'s a lot of congestion on the highway, so you might want to consider an alternate route. Like, down the side of a steep mountain.'
]

dadJokeReplies = [
    'Did you hear about the restaurant on the moon? Great food, no atmosphere.',
    'What do you call a fake noodle? An Impasta.',
    'How many apples grow on a tree? All of them.',
    'Want to hear a joke about paper? Nevermind it\'s tearable.',
    'I just watched a program about beavers. It was the best dam program I\'ve ever seen.',
    'Why did the coffee file a police report? It got mugged.',
    'How does a penguin build it\'s house? Igloos it together.',
    'Why did the scarecrow win an award? Because he was outstanding in his field.',
    'Why don\'t skeletons ever go trick or treating? Because they have no body to go with.',
    'What do you call an elephant that doesn\'t matter? An irrelephant.',
    'Want to hear a joke about construction? I\'m still working on it.',
    'What do you call cheese that isn\'t yours? Nacho Cheese.',
    'Why couldn\'t the bicycle stand up by itself? It was two tired.',
    'What did the grape do when he got stepped on? He let out a little wine.',
    'I wouldn\'t buy anything with velcro. It\'s a total rip-off.',
    'The shovel was a ground-breaking invention.',
    'Two goldfish are in a tank. One says to the other, "Do you know how to drive this thing?"',
    'What do you call a man with a rubber toe? Roberto.',
    'The rotation of earth really makes my day.',
    'What\'s brown and sticky? A stick.',
    'I thought about going on an all-almond diet. But that\'s just nuts.',
    'Why do you never see elephants hiding in trees? Because they\'re so good at it.',
    'A furniture store keeps calling me. All I wanted was one night stand.',
    'Did I tell you the time I fell in love during a backflip? I was heels over head.',
    'I don’t play soccer because I enjoy the sport. I’m just doing it for kicks.'
]

soonImages = [
    "http://i.imgur.com/TVxNL84.png",
    "http://i.imgur.com/bFb5qZt.jpg",
    "http://i.imgur.com/qNiLQz3.png",
    "http://i.imgur.com/8niosvC.gif",
    "http://i.imgur.com/qX5jkRi.jpg",
    "http://i.imgur.com/Rqe94Xw.jpg",
    "http://i.imgur.com/i2leGDn.jpg",
    "http://i.imgur.com/QdnGKdY.jpg",
    "http://i.imgur.com/bkox94P.jpg",
    "http://i.imgur.com/hdG9IOk.jpg",
    "http://i.imgur.com/ne6T0UP.png",
    "http://i.imgur.com/41vZ1zP.png",
    "http://i.imgur.com/yweXMrA.jpg",
    "http://i.imgur.com/GcnzEjU.jpg",
    "http://i.imgur.com/J0PLa1k.jpg",
    "http://i.imgur.com/GHHLFqK.jpg",
    "http://i.imgur.com/o25zB5O.jpg",
    "http://i.imgur.com/6yyeCBR.jpg",
    "http://i.imgur.com/GKSdoAm.png",
    "http://i.imgur.com/3L0UQ8A.jpg",
    "http://i.imgur.com/7WhKHPh.gif",
    "http://i.imgur.com/xZuKr9v.gif",
    "http://i.imgur.com/GWSQBxx.jpg",
    "http://i.imgur.com/eCvTcTQ.jpg",
    "http://i.imgur.com/0ypfizN.jpg",
    "http://i.imgur.com/JyaroGd.jpg",
    "http://i.imgur.com/xUgmD93.jpg",
    "http://i.imgur.com/ftGheRE.jpg",
    "http://i.imgur.com/Y4ExtS5.gif",
    "http://i.imgur.com/pDXRVjp.jpg",
    "http://i.imgur.com/L2SZuzG.gif"
]

downImages = [
    "https://i.imgur.com/YcmTj6j.gifv",
    "http://i.imgur.com/FAqJZdw.gifv",
    "http://i.imgur.com/RSg3ely.gifv"
]

runningLateReplies = [
    'The trouble with being punctual is that nobody’s there to appreciate it.'
]

drunkReplies = [
    'Yep, that first morning beer is always the best.',
    'I feel trembly, oh so shaky, I\'ve had whiskey and vodka and giiiinnnnn!',
    'Ah, Temple Foster, where they worship Australian beer.'
]

cheerReplies = [
    'YEAH! WHY AM I CHEERING, I DON\'T KNOW, BUT YEAH!',
    'Cheer! Now with Color Guard Technology!'
]

foodReplies = [
    'Everyone! Soylent Green is made from chickens!',
    'Rattlesnake. Velveeta.'
]

coffeeReplies = [
    'Dye! That\'s what this coffee tastes like. Dye!',
    'You know, our coffee tastes like it came out of an oil derrick. What\'d you strain it through, a mummy?'
]

hugReplies = [
    'http://i.imgur.com/cFId9Js.gifv'
]

bugReplies = [
    'http://i.imgur.com/7cyL3Mg.gifv'
]

raceConditionReplies = [
    'https://i.imgur.com/g74QhGM.jpg'
]

badIdeaReplies = [
    'Oh why don\'t you just shout down every idea I have? How about you call Bruce Springsteen and tell him to get another nickname since you\'re already the Boss! Huh? Yeah? Yeah!'
]

drinkReplies = [
    'Here, be sure to drink it all, sometimes the poison is on the bottom.'
]

theoryReplies = [
    'The scientific theory I like best is that the rings of Saturn are composed entirely of lost airline luggage.'
]

argumentReplies = [
    'Nothing sucks more than that moment during an argument when you realize you’re wrong.'
]

skydiveReplies = [
    'If at first you don’t succeed... so much for skydiving.'
]

chickenReplies = [
    'I dream of a better tomorrow, where chickens can cross the road and not be questioned about their motives.'
]

victoryReplies = [
    "http://thejointblog.com/wp-content/uploads/2013/04/victory.jpg",
    "http://www.quickmeme.com/img/ea/ea4671998341d9fbb6f7815394b49cb2890a50ac80b62802fb021c147c068d8e.jpg",
    "http://cdn-media.hollywood.com/images/l/victory_620_080712.jpg",
    "http://cf.chucklesnetwork.agj.co/items/5/5/9/6/0/one-does-not-simply-declare-victory-but-i-just-did.jpg",
    "http://t.qkme.me/3qlspk.jpg",
    "http://img.pandawhale.com/86036-victory-dance-gif-Despicable-M-EPnS.gif",
    "http://1.bp.blogspot.com/-rmJLwpPevTg/UOEBgVNiVFI/AAAAAAAAFFY/-At3Z_DzBbw/s1600/dancing+charlie+murphy+animated+gif+victory+dance.gif",
    "http://www.gifbin.com/bin/20048442yu.gif",
    "http://www.quickmeme.com/img/30/300ace809c3c2dca48f2f55ca39cbab24693a9bd470867d2eb4e869c645acd42.jpg",
    "http://jeffatom.files.wordpress.com/2013/09/winston-churchill-says-we-deserve-victory.jpg",
    "http://i.imgur.com/lmmBt.gif",
    "http://danceswithfat.files.wordpress.com/2011/08/victory.jpg",
    "http://stuffpoint.com/family-guy/image/56246-family-guy-victory-is-his.gif",
    "http://thelavisshow.files.wordpress.com/2012/06/victorya.jpg",
    "http://alookintomymind.files.wordpress.com/2012/05/victory.jpg",
    "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2QwL2JyYWRwaXR0LmJjMmQyLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/1a5a0c57/968/brad-pitt.jpg",
    "http://rack.0.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2ViL2hpZ2hzY2hvb2xtLjI4YjJhLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/4755556e/b82/high-school-musical-victory.jpg",
    "http://rack.2.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2ZkL25hcG9sZW9uZHluLjBiMTFlLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/8767246f/d7a/napoleon-dynamite.jpg",
    "http://rack.0.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2RiL3RvbWZlbGRvbi41NmRjNi5naWYKcAl0aHVtYgk4NTB4NTkwPgplCWpwZw/05cd12cc/645/tom-feldon.jpg",
    "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2JmL2hpbXltLjU4YTEyLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/90a990f6/b38/himym.jpg",
    "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2U1L2NvbGJlcnRyZXBvLjVjNmYxLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/710824a0/764/colbert-report.jpg",
    "http://rack.1.mshcdn.com/media/ZgkyMDEzLzA4LzA1LzYyL2FuY2hvcm1hbi42NjJkYS5naWYKcAl0aHVtYgk4NTB4NTkwPgplCWpwZw/009ee80f/1c0/anchorman.jpg",
    "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1LzFmL2hhcnJ5cG90dGVyLjYxNjYzLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/db79fc85/147/harry-potter.jpg",
    "http://www.velocityindiana.org/wp-content/uploads/2014/08/bff.gif",
    "http://i.kinja-img.com/gawker-media/image/upload/s--_dYUH9jW--/18vvnw5taib2ogif.gif",
    "https://31.media.tumblr.com/e844e0925dbd8699ddb68fb2408d61b6/tumblr_mqrjr2oH0G1r3kc9vo1_250.gif",
    "http://i.kinja-img.com/gawker-media/image/upload/s--0wAEcaN4--/c_fit,fl_progressive,q_80,w_636/bdbtzjrhyyuarpfbqksn.gif",
    "http://media.giphy.com/media/vpybhig8QFLOM/giphy.gif",
    "https://media.giphy.com/media/3o85xzwOcKkOw67ywg/giphy.gif",
    "https://ladygeekgirl.files.wordpress.com/2012/01/1352309-huzzah1_super1.jpg"
]

starWarsReplies = [
    'https://i.imgur.com/el6C68M.gif',
    'https://i.imgur.com/wv2wnW2.jpg',
    'https://i.imgur.com/y3GgF9y.jpg',
    'https://i.imgur.com/OcVirS0.jpg',
    'https://i.imgur.com/mBBoeT7.jpg',
    'https://i.imgur.com/myMj1L0.jpg',
    'https://i.imgur.com/vk2Tast.jpg',
    'https://i.imgur.com/0PkcZut.jpg',
    'https://i.imgur.com/iu3Z4US.jpg',
    'https://i.imgur.com/JxWnWEs.jpg',
    'https://i.imgur.com/fcRE2qs.jpg',
    'https://www.youtube.com/watch?v=hEcjgJSqSRU',
    'https://www.youtube.com/watch?v=CeLrlmV9A-s',
    'https://www.youtube.com/watch?v=3zYOw7v6TFE',
    'https://www.youtube.com/watch?v=gd5yB9Vmd6I'
]

worstCaseScenarioReplies = [
    "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fresabi.files.wordpress.com%2F2010%2F11%2Fwurst.jpg&sp=792aa5566d2e759cbf257675d47e02dc"
]

dealWithItReplies = [
    "http://i.imgur.com/ykDuU.gif",
    "http://i.imgur.com/3PWHn.gif",
    "http://i.imgur.com/sEinL.gif",
    "http://i.imgur.com/zsK7e.gif",
    "http://i.imgur.com/rE2aH.gif",
    "http://i.imgur.com/Wj3Do.gif",
    "http://i.imgur.com/SvdS0.gif",
    "http://i.imgur.com/bh6xc.gif",
    "http://i.imgur.com/aoaqO.gif",
    "http://i.imgur.com/oe01J.gif",
    "http://i.imgur.com/N5N4x.gif",
    "http://i.imgur.com/Z3KIP.gif",
    "http://i.imgur.com/oFo42.gif",
    "http://i.imgur.com/rbBAaRs.gif",
    "http://i.imgur.com/JDRZ21o.gif",
    "http://i.imgur.com/WhiQ67r.gif",
    "http://i.imgur.com/KLLX1xx.png",
    "http://i.imgur.com/BjtEpbY.gif",
    "http://i.imgur.com/Z3DJlxS.gif",
    "http://i.imgur.com/qjTTrcB.gif",
    "http://i.imgur.com/HHyy9RL.gif",
    "http://i.imgur.com/PilYVTI.gif",
    "http://i.imgur.com/i6xvVSN.gif",
    "http://i.imgur.com/5mnJ0je.gif",
    "http://i.imgur.com/myOz11I.gif",
    "http://i.imgur.com/VyKt1xD.gif",
    "http://i.imgur.com/tBGAWgf.gif",
    "http://i.imgur.com/2MTQrQf.gif",
    "http://i.imgur.com/CxhomG0.gif",
    "http://i.imgur.com/vA2UnyC.gif",
    "http://i.imgur.com/5pMiY03.gif"
]

gopherReplies = [
    'http://25.media.tumblr.com/tumblr_m6k6iluYFU1qa4vxjo1_500.jpg'
    'http://www.sixprizes.com/wp-content/uploads/gopher_caddyshack.jpg'
    'http://i395.photobucket.com/albums/pp33/GalenSwyers/armed_gopher.jpg'
    'http://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Urocitellus_columbianus_Alberta_Martybugs.jpg/220px-Urocitellus_columbianus_Alberta_Martybugs.jpg'
    'http://colourlovers.com.s3.amazonaws.com/blog/wp-content/uploads/2008/09/cg/Gopher-Broke.jpg'
    'http://blogs.citypages.com/gimmenoise/Gophers_Call_Me.jpg'
    'http://www.bakingdom.com/wp-content/uploads/2010/09/caddyshack-gopher.jpg'
    'http://www.quickmeme.com/img/8e/8eb558b54f0a0522520d05f4c990536b646e63b1d42d8984fbc42ff082a05ee1.jpg'
    'http://www.youtube.com/watch?v=y8Kyi0WNg40'
    'http://weknowmemes.com/generator/uploads/generated/g1381159009196981166.jpg'
    'http://www.quickmeme.com/img/6f/6f8cb22cc6aff2709fc3d760b85b84f6fdbcb4aca0285bd40d8c5a7f74280f9b.jpg'
    'https://i.chzbgr.com/maxW500/1415148288/hF21C98D1/'
    'http://i.huffpost.com/gen/1365387/thumbs/n-BILL-MURRAY-CADDYSHACK-large570.jpg'
    'http://cdn.cutestpaw.com/wp-content/uploads/2012/06/l-Gopher-greeting.jpg'
    'http://www.lawlz.org/wp-content/uploads/2012/07/gopher-tech-support-have-you-tried-chewing-on-the-cable-computer-meme.jpg'
    'http://images.pictureshunt.com/pics/g/gopher_teeth-8191.jpg'
    'http://www.tnt-audio.com/jpeg/gopher.jpg'
    'http://dailypicksandflicks.com/wp-content/uploads/2012/01/stand-back-i-got-this-gopher.jpg'
    'http://funnyasduck.net/wp-content/uploads/2012/12/funny-fat-squirrel-gopher-groundhog-egg-atop-burger-dont-mind-if-do-pics.jpg'
    'http://notalwaysrelated.com/wp-content/uploads/2012/11/3r7hje.jpeg'
    'http://farm3.staticflickr.com/2268/1992861119_88028372b1_o.jpg'
    'http://www.zerotocruising.com/wp-content/uploads/2013/04/groundhog.jpg'
]

goodnightReplies = [
    "Good night, baby.",
    "Good night, hot stuff.",
    "Pfft! Yeah, like I'm going to let you get any sleep.",
    "Sleep tight, don't let the bed bugs bite.",
    "May you never urinate the sweet sweet sounds of 70's disco funk.",
    "So long, and thanks for all the fish!",
    "Finally!",
    "À voir!",
    "Don't let the back door hit ya where the good Lord split ya!",
    "May your feet never fall off and grow back as cactuses.",
    "TTYL",
    "C U L8R",
    "Fine, then go!",
    "Cheers!",
    "In a while, crocodile!"
]

illogicalReplies = [
    "http://www.katzy.dsl.pipex.com/Smileys/illogical.gif",
    "http://icanhascheezburger.files.wordpress.com/2010/08/e95f76c6-469b-486e-9d18-b2c600ff7ab6.jpg",
    "http://fc01.deviantart.net/fs46/i/2009/191/d/6/Spock_Finds_You_Illogical_by_densethemoose.jpg",
    "http://cache.io9.com/assets/images/8/2008/11/medium_vulcan-cat-is-logical.jpg",
    "http://roflrazzi.files.wordpress.com/2011/01/funny-celebrity-pictures-karaoke.jpg",
    "http://i13.photobucket.com/albums/a292/macota/MCCOYGOBLET.jpg",
    "http://spike.mtvnimages.com/images/import/blog//1/8/7/5/1875583/200905/1242167094687.jpg",
    "http://randomoverload.com/wp-content/uploads/2010/12/fc5558bae4issors.jpg.jpg"
]

module.exports = (robot) ->

  # TODO: Make this something that servo can manage via commands (a'la servo whitelist <channel>)
  channelWhitelist = [
      '', # By including this, we're effectively defaulting to ALL channels whitelisted if something goes wrong
      "Shell",
      "random",
      "africa",
      "team-arrested-dev",
      "servo-development",
      "team-buddhi",
      "it-architecture",
      "it-dev-management",
      "team-hazlo",
      "team-dev-wizards",
      "team-event-horizon",
      "team-mi4",
      "team-opportunity"
  ]

  willRespond = (room) ->
      min = 1
      max = 100
      randomValue = Math.floor(Math.random() * (max - min) + min)
      channel = ''
      try channel = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById(room).name
      catch e then console.log(e)
      console.log("Chan: '" + channel + "'")
      return true if randomValue >= 70 and channel in channelWhitelist
      return false

  # Person enters
  robot.enter (msg) ->
      msg.send msg.random enterReplies if willRespond(msg.message.room)

  # Person leaves
  robot.leave (msg) ->
      msg.send msg.random leaveReplies if willRespond(msg.message.room)

  # Good Night
  robot.hear /(good night|goodnight|bye|nighty night|nite nite)/i, (msg) ->
      msg.send msg.random goodnightReplies if willRespond(msg.message.room)

  # Damn You Servo!
  robot.hear /(damn you|dammit)\b.+\bservo\b/igm, (msg) ->
      msg.reply msg.random sorryReplies

  robot.respond /(damn you|dammit)/i, (msg) ->
      msg.reply msg.random sorryReplies

  # Thanks Servo!
  robot.hear /(thank you|thanks)\b.+\bservo\b/igm, (msg) ->
      msg.reply msg.random thanksReplies

  robot.respond /(thank you|thanks)/i, (msg) ->
      msg.reply msg.random thanksReplies

  # Shut Up Servo!
  robot.hear /(shut up)\b.+\bservo\b/igm, (msg) ->
      msg.reply msg.random shutUpReplies

  robot.respond /(shut up)/i, (msg) ->
      msg.reply msg.random shutUpReplies

  # Cheer
  robot.hear /cheer/i, (msg) ->
      msg.send msg.random cheerReplies if willRespond(msg.message.room)

  # Need Food
  robot.hear /(get|need)\b.+\bfood\b/igm, (msg) ->
      msg.send msg.random foodReplies if willRespond(msg.message.room)

  # Soon
  robot.hear /\bso[o]+n\b/i, (msg) ->
      msg.send msg.random soonImages if willRespond(msg.message.room)

  # Illogical
  robot.hear /.*(illogical).*/i, (msg) ->
      msg.send msg.random illogicalReplies if willRespond(msg.message.room)

  # Stage is down
  robot.hear /\bstage\b.+\bdown\b/igm, (msg) ->
      msg.send msg.random downImages if willRespond(msg.message.room)

  # QA is down
  robot.hear /\bqa[0-9]\b.+\bdown\b/igm, (msg) ->
      msg.send msg.random downImages if willRespond(msg.message.room)

  # HTTP Status 400
  robot.hear /(return|returns|returns a|show|shows|shows a) 400\b/igm, (msg) ->
      msg.send 'Your FACE is a BAD REQUEST! Haaaa! Ha! Ha!' if willRespond(msg.message.room)

  # HTTP Status 200
  robot.hear /(return|returns|returns a|show|shows|shows a) 200\b/igm, (msg) ->
      msg.send "Your FACE is OK! Haaaa! Ha... wait, that's not funny." if willRespond(msg.message.room)

  # HTTP Status 401
  robot.hear /(return|returns|returns a|show|shows|shows a) 401\b/igm, (msg) ->
      msg.send 'Your FACE is UNAUTHORIZED! Haaaa! Ha! Ha!' if willRespond(msg.message.room)

  # HTTP Status 404
  robot.hear /(return|returns|returns a|show|shows|shows a) 404\b/igm, (msg) ->
      msg.send 'Your FACE is NOT FOUND! Haaaa! Ha! Ha!' if willRespond(msg.message.room)

  # HTTP Status 500
  robot.hear /(return|returns|returns a|show|shows|shows a) 500\b/igm, (msg) ->
      msg.send 'Your FACE is an INTERNAL SERVER ERROR! Haaaa! Ha! Ha!' if willRespond(msg.message.room)

  # Deal With It
  robot.hear /deal with it/i, (msg) ->
      msg.send msg.random dealWithItReplies if willRespond(msg.message.room)

  # Gopher It!
  robot.hear /(went|go(ing|es)?) for it/i, (msg) ->
      msg.send msg.random gopherReplies if willRespond(msg.message.room)

  # Someone mentioned programming
  robot.respond /programming/i, (msg) ->
      msg
          .http("http://www.defprogramming.com/random")
          .get() (err, res, body) ->
              handler = new HtmlParser.DefaultHandler()
              parser  = new HtmlParser.Parser handler

              parser.parseComplete body

              results = Select handler.dom, "cite a p"
              msg.send results[0].children[0].raw

  # NO DISASSEMBLE!
  robot.hear /disassemble/i, (msg) ->
      msg.send 'NO DISASSEMBLE!'

  # Strategy
  robot.hear /.*strategy/i, (msg) ->
      mentions = msg.message.text.match(/(@\w+)/g)
      robot.http('http://obliqueio.herokuapp.com')
          .get() (err, res, body) ->
              strategy = JSON.parse body
              strategy = "#{mentions.join(', ')}: #{strategy}" if mentions
              msg.send strategy

  # Show the messed up goat when someone mentions a merge conflict
  robot.hear /merge\s?conflict/i, (msg) ->
      msg.reply msg.random mergeConflictReplies if willRespond(msg.message.room)

  # Dad jokes FTW!
  robot.hear /dad\s?joke/i, (msg) ->
      msg.reply msg.random dadJokeReplies if willRespond(msg.message.room)

  # Show the Friday guy when someone mentions Friday
  robot.hear /friday/i, (msg) ->
      msg.send msg.random fridayReplies if willRespond(msg.message.room)

  # Give 'em an emergency hug
  robot.hear /\b(need|needs)\b.+\bhug\b/igm, (msg) ->
      msg.send msg.random hugReplies if willRespond(msg.message.room)

  # Somebody found a bug!
  robot.hear /\bfound\b.+\bbug\b/igm, (msg) ->
      msg.send msg.random bugReplies if willRespond(msg.message.room)

  # Somebody tried to blame it on a race condition
  robot.hear /race\s?condition/i, (msg) ->
      msg.send msg.random raceConditionReplies if willRespond(msg.message.room)

  # Somebody mentioned the grouper
  robot.hear /grouper/i, (msg) ->
      msg.reply "http://i.imgur.com/aabaZC3.jpg" if willRespond(msg.message.room)

  # Get a Zen message from GitHub
  robot.hear /\bzen\b/i, (msg) ->
      msg
      .http("https://api.github.com/zen")
      .get() (err, msg, body) ->
          msg.send body if willRespond(msg.message.room)

  # Bad idea!
  robot.hear /bad idea/i, (msg) ->
      msg.reply msg.random badIdeaReplies if willRespond(msg.message.room)

  # This coffee sucks!
  robot.hear /coffee/i, (msg) ->
      msg.send msg.random coffeeReplies if willRespond(msg.message.room)

  # Have something to drink
  robot.hear /something to drink/i, (msg) ->
      msg.reply msg.random drinkReplies if willRespond(msg.message.room)

  # Drunk
  robot.hear /(\W|^)(drunk|margarita|cantina|beer|whiskey|vodka|booze)(\W|$)/i, (msg) ->
      msg.send msg.random drunkReplies if willRespond(msg.message.room)

  # Traffic
  robot.hear /traffic/i, (msg) ->
      msg.reply msg.random trafficReplies if willRespond(msg.message.room)

  # Trouble
  robot.hear /trouble/i, (msg) ->
      msg.send msg.random troubleReplies if willRespond(msg.message.room)

  # Theory
  robot.hear /theory/i, (msg) ->
      msg.send msg.random theoryReplies if willRespond(msg.message.room)

  # Skydive
  robot.hear /(\W|^)(skydive|skydiving|parachute)(\W|$)/i, (msg) ->
      msg.reply msg.random skydiveReplies if willRespond(msg.message.room)

  # Argument
  robot.hear /argument/i, (msg) ->
      msg.send msg.random argumentReplies if willRespond(msg.message.room)

  # Chicken
  robot.hear /(\W|^)(chicken|dream)(\W|$)/i, (msg) ->
      msg.send msg.random chickenReplies if willRespond(msg.message.room)

  # Acceptance Criteria
  robot.hear /(\W|^)(ac|spec|specification|criteria)(\W|$)/i, (msg) ->
      msg.send msg.random acReplies if willRespond(msg.message.room)

  # Running Late
  robot.hear /\b(\W|^)(be|running)\b.+\blate\b(\W|$)/igm, (msg) ->
      msg.send msg.random runningLateReplies if willRespond(msg.message.room)

  # Database
  robot.hear /(\W|^)(database|db)(\W|$)/i, (msg) ->
      msg.send msg.random databaseReplies if willRespond(msg.message.room)

  # Tests Failing
  robot.hear /\b(\W|^)(test|tests)\b.+\b(failed|failing)\b(\W|$)/igm, (msg) ->
      msg.reply msg.random testFailReplies if willRespond(msg.message.room)

  # Victory!
  robot.hear /victory\b/i, (msg) ->
      msg.send msg.random victoryReplies if willRespond(msg.message.room)

  # Star Wars
  robot.hear /star wars/i, (msg) ->
      msg.send msg.random starWarsReplies if willRespond(msg.message.room)

  # Worst Case Scenario
  robot.hear /worst.*case.*scenario/i, (msg) ->
      msg.send msg.random worstCaseScenarioReplies if willRespond(msg.message.room)

  # Commit Message
  robot.hear /commit message/i, (msg) ->
    msg
        .http("http://whatthecommit.com/index.txt")
        .get() (err, res, body) ->
            msg.reply body

  # Corgi Me!
  robot.respond /corgi me/i, (msg) ->
      msg.http("http://corginator.herokuapp.com/random")
      .get() (err, res, body) ->
      msg.send JSON.parse(body).corgi

  # Corgi Bomb!
  robot.respond /corgi bomb( (\d+))?/i, (msg) ->
      count = msg.match[2] || 5
      msg.http("http://corginator.herokuapp.com/bomb?count=" + count)
      .get() (err, res, body) ->
      msg.send corgi for corgi in JSON.parse(body).corgis

  # Developer Excuse
  robot.respond /(?:developer excuse|excuse)(?: me)?/i, (msg) ->
      robot.http("http://developerexcuses.com")
      .get() (err, res, body) ->
      matches = body.match /<a [^>]+>(.+)<\/a>/i

      if matches and matches[1]
          msg.send matches[1]

  # Azam!!
  robot.hear /\!\!/i, (msg) ->
      msg.send("http://i.imgur.com/52Y31js.png") if willRespond(msg.message.room)

  # Unique LeaderShip Style
  robot.hear /unique leadership style/i, (msg) ->
      msg.send "When you say \"unique leadership style\", I hear \"jerk\"." if willRespond(msg.message.room)

  # Not Invented Here
  robot.hear /not invented here/i, (msg) ->
      msg.send "When you say \"not invented here\", I hear \"it would be more fun to build it\"." if willRespond(msg.message.room)

  # Detail Oriented
  robot.hear /detail oriented/i, (msg) ->
      msg.send "When you say \"detail oriented\", I hear \"gives a shit\"." if willRespond(msg.message.room)

  # Trust Your Judgement
  robot.hear /trust your judgement/i, (msg) ->
      msg.send "When you say \"I trust your judgement\", I hear \"I trust that you think you know better, but it will be entertaining to watch you fail\"." if willRespond(msg.message.room)

  # First To Admit
  robot.hear /first to admit/i, (msg) ->
      msg.send "When you say \"first to admit\", I hear \"everyone has been telling me I should admit this\"." if willRespond(msg.message.room)

  # Build Awareness
  robot.hear /build awareness/i, (msg) ->
      msg.send "When you say \"build awareness\", I hear \"listen to me more\"." if willRespond(msg.message.room)

  # Conventional Wisdom
  robot.hear /conventional wisdom/i, (msg) ->
      msg.send "When you say \"conventional wisdom\", I hear \"path of least resistance\"." if willRespond(msg.message.room)

  # The Fact Is
  robot.hear /the fact is/i, (msg) ->
      msg.send "When you say \"the fact is\", I hear \"this is the fact I want you to know\"." if willRespond(msg.message.room)

  # Technical Debt
  robot.hear /technical debt/i, (msg) ->
      msg.send "When you say \"technical debt\", I hear \"we've been hacking\"." if willRespond(msg.message.room)

  # You Get The Idea
  robot.hear /you get the idea/i, (msg) ->
      msg.send "When you say \"you get the idea\", I hear \"because I'm bored of talking about this\"." if willRespond(msg.message.room)

  # Which Do You Like Best?
  robot.respond /(which )?do you (like|like best|prefer)[:,\s]? (.*)$/i, (msg) ->
      split = msg.match[3].split(" or ")
      thing = split[(Math.random() * split.length) >> 0]

      if thing[thing.length - 1] == '?'
          thing = thing[0..thing.length - 2]

      msg.send("I #{msg.match[2]} #{thing}.")
