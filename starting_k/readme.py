from glob import glob
from os.path import join as pjoin

import gym
import textworld.gym
from textworld import EnvInfos

GAMES_PATH = "sample_games"  # This assumes `sample_games.zip` was first unzipped.
gamefiles = glob(pjoin(GAMES_PATH, "*.ulx"))
print("Found {} games.".format(len(gamefiles)))

gamefile = gamefiles[0]  # Pick a game.

requested_infos = EnvInfos(description=True, inventory=True, extras=["recipe", "walkthrough"])
env_id = textworld.gym.register_games([gamefile], requested_infos)
#env_id = textworld.gym.register_games('./TextWorld_CoG2019/train/tw-cooking-recipe1+take1-11Oeig8bSVdGSp78.ulx', requested_infos)
agent = textworld.agents.HumanAgent()

env = gym.make(env_id)
obs, infos = env.reset()

# Since we asked for more infos, let's print them.
print("Walkthrough:", ". ".join(infos["extra.walkthrough"]))
print(infos["extra.recipe"])

env.render()  # Print the initial observation.

score = 0
done = False
while not done:
    command = input('> ')
    ob, score, done, infos = env.step(command)
    env.render()
    