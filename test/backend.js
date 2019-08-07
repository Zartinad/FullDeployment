const expect = require('chai').expect;
const assert = require('chai').assert;
const should = require('chai').should;

const publicIp = require('public-ip')
const ipAddress = publicIp.v4()
const axios = require('axios')

let today = new Date()
let datetime = `${today.getDate()} ${today.getHours()}:${today.getMinutes()}:${today.getSeconds()}`
console.log(datetime)

describe('Backend Server', async function() {
    it('Should Create An Investment', async function() {
      try {
        let invest = await axios.post(`${ipAddress}/backend/investments/create`, 
          {
            "investment_name": `Test @ ${datetime}|`,
            "description":"Test Investment",
            "currency":"Test",
            "username":"admin",
            "rake":0.1,
            "affiliate_rake":0.5,
            "fx_rake":0 
          }
      )
        resStatus = invest.status
        data = JSON.stringify(invest.data)

        assert(true, `Response Status: ${resStatus}\nData: ${data}`)

      } catch (error) {
        resStatus = error.response.status
        data = JSON.stringify(error.response.data)

        assert(false, `Response Status: ${resStatus}\nData: ${data}`)
      }


    });
 
});
