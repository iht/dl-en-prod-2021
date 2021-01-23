#!/bin/sh

EPOCHS=30
BATCH_SIZE=1024
BUCKET=iht-20200122-kschool

gcloud ai-platform jobs submit training mnist_iht_`date +"%s"` \
  --python-version 3.7 \
  --runtime-version 2.3 \
  --scale-tier BASIC \
  --package-path ./trainer \
  --module-name trainer.task \
  --region europe-west1 \
  --job-dir gs://$BUCKET/tmp \
  -- \
  --epochs $EPOCHS \
  --batch-size $BATCH_SIZE \
  --model-output-path gs://$BUCKET/models