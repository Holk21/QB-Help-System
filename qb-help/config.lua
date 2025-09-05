Config = {}

Config.UseOkOk = false

-- Show a dedicated Welcome tab
Config.ShowWelcomeTab = true

-- Welcome content
Config.Welcome = {
    title = "Welcome to Your Server Name",
    subtitle = "Everything you need to get started",
    bullets = {
        "Press /help anytime to reopen this tablet.",
        "Be respectful and follow server rules.",
        "Use /report to contact staff if you’re stuck.",
        "Join our Discord for announcements & support."
    },
    image = "Add Your Image Here", -- 512x256
    discord = "Add Your Discord Here",
    website = "Add Your Website Here",

}

-- Key to close the tablet (also supports ESC)
Config.CloseKey = 'BACK'

-- Help content categories/items
Config.Help = {
    Player = {
        { title = "Open Inventory", desc = "Open your inventory to manage items.", command = "TAB" },
        { title = "Open Phone", desc = "Access apps, messages, and more.", command = "F1 Or Check Keybinds" },
        { title = "Use Emotes", desc = "Play emotes from your emote menu.", command = "F5" },
        { title = "Report Issue", desc = "Open the report panel to contact staff.", command = "/report" },
        { title = "Seat Belt", desc = "To Wear Seatbelt.", command = "Hit B" },
        { title = "Afterpay", desc = "Open Up Afterpay", command = "F3" },
        { title = "AFK System", desc = "Open Up AFK System", command = "/AFK" },
        { title = "How To Buy Cars", desc = "Buy a Car", command = "Go to PDM" },
        { title = "How To Open Interaction Menu", desc = "Interaction Menu", command = "M" },
        { title = "How To Go AFK", desc = "AFK System", command = "/afk" },
        { title = "How To Open Nav", desc = "Open GPS", command = "F6" },
        { title = "How To Open Job Menu", desc = "Open Job Menu", command = "F4" },
        { title = "How To Open Billing Menu", desc = "Open Billing Menu", command = "F7" },
        { title = "How To Acess The Colour Menu", desc = "Open Clour Menu For Cars", command = "/colours" },
        { title = "How To Acess The Livery Menu", desc = "Open Livery Menu For Cars", command = "/livery" },
        { title = "How To Acess The Extra Menu", desc = "Open Extra Menu For Cars", command = "/extras" },
        { title = "How To Acess The Court Menu", desc = "Open Court Menu For Cars", command = "/court" },
        { title = "How To Acess The Emails", desc = "Open Emails", command = "/email" },
        { title = "How To Acess The Pet Menu", desc = "Open Pet Menu", command = "/pet Or Go The Location And Third Eye The AI" },
        { title = "How To Acess The Wof And Reg", desc = "Open The WOF And RED", command = "/viewwofandreg" },
        { title = "How To Acess The Radio", desc = "Open The Radio", command = "/radio" },
        { title = "How To Make a 111 Call", desc = "Open The 111 Call", command = "/111" },
        { title = "How To Make a 105 Call", desc = "Open The 105 Call", command = "/105" },
        { title = "How To Make a Review", desc = "Open The Review System", command = "/review" },
        { title = "How To Open The Scorebord", desc = "Open Scoreboard", command = "Hit J" },
    },
    Police = {
        { title = "Services", desc = "Check to See Howmanu Polcie On.", command = "/services" },
        { title = "Cuff / Uncuff", desc = "Toggle cuffs on a nearby target.", command = "/cuff" },
        { title = "How To Get a Car", desc = "How To Spawn a Police Car", command = "When on Duty U Will See a Garage" },
        { title = "How To Open Job Menu", desc = "Open Job Menu", command = "F4" },
        { title = "How To Open Billing Menu", desc = "Open Billing Menu", command = "F7" },
        { title = "How To Acess The Colour Menu", desc = "Open Clour Menu For Cars", command = "/colours" },
        { title = "How To Acess The Livery Menu", desc = "Open Livery Menu For Cars", command = "/livery" },
        { title = "How To Acess The Extra Menu", desc = "Open Extra Menu For Cars", command = "/extras" },
        { title = "How To Acess The Court System", desc = "Open Court System For Cars", command = "/court" },
        { title = "How To Acess The Emails", desc = "Open Emails", command = "/email" },
        { title = "How To Acess View Details For Wof And Reg", desc = "Open Reg And Wof", command = "/viewdetails" },
        { title = "How To Acess The Radio", desc = "Open The Radio", command = "/radio" },
        { title = "How To Acess The Rights", desc = "Open The Rights System", command = "/rights" },
    },
    Fire = {
        { title = "Pager/siren", desc = "Set pager And Sire For Firefighter.", command = "/pager /firesiren" },
        { title = "Fire Hose", desc = "Equip and use the fire hose tool.", command = "Near Truck Hit E" },
        { title = "Spreaders", desc = "Get Spreaders", command = "/spreadres" },
        { title = "Fire Fan", desc = "Get The Fire Fan", command = "/fan" },
        { title = "Fire stabilisers", desc = "Get The Fire stabilisers", command = "/stabilisers" },
        { title = "Fire supplyline", desc = "Get The Fire supplyline", command = "/supplyline" },
        { title = "Fire watermonitor", desc = "Get The Fire watermonitor", command = "/watermonitor" },
        { title = "How To Get a Car", desc = "How To Spawn a Fire Truck", command = "When on Duty U Will See a Garage" },
        { title = "How To Open Job Menu", desc = "Open Job Menu", command = "F4" },
        { title = "How To Open Billing Menu", desc = "Open Billing Menu", command = "F7" },
        { title = "How To Acess The Colour Menu", desc = "Open Clour Menu For Cars", command = "/colours" },
        { title = "How To Acess The Livery Menu", desc = "Open Livery Menu For Cars", command = "/livery" },
        { title = "How To Acess The Extra Menu", desc = "Open Extra Menu For Cars", command = "/extras" },
        { title = "How To Acess The Emails", desc = "Open Emails", command = "/email" },
        { title = "How To Acess The Radio", desc = "Open The Radio", command = "/radio" },
        { title = "How To Acess The AMS System", desc = "Open The AMS System", command = "/ams" },
        { title = "How To Acess The LMR System", desc = "Open The LMR System", command = "/lmr" },
    },
    Ambulance = {
        { title = "Services", desc = "Check to See Howmanu Polcie On.", command = "/services" },
        { title = "ECG", desc = "Go To a Ambulance To Use ECG.", command = "/ecg Near Ambulance" },
        { title = "AED", desc = "Go To a Ambulance To Use AED.", command = "/aed Near Ambulance" },
        { title = "Ambulance Menu", desc = "Access EMS Tablet For Duty.", command = "/emsopentablet" },
        { title = "How To Get a Car", desc = "How To Spawn a Ambulance", command = "When on Duty U Will See a Garage" },
        { title = "How To Open Job Menu", desc = "Open Job Menu", command = "F4" },
        { title = "How To Open Billing Menu", desc = "Open Billing Menu", command = "F7" },
        { title = "How To Acess The Colour Menu", desc = "Open Clour Menu For Cars", command = "/colours" },
        { title = "How To Acess The Livery Menu", desc = "Open Livery Menu For Cars", command = "/livery" },
        { title = "How To Acess The Extra Menu", desc = "Open Extra Menu For Cars", command = "/extras" },
        { title = "How To Acess The Emails", desc = "Open Emails", command = "/email" },
        { title = "How To Acess The Radio", desc = "Open The Radio", command = "/radio" },
    },
    Mechanic = {
        { title = "How to Do Wof And Reg", desc = "To Make Wof And Reg.", command = "/viewdetails" },
        { title = "How To Open Job Menu", desc = "Open Job Menu", command = "F4" },
        { title = "How To Open Billing Menu", desc = "Open Billing Menu", command = "F7" },
        { title = "How To Acess The Colour Menu", desc = "Open Clour Menu For Cars", command = "/colours" },
        { title = "How To Acess The Livery Menu", desc = "Open Livery Menu For Cars", command = "/livery" },
        { title = "How To Acess The Extra Menu", desc = "Open Extra Menu For Cars", command = "/extras" },
        { title = "How To Acess The Emails", desc = "Open Emails", command = "/email" },
        { title = "How To Acess The Radio", desc = "Open The Radio", command = "/radio" },
    }
}
