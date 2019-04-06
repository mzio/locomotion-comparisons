# Comparing RL Locomotion Environments / Implementations   

Want to look at implementations for HalfCheetah and Ant environments. All implementations are done with PyBullet, an open-source physics engine, and try to emulate MuJoCo environments to some degree. 

## The repositories   
- [pybullet/gym/](https://github.com/bulletphysics/bullet3/tree/master/examples/pybullet/gym): Original open-source implementation of MuJoCo environments, with this subdirectory supporting the OpenAI Gym framework.  
  - Contains training code using OpenAI Baselines for some environments, but not Ant of HalfCheetah
- [pybullet-gym](https://github.com/benelot/pybullet-gym): Another open-source implementation of MuJoCo environments, specifically using the OpenAI Gym framework.  
  - Have reason to believe this is different from the above, but not sure.
- [georgesung / TD3](https://github.com/georgesung/TD3): Benchmarks TD3 and DDPG on PyBullet. The environments are reported for MuJoCo version.  
  - This is the only repository that seems to come with training code (the other two have pre-trained models for our enjoyment but not our education).   
  - The actual environments they use to train seem to be coming from `pybullet/gym/`.   

Plan, just use the provided TP3 training algo in `georgesung / TD3` (`gTD3`). Accordingly, we want to load the following environments:  

```{python}
# pybullet_envs  
register(
    id='HalfCheetahBulletEnv-v0',
    entry_point='pybullet_envs.gym_locomotion_envs:HalfCheetahBulletEnv',
    max_episode_steps=1000,
    reward_threshold=3000.0
)
register(
    id='AntBulletEnv-v0',
    entry_point='pybullet_envs.gym_locomotion_envs:AntBulletEnv',
    max_episode_steps=1000,
    reward_threshold=2500.0
)
# pybulletgym  
## Roboschool implementations  
register(
    id='HalfCheetahPyBulletEnv-v0',
    entry_point='pybulletgym.envs.roboschool.envs.locomotion.half_cheetah_env:HalfCheetahBulletEnv',
    max_episode_steps=1000,
    reward_threshold=3000.0
)
register(
    id='AntPyBulletEnv-v0',
    entry_point='pybulletgym.envs.roboschool.envs.locomotion.ant_env:AntBulletEnv',
    max_episode_steps=1000,
    reward_threshold=2500.0
)
## MuJoCo implementations  
register(
    id='HalfCheetahMuJoCoEnv-v0',
    entry_point='pybulletgym.envs.mujoco.envs.locomotion.half_cheetah_env:HalfCheetahMuJoCoEnv',
    max_episode_steps=1000,
    reward_threshold=3000.0
)
register(
    id='AntMuJoCoEnv-v0',
    entry_point='pybulletgym.envs.mujoco.envs.locomotion.ant_env:AntMuJoCoEnv',
    max_episode_steps=1000,
    reward_threshold=2500.0
)
```

## Actual workflow  
First started by cloning both `pybullet-gym` and `TD3` repositories. The PyBullet original environments are available through the pip installation of PyBullet, and are imported through `pybullet_envs`. The only other modification then should be modifying the registration ids in the `pybullet-gym` `__init__.py` file so as not to conflict with the `pybullet_envs` ones.  

After this, we should just be able to run the `main.py` file provided in the `TD3` repository for all desired environments. I ran both the Roboschool and default MuJoCo ports provided in `pybullet-gym`.  
