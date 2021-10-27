# pandoc --to=plain --wrap=none main.tex -s -o output.txt
pandoc main.tex -o output.txt
# tr -c '[:alnum:]' '[\n*]' < I_Introduction/ | sort | uniq -c | sort -nr | head  -30
# With stop words eliminated
tr -c '[:alnum:]' '[\n*]' < output.txt | fgrep -v -w -f /usr/share/groff/current/eign | sort | uniq -c | sort -nr | head  -80
rm output.txt