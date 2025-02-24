PYTHONWARNINGS="ignore" OMP_NUM_THREADS=1 python -m torch.distributed.launch --nproc_per_node=4 main_finetune.py \
    --accum_iter 4 \
    --batch_size 32 \
    --model vit_large_patch16 \
    --finetune ./ckpts/mae_pretrain_vit_large.pth \
    --epochs 100 \
    --blr 5e-4 --layer_decay 0.65 \
    --weight_decay 0.05 --drop_path 0.1 --mixup 0.8 --cutmix 1.0 --reprob 0.25 \
    --dist_eval --data_path ./datasets/cat6 \
    --nb_classes=6
