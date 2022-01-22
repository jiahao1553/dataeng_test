# How to setup scheduling task
1. Open terminal and enter `crontab -e` to start task scheduling process
2. In the text editor, append the following to the file assuming worker.js and dataset1.csv are in user folder
```sh
# 01 01 * * * node [path-to-worker.js] -i [path-to-input-csv-file] -o [path-to-output-csv-file]
# Example:
01 01 * * * node /home/user/worker.js -i /home/user/dataset1.csv -o /home/user/processed_dataset1.csv
```
3. Check if the job is setup correctly with `crontab -l`
