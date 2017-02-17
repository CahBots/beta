require 'discordrb'
require 'configatron'
require_relative 'config.rb'

bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: 267104172049039373, prefix: ['B^', '<@267104172049039373> '], ignore_bots: true

bot.ready do |event|
  bot.game="Use B^cmds or B^info"
end

bot.command(:die, help_available: false) do |event|
  if event.user.id == 228290433057292288
    bot.send_message(event.channel.id, 'CahBot Beta is shutting down')
    exit
  else
    "Sorry, only Cah can kill me"
  end
end

bot.command(:eval, help_available: false) do |event, *code|
  if event.user.id == 228290433057292288
    begin
      eval code.join(' ')
    rescue => e
      event << "Ah geez, something went wrong, it says:"
      event << "```"
      event << "#{e} ```"
    end
  else
    "Sorry, only Cah can eval stuff"
  end
end

bot.command(:restart, help_available: false) do |event|
  if event.user.id == 228290433057292288
    begin
      event.respond ["Into the ***fuuuutttttuuuuurrrreeee***", "Please wait...", "How about n—", "Can do :thumbsup::skin-tone-1:", "Pong! Hey, that took... Oh wait, wrong command", "Ask again at a later ti—"].sample
      exec("bash restart.sh")
    end
  else
    "Sorry, only Cah can update me"
  end
end

bot.command(:ping, help_available: false, max_args: 0) do |event|
  m = event.respond('Pinging!')
  m.edit "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
puts "^ping | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command([:eightball, :eball], help_available: false, min_args: 1) do |event|
  event.respond ["Sources say... Yeah", "Sources say... Nah", "Perhaps", "As I see it, yes", "As I see it, no", "If anything, probably", "Not possible", "Ask again at a later time", "Say that again?", "lol idk", "Probably not", "woahdude", "[object Object]", "Undoubtfully so", "I doubt it", "Eh, maybe"].sample
puts "^eightball | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:roll, help_available: false, max_args: 0) do |event|
      h = event.respond '**Rolling Dice!**'
  sleep 2
      h.edit "And you got a... **#{rand(1..6)}!**"
puts "^roll | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:flip, help_available: false, max_args: 0) do |event|
  m = event.respond ["woahdude, you got **Heads**", "woahdude, you got **Tails**", "You got **heads**", "You got **tails**"].sample
puts "^flip | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:flop, help_available: false, max_args: 0) do |event|
  m = event.respond ["Oops, the coin flipped so high it didn't come back down", "The coin multiplied and landed on both", "The coin... disappeared", "Pong! It took **#{((Time.now - event.timestamp) * 1000).to_i}ms** to ping the coin", "And you got a... **#{rand(1..6)}!** wait thats not how coins work", "Perhaps you could resolve your situation without relying on luck", "noot", "[Witty joke concerning flipping a coin]", "[BOTTOM TEXT]"].sample
puts "^flop | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:info, help_available: false, max_args: 0) do |event|
  event << "***Info About CahBot:***"
  event << ""
  event << "**What is CahBot/CahBot Beta?** CB is a small Discord bot with loads of potential, Beta is the borderline experimental version."
  event << "**Who made CahBot?** Cah#5153 coded CahBot, with help from happyzachariah#6121 and others"
  event << "**Why does CahBot exist?** One day I was bored so I made a Discord bot. End of story kthxbai"
  event << "**Does CahBot have a server or something?** You bet, https://goo.gl/02ZRK5"
  event << "**u suk a bunnch an u can hardly mak a discord bawt.** Radical, thank you for noticing"
puts "^info | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:trello, help_available: false, max_args: 0) do |event|
  event.respond "The Trello board for CahBot: https://goo.gl/QNJa3E"
puts "^trello | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.message(with_text: 'CBB prefix') do |event|
  event.respond "My prefix is `B^`. For help, do `B^help`"
puts "\"CBB Prefix\" | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:rnumber, help_available: false, min_args: 2, max_args: 2) do |event, min, max|
  rand(min.to_i .. max.to_i)
puts "^rnumber | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:invite, help_available: false, max_args: 0) do |event|
  event.respond "To invite me to your server, head over here: https://goo.gl/ttNED9 (Will be updated so you can invite Beta)"
puts "^invite | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:say, help_available: false, required_permissions: [:manage_messages], min_args: 1) do |_event, *args|
  _event.message.delete
  "#{args.join(' ')}"
puts "^say | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command([:reverse, :rev], help_available: false, min_args: 1) do |event, *args|
  "#{args.join(' ')}".reverse
puts "^reverse | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:userinfo, help_available: false, max_args: 0) do |event|
  event << "**__User Info For You__**"
  event << ""
  event << "**User ID:** `#{event.user.id}`"
  event << "**User Discrim:** `#{event.user.discrim}`"
  event << "**Username:** `#{event.user.name}`"
  event << "**True or False: Are You A Bot?** `#{event.user.current_bot?}`"
  event << "**User Nickname** `#{event.user.nick}`"
  event << "**User Avatar (may be wrong due to gif avatars):** https://discordapp.com/api/v6/users/#{event.user.id}/avatars/#{event.user.avatar_id}.jpg"
puts "^userinfo | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:thanks, help_available: false, max_args: 0) do |event|
  event << "Thanks so much to these current Donors:"
  event << "ChewLeKitten#6216 - Tier 1 Donor, First Donor, AND awesome contributor"
puts "^thanks | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:update, help_available: false, max_args: 0) do |event|
  event << '**Latest CahBot Beta Update**'
  event << ''
  event << 'Now I can see who ran a command and where, *finally* :eyes:'
  event << 'B^feedback; You can now send bot feedback/suggestions, can\'t wait for the onslaught of people telling me I suck'
  event << 'B^trello; Woah, a trello has appeared'
puts "^update | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command([:servercount, :servcount], help_available: false, max_args: 0) do |event|
  event.respond "CahBot Beta is on **#{bot.servers.count}** servers as of now"
puts "^servercount | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:donate, help_available: false, max_args: 0) do |event|
  event.respond "Hi #{event.user.name}, click here for donations: <https://goo.gl/QBvB7N> ~~*not a virus i swear*~~"
puts "^donate | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:help, help_available: false, max_args: 0) do |event|
  event << ' woahdude, you looking for help? Well, here\'s what you need to know.'
  event << ' For a list of commands, you can do `B^cmds`, for info about CahBot, do `B^info`'
puts "^help | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:noot, help_available: false, max_args: 0) do |event|
  event.respond "NOOT https://s-media-cache-ak0.pinimg.com/originals/fe/cb/80/fecb80585eca20163a4d57fa281610b8.gif"
puts "^noot | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command([:cmds, :commands], chain_usable: false, max_args: 0) do |event|
  event << ' Here are all of my commands for you to use!'
  event << ' (upon saying "CBB prefix") reminds you the prefix'
  event << ' `B^info`: Shows you some info about CB, or something'
  event << ' `B^rnumber <Number> <Other Number>`: Gives you a random number'
  event << ' `B^help`: Basically tells you to go here'
  event << ' `B^cmds`: pulls up this'
  event << ' `B^eightball`: Ask the 8ball something'
  event << ' `B^userinfo`: Shows some info about you'
  event << ' `B^reverse`: Reverses text'
  event << ' `B^flip`: Flips a coin, what else did you expect?'
  event << ' `B^flop`: Flops a coin, what expect did you else?'
  event << ' `B^ping`: Used to show response time'
  event << ' `B^servercount`: Returns the number of servers CB is in'
  event << ' `B^invite`: Gives you a link to invite me to your own server!'
  event << ' `B^die`: Shuts me down, only Cah can use this command'
  event << ' `B^roll`: Rolls a number between 1 and 6'
  event << ' `B^eval`: Like you don\'t know what eval commands do'
  event << ' `B^donate`: Want to donate? That\'s great! This command gives you a link for Patreon donations'
  event << ' `B^update`: Gives you the latest CB update'
  event << ' `B^say`: Makes CB say something, you need the manage messages perm tho'
  event << ' `B^feedback <words>`: Sends your feedback to the CB Server'
  event << ' `B^thanks`: Thanks to these radical donors!'
  event << ' `B^trello`: The Trello board, woahdude'
  event << ' `B^noot`: noot (don\'t ask I didn\'t write this)'
puts "^commands | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
end

bot.command(:feedback, min_args: 1) do |event, *args|
  if event.channel.pm? == true
    bot.send_message(252239053712392192, "New Feedback from `#{event.user.name}`\##{event.user.discriminator}. ID: #{event.user.id}. From a DM.

*#{args.join(' ')}*")
    m = (event.respond "Radical! Feedback sent.")
    sleep 5
    m.delete
    puts "^feedback | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) in a DM"
  else
    event.message.delete
    bot.send_message(252239053712392192, "New Feedback from `#{event.user.name}`\##{event.user.discriminator}. ID: #{event.user.id}. From the land of `#{event.server.name}` (Server ID: #{event.server.id}).
*#{args.join(' ')}*")
    m = (event.respond "Radical! Feedback sent.")
    puts "^feedback | Command ran by #{event.user.name}\##{event.user.discriminator} (ID: #{event.user.id}) on server #{event.server.name} (ID: #{event.server.id})"
    sleep 5
    m.delete
  end
end

bot.run
