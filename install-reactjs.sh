## install reactJS
## ref ==> https://www.liquidweb.com/kb/an-intro-to-react-js/

# requirement
yum -y install gcc-c++ make

# nodejs repo if required
#curl -sL https://rpm.nodesource.com/setup_11.x | sudo -E bash -


# install nodejs
yum -y install nodejs
node -v
npm -v
npm install -g serve


# setup react
mkdir -p /home/react/dev/
npx create-react-app /home/react/dev


# Start reactJS on localhost:5000
cd /home/react/dev/
npm run build
serve -s build
