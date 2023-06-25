source /workspace/venv/bin/activate

export NCCL_P2P_DISABLE=1
export NCCL_P2P_LEVEL=LOC

torchrun --nproc_per_node=1 --master_port=20001 /workspace/FastChat/fastchat/train/train_mem.py \
  --model_name_or_path /workspace/llama-7b \
  --data_path /workspace/as_conversations.json \
  --bf16 True \
  --output_dir /workspace/airoboros-uncensored-13b \
  --num_train_epochs 3 \
  --per_device_train_batch_size 20 \
  --per_device_eval_batch_size 20 \
  --gradient_accumulation_steps 2 \
  --evaluation_strategy "steps" \
  --eval_steps 500 \
  --save_strategy "steps" \
  --save_steps 500 \
  --save_total_limit 10 \
  --learning_rate 2e-5 \
  --weight_decay 0. \
  --warmup_ratio 0.04 \
  --lr_scheduler_type "cosine" \
  --logging_steps 1 \
  --report_to "clearml" \
  --fsdp "full_shard auto_wrap offload" \
  --fsdp_transformer_layer_cls_to_wrap 'LlamaDecoderLayer' \
  --tf32 True \
  --model_max_length 2048 \
  --gradient_checkpointing True \
  --lazy_preprocess True
