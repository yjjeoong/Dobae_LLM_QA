#!/bin/bash

NUM_GPU="auto"
DIR_DATA="./data/"
RAG_DATA=("answer_summary_modify.csv" "blog_summary_final.csv") 
MODEL_PATH="./model/final_/" 
MAX_LENGTH=3000
TEST_DATA="test.csv" #130개질문파일
TEST_SAMPLE_DATA="test_sample.csv" #33개질문파일(GPT답변포함되어있어야함)
TOP_K=3
ADD_FN="dobaedan" # 파일명 설정하기 ex) 날짜_모델명_{ADD_FN}_submission.csv


CUDA_VISIBLE_DEVICES=0,1 python3 ./rag.py --num_gpu "$NUM_GPU" \
                --dir_data "$DIR_DATA" \
                --rag_data "${RAG_DATA[@]}" \
                --model_path "$MODEL_PATH" \
                --max_length $MAX_LENGTH \
                --top_k $TOP_K \
                --test_sample_data $TEST_SAMPLE_DATA \
                --add_fn $ADD_FN \