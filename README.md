# wcom-diffusion

To use the YAML file to recreate the environment on another machine, you can run:
```
conda env create -f environment.yml
```

### Vaihingen
Training script example:
Multiple GPUs (2):
```
CUDA_VISIBLE_DEVICES=0,1 mpiexec -n 2 python image_train_diff_vaih.py --lr 0.0001 --batch_size 4 --dropout 0.1 --rrdb_blocks 6 --diffusion_steps 100
```
Single GPU (1):
```
CUDA_VISIBLE_DEVICES=0 mpiexec -n 1 python image_train_diff_vaih.py --lr 0.0001 --batch_size 4 --dropout 0.1 --rrdb_blocks 6 --diffusion_steps 100
```

Evaluation script example:
```
CUDA_VISIBLE_DEVICES=0 mpiexec -n 1 python image_sample_diff_vaih.py --model_path path-for-model-weights
```
