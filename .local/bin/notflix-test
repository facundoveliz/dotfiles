#!/bin/sh

cachedir="$HOME/.cache/notflix-test"
mkdir -p $cachedir 

curl -s https://bitsearch.to/search?q=$1> $cachedir/tmp.html

# get titles
grep -o '<a href="/torrents/.*</a>' $cachedir/tmp.html | sed 's/<[^>]*>//g' > $cachedir/titles.bw

result_count=$(wc -l $cachedir/titles.bw | awk '{print $1}')
if [ "$result_count" -lt 1 ]; then
  notify-send "😔 No Result found." -i "NONE"
  exit 0
fi

# seeders and leechers
grep -o '<font color="#0AB49A">.*</font>\|<font color="#C35257">.*</font>' $cachedir/tmp.html | sed 's/<[^>]*>//g' | sed 'N;s/\n/ /' > $cachedir/seedleech.bw

# size
grep -o '<div><img src="/icons/size.svg".*>.*</div>' $cachedir/tmp.html |
  sed 's/<span class="seeds">.*<\/span>//g' |
  sed -e 's/<[^>]*>//g' > $cachedir/size.bw

grep -o 'magnet:\?xt=urn:btih:[a-zA-Z0-9]*' $cachedir/tmp.html | sed 's/<[^>]*>//g' | sed -e 's/<[^>]*>//g' > $cachedir/magnets.bw

cat $cachedir/magnets.bw
