# A

## 1
```bash
cat wiki-en-flower.txt
less wiki-en-flower.txt
```

## 2
```bash
wc -l wiki-en-flower-tokenized.txt
```

## 3
```bash
tr ' ' '\n' < wiki-en-flower.txt > wiki-en-flower-tokenized.txt
```

## 4
```bash
wc -w wiki-en-flower-tokenized.txt
```

## 5
```bash
cat wiki-en-flower-tokenized.txt | sort | uniq -c | wc -w
```

## 6
```bash
cat wiki-en-flower-tokenized.txt | sort | uniq -c | sort -nr | head -5
```

## 7
```bash
cat wiki-en-flower-tokenized.txt | sort | uniq -c | awk '$1==1' | wc -w
```

## 8
```bash
cat wiki-en-flower-tokenized.txt | sort | uniq -c | awk '$1==10 && $2~/^t/'
```

# B

## 2
```bash
cat wiki-en-flower.txt | tree-tagger-english > wiki-en-flower-tagged.txt
```

## 3
```bash
less wiki-en-flower-tagged.txt
```

## 4
```bash
cat wiki-en-flower-tagged.txt | awk '{print $2}' | sort | uniq -c | sort -nr > wiki-en-
flower_tagged_pos_counted.txt 
```


## 5
```bash
cat wiki-en-flower-tagged.txt |
awk '$2~ /NN/ && $3!~ /(unknown|\|)/ {print $3}' | sort |uniq -c | sort -nr | head -100 >
 wiki-en-flower_tagged_nn_100.txt 
```
