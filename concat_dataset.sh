mkdir ./dataset/combined
a=$(cat ./dataset/evosuit/Evosuit_train.methods | wc -l)
echo $a
head -$a ./dataset/train.methods   > ./dataset/combined/train_combined.methods
cat ./dataset/evosuit/Evosuit_train.methods >> ./dataset/combined/train_combined.methods
cat ./dataset/combined/train_combined.methods | wc -l
head -$a ./dataset/train.tests   > ./dataset/combined/train_combined.tests
cat ./dataset/evosuit/Evosuit_train.tests >> ./dataset/combined/train_combined.tests
cat ./dataset/combined/train_combined.tests | wc -l

a=$(cat ./dataset/evosuit/Evosuit_test.methods | wc -l)
echo $a
head -$a ./dataset/eval.methods   > ./dataset/combined/eval_combined.methods
cat ./dataset/evosuit/Evosuit_test.methods >> ./dataset/combined/eval_combined.methods
cat ./dataset/combined/eval_combined.methods | wc -l
head -$a ./dataset/eval.tests   > ./dataset/combined/eval_combined.tests
cat ./dataset/evosuit/Evosuit_test.tests >> ./dataset/combined/eval_combined.tests
cat ./dataset/combined/eval_combined.tests | wc -l
















