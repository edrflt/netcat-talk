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
