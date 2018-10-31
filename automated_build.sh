# Copy static site
CWD=`pwd`

# Clone Pages repository
cd /tmp
git clone https://github.com/davidgeilfus/my-awesome-site.git build
# cd build && git checkout -b YOUR_BRANCH origin/YOUR_BRANCH # If not using master

# Trigger Jekyll rebuild
cd $CWD
bundle exec jekyll contentful
bundle exec jekyll build

# Push newly built repository
cp -r $CWD/_build/* /tmp/build # or $CWD/_site

cd /tmp/build

git config --global user.email "davidgeilfus+github@gmail.com"
git config --global user.name "David Geilfus"

git add .
git commit -m "Automated Rebuild"
git push -f origin YOUR_PAGES_BRANCH