# BerryNotes

A note-taking addon for **World of Warcraft (Retail)**. Opens a free-text window inside the game so you can jot things down, with automatic saving between sessions.

## Features

- Floating, movable notes window inside the game UI
- Automatic text saving via `SavedVariables` (persists across game restarts and `/reload`)
- Toggle the window on/off with a simple chat command
- Visual style matching WoW's native tooltip UI

## Installation

1. Download or clone this repository.
2. Copy the `BerryNotes` folder into:
   ```
   World of Warcraft/_retail_/Interface/AddOns/
   ```
3. Restart the game (or run `/reload` if it's already open).
4. Enable the addon from the character selection screen (AddOns).

## Commands

| Command | Action |
|---|---|
| `/bn` | Shows or hides the notes window |
| `/berry` | Same as `/bn` |
| `/berrynotes` | Same as `/bn` |

## Technical details

- Written in **Lua**, using WoW's addon API (`CreateFrame`, `SlashCmdList`, `SavedVariables`).
- Note text is saved in real time to a persistent table (`BerryNotesDB`) as the user types.
- Handles chat events (`CHAT_MSG_SAY`, `CHAT_MSG_PARTY`, `CHAT_MSG_GUILD`, `CHAT_MSG_WHISPER`) as groundwork for future note-sharing functionality.

## Roadmap

- [ ] Share notes between players via `C_ChatInfo.SendAddonMessage`
- [ ] Multiple notes / tabs
- [ ] Customizable color and font size
- [ ] Per-character saved position and size

## Status

This is my first WoW addon, built as a personal project to learn the game's API and event-driven architecture in Lua. Still under active development — feedback and suggestions are welcome.

---

Built by [Marianela Rossetti](https://github.com/rossettimarianela)
