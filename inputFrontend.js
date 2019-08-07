const inquirer = require('inquirer'); //Question and Answer
const publicIp = require('public-ip')
const fs = require('fs') //File Writer

//Argv index starts at 2 starts at 2!
let filePath = process.argv[2]
let configObject = require(filePath)

skipKeys = ['multipleStatements', 'connectionLimit']
ipKeys = ['ipAddress', 'host', 'Host', 'ip-address', 'serverIP']
passwordKeys = ['password']
//filePath is a .js file that exports a module

async function main(){
    const ipAddress = await publicIp.v4()

    let i = 0
    keys = Object.keys(configObject)
    for (i; i < keys.length; i++){
        key = keys[i]
        answer = ""

        if (skipKeys.includes(key)) {
            //Do nothing
        } else if (passwordKeys.includes(key)) {
            answer = await inquirer.prompt({
                message: `Enter Input For ${key}?`,
                type: 'password',
                mask: '*',
                name: 'answer'
              });
        } else if (ipKeys.includes(key)){
            answer = await inquirer.prompt([
                {
                    message: `Use Default IP Address (${ipAddress}) For ${key}?`,
                    type: 'confirm',
                    name: 'confirm'
                }, 
                {
                    type: 'input',
                    name: 'answer',
                    message: `Enter IP Address for ${key}`,
                    when: (answer) => { return !answer.confirm}
              }]);
            
            if (answer.confirm){
                answer.answer = ipAddress
            } 
        } else {
            answer = await inquirer.prompt(
                {
                    type: "input",
                    name: "answer",
                    message: `Enter ${key}?`
                })
              
        }
        configObject[key] = answer.answer
    }

    let write = `module.exports = ${JSON.stringify(configObject)}`
    
    // Write data in 'Output.txt' . 
    fs.writeFile(`${filePath}.js`, write, (err) => { 
        
    // In case of a error throw err. 
    if (err) throw err; 
    }) 

}

main()