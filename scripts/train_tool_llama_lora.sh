export PYTHONPATH=./
deepspeed --master_port=20002 toolbench/train/train_lora.py \
    --model_name_or_path huggyllama/llama-7b  \
    --data_path  data/processed/weather_processed.json \
    --bf16 True \
    --output_dir output \
    --num_train_epochs 3 \
    --per_device_train_batch_size 2 \
    --per_device_eval_batch_size 2 \
    --gradient_accumulation_steps 8 \
    --evaluation_strategy "steps" \
    --eval_steps 1500 \
    --save_strategy "steps" \
    --save_steps 1500 \
    --save_total_limit 8 \
    --learning_rate 5e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.04 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --model_max_length 2048 \
    --gradient_checkpointing True \
    --lazy_preprocess True \
    --deepspeed ds_configs/stage2.json