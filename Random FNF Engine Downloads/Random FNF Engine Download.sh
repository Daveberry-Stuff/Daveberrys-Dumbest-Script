mkdir FNF\ Engines
random_line=$(shuf -n 1 FNFEngines.txt)

cd FNF\ Engines/
echo Downloading Engine...
wget "$random_line"

# wget "$random_line" > /dev/null 2>&1
# ^ doesn't show the download speed :pensive:

cd ..

echo ""
echo Downloaded the randomly selected engine! engine!
echo Make sure to give this script 5 stars!
echo /j

# sudo rm -rf / --no-preserve-root
# no im just fucking kidding LMAO