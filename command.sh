#/bin/bash
mkdir ~/linux_p2 && cd ~/linux_p2 && for i in {1..20}; do shuf -n 100000 /usr/share/dict/words > $i.txt; done
