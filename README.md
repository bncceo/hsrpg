# hubot-hsrpg

An attempt to create a PvP & PvE game with RPG elements for HuBot

See [`src/hsrpg.coffee`](src/hsrpg.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-hsrpg --save`

Then add **hubot-hsrpg** to your `external-scripts.json`:

```json
[
  "hubot-hsrpg"
]
```

## Sample Interaction

```
user1>> hubot hello
hubot>> hello!
```

## NPM Module

https://www.npmjs.com/package/hubot-hsrpg

## Development Notes

The goal of this app is to create an interactive game that allows chatters to challenge each other and/or npc monsters to duels in which their outcome is based on their character stats. Their stats will be tied to their user name, and can be increased through doing battles. Furthermore, this project will serve as an experiment for myself to learn hubot and maybe do something cool with it.

### Development Part 1

I ran the yeoman script to generate the starting template in this repo. The instructions on how to do this can be found on the hubot github readme. Then I set up the repo and wrote this blurb in the readme. 