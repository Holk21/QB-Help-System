# 📖 README for `qb-help`

## Overview
`qb-help` is a lightweight tablet-style help panel for FiveM servers running **QBCore**.  
It gives new and existing players a quick way to see **server rules, keybinds, commands, and helpful links (Discord & Website)**.  

The tablet can be opened in-game with a command or keybind and includes a live in-game **clock, date, and online player count**.  

---

## ✨ Features
- 📱 **Tablet UI** with categories: Player, Police, Fire, Ambulance  
- ⏰ **Live status bar** (time, date, players online)  
- 👋 **Welcome page** with configurable title, subtitle, image, and bullet points  
- 🔗 **Clickable Discord & Website buttons** (opens in external browser)  
- 🔔 Notifications via **okokNotify** (optional) or QBCore Notify  
- 🔑 Configurable keybinds and commands  
- 🔒 ESC/Backspace closes the tablet  

---

## 🛠️ Installation
1. Place the folder `qb-help` into your server’s `resources/` directory.
2. Ensure it in your `server.cfg`:
   ```
   ensure qb-help
   ```
3. Make sure you have **QBCore** and (optionally) **okokNotify** installed.

---

## 🎮 Usage
- **Command:** `/help`  
- **Default keybind:** `F10`  
- Close with `ESC` or `Backspace`.  

---

## ⚙️ Configuration
Edit `config.lua` to customize:

```lua
Config.ShowWelcomeTab = true
Config.UseOkOk = false  -- true = use okokNotify, false = QBCore Notify

Config.Welcome = {
    title = "Welcome to the Aotearoa Nation Wide RP",
    subtitle = "Everything you need to get started",
    bullets = {
        "Press /help anytime to reopen this tablet.",
        "Be respectful and follow server rules.",
        "Use /report to contact staff if you’re stuck.",
        "Join our Discord for announcements & support."
    },
    image = "https://yourcdn.com/welcome.png",
    discord = "https://discord.gg/YourServer",
    website = "https://yourserver-website.com/"
}
```

You can also add/edit **Player, Police, Fire, and Ambulance commands** in the same file.  

---

## 🔗 External Links
- The **Discord** and **Website** buttons now correctly open in the player’s **default web browser**.

---

## 📷 Preview
When opened, the tablet looks like this:  
- Sidebar with categories (Welcome, Player, Police, Fire, Ambulance)  
- Welcome page with image, title, bullets, and links  
- Cards showing commands for each role  

---

## 🧩 Dependencies
- [QBCore Framework](https://github.com/qbcore-framework)  
- (Optional) [okokNotify](https://okok.tebex.io/)  

---

## 👨‍💻 Credits
- Script Author: **Braiden Marshall**  
- Framework: **QBCore**  
