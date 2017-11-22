Initial training process of a conversation bot using OpenNMT
---

This is intended to offer a first approach to the training of a conversation bot using a Seq2Seq model.
Follow the instructions and you'll train a basic conversational bot.

This uses OpenNMT, implemented in PyTorch.

- First, clone the OpenNMT repository using:

```
git clone https://github.com/OpenNMT/OpenNMT-py.git
```

In order to use the scripts without modifications, check that you have a structure of directories similar to this:

```
├── data
│   └── model
├── initial-bot-OpenNMT
└── OpenNMT-py
```

Where we have this repository, the OpenNMT repo, and a data folder, being inside a model folder.

- Now, copy the scripts to the destination folders:

```
./initial-bot-OpenNMT/move_files.sh
```

- Download de the data (we use an already preprocessed dataset extracted from the [Cornell Movie Corpus](http://www.cs.cornell.edu/%7Ecristian/Cornell_Movie-Dialogs_Corpus.html)):

```
cd data

./pull_data.sh
```

- Fix the encoding and split the test set into dev and test set (not completely ML correct) into 15k sets

```
./fix_encoding.sh
```

- Run `wc -l *` and check that you have something like this:

```
    ...
   30000 test.dec
   30000 test.enc
  108135 train.dec
  108135 train.enc
   15000 utf_dev.dec
   15000 utf_dev.enc
   15000 utf_test.dec
   15000 utf_test.enc
  108135 utf_train.dec
  108135 utf_train.enc
  ...
```

- Chage directories:

```
cd ../OpenNMT-py

```

- Preprocess the data. This step creates some PyTorch arrays and generates a vocabulary:

```
./preprocess.sh
```

If correct, you should see the following messages:

```
Preparing training ...
Building Training...
Building Vocab...
Building Valid...
Saving train/valid/fields
```

And you should see some new files if you run `ls -1 ../data`:

```
bot.train.pt
bot.valid.pt
bot.vocab.pt
fix_encoding.sh
model
pull_data.sh
test.dec
test.enc
train.dec
train.enc
utf_dev.dec
utf_dev.enc
utf_test.dec
utf_test.enc
utf_train.dec
utf_train.enc
```

- Start the training! This will train with the default parameters. Change them if you want.

```
./train.sh
```

Now, you have to wait. No rush here.

- After training, it is time to test. Select the best model (saved in `data/model`) to use:

```
./infer.sh ../data/model/bot-model[...]
```

After this, the predictions are at `data/preds.txt`



---

For more info, check:

- https://github.com/OpenNMT/OpenNMT-py
- http://opennmt.net/OpenNMT-py/quickstart/
- http://opennmt.net/OpenNMT-py/extended/
- http://opennmt.net/OpenNMT-py/options/preprocess/
- http://opennmt.net/OpenNMT-py/options/train/
- http://opennmt.net/OpenNMT-py/options/translate/
