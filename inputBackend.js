let inquirer = require('inquirer');
let sampleEcosystemConfig = require('./sampleConfigs/sample-ecosystem-redux.config').apps

let inputDict = {} //This will store inputs that have been processed already

//Loop through all the sub-configs in this file
async function main(){
    let configIndex = 0
    for (configIndex; configIndex < sampleEcosystemConfig.length ; configIndex++){
        subConfig = sampleEcosystemConfig[configIndex]
    
        if (subConfig.hasOwnProperty('env')){
            fields = Object.keys(subConfig.env)
            let fieldIndex = 0
    
            for (fieldIndex; fieldIndex < fields.length; fieldIndex++){
                targetField = fields[fieldIndex]
                await processInput(targetField, configIndex)
                
            }
            
        }
    }

    console.log(sampleEcosystemConfig)
}

//Processes 
async function processInput(targetField, configIndex){
    if (targetField != 'NODE_ENV'){
        if (targetField in inputDict){ //If we have input it before, use the same answer
            sampleEcosystemConfig[configIndex].env[targetField] = inputDict[targetField]
        } else { //We ask the user to input it
            let answers = await inquirer.prompt([ {
                type: 'input',
                name: 'answer',
                message: `Enter Input For ${targetField}?`,
            }])
            console.log(answers.answer)
            sampleEcosystemConfig[configIndex].env[targetField] = answers.answer
            inputDict[targetField] = answers.answer
        }        
                
    }
    
    
}

main()