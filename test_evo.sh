#!/bin/bash
#SBATCH --gres=gpu:4       # Request GPU "generic resources"
#SBATCH --cpus-per-task=8  # Refer to cluster's documentation for the right CPU/GPU ratio
#SBATCH --mem=32000M       # Memory proportional to GPUs: 32000 Cedar, 47000 Béluga, 64000 Graham.
#SBATCH --time=1-8:00     # DD-HH:MM:SS

source ./Env/bin/activate


source=methods
target=tests
lr=1e-4
beam_size=10
source_length=320
target_length=256
batch_size=64
output_dir=saved_models/dec_10_CombinedData_graphcodebert/$source-$target
dev_file=dataset/evosuit/Evosuit_test_lang3_ArrayUtils.$source,dataset/evosuit/Evosuit_test_lang3_ArrayUtils.$target
test_file=dataset/evosuit/Evosuit_test_lang3_ArrayUtils.$source,dataset/evosuit/Evosuit_test_lang3_ArrayUtils.$target
load_model_path=$output_dir/checkpoint-best-bleu/pytorch_model.bin #checkpoint for test


python run.py \
--do_test \
--model_type roberta \
--source_lang $source \
--model_name_or_path $load_model_path \
--tokenizer_name graphcodebert-base \
--config_name graphcodebert-base \
--load_model_path $load_model_path \
--dev_filename $dev_file \
--test_filename $test_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--eval_batch_size $batch_size 2>&1| tee $output_dir/test.log