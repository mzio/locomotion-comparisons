#!/bin/bash

# Script to reproduce results
#!/bin/bash
#SBATCH -J rl_comparisons  # Job name
#SBATCH -p fas_gpu               # Partition to submit to
#SBATCH --gres=gpu:1             # Number of GPUs to use
#SBATCH -t 0-12:00               # Runtime
#SBATCH --mem 8000               # Memory
#SBATCH -o ouput_%j.o            # File that STDOUT writes to
#SBATCH -e error_%j.e            # File that STDERR writes to

## Setup environment ##
module load Anaconda3/5.0.1-fasrc01 cuda/9.0-fasrc02 cudnn/7.0_cuda9.0-fasrc01
source activate prl_env

for ((i=0;i<10;i+=1))
do 
	python main.py \
	--policy_name "TD3" \
	--env_name "HalfCheetahBulletEnv-v0" \
	--seed $i \
	--start_timesteps 10000

	python main.py \
	--policy_name "TD3" \
	--env_name "HalfCheetahPyBulletEnv-v0" \
	--seed $i \
	--start_timesteps 1000

	python main.py \
	--policy_name "TD3" \
	--env_name "HalfCheetahMuJoCoEnv-v0" \
	--seed $i \
	--start_timesteps 1000

	python main.py \
	--policy_name "TD3" \
	--env_name "AntBulletEnv-v0" \
	--seed $i \
	--start_timesteps 10000

	python main.py \
	--policy_name "TD3" \
	--env_name "AntPyBulletEnv-v0" \
	--seed $i \
	--start_timesteps 1000

	python main.py \
	--policy_name "TD3" \
	--env_name "AntMuJoCoEnv-v0" \
	--seed $i \
	--start_timesteps 1000
done
