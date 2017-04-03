# nc talk
Talk through netcat  
This program is useful on machines where write is not available  

## Usage
#### Sending
echo "message" | ./nct.sh -s username  
*username is the username you get with whoami*  

#### Receving
./nct.sh -r [file name]  
*nct stays opened and shows messages on terminal*  
*when file is specified, nct stores data in specified file and quits*  

## Install
wget https://raw.githubusercontent.com/edrflt/netcat-talk/master/nct.sh  
chmod +x nct.sh
#### Optional alias
Since nct.sh -s has the same syntax than write, you can set an alias
alias write="~/nct.sh -s"
